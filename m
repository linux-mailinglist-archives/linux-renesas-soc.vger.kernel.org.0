Return-Path: <linux-renesas-soc+bounces-20003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5113AB1B34F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 14:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64B2B3BEDC4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 12:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D801E272E4E;
	Tue,  5 Aug 2025 12:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuYYUlCG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0611E27056A;
	Tue,  5 Aug 2025 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396741; cv=none; b=YPHbYo+n5XbKL34HML910Cyk7Mj2XD5N2Kwt4JBYGur/yLsOWIJI9EAX0bJ+6eR4lNONQoeHpXSoHPbBlRwpoROeOLEHlX1Sm1iZhACoxksWlcMquY9HwCtAvazjZiD9xy5vXY7AUUXdG7/8YPTyOIqnLMSsjDp1mvg0NApclfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396741; c=relaxed/simple;
	bh=8jqfJMURhnOJNGrQTjrsVkA3SQPdiykUmdmgG4JsmIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOBR9eaVPSYeCUBOZjT9gGUbz+h7SHmLviDKf0jZxosKFc5RVEJyoh0PEBMzES6NtbkLCV6Aw4eoPXm5Hmw2l64eonimfpmqUpKRvKdUI7WjcW5ta+5IJ6sgzNwwfx2PNNsPwgcGTp5bFZdRKNdY9Q1sLiU9sQkW1vRMvnKRcb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuYYUlCG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b7825e2775so4714468f8f.2;
        Tue, 05 Aug 2025 05:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754396737; x=1755001537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPoAix/bRF53Va2EIT5HaYLDIWPycCrapatLpJoZNqQ=;
        b=QuYYUlCGbc7GJYDBo3ZQr88U4guAZhg7qZ/sguNKCu6HpscFPcAUVFgMkopU39E2aL
         PoTTPmQusdV1eWuhyuFI4FeHz4UJFaRXsWvyRf4zpQrEx7gRkfsLAtbCL/3LWoyitiBY
         qb2ZaUZuH6DLDFAm26c3uiTnX9mna2XGmcRhbZVAy/0yUs/IIq6kCIXdSaTwV+odGhxQ
         79vJDkuRQeZDcZOhvShmtDmyHk6u7AknHOR+XSpY/7qoZS0WHfgXi8cPeSSkeLpu9rBQ
         Iy9qy5ETy4+biFchgv84ckJfJD3MoyALkRHl3S8qJvgVc5KJwk8eRUCIzYPITD4ALNDF
         QXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754396737; x=1755001537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPoAix/bRF53Va2EIT5HaYLDIWPycCrapatLpJoZNqQ=;
        b=QP7BIoNXPV3jQNczs0c2WXOQ6XHQAVHvdMqI15k62PZBSNi/XhT013KVzU5lu+36dY
         4JHw7I79F6IKIEwKWsJBbnYqFfhad2auKcy54NehjK6fG0YrGOTvmrpsWu8HLs8lFdn8
         E3s4qWfLazqMuLJERZ6WRfxHQimcq9+IzMaSuqCLiwa9LZeS0bdurX0K62nrf6Ebd+8V
         wCN5e9V3iwYUOiA6ZcTHwcu8HUQWcIK4kvHmInIxm+8Yz63xcZNw7PeEuFa7nDtjMZvD
         7RDwKH2veZyHiPgM2K4SFqnyiQW49wn3OgV2MpdlKE8DlOPllfbDsVT37xKQxNK+uTEk
         M80A==
X-Forwarded-Encrypted: i=1; AJvYcCU8FIaXrUXY1GtUyJWCGbGIxplq2kqxSZEPNxGavBuFZ3/QPnZfga9suVVZD9UG1W7c51cbJxnqb1ph@vger.kernel.org, AJvYcCUHpzS0t0j3J+iFKLYkzYajKOSL9ygeiM9+9H7oQ9sJyk573pqyfE1yeqnLGZxgE/xvm6fDDDMXHcQlm8EQV/rIcVM=@vger.kernel.org, AJvYcCXYgeUZScvDv8GwQe0XQxg0SdzEimOtHdQgTTcv453kZe9RCzJhfYzyjvsU+3sDQwwav4gocg6ZTQRklWg1@vger.kernel.org
X-Gm-Message-State: AOJu0YxGPefyN4tV4ru3leUC4GIIHrbnzZQvB2uP2UABhDTYbWV1VZgW
	ZtC8ViCrzgimrnA9JV+Fw72YFGMQ7MbE0b76R87GGOTB2KGMYALFPr1VrLTlkgX5
X-Gm-Gg: ASbGncu7f8ojJgTyVpncAxWTZ+7IxSYudmDCr2yzZyopVeaYm+95VgaJs12B02xRWtX
	0v8vCQ4XDoW4yrFUrkIGU2RKialLHzeurHzuREHn3L2Ki9Yot9LqndOn8IJx2jEC6eni37Ty+LW
	pIIwn/balBhTFfiTgGpCbN5GOvbr5LwrS4/nnG9Eo7YaB4Wb/dTp0RYh34nOglTicWYQ+mHlCfe
	9nQoNpTQQkMLkpF/pi18OoRD0r71LzOL1Ax9UDzc0OJlCoICJBFNbkboqJ5qK9LjQ97p56bwiBq
	JSHalsyx0jHM3IfKxHv+fetjk2aNg5gadcncQhOwSkr+CMow3zAbV3/qtmhqr9JDWtPhtnN0YW4
	smnwW3Afve8qfs0yeNMAMtkwSaKKPr74pzCRQIVE3UDMiU84BinQrBfPKKXKgcWjsKAahSmBRYs
	yvoCGxZKlp
