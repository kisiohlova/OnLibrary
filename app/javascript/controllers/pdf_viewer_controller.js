import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    document.addEventListener("DOMContentLoaded", () => {
      const url = this.data.get("url");
      const filename = this.data.get("filename");

      const adobeDCView = new AdobeDC.View({ clientId: "4aa945fcb9d442b7986cece776f41c69", divId: "pdf-viewer" });
      adobeDCView.previewFile({
        content: { location: { url: url } },
        metaData: { fileName: filename }
      },{
        showAnnotationTools: false,
        showDownloadPDF: false,
        showPrintPDF: false
      });
    });
  }
}
