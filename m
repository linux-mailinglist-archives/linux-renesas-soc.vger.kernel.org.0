Return-Path: <linux-renesas-soc+bounces-13604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AEFA429E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 18:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFB48189B0DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 17:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFAF26618D;
	Mon, 24 Feb 2025 17:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JtZNii9m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53279265CD8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 17:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740418331; cv=none; b=Dt3l0D4GABr71K+oyAIzrP98zLoyAh3Ka1FhaRTZqe3egmFTuXpatUvfckljoxLNe8mPaq+bLGXziZIOYKlMpDez8r31HH23ahpEsMQXi9jq80OoXrpiYG4e8/i1UGMGPQjCtaYdEy7hcPt4y+avfC5WDm01E66qzZJgmv+cB9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740418331; c=relaxed/simple;
	bh=oIB0SGCz6w/sdFWz/voO0kJ/tz/pNsc4Pe98Mbdlmuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=otEqsvlCQ+6XANiKR1xkOUR2R/XbvMO5X5evYVAW5c8FMLFAn8uyEgjKyuSyFXcQQyUDmGyr1Q7loSHYPOvN9eEhZuiAGZtaLgMsl0hmqwzXf5+WdvdWeEWDwOpYIF9VsGMcp+mHX6kMIy8yVq5JgeHcZCJsFVqLfqgF3SO5pDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JtZNii9m; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaeec07b705so755101766b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 09:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740418328; x=1741023128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhxXNmQS7HiqcndJwzB1tfncWGWAmFhTQNVTNzL+Iew=;
        b=JtZNii9m2CclQdlEmJ8tK24LCj6XEuU3LqkFARNKiLvFT61QPErlqVStQvrREXP40V
         w+A1L3lgCtrozH3xOhaRz66a1n7CuWOfjoHeiWEu3luJbKfzNwOfr1OIhEErPIJI2EyC
         q5nKLA5INTlnHUEjGqBiTJWOSeHI5KelLduYCL/YH+mEc83wq6wIHIOrcCqidREb5Jwq
         Q6VJ2VYZdt1UhkgD+Paq5iy8S6du0Fia9Bei5NSPsCWf6SoI6uQE10+SZoMgEX3ier1m
         tFXMgJlJI8TFO4Ov3gPVP/1aThmsFKPX5U6QEN2MHUxPERrfTffo1f/lhUGEW6Q8WZw6
         Cjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740418328; x=1741023128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhxXNmQS7HiqcndJwzB1tfncWGWAmFhTQNVTNzL+Iew=;
        b=kUeUlH9Ol05ktpNkHCGDKxpcUgtUl7QnCtFwzvHIuKnsrPPndpglLDAmr3VLN5L4Rr
         /MpIB64ffEhkUmmEz4HncYAebJYb6zeQ/XWAxCxv6nW63EoWxM3VE4+hTTmV+sBljEEs
         BbFrOAC22q5+8rMLXQC/f19I31NjJkisQFQloGyTFDqm8N2kZXXHVET6O+bvaLZIIfC0
         wKMm70KSNJe6Xfbq/EvUBoGz5TugyLBsPt1aIQyBF8UIgk6nlZ2JP8roUiHkVtVyqNb9
         ldO7sdNzQf4fKTPW2Vfj/gfMTHYd13FXYuxIHGGNFvvnpuKagkECtX0U0qmAdoXhnGW2
         3TQw==
X-Forwarded-Encrypted: i=1; AJvYcCX+mW2lQhrAFif2fT426vDbaZDS05YaWlE5yHR95HtG2A6fxUDgUxJHAhmulH2a2SY7jiysM+93WHEpK5s32LWomw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT9FCDTc8sE3TeUURaooo43mm+kpW3vbVveG3oYKpzti9i1b3M
	iocvWi36bK87soZudG3xNDrdmjZRzULNdV7e58UNBENg/KMWNVeloQl6xMI1AGc=
X-Gm-Gg: ASbGncs3tTV/xnKz5OXg0VdwMwgx45ZzMAfad8Acy0zzE2esAJo1FPovqtYY4bL5vXW
	AcOG+mLecRjcMye0NhUTHiW79eLGfHk7UlXP8ifMp0VaZR/3BKY8/lC5Rv/JxdvrpA5ZB9fM1sw
	n68s0tOUva8Y/r5ZcMdiOGyhj1i7DhLag5zZhDTDfHm5HSmqkyfaHD3QK5iA2NyNaKz46l1LvJZ
	PDVZSrbxy8/782i0PuT0i1KB4rdzAR7Zg3Uv4uV5I20Pgjw9J/HaD7rMq0OoaOZA5qRXzoGtCBj
	NAG/vJjkVlcnYXGMJAVOcWiSPSuZ2fg2oYyiZWY4Gfb0ok84ZsVPxsw=
X-Google-Smtp-Source: AGHT+IEOW8+Mti0kStIcH2NN1v3JN2p1VlS2xp8UH5KoJEBDGTjvf4FDX9S2JYf1r+OelyXxGOdoUA==
X-Received: by 2002:a17:907:970c:b0:abb:eec3:394c with SMTP id a640c23a62f3a-abc0d97e77amr1259252366b.5.1740418327678;
        Mon, 24 Feb 2025 09:32:07 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a7fsm18674357a12.58.2025.02.24.09.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 09:32:06 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 4/4] arm64: defconfig: Enable RZ/G3S thermal
Date: Mon, 24 Feb 2025 19:31:44 +0200
Message-ID: <20250224173144.1952801-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224173144.1952801-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250224173144.1952801-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the CONFIG_RZG3S_THERMAL flag for the RZ/G3S SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a1cc3814b09b..c3336b1342c5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -714,6 +714,7 @@ CONFIG_ROCKCHIP_THERMAL=m
 CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_RZG2L_THERMAL=y
+CONFIG_RZG3S_THERMAL=m
 CONFIG_ARMADA_THERMAL=y
 CONFIG_MTK_THERMAL=m
 CONFIG_MTK_LVTS_THERMAL=m
-- 
2.43.0


