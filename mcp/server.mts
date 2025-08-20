// server.mts
import {McpServer} from "@modelcontextprotocol/sdk/server/mcp.js";
import {StdioServerTransport} from "@modelcontextprotocol/sdk/server/stdio.js";
import {z} from "zod";

// Create an MCP server
const server = new McpServer({
    name: "figma-to-flutter-server",
    version: "0.1.0"
});

// Simple state to store configuration
let figmaAccessToken: string | null = null;

// Tool 1: Set Figma Access Token
server.registerTool(
    "set_figma_token",
    {
        title: "Set Figma Access Token",
        description: "Configure the Figma API access token for authentication",
        inputSchema: {
            token: z.string().describe("Figma personal access token")
        }
    },
    async ({token}) => {
        figmaAccessToken = token;
        return {
            content: [{
                type: "text",
                text: "✅ Figma access token has been configured successfully!"
            }]
        };
    }
);

// Tool 2: Check Configuration Status
server.registerTool(
    "check_status",
    {
        title: "Check Server Status",
        description: "Check if the server is properly configured",
        inputSchema: {}
    },
    async () => {
        const status = {
            serverName: "figma-to-flutter-server",
            version: "0.1.0",
            figmaTokenConfigured: figmaAccessToken !== null,
            timestamp: new Date().toISOString()
        };

        return {
            content: [{
                type: "text",
                text: `📊 Server Status:\n${JSON.stringify(status, null, 2)}`
            }]
        };
    }
);

// Tool 3: Simple Test Tool
server.registerTool(
    "test_connection",
    {
        title: "Test Connection",
        description: "Test the MCP server connection with a simple response",
        inputSchema: {
            message: z.string().optional().describe("Optional test message")
        }
    },
    async ({message}) => {
        const testMessage = message || "Hello from Figma-to-Flutter MCP Server!";

        return {
            content: [{
                type: "text",
                text: `🔗 Connection Test Successful!\n\nEcho: ${testMessage}\nServer Time: ${new Date().toISOString()}`
            }]
        };
    }
);

// Connect transport layer
const transport = new StdioServerTransport();

async function main() {
    try {
        await server.connect(transport);
        console.log("🚀 Figma-to-Flutter MCP Server is running!");
        console.log("📋 Available tools:");
        console.log("  - set_figma_token: Configure Figma access token");
        console.log("  - check_status: Check server configuration status");
        console.log("  - test_connection: Test the MCP connection");
    } catch (error) {
        console.error("❌ Failed to start server:", error);
        process.exit(1);
    }
}

main();