Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6176B43C3E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Oct 2021 09:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240377AbhJ0HdC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Oct 2021 03:33:02 -0400
Received: from mail.iot.bzh ([51.75.236.24]:7112 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238468AbhJ0HdB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Oct 2021 03:33:01 -0400
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 3BC9B25108;
        Wed, 27 Oct 2021 09:30:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:date:from:from:in-reply-to:message-id
        :mime-version:references:reply-to:subject:subject:to:to; s=
        iot.bzh; bh=jAf3R5ZyexAMPU3GUd0OTU1+8j7GJia+7fFU5b693MA=; b=A3d5
        5r3k2hwmJoorMRVwb6PAq8eyUFrx/YCyukpb2Uv2sNTHsj1dxJz708foNWsvtkfV
        ODKWDWgdo+ZLprqPq48qtSnKxXBlAM9G+LAcFNWjqNwSH99jfbx8HRR+suBKodnF
        RlXgNdBwGcU0UOKqxf0L9JDYzd5hNrYKQQGTLElJ6AVwKOyBMr7p4VIiNx2npNpJ
        lL221C+RS2nE/q5fkofzqK6BYMf7bNuXxpB432MEjsnQn/fAPMHzpj1tMPlJXVcw
        YLGcApb/oC7fsq0UMd4iJnHSIAO6CRJ6DO6g8QiR34jr2YrByITCC+4BSCPFLJ8b
        aZPoesQiotyE7pBSMg==
From:   Julien Massot <julien.massot@iot.bzh>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Julien Massot <julien.massot@iot.bzh>
Subject: [RFC PATCH 1/3] dt-bindings: remoteproc: Add Renesas R-Car
Date:   Wed, 27 Oct 2021 09:30:18 +0200
Message-Id: <20211027073020.17055-2-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027073020.17055-1-julien.massot@iot.bzh>
References: <20211027073020.17055-1-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Renesas R-Car SoCs may contains a Realtime processor.
This patch adds binding for this remote processor.

Signed-off-by: Julien Massot <julien.massot@iot.bzh>
---
 .../remoteproc/renesas,rcar-rproc.yaml        | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
new file mode 100644
index 000000000000..dbf95137ce88
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
+      (see ../reserved-memory/reserved-memory.txt)
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
+        ranges;
+
+        cr7_ram: cr7_ram@40040000 {
+            no-map;
+            reg = <0x40040000 0x1fc0000>;
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


