Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56E936932A6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 17:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjBKQ6z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 11:58:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjBKQ6y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 11:58:54 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694B53599
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 08:58:53 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id j23so8201866wra.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 08:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rf5ZAcy/GXCo36DmzV5DkIEBLmV1DDUmlNZupwkUTG0=;
        b=MHBaV4QlVZlrYl3mRa4wx1I/csuyRLbF2R9X34S6GPAOCrc7n7kLYzAKzP24WA0/iQ
         CebfeY/3+W8+prTXMUjC5ifDAEME8Xf1XXRoSVpCF0un8abt5Qxlh3NPIxZLC3/O/OhY
         E8H3WDwMTIQsYaeT6vbTKwEFS55NjicI4P7AF/zZgbh4Z4Xb4eqktjVnV1gHaJpxh8qI
         BRE15sE7Syj3kKgW7q6C5Rw+zycKRJR7SQrrvZieywFt0GPQQs5GogUBAoHdOtbeCEoW
         u4ajr9gOoHWtzNBXRY2SnUbggKsu6KWbWXTfXZDSlzVwkptWbc0qz8DAfdfaT93hdwDA
         XVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rf5ZAcy/GXCo36DmzV5DkIEBLmV1DDUmlNZupwkUTG0=;
        b=EWCNZmGEG/jkGXLaEohgCW4XH/CMwvVKCuktzIcf6kwctZkCwxpZNBCN+FCZe+Ha9d
         /Tajba5NpJtPpvIin+1ixd5dmWbdq5MzlhZ1sYhTokFk5t4eY4a0i81l/u8Ak+r573IX
         bxvYX9mffA97fkNi/StAwoPmy2BoyT74LaZFKxo+4ENMoTQfsUfmNlWHkN8+x/o+q0/5
         erwNdqtKRL1iav28eSF0udaRJSwcMNxhoXDM2Exv9X/PEjmu/sZdqtQU1jZ4zvGCJgy+
         WJ3cWL4gRlc3XhWcNQKG0s8+06+PFYaRSACzc9kqNGeLbCSyj6o2se2r07LaNuty7W86
         kSpQ==
X-Gm-Message-State: AO0yUKVwtvduhso9E96IeoeNsozd6X6t4/ggV+ZnCY7q3JS9lUB4c5rv
        l+q0TZV1A1sLieT6CKeU1CWAyw==
X-Google-Smtp-Source: AK7set+aBrBd5afw2oNBvePJeEYaB3Z2pQ13ePz8aBB0jd1BQ39pl2Qk8xtqPrdjgeFwDNJFRmV/Ag==
X-Received: by 2002:a05:6000:551:b0:2c4:5d8:8250 with SMTP id b17-20020a056000055100b002c405d88250mr10752589wrf.23.1676134732004;
        Sat, 11 Feb 2023 08:58:52 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id y13-20020a5d614d000000b002c5526234d2sm887064wrt.8.2023.02.11.08.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 08:58:51 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] arm64: dts: renesas: draak: Add overlay for CVBS input
Date:   Sat, 11 Feb 2023 17:57:15 +0100
Message-Id: <20230211165715.4024992-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211165715.4024992-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230211165715.4024992-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The Draak board has an ADV7180 CVBS decoder and an ADV7612 HDMI decoder,
both connected to the same VIN input. DIP switches are used to select
one of the two devices, with the HDMI decoder being the default. Add an
overlay that selects the CVBS decoder.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
[Niklas: Inverted it from HDMI to CVBS]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../boot/dts/renesas/draak-cvbs-input.dtso    | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 0699b51c1247..f5df37253184 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -87,5 +87,6 @@ dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
+dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-cvbs-input.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso b/arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso
new file mode 100644
index 000000000000..b833c58c2029
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023 Ideas on Board Oy
+ *
+ * Device tree overlay for the Draak board, to enable CVBS input. This requires
+ * setting DIP switches SW49, SW50, SW51 and SW52 to OFF, and SW53 and SW54 to
+ * ON.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&adv7180_out {
+	remote-endpoint = <&vin4_in>;
+};
+
+&i2c0 {
+	hdmi-decoder@4c {
+		ports {
+			port@2 {
+				/delete-node/ endpoint;
+			};
+		};
+	};
+};
+
+&vin4_in {
+	remote-endpoint = <&adv7180_out>;
+};
+
+&vin4_pins {
+	groups = "vin4_data8", "vin4_sync", "vin4_clk";
+};
-- 
2.39.1

