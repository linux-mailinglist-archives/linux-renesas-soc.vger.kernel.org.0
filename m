Return-Path: <linux-renesas-soc+bounces-20004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BD6B1B351
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 14:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 895E43BE6E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 12:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504972737E2;
	Tue,  5 Aug 2025 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Snl/jvIe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67203271440;
	Tue,  5 Aug 2025 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396742; cv=none; b=Zsc1JgR7/TiUaAbJoS3GTyNhkq9bYgMuTv+j9832pwTjTx7jnG6ktM/p5vFkI+M+oiZrs9U6qM72TD9TyYpY4hPz+x9UkOAcHlAm4fiBcLasZ2wGfKfCnrFqpk1v4EBo/04W44cq1PhSHyIQAdqkUakTfvSi3cMk7Bf1iVbPBSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396742; c=relaxed/simple;
	bh=NLOHCTqafirMK+HBsdlNTDWqDA9OlJ1lSqjRufLlNW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IoT9rlg2xihonb53fGwyZedN2jsJFcAaKvVV2HIyhIzHF17PmvirPpp1dTaVTrBCAyp7Vrp3NLONZnj7R6ooVpAUh0VrIbz+YY6QTvZXrSvs538jgJKOnS7Iwsfgrf9iw1W4/TuG/+JUcWyNMw8/Umi7BW/6HJUlTZVCSSDmFHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Snl/jvIe; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b7961cf660so4307738f8f.1;
        Tue, 05 Aug 2025 05:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754396739; x=1755001539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1nM+ZKQrBb+Htee3aK8Av9Uv/f3aSiUUxHDlz6amBA=;
        b=Snl/jvIeDqJv/vC9GMyXz5aIb6MjnKaTazIwfLgkP5auUUO9RVzRpFMptUsicOhL9q
         TdEjataQ4D3StFw+x35YmligIvYMgTzAPRfbiGxNgeXW3PQyGjfrMNqWksz6QpSYenlB
         g+ra20HLzekZOJWkPmJEtmxWtbs/K0/LVTiIXz12AH0DKFzHEj5vyi1LkR2bMh5SscrL
         MHUyr7jQtqyr8StTuWBm86fb7PH533hIKqFcc5U/ExcFv8mDsqunaFNiBG2tO/jkMQFU
         CmC7i/PMTo2w/PfA9tuYZoq6Ba+/tJ0dpRhUYbKFffOiBnfJP7xRHQAZMF2F8xNZ7Rcg
         wQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754396739; x=1755001539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1nM+ZKQrBb+Htee3aK8Av9Uv/f3aSiUUxHDlz6amBA=;
        b=MBywM7BnxYvhL+7LX7Ci1get10hzAza6gvnAkElGd/FJ/2Tou1lcekYhjElzbwOIqm
         Khb3gX5qZUMcKTwu5sKwfMoUKl3aICL31mP+D7Pw23LR6tgH3L7HzoRykmQ8izkt821e
         xzqJ0i+0IAYSOayERBKr+vG+AHrLTsgtlrk6tJuV95y+k90C++lXwoTKpAv/fSNyHaKs
         0nAfDJkzdSjnjKHarTq2n9DPykidJf//yOXit2G7WuzvAjMtwTrrxpg5PO3YB2pwkX0J
         xHni7XNBgZf3zsIpwYNm4xQpvSKn/pOwYV+qOw2XS4gJSSU2emlcZVghJoe8PnshnXUL
         XRoA==
X-Forwarded-Encrypted: i=1; AJvYcCVHxnxg+HtowYfC+9OjXc68OOjPE+k3u4Y7GljVkm2q0N//NcRWFIIVynWN1vQRZX9Rs9GNNWv5eSZk@vger.kernel.org, AJvYcCVzHNQaIV2Dx/M3MmDQw5CwvCaYhQT3r/R80pOenxacrFKZvZmWnTULlK7Q5jsQQzxBcvLdAfCJ1y5mq340@vger.kernel.org, AJvYcCXPJ5xirrmgJQkm5WPwC4TGKMzlnBOqbxLiLIIcbigKsGx+A5zEQmIMQNuN5rFR2qvRzhXc/aE4/yaaY3x1lcgbgVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPohOC9bj39YLZUuAi6pcrR+F+i344qyo8KhvO8+P3/Vbsu1Pu
	Jh+elCtktQ5XDmCZ9XiFxoTZW7AmLpgCORIn8Ua7EFiet//fNN15VUpo