X-Google-Smtp-Source: AGHT+IFSdsPuCN/qny8RYo8+ZZ+mjH0Fd3pV2IufyMr8jv2+EhjfpeBL35jepSfukzO4fESmn28k9Q==
X-Received: by 2002:a05:6000:2508:b0:3b7:8412:4540 with SMTP id ffacd0b85a97d-3b8d94bb098mr8756244f8f.27.1754396737154;
        Tue, 05 Aug 2025 05:25:37 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c48a05bsm19153986f8f.69.2025.08.05.05.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 05:25:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/5] phy: renesas: rcar-gen3-usb2: Store drvdata pointer in channel
Date: Tue,  5 Aug 2025 13:25:26 +0100
Message-ID: <20250805122529.2566580-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805122529.2566580-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250805122529.2566580-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Store the SoC-specific driver data pointer (struct rcar_gen3_phy_drv_data)
directly in struct rcar_gen3_chan instead of copying individual flags
into separate fields. Update all references to use channel->drvdata->flags,
removing the redundant soc_no_adp_ctrl and utmi_ctrl members from the
channel structure.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 47beb94cd424..cfa9667c7680 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -122,6 +122,7 @@ struct rcar_gen3_phy {
 struct rcar_gen3_chan {
 	void __iomem *base;
 	struct device *dev;	/* platform_device's device */
+	const struct rcar_gen3_phy_drv_data *drvdata;
 	struct extcon_dev *extcon;
 	struct rcar_gen3_phy rphys[NUM_OF_PHYS];
 	struct regulator *vbus;
@@ -133,8 +134,6 @@ struct rcar_gen3_chan {
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
-	bool soc_no_adp_ctrl;
-	bool utmi_ctrl;
 };
 
 struct rcar_gen3_phy_drv_data {
@@ -204,7 +203,7 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 	u32 val;
 
 	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
-	if (ch->soc_no_adp_ctrl) {
+	if (ch->drvdata->no_adp_ctrl) {
 		if (ch->vbus)
 			regulator_hardware_enable(ch->vbus, vbus);
 
@@ -290,7 +289,7 @@ static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 	if (!ch->uses_otg_pins)
 		return (ch->dr_mode == USB_DR_MODE_HOST) ? false : true;
 
-	if (ch->soc_no_adp_ctrl)
+	if (ch->drvdata->no_adp_ctrl)
 		return !!(readl(ch->base + USB2_LINECTRL1) & USB2_LINECTRL1_USB2_IDMON);
 
 	return !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
@@ -421,7 +420,7 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 	      USB2_LINECTRL1_DMRPD_EN | USB2_LINECTRL1_DM_RPD;
 	writel(val, usb2_base + USB2_LINECTRL1);
 
-	if (!ch->soc_no_adp_ctrl) {
+	if (!ch->drvdata->no_adp_ctrl) {
 		val = readl(usb2_base + USB2_VBCTRL);
 		val &= ~USB2_VBCTRL_OCCLREN;
 		writel(val | USB2_VBCTRL_DRVVBUSSEL, usb2_base + USB2_VBCTRL);
@@ -487,7 +486,7 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	if (rphy->int_enable_bits)
 		rcar_gen3_init_otg(channel);
 
-	if (channel->utmi_ctrl) {
+	if (channel->drvdata->utmi_ctrl) {
 		val = readl(usb2_base + USB2_REGEN_CG_CTRL) | USB2_REGEN_CG_CTRL_UPHY_WEN;
 		writel(val, usb2_base + USB2_REGEN_CG_CTRL);
 
@@ -778,6 +777,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		ret = -EINVAL;
 		goto error;
 	}
+	channel->drvdata = phy_data;
 
 	platform_set_drvdata(pdev, channel);
 	channel->dev = dev;
@@ -788,12 +788,9 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 			goto error;
 	}
 
-	channel->soc_no_adp_ctrl = phy_data->no_adp_ctrl;
 	if (phy_data->no_adp_ctrl)
 		channel->obint_enable_bits = USB2_OBINT_IDCHG_EN;
 
-	channel->utmi_ctrl = phy_data->utmi_ctrl;
-
 	spin_lock_init(&channel->lock);
 	for (i = 0; i < NUM_OF_PHYS; i++) {
 		channel->rphys[i].phy = devm_phy_create(dev, NULL,
@@ -808,7 +805,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
 	}
 
-	if (channel->soc_no_adp_ctrl && channel->is_otg_channel)
+	if (channel->drvdata->no_adp_ctrl && channel->is_otg_channel)
 		channel->vbus = devm_regulator_get_exclusive(dev, "vbus");
 	else
 		channel->vbus = devm_regulator_get_optional(dev, "vbus");
-- 
2.50.1


