Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F8946C12A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Dec 2021 17:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239692AbhLGRCU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Dec 2021 12:02:20 -0500
Received: from mail.iot.bzh ([51.75.236.24]:55466 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239568AbhLGRCT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 12:02:19 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id A5AC2455A8;
        Tue,  7 Dec 2021 17:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:date:from:from:in-reply-to:message-id
        :mime-version:references:reply-to:subject:subject:to:to; s=
        iot.bzh; bh=HbxUUmI5LbI+DFALMhYBxeBexPYGN4eu5ht9ZQuDbLc=; b=XuRq
        YKZ97vJOaMmYw90HJnQhUFn/T/tsdj23y7GZ6iVZtFpV4hJfyskNwQEy3w/ifMzZ
        C266tZRwQeMY3+ztiSTO+A3Owg9iqzzODxPkme3M8vbegi+hO5G4ONkfU1Zqz8Cv
        Yp/rvfH1G30rf8RQd51QmUpPuqz6ebziBuaCn19hB2GR5pp2SyBA6EBTf/nmmPHh
        WnyUUN2QldS7vk98df3/LGM4hG6yTIbAZSRo8yt1xuszvf/WiAT/ISnCcgDIDfqr
        fhDa765N8HRjAoH3FTihKRQUIJoHULx//nLd/bJpccGiUaFSJmkTaWrGMr4j1ERn
        79SoFalz0GQoHRtxvA==
From:   Julien Massot <julien.massot@iot.bzh>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Julien Massot <julien.massot@iot.bzh>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: Add Renesas R-Car
Date:   Tue,  7 Dec 2021 17:58:28 +0100
Message-Id: <20211207165829.195537-2-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211207165829.195537-1-julien.massot@iot.bzh>
References: <20211207165829.195537-1-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Renesas R-Car SoCs may contain a Realtime processor.
This patch adds bindings for this remote processor.

Signed-off-by: Julien Massot <julien.massot@iot.bzh>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes since v2:
Fix spelling

---
 .../remoteproc/renesas,rcar-rproc.yaml        | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
new file mode 100644
index 000000000000..a7d25fa920e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/remoteproc/renesas,rcar-rproc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas R-Car remote processor controller bindings
+
+maintainers:
+  - Julien Massot <julien.massot@iot.bzh>
+
+description: |
+  This document defines the bindings for the remoteproc component that loads and
+  boots firmwares on the Renesas R-Car family chipset.
+  R-Car gen3 family may have a realtime processor, this processor shares peripheral
+  and RAM with the host processor with the same address map.
+
+properties:
+  compatible:
+    const: renesas,rcar-cr7
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  memory-region:
+    description:
+      List of phandles to the reserved memory regions associated with the
+      remoteproc device. This is variable and describes the memories shared with
+      the remote processor (e.g. remoteproc firmware and carveouts, rpmsg
+      vrings, ...).
+      (see ../reserved-memory/reserved-memory.yaml)
+
+required:
+  - compatible
+  - resets
+  - memory-region
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        cr7_ram: cr7_ram@40040000 {
+            no-map;
+            reg = <0x0 0x40040000 0x0 0x1fc0000>;
+        };
+    };
+
+    cr7_rproc: cr7 {
+        compatible = "renesas,rcar-cr7";
+        memory-region = <&cr7_ram>;
+        power-domains = <&sysc R8A7795_PD_CR7>;
+        resets = <&cpg 222>;
+    };
+
+...
-- 
2.33.1


