Return-Path: <linux-renesas-soc+bounces-26774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8E4D1FEBB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 16:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 573FA307E6EA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 15:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D2D3A0E94;
	Wed, 14 Jan 2026 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Br6vZf8I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EB63A0B35
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405540; cv=none; b=EqO24IrTISzuJL8LkPQSuE9Cb+Kzew3DaTcPySc3ABm8YendBPLhOOTgzoD1dlQh7Ur8vDoKWpd2zTuzo06GEKeLwOOIEBIXHfkAg1AH6cPxmQZXc6oD9ekr8pcf2O72IuOxM6Qu/rfJknZ1GWFI56q51RFTE1NY+ErG9eRK8f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405540; c=relaxed/simple;
	bh=FOL5X+99qWunsCTeGM07ATFHOMYT6GR93IxdA7aRrUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=je0Ey8jsaujEP6P7/7vMjR0kc2Uy+dgJWZfCnfYLzS5eqf7lk7of5cuwZkQd6L/w4XRH1gFW5D5l/28PwIDwRVA+TqlOVPJ/Y4ZuJPTzi2FXlBISW3P+hEsGr8M7bZBtdeOei9bYdonKCs7jQMDlgOOddeCLYHtXUJwE0zpAzs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Br6vZf8I; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ed9b04365so14088405e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768405533; x=1769010333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSodyynn8rwGOKc+y/IlQ2JsCp706/pukP4Yc6NiJMc=;
        b=Br6vZf8IrU7WaigK6h/fBAeSflsFuiFAzrkG/eNBVIYCNOCigexS+WeBAX6f3vnp28
         DykdxeI/4iKz97f/zr347YzJKrtXabcISGJuZWHFBLcHj2NMepYp1RuvVeTsGdog4fpA
         CWe3avU11Mt0q8gTHiCAqlfvNsPZ+Jb94AC82I2GUSc62wuIxQ6OL7Mvi2BPfkZ0dOSr
         JQMP1//ZGBzCsd65zvcdpRdY9BAlzVcV8zjWUuc92l26DHr/EQZMI1pEA4dp5ee3FL8/
         hpsNUX1OR+hnsGcJMPGtIrb8tbBuWpCfkbq8iDbK+HMNhl0yHzoPqp4LnkBDJ05dfwoi
         AAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405533; x=1769010333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HSodyynn8rwGOKc+y/IlQ2JsCp706/pukP4Yc6NiJMc=;
        b=RuRiYrZw2ANE+zbRfX/zZokuADTjTUwOI94oExc8Hcti4kgaUul4lG25ac2qieXon3
         ikAFQlXwL8wF+Fwms28v1C0v02Cg2YBodReQaMiPo/s6SM4dXzE2u//78Kaomv600qtg
         LE2Hv3oJNmXDXcrRgo9HzpkLnYekosqs/aj0+B9ScBsPPfuxL7721uOCU5vQt/XnnDbo
         388XSBVwtPcwyWCw+95ivtn0zVAND6gyIOiC/Yxj5wuiaIZTPAX3wkDSEmXqIdH5Ix7C
         Q/E7S0gKTZdELeoXwYpppYSWcaXuRsG0pQD6D3sc0HfRJP2PNo3eyMBd5ronaKrj9dTP
         ohpg==
X-Gm-Message-State: AOJu0YxWdk+1KETRkrpZxCCIprW42Phrh+xLN9cjlpNjFHPFuzG458+4
	fP/P0iiCyBmUmbDhbxOJuiWI9oCzmNvSmvZ1GsF7mPVc60P74Qjczby/
X-Gm-Gg: AY/fxX6JjAUFmb/44aDW7OZlelWXcCSm6TsibUymx00ymsvV1vcs3TwhnACWk88hF3j
	Xx1Q3bACyZRl7Suu1RgcoSN7Ab9RbBwm5paICuJjD1B/odh89jmiU44YvY7M7K/1+7yKwjJnVL7
	bgiBO6s79Dc43dufcCmw3vXSorKrJ7exvj8VcV3Opaq5kNaqcfmE+WKVAkCdYKewy4KI4S3rP18
	ZoB+rU3ttgzANCYYilYa9rHstZiBMc7CMs/ufwhOrFn4EM9FYlF2EzzsLf7EOAEk7j7BzMe461+
	IUVyz9EoR+cLTIUcGZg8s+Rzc6uRaa8MidZSnClucMHBj83tzBktAhxajaZeJf/lByclQ3uXR+J
	hMRHkXYogI3ppOyLksLgWBTcHkdhjfX5+fUjBYGQeqMbt2hhwOIPkMplK9n8uN8SfjfPk5rl6o0
	5bVk9eHvM7wyChJRyFSRkTOdAuCKcuanuzdN/iKXIdcRNKmjwSbumrfLA6Il2+6yQNiyoNn2N1u
	giS4ameWRw2gXFGQIPooNtD
X-Received: by 2002:a05:600c:8b0e:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-47ee3371b93mr40781275e9.31.1768405532616;
        Wed, 14 Jan 2026 07:45:32 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:7f20:df14:ac2b:3d74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee544387fsm33867105e9.0.2026.01.14.07.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:45:31 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 4/4] can: rcar_canfd: Add RZ/T2H support
Date: Wed, 14 Jan 2026 15:45:25 +0000
Message-ID: <20260114154525.3169992-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114154525.3169992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260114154525.3169992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The CAN-FD IP on the RZ/T2H SoC is similar to R-Car Gen4, but differs in
the AFLPN and CFTML bits and supports two channels with eight interrupts.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
- No changes made.

v2->v3:
- Added Reviewed-by tag.

v1->v2:
- No changes made.
---
 drivers/net/can/rcar/rcar_canfd.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 4a653d8978ba..eaf8cac78038 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -670,6 +670,23 @@ static const struct rcar_canfd_hw_info r9a09g047_hw_info = {
 	.external_clk = 0,
 };
 
+static const struct rcar_canfd_hw_info r9a09g077_hw_info = {
+	.nom_bittiming = &rcar_canfd_gen4_nom_bittiming_const,
+	.data_bittiming = &rcar_canfd_gen4_data_bittiming_const,
+	.tdc_const = &rcar_canfd_gen4_tdc_const,
+	.regs = &rcar_gen4_regs,
+	.sh = &rcar_gen4_shift_data,
+	.rnc_field_width = 16,
+	.max_aflpn = 15,
+	.max_cftml = 31,
+	.max_channels = 2,
+	.postdiv = 1,
+	.multi_channel_irqs = 1,
+	.ch_interface_mode = 1,
+	.shared_can_regs = 1,
+	.external_clk = 1,
+};
+
 /* Helper functions */
 static inline void rcar_canfd_update(u32 mask, u32 val, u32 __iomem *reg)
 {
@@ -2345,6 +2362,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(rcar_canfd_pm_ops, rcar_canfd_suspend,
 static const __maybe_unused struct of_device_id rcar_canfd_of_table[] = {
 	{ .compatible = "renesas,r8a779a0-canfd", .data = &rcar_gen4_hw_info },
 	{ .compatible = "renesas,r9a09g047-canfd", .data = &r9a09g047_hw_info },
+	{ .compatible = "renesas,r9a09g077-canfd", .data = &r9a09g077_hw_info },
 	{ .compatible = "renesas,rcar-gen3-canfd", .data = &rcar_gen3_hw_info },
 	{ .compatible = "renesas,rcar-gen4-canfd", .data = &rcar_gen4_hw_info },
 	{ .compatible = "renesas,rzg2l-canfd", .data = &rzg2l_hw_info },
-- 
2.52.0


