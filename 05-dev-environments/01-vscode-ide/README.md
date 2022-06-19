Detailed instructions are found in [REditorSupport/vscode-R](https://github.com/REditorSupport/vscode-R/wiki/Installation:-Linux).

### tldr:

**In your Docker image**

- Install [`radian`](https://github.com/randy3k/radian) using this line in your Dockerfile:
```
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    && pip install -U radian
```

- Make sure `{languageserver}` is installed in your R setup
- To ensure plotting works, make sure `{httpgd}` is installed in your R setup
- For debugging to work with the `VSCode-R-Debugger` extension, ensure `vscDebugger` is installed using `remotes::install_github("ManuelHentschel/vscDebugger")`
- Edit `docker-compose.yml`. Add environment variables as needed. Edit `$PROJECT_DATA_DIR` to your project's data directory if needed. 
- _Optionally_ edit `.devcontainer/devcontainer.json`. Manipulate the `"extensions"` as you see fit.
- _Optionally_ edit `.vscode/settings.json`. All the recommended settings have been set. Manipulate as needed. 