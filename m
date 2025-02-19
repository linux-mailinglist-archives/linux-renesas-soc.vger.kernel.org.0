Return-Path: <linux-renesas-soc+bounces-13366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A6FA3C486
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 17:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6855E3BB213
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 16:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F951FDE3D;
	Wed, 19 Feb 2025 16:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="i1L8Bhiq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA341FDE10
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981283; cv=none; b=gl80GZBM5XtUUxEgRBTwgeOovWl3tHpTJsOAU+DaHPCGzHlZUNLN73Tom2TvAdWPBTBtbWx3B+gfcJ8bFITrb9AjDAbocwH4mvzN4EwBRn5+Cqft6LJrxJpNorK6NHaVr9vte4lFP9wL/0Wjx4jnF2izsr/soNPyuY3KgZnYIo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981283; c=relaxed/simple;
	bh=wc4sN7qLZm+el405nRxJo5bxZYh7t6HvJ1R0u+zhzag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y0+6ou2PkxK5zW+sspkWrkAOGdjz0xHFNWKBED8NDzNvTKVksgEVCG8mMyBpdNgWoR3fLL4NK3Xtn0pmUEn+5/weWMPy3dc0hcODCj1tiH0F2FCkJYT/7gTrwU9EieBpBFG6TJtqGAyX1metAT9r/nVbMPtvb/DstH30EITHfgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=i1L8Bhiq; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso1163543566b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 08:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739981279; x=1740586079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlGt4wExiEL/CIXJbDF0itACKrrgHmIFMrYFUtPey+c=;
        b=i1L8BhiqCbPhgjhqI4Fs0WESgBOn7qro6AnnWert3MTOoZLsj7G3+Mjl1knNKEPU3F
         RyFtGuzwiVsEN0wzECKvdfNoHo4OmYtVY6vBmyEbw2yut+r0f6BuBXFpq6454LhdYMH1
         uVvamrLBEtJ/qIN+mQOtNgbYOaax7IyYSTfioADdnREZ8/5bqw3oZ3HttptNOzcaFU+Q
         yVgK0sgn4AW/9vVfarjUZkz8NPpmbTol5zMuryl7d7MRWVzi23tWpj/ZRm5QuGi5GfZq
         +VGi/mNNMz/Tw2kT+RPv3fu2B/5FQoZGomXomz7B4ckg3xVgpNmZNB+XBoS9QTQhjdof
         FHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981279; x=1740586079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlGt4wExiEL/CIXJbDF0itACKrrgHmIFMrYFUtPey+c=;
        b=tcMAeBm0FxIBhRHGytTQx8azPwzebKC2jidbyWEeFQfK4vLENkIKWQCfB4xjo6MkP/
         gJ/lbDop7h2wvRl30HrKEOXeI8Hb3/hXIhjZPa9mq9k12g4C+AhMc/FCi6xEovNlqTeW
         T8hV5j4pyPGvd3J9WmzWRTxdrX7/F9lP7qAQn3j5hwOBiV22H5eaHM7bUrwOg6PoW24d
         m7zxz0halPzHNVrvPIKRFto4r9t2SFPGD9EXm+EemSPy+s3tp7qsPsOfo8JuLNwCEFEv
         tWLiCqOG+srD6eHbwWDnD4YQS0FETyGKWub+3gmMX0hZujkp+7hsWb8zkDCR1/PskQ7E
         XwLA==
X-Forwarded-Encrypted: i=1; AJvYcCX3a1uSNc6ybHzcYgyWp+sUjtVhrE3p9AjfQAZUhOYEzP/QGOyjKTrBZgvjr1U81+Gal8aMmr2qPzPln+siVQwtMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSCFTUrSo37MyTM5vBjxvsGCivq4O0laj0DoyuXBONbMRoazRk
	OPEkdeJPN6ECDYo7SDLMbn+jXtEL9sABkRGWkJ6PTMpnu0EhYC02M544tnXd2x0=
X-Gm-Gg: ASbGncul4grtzH5aHkXo3evEoOCho3oIOGWDirrVxF5blH3/0z+yMnWn1CUL4h1+Lxg
	EFcfCQ985TA8KMPcsJDxy3Bl+3gI3/MvE1INN/leCQXsbxz3VHKQRw7AZbq+TFCp3VAWfE4edPj
	nua79/rl5zqnzLiBPCsetdVZRepVuFPBxw6hF5kueOiHuJtWHzM+GZRfCwVp1LL6vACk8t9DL8j
	a1nms9CywUMectzyvdHxdQ/uge4z/TBCtQUucaDNFpDBDO4hVlXlD80/xwtBlRXkwtwnOZfO8oS
	AJXn45MpkpVyO4pWYOUhnDFvjB54UVVshkRLpdYTRpY9
X-Google-Smtp-Source: AGHT+IF44ZngvmvLQTa6/DYd9mBS4nelIO/FTgR44hs+O/p7Fl0s8INvjP10jVJEICLAlDgjE/nKmg==
X-Received: by 2002:a17:907:6d09:b0:ab7:cb84:ecd6 with SMTP id a640c23a62f3a-abb70e0d0ecmr1908734066b.56.1739981279398;
        Wed, 19 Feb 2025 08:07:59 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbc0d0b882sm327791066b.109.2025.02.19.08.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:07:59 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	horms+renesas@verge.net.au,
	fabrizio.castro@bp.renesas.com,
	robh@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH RFT 1/5] phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
Date: Wed, 19 Feb 2025 18:07:44 +0200
Message-ID: <20250219160749.1750797-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
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
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
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


