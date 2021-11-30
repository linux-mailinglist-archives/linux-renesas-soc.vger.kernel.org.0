Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA44B46306D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 11:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240567AbhK3KE0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 05:04:26 -0500
Received: from mail.iot.bzh ([51.75.236.24]:51550 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235542AbhK3KEZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 05:04:25 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 7333224983;
        Tue, 30 Nov 2021 11:01:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:date:from:from:in-reply-to:message-id
        :mime-version:references:reply-to:subject:subject:to:to; s=
        iot.bzh; bh=/gG+J72HN3ngbVIosvZshZeK9gwxnSIdCSuznYRZaTE=; b=JmKg
        Vq2Yp8K31bILROUMUG8sZbuCfWmR3nPZvZbFYE0s8TqOJILX/3Q8yEPsf3asnau+
        Dxx/EilG/P10jdSbbRaJLx2kEPA5+UYIWbjPYF7KzpGuM0uYgOpQH3VamdY3ZkFM
        86ZCgdchDtZUfTASlRCxSc4x7sitFIkQKVK2ItazeHZuuwoVPCQ2v6bi5V54WoL3
        ag4kaGspRzFYezLHKbsNix97NeuvWYmG9l4V0rwEKe8AT/uF8rSlk1Y2JBBoS4Bb
        gegtaU3/6QDqN4VdbpnxTofhIKdjP5J5ypUFfQLN6Fm9OPA0LvpEvcFy0CRFYGXK
        pylZeYJ7dIel2JMzrg==
From:   Julien Massot <julien.massot@iot.bzh>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Julien Massot <julien.massot@iot.bzh>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: Add Renesas R-Car
Date:   Tue, 30 Nov 2021 11:00:48 +0100
Message-Id: <20211130100049.129418-2-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130100049.129418-1-julien.massot@iot.bzh>
References: <20211130100049.129418-1-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Renesas R-Car SoCs may contains a Realtime processor.
This patch adds binding for this remote processor.

Signed-off-by: Julien Massot <julien.massot@iot.bzh>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v1
- dropped 'status = "okay";' in the sample
- Add Rob's Reviewed-by tag

---
 .../remoteproc/renesas,rcar-rproc.yaml        | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
new file mode 100644
index 000000000000..3fe8d49051e6
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
+  This document defines the binding for the remoteproc component that loads and
+  boots firmwares on the Renesas R-Car family chipset.
+  R-Car gen3 family may have a realtime processor, this processor share peripheral
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


