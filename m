Return-Path: <linux-renesas-soc+bounces-34927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 753iJWdcT2q5fAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:31:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B40372E4EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:31:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=swfPbmZ5;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E75C830252A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 08:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F397F3F2100;
	Thu,  9 Jul 2026 08:31:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EA73EFFDC
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 08:31:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585876; cv=none; b=Pt7fNGIE5AgUDNIvbOH10oPufOW4xPlKbt4etQm7o9Et1Xd5coU/oL+4y5UOcdjqTN+IYd3s3IFNPNm+Mg6tarZ0ytQsQ8yTSikWJJtK37vkUDiul7zAEzB/dmJ93BFECBWsinPry5z5oIFTaieqxxBn+6iP9ItYOYxK6B+Ngcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585876; c=relaxed/simple;
	bh=PYxruzFLINygyGQOy0iKtijPZZRNWyuWnO44oqRF+Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lHM8u042BESkGzzXU3evMWfzOtb9VrHcBIh9WqaqU+DXmaCjiD6RCTIwbAWCHmlliG0Rp9Ngtg6OBrP/aOPW5zoDb1GHULbGk4YbPrmEK03KoJaBo7dyGt3Vn7MDokshnuHX6/POTxR4a/E3yZxDfDqYDY4JxyxTfZj8+Sm6Nas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=swfPbmZ5; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-475881b9a4bso1356540f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 01:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783585873; x=1784190673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNukIqtVRnjj2t2mzXViCCbEh3Pr2HmpRQbuBnkiQpo=;
        b=swfPbmZ5oojIAwQR2jl+2LL0FEBsse2P/+7bhreJ6hmEo5yn+HDfhyCWC4HJoyIkn1
         h6TQot/ooP5GejHkYtZT843UGR387jt3E863ke35Zvkao19H8irwVN0LSndnalna9WYJ
         KtFsjsNsV3yGttbrSjw0N98sYl0iHi7I+YML86AEjiTcMQPX3p6LTdrvGygPnkFOk7EC
         YOJy11ZW8F57Pcj6uzcaEdaKygdJylSByEVwZ9n7xRadJba/mboUkVyL7WCaZ+O9KCXq
         X2HuHDUwdflY2BFkpX+IKVtHxjINGEfqz+WFPN1PF2h/evxfY5tqMbvMh8a58v3Def3P
         uyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585873; x=1784190673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FNukIqtVRnjj2t2mzXViCCbEh3Pr2HmpRQbuBnkiQpo=;
        b=jRrKQlGNpFcIMHl+OXFIf0ssHIQ2X1U99eeJi8Zh2R5hBvAYLmNGe5/rTQyP+DkwnD
         MUU7HrXrqBTdGtnDm5XfZtcrMZ6jmqSMRIqLWtzsdiOBy0imTuxsQ+SfoBmWzDEjlELZ
         8toG4kySJkRvDBBd6vvawTWyGAyinpdJUmCJe7mF+Y3kTlvKaI9EAigWEOqw+QugcW98
         TOvvYg9L0bqAr9OOyAfAfOUN1t90zpRV3Pc/6FbFWnanhNoC0idgbL3fr/qrHJDazyJi
         hcekLAqfnp1IZx9kJsRH2sVs6Mpg9IE/4piOVQQ4wQCa3p1JD0GDnoF+NzmNNKp+7O+j
         NW1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq8Nk9mbH5MQyiJifKTZA+H0DWIHDaTae8zGDCM8R2aBrMA6QekK2AmVa8TsQM1lPOVS314gOmtRuJBEtXf/S0t9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmckd/SdkVmg6mQXajkB/KYqKP8/wh2bO60wWU79vpM5P0F7dn
	pdPRaznfwDDrlAKry/Cm057+2E2dXzJ7cUFtv7QeAeDLv0ULjPzO7YqqY0ftw1En
