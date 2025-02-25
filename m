Return-Path: <linux-renesas-soc+bounces-13649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4DBA43C78
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 11:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F8381895B60
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 10:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9735326770E;
	Tue, 25 Feb 2025 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="j36kgmgJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BC52676CD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Feb 2025 10:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740481159; cv=none; b=nLnkRCS17e1xj90NWPmntdvmbOodqWPkCCm0QdCBx9chae7svpzxFbGNgCG3OXrWoIHbr18B/UBaEz27PgJ/F4bIoe+x5tOIxRtv6TQ+X+gvvbGMXGjf8NlF+oTYIHacn8MnFDKKvnDmGdT7NSe8zuXUuqq5XCy9f1P5FEUkbAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740481159; c=relaxed/simple;
	bh=aRLrhUecBs7vYsSHOF02+roIq61av/C2p8cKhrDLy5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bKdTON9/JaB23YsRJru3BQxUjYR8uwg/fCf4aaFxHWxCia1EToHs3V+5uv/RUxEOfA4Lql01pEyt6XacCKGzp9agKDodIjrpAqyt7ZvmgwPPBko6+7kK9pUNzKvjgDGCx67KTjngzNLn1xOTR7xI6ov48Mza7Hs3slZatxoUr9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=j36kgmgJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43996e95114so35542935e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Feb 2025 02:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740481156; x=1741085956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kH7eCOhtqxJ18+f2Lrbq8HST1vCFK6UWg0TuF7cMRvY=;
        b=j36kgmgJ/5DR06t9WgegxnMIDjZrGf3MYCnIGqzQEUG4Sm3gRD3xPDsRS9aaE2oA63
         3qZqayhp4q+hAmHHhksC2TcxE3PLGYTnJhjQsVg/8SsUxW2FyQv87+EPTfRT+BYM4J8T
         yoZfDL5ikvE0L2Y5nEhyl3gPAzE6WqwX/lUvwBg5S9mQaxoIAgnIEOUXh9HyRznmEDkA
         QpIai/tgk3IoNqFSEDRubUSCgjMjS80zZJDvg57a3YVDxKs1jcFVYI/IyFC1p6ucK5d2
         F1SjP5wlHrH7t/arsHBEG3mqYxL/7vhn+eaLWETMz20YBf53TqrkTfQKOYf2jQ3XhLTg
         Fvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740481156; x=1741085956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kH7eCOhtqxJ18+f2Lrbq8HST1vCFK6UWg0TuF7cMRvY=;
        b=HQd43iAV8MWUA0Z1gkvEa94WUkN5VnZte8qhaKmOEVpIPO1VXtND0Y+iDmbIpWv49F
         ia6oEVWJPIYpR2IYCkluTX2MqK99/GPvt6Tp/A/cLxNrS3gnZEYv8whqU+irxGZgXC1j
         O1kbDVn85BxjVa9rlriaRKyq27MwH2SsMqrXQQNSXWME0cDqml99BGR6SnmE/MlZT+eD
         gL6E4utTccNfO63nRtNPw6U0QgTgkDCgv5/vDg1jisG6r6Ts2OSEDG5pGqkcjQDe1PaK
         d+vNvAxtphJ9AQGE7Bqd1KNg3S2Co8MFJvM/TH+KMFbBscJJIACQWYmRUN3CRhRx44qe
         2fig==
X-Forwarded-Encrypted: i=1; AJvYcCWWrrZeyLaPRbrK5hL2mJ9KG8NXL4Ld627AVEeS99T6ZTR0d/gKW/zx93uk+nE1rBkk8AX76Vl84h1ZgWpycwYvNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj2kPap48V9nkcqz/ZfK3GwYPTCU0vUz6JUNFaYDb9Z1bbVydc
	Mx3Zujii3FTOMxFGU+p33wwbAxwhudVGpn4VbXG6QwP03/TcZseanp+Tx/Trnnra6S5byX8JDQS
	L5wc=
X-Gm-Gg: ASbGncvJB4hPL1AMuvreimyxRVU7IRnAiLmfcwAh+/0xE0knD2Khd6mCth4ipjyBzyq
	7+iI0lEqUvW6818QhHJVJjr/1Qd9w0NMimDEgToqFrfXQaLUSWD5BN0cnG3CzzZ3fuQDS/dwTtK
	c0K9WdU9Opj2xJuqxuMYerHtTZCL7Gb9dszsWIuPeSrVIBvPT/LqHBjFHYpZY4CQina2mYkLPYd
	uvAOPzKsVZmWMon6H5awMpCJBTvvoyBglBSUoBIp9LbWXRLCRSS096bhSLsbxDmgWMTB3bvw9Ni
	vqAqejJcqntUdwqTSMclHZBSdaspvuiF0C/XPiRPcrjVH2m2Esqx+KM=
X-Google-Smtp-Source: AGHT+IFdOUFXqI73ftpxREcI5cD1cyJ6UWKG6ZRltd1AfX3lyAlJrJ3iiVYWT+u+hgxLgX7yWWhCJw==
X-Received: by 2002:a05:600c:4507:b0:439:8e95:795b with SMTP id 5b1f17b1804b1-439aebf38b2mr148209225e9.31.1740481155909;
        Tue, 25 Feb 2025 02:59:15 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab2c50dcfsm12588815e9.0.2025.02.25.02.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:59:15 -0800 (PST)
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
	stable@vger.kernel.org
Subject: [PATCH v2 1/5] phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
Date: Tue, 25 Feb 2025 12:59:03 +0200
Message-ID: <20250225105907.845347-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225105907.845347-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250225105907.845347-1-claudiu.beznea.uj@bp.renesas.com>
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
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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