X-Gm-Gg: ASbGnctQckxmeVmGoj30PKatMaU3kuoLAHNVjXW+8lsei2eF8A1JbmlTQ+f2C5smr5Y
	fAxHVGywXzfyZyJ5l7Qj3QKRNmwAB4JWCrDfGPllhErAQKspEK+IrFjdwB6TthVJBNbMlrOYTwi
	84Pmc3mu1xxgMxt6GIC6otlrUrefdIDm4GPGBq+eTLWiMfLhrjTlZLu6k5MrSA8YPIbMqQLZG/j
	A+u60D/FnqDoLIgRa9qHUFL7jY3J+0FbeGTMXUDYFvNY/MG40Ft41XDAkPk8KTxpmNe9K5OIpkZ
	IzXYKyxGdUcGbQsxW6s0jyo1/Es3iVcD43o8DTyMyCauaJ3AKaRNBjfEtr86/GSUjkkh24REA5G
	JLq5jBXU0UyVSjEq3w2j1fVdErD4UDZ2qFPo73rXqrpa3kPSll+qSHnDX93Y5467UCRb/SJxZFg
	==
X-Google-Smtp-Source: AGHT+IHc5Icm1SVZv69DweZwMA+oPfcG9+hBe7KOaiBLVovbZ2Nqsy9UgfyhAA8WbXjZU5OUGPlLOQ==
X-Received: by 2002:a05:6000:2912:b0:3b7:9d87:97ad with SMTP id ffacd0b85a97d-3b8d94bc889mr10154634f8f.37.1754396738587;
        Tue, 05 Aug 2025 05:25:38 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c48a05bsm19153986f8f.69.2025.08.05.05.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 05:25:37 -0700 (PDT)
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
Subject: [PATCH 3/5] phy: renesas: rcar-gen3-usb2: Allow SoC-specific OBINT bits via phy_data
Date: Tue,  5 Aug 2025 13:25:27 +0100
Message-ID: <20250805122529.2566580-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the PHY driver to support SoC-specific OBINT enable bits by
introducing the `obint_enable_bits` field in the `rcar_gen3_phy_drv_data`
structure. This allows each SoC to specify bits required.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 27 ++++++++++++------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index cfa9667c7680..ea387941c6f7 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -71,8 +71,7 @@
 /* OBINTSTA and OBINTEN */
 #define USB2_OBINT_SESSVLDCHG		BIT(12)
 #define USB2_OBINT_IDDIGCHG		BIT(11)
-#define USB2_OBINT_BITS			(USB2_OBINT_SESSVLDCHG | \
-					 USB2_OBINT_IDDIGCHG)
+#define USB2_OBINT_IDCHG_EN		BIT(0) /*  RZ/G2L specific */
 
 /* VBCTRL */
 #define USB2_VBCTRL_OCCLREN		BIT(16)
@@ -93,7 +92,6 @@
 #define USB2_ADPCTRL_DRVVBUS		BIT(4)
 
 /*  RZ/G2L specific */
-#define USB2_OBINT_IDCHG_EN		BIT(0)
 #define USB2_LINECTRL1_USB2_IDMON	BIT(0)
 
 #define NUM_OF_PHYS			4
