Return-Path: <linux-renesas-soc+bounces-33552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FF/pKuxKIGqx0QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 17:40:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 223376394EA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 17:40:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAAEF30E7CEB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 15:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A297B3D6691;
	Wed,  3 Jun 2026 15:17:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6337E3CF671;
	Wed,  3 Jun 2026 15:17:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499839; cv=none; b=daGyN1uopalfykXeCJhyblLtkLyKc0p4fhOxP4EyG74pKHpj2CygnS4F+Jk8Hg2RQ0iAhpvhyAvUbyilNM2Ty+LD4QfAh7/rHu6v2hmaIstsT0qsw/Te5wql8Vr3uwFyzTHEst5IuwdFAmHr98W+ESLYTJOKSIIn3xNL9wsKtEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499839; c=relaxed/simple;
	bh=Liu7S2+ZsFa6gRQW6s8JsVihpfcRfp9vJIp7HKHuC6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IuQ7QGi/BaUAx0OP8ieLIV48NJ9uaH/cwPs6l/H28TyMw9Bjf2FSO4xqHbhNeQz8hoMcmetBsD7BlRUXY406Y9PTjzflrrJHMnte9nsEvtGSc0TAgTDOAXpoLSakypKJ3XuF+IKDmuXhNHCRbwTSIH+b584DCPml1YGp0IebZhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AE01F00899;
	Wed,  3 Jun 2026 15:17:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] usb: host: xhci-rcar: Split R-Car Gen2 and Gen3 .plat_start() handling
Date: Wed,  3 Jun 2026 17:17:10 +0200
Message-ID: <d1ee4e1bb9106f8251b061b52948434d560b4675.1780499433.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780499433.git.geert+renesas@glider.be>
References: <cover.1780499433.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33552-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:mathias.nyman@intel.com,m:gregkh@linuxfoundation.org,m:yoshihiro.shimoda.uh@renesas.com,m:wsa+renesas@sang-engineering.com,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:geert+renesas@glider.be,m:wsa@sang-engineering.com,m:geert@glider.be,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,glider.be:mid,glider.be:from_mime,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 223376394EA

Currently, R-Car Gen2 and Gen3 share the same .plat_start() callback.
However, this single callback performs different operations, after
checking the XHCI's controller compatible value.

Avoid repeated checking of compatible values and reduce kernel size by
splitting this method in two separate functions.  Update
xhci_rcar_resume_quirk() to dispatch to the correct method by calling it
through the .plat_start() function pointer, too.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/host/xhci-rcar.c | 53 ++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index d2efc98090ce0053..d747c0905827661e 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -32,29 +32,6 @@
 MODULE_FIRMWARE(XHCI_RCAR_FIRMWARE_NAME_V1);
 MODULE_FIRMWARE(XHCI_RCAR_FIRMWARE_NAME_V3);
 
-static void xhci_rcar_start_gen2(struct usb_hcd *hcd)
-{
-	/* LCLK Select */
-	writel(RCAR_USB3_LCLK_ENA_VAL, hcd->regs + RCAR_USB3_LCLK);
-	/* USB3.0 Configuration */
-	writel(RCAR_USB3_CONF1_VAL, hcd->regs + RCAR_USB3_CONF1);
-	writel(RCAR_USB3_CONF2_VAL, hcd->regs + RCAR_USB3_CONF2);
-	writel(RCAR_USB3_CONF3_VAL, hcd->regs + RCAR_USB3_CONF3);
-	/* USB3.0 Polarity */
-	writel(RCAR_USB3_RX_POL_VAL, hcd->regs + RCAR_USB3_RX_POL);
-	writel(RCAR_USB3_TX_POL_VAL, hcd->regs + RCAR_USB3_TX_POL);
-}
-
-static int xhci_rcar_is_gen2(struct device *dev)
-{
-	struct device_node *node = dev->of_node;
-
-	return of_device_is_compatible(node, "renesas,xhci-r8a7790") ||
-		of_device_is_compatible(node, "renesas,xhci-r8a7791") ||
-		of_device_is_compatible(node, "renesas,xhci-r8a7793") ||
-		of_device_is_compatible(node, "renesas,rcar-gen2-xhci");
-}
-
 static void xhci_rcar_start(struct usb_hcd *hcd)
 {
 	u32 temp;
@@ -64,8 +41,23 @@ static void xhci_rcar_start(struct usb_hcd *hcd)
 		temp = readl(hcd->regs + RCAR_USB3_INT_ENA);
 		temp |= RCAR_USB3_INT_ENA_VAL;
 		writel(temp, hcd->regs + RCAR_USB3_INT_ENA);
-		if (xhci_rcar_is_gen2(hcd->self.controller))
-			xhci_rcar_start_gen2(hcd);
+	}
+}
+
+static void xhci_rcar_gen2_start(struct usb_hcd *hcd)
+{
+	if (hcd->regs != NULL) {
+		xhci_rcar_start(hcd);
+
+		/* LCLK Select */
+		writel(RCAR_USB3_LCLK_ENA_VAL, hcd->regs + RCAR_USB3_LCLK);
+		/* USB3.0 Configuration */
+		writel(RCAR_USB3_CONF1_VAL, hcd->regs + RCAR_USB3_CONF1);
+		writel(RCAR_USB3_CONF2_VAL, hcd->regs + RCAR_USB3_CONF2);
+		writel(RCAR_USB3_CONF3_VAL, hcd->regs + RCAR_USB3_CONF3);
+		/* USB3.0 Polarity */
+		writel(RCAR_USB3_RX_POL_VAL, hcd->regs + RCAR_USB3_RX_POL);
+		writel(RCAR_USB3_TX_POL_VAL, hcd->regs + RCAR_USB3_TX_POL);
 	}
 }
 
@@ -192,13 +184,16 @@ static int xhci_rcar_init_quirk(struct usb_hcd *hcd)
 
 static int xhci_rcar_resume_quirk(struct usb_hcd *hcd)
 {
+	struct xhci_plat_priv *priv;
 	int ret;
 
 	ret = xhci_rcar_download_firmware(hcd);
-	if (!ret)
-		xhci_rcar_start(hcd);
+	if (ret)
+		return ret;
 
-	return ret;
+	priv = hcd_to_xhci_priv(hcd);
+	priv->plat_start(hcd);
+	return 0;
 }
 
 /*
@@ -217,7 +212,7 @@ static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen2 = {
 	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V1,
 	.quirks = XHCI_NO_64BIT_SUPPORT |  XHCI_SLOW_SUSPEND,
 	.init_quirk = xhci_rcar_init_quirk,
-	.plat_start = xhci_rcar_start,
+	.plat_start = xhci_rcar_gen2_start,
 	.resume_quirk = xhci_rcar_resume_quirk,
 };
 
-- 
2.43.0


