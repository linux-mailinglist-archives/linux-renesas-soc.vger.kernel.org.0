Return-Path: <linux-renesas-soc+bounces-13951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA29A4DB49
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 11:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E85B0188E579
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 10:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1DE1FF1BD;
	Tue,  4 Mar 2025 10:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="I/F1BWbC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF0D1FCCF7
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Mar 2025 10:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085316; cv=none; b=qV3KlubkOMnHcw5yzXSi7XwwMs3udEAhpx2KrQkvn64FDIKWE2kgepsjGfmDL90qo53EF6/yKVs8xJfpFwB4NNPwH+XuemJMJYce+yLZPf4kIF5rtH4qEQraKuMaFmi+3RCZKjBROhniMEE79A63fBnsQ8pV4gdRpCM0nrUT6rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085316; c=relaxed/simple;
	bh=L+7igWmrzB3MXXLwtuLEyjoA6CAq6ItWg62jIUmYSgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c9NVWNgrsuSxqODTZv4HHMajTOmK3cQcqvwO9cCo45GwJwwsyI0ajFW1Y3PdcEjySiKfShwwtMqfDrvbG8rImzUlKPDeLQNJrgkYHyWAiNNeV/pxnxPj4RDuacY7jlQ9Tg1kMSSQ3rzBNlGPIvBBZtCf36ULRNxatXULiUp+WTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=I/F1BWbC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43bcbdf79cdso3659455e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Mar 2025 02:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1741085312; x=1741690112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjhb9oVUG8lj7hYYtmkJhzYs0Q2lzrIfIpH+FDRUtb4=;
        b=I/F1BWbCFVw+I/jrTwmST+Bu+dHeRKJPywxM9ZLgUPrq6nj9E5LtC0nS+YdiH4emHa
         MoNon0wD5OFzQ8sRCLxmsg2sIDlQ7oRihoIf2Fil2LtofYoHM+peDllgjhyeJ+2eD8r+
         VNaYBbmn17XykKvpkuBK3dqhfMUDce9IfjyJyclGQv1kahwK1eksmY9jNiAP+F+5N0e7
         mVpog/qLpjGPZjy+g87pbiYZN9x0N4IZnmMAuBemnI5vxPZ89fYcoIln6rYO60lY533i
         WgNMsa6Uj/Ohi6pJ7akstsuEaxoQ5YSA5C5Y2u6MP3QebydSRtO0SKQh4mf2n0eX7vgb
         3avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085312; x=1741690112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjhb9oVUG8lj7hYYtmkJhzYs0Q2lzrIfIpH+FDRUtb4=;
        b=gOGbeJxivDg6SlKsm11QleDF93y9IHjEAppEaEe56b1cLTjziz19KHT+kawnXGT7Il
         jVPtZoP3RwX70c03EUe992fHGCYIW8cGKVARdaCVrCInv3MdYkplUCXjZ0/2bpVNdxq3
         qfRK6DwNRT76f6kwWLzCC2Y8t0STpurUZQLyttQVDQbEp9ifzSin4RCq+mBhqzymn6Tj
         3LkHIoNW3jLAXHuFOB49aHEQsykTbsb9BWtlBZgRmxZXMpFIuqjGxOjnlCj+KKuWQgLZ
         0VMwH+DAYOgZQi9akBdA6ZO5JTkgxiopT9JTF6Mu22/lGxVvH2LpqYCdSIWZuvhrFam3
         qH1g==
X-Forwarded-Encrypted: i=1; AJvYcCUMMnjc3OaHspHfoehucCKkcrYwYFvTuzr66UIt7ccNxGNOfRi8WRHPdfpIoB79AS8SlkrCwrqMxX41OI02DsnIkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXlEZHf2Lnpz3CqwxRTwhf4QJGB4tkbneuf8COFel+WhEGNsiN
	KdrcCH/PywITRux5HTIBbHUh2WzHPcTwcqXGhLoxEgaC5iQPjvyZJv2DuZsAmhM=
X-Gm-Gg: ASbGncukCXF9J3UTJYJw3oaiT0rXKRHKbHNbgpD6ppxCG5+mG0v8jcR7Rnj12jZ2Mpe
	hrRKudCCd7JPcxw31pEpQQPJSy88hiqXaVELwHH3+kqEg6qr8iYpOla5RlXWSRm5OFj+W1z6epG
	q3whbqKyNUB/XRx0FoqB7YI7bGBOGNxqvLFKMmesyleMkAW5tGCAiZU6PXBGrLUYlryKQV2oPhA
	zR5WeElglvv+iPemoXoAFBFfwvici72jLiP6UhJHWGl/RFqHRSU1m7Dy3n0Uu+v32CmXRGG9hy7
	K8AHclONJ/1Hon9VosJbcQFmwZOLRHOW5vQqed8Vz/cVl7xbDiXq73ust87twI2IeF6mCZitCkI
	=
