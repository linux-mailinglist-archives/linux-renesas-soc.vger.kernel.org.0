Return-Path: <linux-renesas-soc+bounces-26192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB51CE9997
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 12:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B006B3018419
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 11:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A054C2EA172;
	Tue, 30 Dec 2025 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isUNO4Rp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBE12EB874
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767095904; cv=none; b=gXNIO5M0wOc29OEMO19++EV5cliAcHY0+kfHctMTZcEvoNbSdDT+y3ldbtVEbyL7IyHMlEeRQUSI0X+G5E7N2l4ziXzXWdBifNJXE175g8HIWEReYOVuQ/3lyNf/l9wwlcPjxmXPR4/mOWr6DSsXz3YE+rKZ5GkpysRwT0sAb9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767095904; c=relaxed/simple;
	bh=fyRh3NDfYI2G2pxDNRqvuJsGnCEa1C3EXnnGh0e8NZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMw465ntm+AuUrmGHkRXLauGQKNMVk7Q4S/c8GQAupgIycATvIRooyIqci9hN/nCwNmVAUgFC0lKLhJJtFbYQM1LVjwAJfXbPHqPD7QQCBNd9bLvA7mgruxPWVzj7HIhmUp3xqufCCiMAEfm6tqn6eDCFfp9hGZBTSQ6WGtQ+pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isUNO4Rp; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-430f9ffd4e8so4875404f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 03:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767095900; x=1767700700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mrVqbtRlpbpcL6kvwA96sNyCMACeAaD1ypExVsExyw=;
        b=isUNO4RpRvmeBb/SewrfLUxGBVOlt1KNSwulqiSCDd4SU6wPuB7VXvynTj1KLnJWNZ
         zdZB0JgIgbvJx8tyJ+vo0BlFowcIeAQd/WXrVdBjErz9k2Qn8cqca+ZiQUwSDgekv1dg
         rGYuNp83MhShxYq3gHazwiwjEgvTgoS8guiaTaSN3XTvt2Wu74f4Y4NV28+rGHFFnVfR
         B/l+80G6ahiTF0lGEqW8MYlD1AYrTrTlfGSFwAEivdkIdiReomPCCJnzxNL/TCqwmBhl
         VsRwwQw2AhIdFq8tpwFr5f0eSL6k2pGwgAVXULZ9lAM7Fwz7nzWR1On4vIYarcn8G1rA
         BEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767095900; x=1767700700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1mrVqbtRlpbpcL6kvwA96sNyCMACeAaD1ypExVsExyw=;
        b=Pya+exvIr3AVJphpHXq6+WhhwgB0XhiFt7oX80bMUZRBQi6lXFZ6yekW1XPkhFBsS9
         TU0/gUcjXwQtbhMcT2XFuPRUYZqiWR1m/F3JQDmHcbkWy+bb3H7x3ZcrWoiwLHioob3R
         vnmmdD63R5oQMA/6ba7YMJcoPaazGhmpTNev3qauV6K7p99kHhiys2RXy8AGnVSAtiQR
         tKhCe2HhBr8Pz579WmXhmeKBE14URst5pkv4/4u4VMmPxj4DUn0gsiX4L0y9XCfFnSfe
         hQmOcozUMEeIjaQNWKFt2tVJuvyMrsKZAcxXxJjyiff7u53u3cSfLJlXcksQ7ajn+SPZ
         rhZA==
X-Forwarded-Encrypted: i=1; AJvYcCUB2w/fmQGqvlZNzVxEseK7c/cwdm7tYyPpoavwX5KWI39YVDmGrFdhqInaTWM5Z4IrISGqR3WbTwdtbPBdlzgK9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnP8CaqcaUWNB+FucebA5pXGzdVAOoBTQKe0bSzdYSa7dw5xYu
	MgPKo6d0tDZimmQUxV1zNLBfHr5ZURIZkjCysdDE32x0LuhB6EXYfxr2
X-Gm-Gg: AY/fxX7jr3BCg1YxqjcH36Gi5/w6q17jUi8NlLe8O5B323MN+yZrlmbRo5Pqdun4Wwj
	E9un8fja26VoKjKwwvBm5piBZor1AG7xS92mpAVGM1OONAjcQAXOX2gcfE6N208/xkcY+Jfjqrr
	B1wNFly9/GcnbVDO99AfMmAyVf5ze9tVd9mxzBPNn0FXMqy+eUzZHtr4C8hUdNZ8Kbdeo7uO14G
	HGPLcDVE8nUJmgv/JOQBqC6Cz9Fcwm3+p3vj2oGCDQ7/KX0XvK5AI5aD2sfH1Vv2w4/KeuyLoew
	6KGlbQZay3x9wpdx1NwEiZmgDkBI/EPbhPD/+NY8UaJ7+zMiJZWAgRMu4pioSmmqUa32pwCLEx+
	FVoAKGzTBzZErfeqjSB6w2EasU/8MsMrBlYaUiv8eLnhy9yx3esv/I5OC58jwWeLo0V+KJJ3vyo
	Vrrq7tSimUdLjdPI6o4ZDydcHv6N9bTLa2mR1dPkIM2XgfXOmp/jsmMC1Ds8G1hok1IFP4b3RTK
	7n/c+qDtXLULXLxMiT60kB7
X-Google-Smtp-Source: AGHT+IFkCky57Uay6sBkG6xB9auHzI69jD1MaNT3gszPM4wT3bxIuOsRBOVRIqN2JH/ov9C69vdqcw==
X-Received: by 2002:a05:6000:2008:b0:430:ffdb:e9bd with SMTP id ffacd0b85a97d-432447a714amr49360943f8f.10.1767095900408;
        Tue, 30 Dec 2025 03:58:20 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:efaa:981e:926e:8957])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm68337227f8f.35.2025.12.30.03.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 03:58:19 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/4] can: rcar_canfd: Add RZ/T2H support
Date: Tue, 30 Dec 2025 11:58:14 +0000
Message-ID: <20251230115814.53536-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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


