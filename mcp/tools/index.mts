// src/tools/index.mts
import type {McpServer} from "@modelcontextprotocol/sdk/server/mcp.js";
import {registerConfigTools} from "./config.mjs";
import {registerFigmaTools} from "./figma.mjs";

export function registerAllTools(server: McpServer) {
    // Register all tool categories
    registerConfigTools(server);
    registerFigmaTools(server);

    console.log("📋 Registered tool categories:");
    console.log("  ⚙️  Configuration tools");
    console.log("  🎨 Figma tools");
}

export {getFigmaToken} from "./config.mjs";