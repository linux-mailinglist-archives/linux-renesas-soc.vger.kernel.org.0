Return-Path: <linux-renesas-soc+bounces-34411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xLPIAVy5PGoIrAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 07:15:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD886C2BF5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 07:15:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ew.tq-group.com header.s=default2602 header.b=g27bAOP0;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ew.tq-group.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35E37302D11D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 05:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7918E305682;
	Thu, 25 Jun 2026 05:14:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7DC2F25F3;
	Thu, 25 Jun 2026 05:14:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782364499; cv=none; b=fDSpAjxcJWyhagMoXaTQxf+biWCFwRNEHf0A2o4HRDCXSZZF/ult6GdXnCURuvehBA0B3Q3vjHE2ffTdOLNYOqB77A9kbYWazQ+OTLCU4fFXrHBvG3un4LsH4D5RpfqT+g+f33sRi+TXuonzDCqtML0bz+2Xv+VB5KNmFtwDpBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782364499; c=relaxed/simple;
	bh=9Vs+/oGH2yGRYLqhty+vKJCcy8UtUbPlWQ1lnPB96ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ti2bTR0o8qN+Ord/NPc2jR8oOzk2VBk4zCNDrFaIbyXp8tWF4/p+fbKl1PapXdPzFMj3B7ov5SS6v4bBdPNltEt961FkTCr3hpTGTINDzLyxO4xs8QCuFCtjfXe1bWOaO7QQYz55CqFnOvsK2a5wQGNjWSfwn+1p/RaYS2qG1Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=g27bAOP0; arc=none smtp.client-ip=188.40.3.216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=owpGvIDvafj4FmetzRwj1Of5zNW8jn13/R7Di810Ixk=; b=g27bAOP0fwv8aaIalePav/W0LB
	Z2K08vtfQ4clb0Qs3n96T1H832VwDyZoaYq2xvJcLoAtbYtHgpe3jig2JZSBllQyRoPOm4tkDFJXE
	yc7j4acJjLAauRkEi7pv5+/nXabhdXFeKIx2al/PSC4Eh1GyMnSqIuXWhVVhyRXyDvSUMghLPxEXG
	StkgtsrihJ0LfKYG4wGX/GBGODDpbZz6Dhgkn30a9RW5/bWGTaDLVRf8MZlLGpLkUyVTzHrrDKwVf
	ySTylM67shMkhZVEc4snm7oHMzeSTIhrZBgYGBvMY9BYuqeuIpxzCpTpdh9ePQNDTZzq0hatLduOD
	6b6zotOw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wccQQ-0001pQ-0l;
	Thu, 25 Jun 2026 07:14:54 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wccQQ-0002rW-1N;
	Thu, 25 Jun 2026 07:14:53 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 4/4] arm64: dts: freescale: Add dual-channel LVDS overlay for TQMa8MPxS
Date: Thu, 25 Jun 2026 07:14:47 +0200
Message-ID: <20260625051449.2560197-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625051449.2560197-1-alexander.stein@ew.tq-group.com>
References: <20260625051449.2560197-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28041/Wed Jun 24 08:24:54 2026)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34411-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,glider.be];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:shawnguo@kernel.org,m:alexander.stein@ew.tq-group.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux@ew.tq-group.com,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ew.tq-group.com:dkim,ew.tq-group.com:mid,ew.tq-group.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FD886C2BF5

This adds an overlay for the supported LVDS display AUO G133HAN01.
Configure the video PLL frequency to exactly match typical pixel clock of
141.200 MHz.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v6:
* None

 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 ...p-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso | 81 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2f4568e7105f4..0c390ef6f7571 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -498,8 +498,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb
 
+imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtbo
 imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtbo
 imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso
new file mode 100644
index 0000000000000..2d2dfda944faa
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Martin Schmiedel
+ */
+
+/dts-v1/;
+/plugin/;
+
+&backlight_lvds0 {
+	status = "okay";
+};
+
+&panel_lvds0 {
+	compatible = "auo,g133han01";
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dual-lvds-odd-pixels;
+
+			panel_in_lvds0: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-even-pixels;
+
+			panel_in_lvds1: endpoint {
+				remote-endpoint = <&ldb_lvds_ch1>;
+			};
+		};
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_in_lvds0>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			ldb_lvds_ch1: endpoint {
+				remote-endpoint = <&panel_in_lvds1>;
+			};
+		};
+	};
+};
+
+// Update VIDEO_PLL1 frequency
+&media_blk_ctrl {
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>,
+			       <988400000>;
+};
+
+&pwm3 {
+	status = "okay";
+};
-- 
2.54.0


