Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D58B6928FC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 22:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbjBJVP6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 16:15:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233024AbjBJVP5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 16:15:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC9E7536E;
        Fri, 10 Feb 2023 13:15:56 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBDC3886;
        Fri, 10 Feb 2023 22:15:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676063753;
        bh=fJ0tKY7VC0b4YkjurAYzS4g+2yfEnsod0xQB6aLCjIc=;
        h=From:To:Cc:Subject:Date:From;
        b=TLb3wvUGuOs8Cjo8KhCSYJIs0JXscidVktrAQagsUpB/yZcmyP6zj+8S3vZOxittW
         /xsig+7UhPBRG/82ySa6vPT5Pzwyv793YP4w2MRgkpCfblMiLiouusd0FRlc3u5rGO
         VkwsqWgyDOnld8AVwncPz++FLdgI9f3eiNyeOR/g=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH/RFC] arm64: dts: renesas: draak: Add overlay for HDMI input
Date:   Fri, 10 Feb 2023 23:15:51 +0200
Message-Id: <20230210211551.18106-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Draak board has an ADV7180 CVBS decoder and an ADV7612 HDMI decoder,
both connected to the same VIN input. DIP switches are used to select
one of the two devices, with the CVBS decoder being the default. Add an
overlay that selects the HDMI decoder.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---

Niklas, would this be an acceptable way to handle the DIP switches on
the Draak board ?

---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../boot/dts/renesas/draak-hdmi-input.dtso    | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 0699b51c1247..de4170af611e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -88,4 +88,5 @@ dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
+dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-hdmi-input.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso b/arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso
new file mode 100644
index 000000000000..e0d671f0cab3
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023 Ideas on Board Oy
+ *
+ * Device tree overlay for the Draak board, to enable HDMI input. This requires
+ * setting DIP switches SW49, SW50, SW51 and SW52 to ON, and SW53 and SW54 to
+ * OFF.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&adv7612_out {
+	remote-endpoint = <&vin4_in>;
+};
+
+&i2c0 {
+	composite-in@20 {
+		ports {
+			port@3 {
+				/delete-node/ endpoint;
+			};
+		};
+	};
+};
+
+&vin4_in {
+	remote-endpoint = <&adv7612_out>;
+};
+
+&vin4_pins_cvbs {
+	groups = "vin4_data24", "vin4_sync", "vin4_clk";
+};

-- 
Regards,

Laurent Pinchart

