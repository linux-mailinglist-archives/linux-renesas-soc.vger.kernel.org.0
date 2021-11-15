Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2235450611
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 14:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbhKONz6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 08:55:58 -0500
Received: from mail.iot.bzh ([51.75.236.24]:19420 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231894AbhKONyB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 08:54:01 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id A2D0B1B7CF;
        Mon, 15 Nov 2021 14:50:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:date:from:from:in-reply-to:message-id
        :mime-version:references:reply-to:subject:subject:to:to; s=
        iot.bzh; bh=e+P5b+tSoUAaR1M5krhwm/73upOqhvsCyXhH7eWns4w=; b=aT/2
        58VCdrAdC9g4Hpv993bdrucAodyy23IqcCnyH6gpow+lICgbx3ytKdd/9sp2ctJV
        qoeeGhPb1raWJkn6SH8RiX9EOHfm4Cjln4df2Qg6PZ0AkSOadf50hbitSKjB79fM
        lonvky5eeeXro4OZ2tAXWwFzwf0hqnMnpehv/oRQiI7agbI0gPkKhC1ZYUEBEvTO
        9YHTLlmYopmgupTP1c+/6KTmyEObDBrJUFFATHePSyIPp6KvW4aRHnpNQkJqr7KZ
        1HmmnGha0lhNMSQgeCkYu74HUUxjdgdCqE/OJcnjgzmJdpR98QwT7IN5NHryZvsf
        6UedFoTLrmRF0mcDAg==
From:   Julien Massot <julien.massot@iot.bzh>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Julien Massot <julien.massot@iot.bzh>
Subject: [PATCH v1 1/3] dt-bindings: remoteproc: Add Renesas R-Car
Date:   Mon, 15 Nov 2021 14:50:30 +0100
Message-Id: <20211115135032.129227-2-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115135032.129227-1-julien.massot@iot.bzh>
References: <20211115135032.129227-1-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Renesas R-Car SoCs may contains a Realtime processor.
This patch adds binding for this remote processor.

Signed-off-by: Julien Massot <julien.massot@iot.bzh>
---
Change since RFC:
Adds missing address-cells and size-cells and change reg cell
accordingly.
---
 .../remoteproc/renesas,rcar-rproc.yaml        | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
new file mode 100644
index 000000000000..dcb6b0f75dda
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
@@ -0,0 +1,66 @@
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
+        status = "okay";
+    };
+
+...
-- 
2.31.1