X-Gm-Gg: AfdE7clFKoVtoZ+5H4+yxXYLBiIUV8r4cg4A56qfCv4Nb0sjnynLkMQBKZnZpO+UjfE
	ifN7gZDXqWHrLL5r7yQlFj21uWl286GAvjYHGGTdGlKTH2RYzAkV9y93oX8rwGLr/oOBJf/rIX+
	NTPkmfv7/PSpGZSpRoewcxRT19JM4yklQtRrbT26/Y0PohwcHC3wNWGzshSuAgIBtq6QjOrdm+j
	kXTKqTdJ+tkG07RozFQcvi1z/H0WB61MjITH/E8XEPa3MPt1q+P0wvelg5xPQ3eg/MJymyqLL9N
	Ey/lB6sKeqnLs/U0sFTf08hSLHehl1cINkQFeRuLIn3PAu481/HvRt1wsDUTTX38f2VbbZO+K+Z
	aP2a+LN66ieGWfYeMRXiZ0maP+cvQt1mwqSkfxzrA05mKcMHl+Q4FtlABrPjZNUWnOCR0SQDiDx
	XegFcT6/h0CJIjbikhV7nJ
X-Received: by 2002:a05:6000:1787:b0:475:f100:35f3 with SMTP id ffacd0b85a97d-47df076c9bcmr6878817f8f.48.1783585872954;
        Thu, 09 Jul 2026 01:31:12 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm50316543f8f.11.2026.07.09.01.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:31:12 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 3/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Date: Thu,  9 Jul 2026 09:30:56 +0100
Message-ID: <20260709083108.108370-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34927-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:broonie@kernel.org,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[pengutronix.de,glider.be,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B40372E4EA

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the renesas,r9a08g046-usbphy-ctrl compatible string to the OF match
table for the RZ/G3L (r9a08g046) SoC, using a dedicated rzg3l_info
struct with pwrrdy set, similar to RZ/G3S.

The RZ/G3L SoC has 2 OTG controllers compared to one on RZ/G3S, so it
uses a separate rzg3l-vbus-regulator driver to handle the additional
VBUSEN control for port 2. The regulator_driver_name field is used as
the platform device name passed to platform_device_alloc(), and must
exactly match the name the corresponding regulator driver registers
via its id_table for platform bus matching to succeed.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated the commit description.
 * Migrated to id_table match using driver_name and reduced the length
   < 24.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 84e745e49240..0803195080bd 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -42,6 +42,7 @@ struct rzg2l_usbphy_ctrl_priv {
 };
 
 struct rzg2l_usbphy_ctrl_info {
+	const char *regulator_driver_name;
 	bool pwrrdy;
 };
 
@@ -110,15 +111,24 @@ static void rzg2l_usbphy_ctrl_init(struct rzg2l_usbphy_ctrl_priv *priv)
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
-static const struct rzg2l_usbphy_ctrl_info rzg2l_info = {};
+static const struct rzg2l_usbphy_ctrl_info rzg2l_info = {
+	.regulator_driver_name = "rzg2l-vbus-regulator",
+};
 
 static const struct rzg2l_usbphy_ctrl_info rzg3s_info = {
+	.regulator_driver_name = "rzg2l-vbus-regulator",
+	.pwrrdy = true,
+};
+
+static const struct rzg2l_usbphy_ctrl_info rzg3l_info = {
+	.regulator_driver_name = "rzg3l-vbus-regulator",
 	.pwrrdy = true,
 };
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl", .data = &rzg2l_info },
 	{ .compatible = "renesas,r9a08g045-usbphy-ctrl", .data = &rzg3s_info },
+	{ .compatible = "renesas,r9a08g046-usbphy-ctrl", .data = &rzg3l_info },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
@@ -245,7 +255,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (error)
 		goto err_pm_runtime_put;
 
-	vdev = platform_device_alloc("rzg2l-usb-vbus-regulator", pdev->id);
+	vdev = platform_device_alloc(info->regulator_driver_name, pdev->id);
 	if (!vdev) {
 		error = -ENOMEM;
 		goto err_pm_runtime_put;
-- 
2.43.0


