Return-Path: <linux-renesas-soc+bounces-33509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EUN+K8b2H2patQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 11:41:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DD46363E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 11:41:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ew.tq-group.com header.s=default2602 header.b=RLYkQEfE;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ew.tq-group.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CE703100F37
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 09:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFAD8401A3A;
	Wed,  3 Jun 2026 09:36:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D2F39A4C4;
	Wed,  3 Jun 2026 09:36:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780479400; cv=none; b=NF27FeJxfsuQrNrs8ZvDPfU1kxeiQX3WhqtyeENcLLCg+eq93hujUKEa3ZOaKjEAl3zKVX+j3J4QpRDoWrwmw7PiZ9kc+nfkt5J4IQKg4qdofWAYT20MCex19iYVHib5QUx/OdvW1WjfFEt/stOqmjwVXT79H+Db2P+9FjAiT5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780479400; c=relaxed/simple;
	bh=Y8tO2tuiKRQs8SBlwACtC3ShhVJRJQJBQvomvcVWW68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UON/iGxkta/EnhHwuBH+WG41HwX1vMwWLUTbdLYhYAaBZdpUROptYgRvC9kmWJYLq/ZKhKsbPx20dUvlrgMJqZTFu3FFeDEpcvriPoDsHA8VShAuf67FFUjbWLHgp28Nsh2Rykm3n1T/rj7FPsRh2AWum2EYToG1zgnaLiO/JzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=RLYkQEfE; arc=none smtp.client-ip=188.40.3.216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=s3nIZg1lS6d2bL1jzuE1zd9NPy/9rMXAaV/jqMphScY=; b=RLYkQEfE8ZLPYaH01dRy78QLgP
	OXs611qUyvlm0MYu/jv7V2ECgxCsyZ6a0gu3udc1K+wzh69TmW8P5Kr6yDivYW8QNPRa5z3yA6Fm3
	UEXunbdaOd0KWPD6YZkUfmKon0T2Jmr1SSx4jrp0IoIfZeD+3/qP0Kk7fAmN1jwRWBxxpUgXvwm3S
	3vbaEy6TnPfRbGkIDE7iKRoAacGQJrOlR7wtJaGQXoFqwWxOlWmE6dSp6QW/1cfitIu88Vk8ikLMq
	fhV3XlgH6gfF6P6UGOxeW5VoNIkvqLlzcTzzo3JjdqXuYAq2MLVGPqMAgVnK5JOZNd8SId+jVoh5R
	UcHvMfmw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wUi1T-000309-0h;
	Wed, 03 Jun 2026 11:36:27 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wUi1R-000Hpl-2l;
	Wed, 03 Jun 2026 11:36:26 +0200
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
Cc: Paul Gerber <paul.gerber@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v4 3/4] arm64: dts: freescale: add LVDS overlays for TQMa8MPxS
Date: Wed,  3 Jun 2026 11:36:08 +0200
Message-ID: <20260603093621.2504490-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com>
References: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28019/Tue Jun  2 08:33:27 2026)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33509-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,glider.be];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:shawnguo@kernel.org,m:paul.gerber@tq-group.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux@ew.tq-group.com,m:linux-renesas-soc@vger.kernel.org,m:alexander.stein@ew.tq-group.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ew.tq-group.com:mid,ew.tq-group.com:from_mime,ew.tq-group.com:dkim,vger.kernel.org:from_smtp,tq-group.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69DD46363E8

From: Paul Gerber <paul.gerber@tq-group.com>

This adds overlays for the supported LVDS display tianma tm070jvhg33
for both LVDS channels.

The display timings have to be specified explicitly. Using the typical pixel
clock, the LDB clock can not be configured as the 7-fold of that.
By setting pixel clock to 74.25 MHz, LDB can be configured to exactly
519.75 MHz.

Signed-off-by: Paul Gerber <paul.gerber@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v4:
* New to series v4

 arch/arm64/boot/dts/freescale/Makefile        |  5 +++
 ...qma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso | 43 +++++++++++++++++++
 ...qma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso | 43 +++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 29adf1ab41cdd..dee2bea156740 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -385,6 +385,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb
 
+imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtbo
+imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
 imx8mq-evk-pcie1-ep-dtbs += imx8mq-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk-pcie1-ep.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..2cf1de8c05b49
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Paul Gerber
+ */
+
+/dts-v1/;
+/plugin/;
+
+&backlight_lvds0 {
+	status = "okay";
+};
+
+&panel_lvds0{
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+
+	panel-timing {
+		clock-frequency = <74250000>;
+		hactive = <1280>;
+		vactive = <800>;
+		hfront-porch = <64>;
+		hback-porch = <5>;
+		hsync-len = <1>;
+		vfront-porch = <40>;
+		vback-porch = <2>;
+		vsync-len = <1>;
+		de-active = <1>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+};
+
+&pwm3 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..cbad0cfab2925
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Paul Gerber
+ */
+
+/dts-v1/;
+/plugin/;
+
+&backlight_lvds1 {
+	status = "okay";
+};
+
+&panel_lvds1{
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+
+	panel-timing {
+		clock-frequency = <74250000>;
+		hactive = <1280>;
+		vactive = <800>;
+		hfront-porch = <64>;
+		hback-porch = <5>;
+		hsync-len = <1>;
+		vfront-porch = <40>;
+		vback-porch = <2>;
+		vsync-len = <1>;
+		de-active = <1>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+};
+
+&pwm2 {
+	status = "okay";
+};
-- 
2.54.0