@@ -130,7 +128,6 @@ struct rcar_gen3_chan {
 	struct work_struct work;
 	spinlock_t lock;	/* protects access to hardware and driver data structure. */
 	enum usb_dr_mode dr_mode;
-	u32 obint_enable_bits;
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
@@ -141,6 +138,7 @@ struct rcar_gen3_phy_drv_data {
 	bool no_adp_ctrl;
 	bool init_bus;
 	bool utmi_ctrl;
+	u32 obint_enable_bits;
 };
 
 /*
@@ -225,9 +223,9 @@ static void rcar_gen3_control_otg_irq(struct rcar_gen3_chan *ch, int enable)
 	u32 val = readl(usb2_base + USB2_OBINTEN);
 
 	if (ch->uses_otg_pins && enable)
-		val |= ch->obint_enable_bits;
+		val |= ch->drvdata->obint_enable_bits;
 	else
-		val &= ~ch->obint_enable_bits;
+		val &= ~ch->drvdata->obint_enable_bits;
 	writel(val, usb2_base + USB2_OBINTEN);
 }
 
@@ -430,7 +428,7 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 	mdelay(20);
 
 	writel(0xffffffff, usb2_base + USB2_OBINTSTA);
-	writel(ch->obint_enable_bits, usb2_base + USB2_OBINTEN);
+	writel(ch->drvdata->obint_enable_bits, usb2_base + USB2_OBINTEN);
 
 	rcar_gen3_device_recognition(ch);
 }
@@ -450,9 +448,9 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 
 	scoped_guard(spinlock, &ch->lock) {
 		status = readl(usb2_base + USB2_OBINTSTA);
-		if (status & ch->obint_enable_bits) {
+		if (status & ch->drvdata->obint_enable_bits) {
 			dev_vdbg(dev, "%s: %08x\n", __func__, status);
-			writel(ch->obint_enable_bits, usb2_base + USB2_OBINTSTA);
+			writel(ch->drvdata->obint_enable_bits, usb2_base + USB2_OBINTSTA);
 			rcar_gen3_device_recognition(ch);
 			ret = IRQ_HANDLED;
 		}
@@ -591,28 +589,35 @@ static const struct phy_ops rz_g1c_phy_usb2_ops = {
 static const struct rcar_gen3_phy_drv_data rcar_gen3_phy_usb2_data = {
 	.phy_usb2_ops = &rcar_gen3_phy_usb2_ops,
 	.no_adp_ctrl = false,
+	.obint_enable_bits = USB2_OBINT_SESSVLDCHG |
+			     USB2_OBINT_IDDIGCHG,
 };
 
 static const struct rcar_gen3_phy_drv_data rz_g1c_phy_usb2_data = {
 	.phy_usb2_ops = &rz_g1c_phy_usb2_ops,
 	.no_adp_ctrl = false,
+	.obint_enable_bits = USB2_OBINT_SESSVLDCHG |
+			     USB2_OBINT_IDDIGCHG,
 };
 
 static const struct rcar_gen3_phy_drv_data rz_g2l_phy_usb2_data = {
 	.phy_usb2_ops = &rcar_gen3_phy_usb2_ops,
 	.no_adp_ctrl = true,
+	.obint_enable_bits = USB2_OBINT_IDCHG_EN,
 };
 
 static const struct rcar_gen3_phy_drv_data rz_g3s_phy_usb2_data = {
 	.phy_usb2_ops = &rcar_gen3_phy_usb2_ops,
 	.no_adp_ctrl = true,
 	.init_bus = true,
+	.obint_enable_bits = USB2_OBINT_IDCHG_EN,
 };
 
 static const struct rcar_gen3_phy_drv_data rz_v2h_phy_usb2_data = {
 	.phy_usb2_ops = &rcar_gen3_phy_usb2_ops,
 	.no_adp_ctrl = true,
 	.utmi_ctrl = true,
+	.obint_enable_bits = USB2_OBINT_IDCHG_EN,
 };
 
 static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
@@ -748,7 +753,6 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(channel->base))
 		return PTR_ERR(channel->base);
 
-	channel->obint_enable_bits = USB2_OBINT_BITS;
 	channel->dr_mode = rcar_gen3_get_dr_mode(dev->of_node);
 	if (channel->dr_mode != USB_DR_MODE_UNKNOWN) {
 		channel->is_otg_channel = true;
@@ -788,9 +792,6 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 			goto error;
 	}
 
-	if (phy_data->no_adp_ctrl)
-		channel->obint_enable_bits = USB2_OBINT_IDCHG_EN;
-
 	spin_lock_init(&channel->lock);
 	for (i = 0; i < NUM_OF_PHYS; i++) {
 		channel->rphys[i].phy = devm_phy_create(dev, NULL,
-- 
2.50.1