X-Google-Smtp-Source: AGHT+IHcts+Ef7abJwxoLgkZw98QU7H40GbI3oB8YyXxlG8MEQq/0M2R29xPjCZcGAJReffYT0xshg==
X-Received: by 2002:a5d:64a6:0:b0:390:e889:d1d7 with SMTP id ffacd0b85a97d-390ec7cc71amr13636577f8f.13.1741085312528;
        Tue, 04 Mar 2025 02:48:32 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844a38sm17445161f8f.75.2025.03.04.02.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:48:32 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	horms+renesas@verge.net.au,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/5] phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
Date: Tue,  4 Mar 2025 12:48:22 +0200
Message-ID: <20250304104826.4173394-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304104826.4173394-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250304104826.4173394-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

It has been observed on the Renesas RZ/G3S SoC that unbinding and binding
the PHY driver leads to role autodetection failures. This issue occurs when
PHY 3 is the first initialized PHY. PHY 3 does not have an interrupt
associated with the USB2_INT_ENABLE register (as
rcar_gen3_int_enable[3] = 0). As a result, rcar_gen3_init_otg() is called
to initialize OTG without enabling PHY interrupts.

To resolve this, add rcar_gen3_is_any_otg_rphy_initialized() and call it in
role_store(), role_show(), and rcar_gen3_init_otg(). At the same time,
rcar_gen3_init_otg() is only called when initialization for a PHY with
interrupt bits is in progress. As a result, the
struct rcar_gen3_phy::otg_initialized is no longer needed.

Fixes: 549b6b55b005 ("phy: renesas: rcar-gen3-usb2: enable/disable independent irqs")
Cc: stable@vger.kernel.org
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- collected tags

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 33 ++++++++++--------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 775f4f973a6c..46afba2fe0dc 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -107,7 +107,6 @@ struct rcar_gen3_phy {
 	struct rcar_gen3_chan *ch;
 	u32 int_enable_bits;
 	bool initialized;
-	bool otg_initialized;
 	bool powered;
 };
 
@@ -320,16 +319,15 @@ static bool rcar_gen3_is_any_rphy_initialized(struct rcar_gen3_chan *ch)
 	return false;
 }
 
-static bool rcar_gen3_needs_init_otg(struct rcar_gen3_chan *ch)
+static bool rcar_gen3_is_any_otg_rphy_initialized(struct rcar_gen3_chan *ch)
 {
-	int i;
-
-	for (i = 0; i < NUM_OF_PHYS; i++) {
-		if (ch->rphys[i].otg_initialized)
-			return false;
+	for (enum rcar_gen3_phy_index i = PHY_INDEX_BOTH_HC; i <= PHY_INDEX_EHCI;
+	     i++) {
+		if (ch->rphys[i].initialized)
+			return true;
 	}
 
-	return true;
+	return false;
 }
 
 static bool rcar_gen3_are_all_rphys_power_off(struct rcar_gen3_chan *ch)
@@ -351,7 +349,7 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 	bool is_b_device;
 	enum phy_mode cur_mode, new_mode;
 
-	if (!ch->is_otg_channel || !rcar_gen3_is_any_rphy_initialized(ch))
+	if (!ch->is_otg_channel || !rcar_gen3_is_any_otg_rphy_initialized(ch))
 		return -EIO;
 
 	if (sysfs_streq(buf, "host"))
@@ -389,7 +387,7 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
 {
 	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
 
-	if (!ch->is_otg_channel || !rcar_gen3_is_any_rphy_initialized(ch))
+	if (!ch->is_otg_channel || !rcar_gen3_is_any_otg_rphy_initialized(ch))
 		return -EIO;
 
 	return sprintf(buf, "%s\n", rcar_gen3_is_host(ch) ? "host" :
@@ -402,6 +400,9 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 	void __iomem *usb2_base = ch->base;
 	u32 val;
 
+	if (!ch->is_otg_channel || rcar_gen3_is_any_otg_rphy_initialized(ch))
+		return;
+
 	/* Should not use functions of read-modify-write a register */
 	val = readl(usb2_base + USB2_LINECTRL1);
 	val = (val & ~USB2_LINECTRL1_DP_RPD) | USB2_LINECTRL1_DPRPD_EN |
@@ -465,12 +466,9 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
 	writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
 
-	/* Initialize otg part */
-	if (channel->is_otg_channel) {
-		if (rcar_gen3_needs_init_otg(channel))
-			rcar_gen3_init_otg(channel);
-		rphy->otg_initialized = true;
-	}
+	/* Initialize otg part (only if we initialize a PHY with IRQs). */
+	if (rphy->int_enable_bits)
+		rcar_gen3_init_otg(channel);
 
 	rphy->initialized = true;
 
@@ -486,9 +484,6 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
 
 	rphy->initialized = false;
 
-	if (channel->is_otg_channel)
-		rphy->otg_initialized = false;
-
 	val = readl(usb2_base + USB2_INT_ENABLE);
 	val &= ~rphy->int_enable_bits;
 	if (!rcar_gen3_is_any_rphy_initialized(channel))
-- 
2.43.0


