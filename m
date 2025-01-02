Return-Path: <linux-renesas-soc+bounces-11782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C66B19FFDD4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 19:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93E461617A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 18:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA711B4F11;
	Thu,  2 Jan 2025 18:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCRe+hBE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708621B4245;
	Thu,  2 Jan 2025 18:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735841938; cv=none; b=PE8XCIJHCwqz9sG/KE/kYv43vjy48VL8owZ0hVMo6BtKkP3LwOufSVjcSoZiPDPobV6saXz6dVl+Xp/gduVpXBXLQvVRbHe3fENLx9mIhBdCj97vRbt8PvhZ4XfaXhiNNXtj8DL0IA+xpNvFPFUj9XjNLaQ2D25Jz3vz9MLgsUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735841938; c=relaxed/simple;
	bh=n+waWRDwlWy9TC6uXDWXKs5D4sPMvcPJkXcJ1csNOiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHe9hf/BVS/FaNgo1/cXSfmTMWUkVjXZQVI1HF/vy426dS9knCy1yCSik9ljLzQEXidG29czXythouLAByPcDA51x+wzWC2eKURlHltxD25gbqrUqjS2gsdtrtQK6ESn08gxG+AHhmd+xGM5iH8x+Oiu2zZEQ14HazduPeoztwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCRe+hBE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43634b570c1so83495645e9.0;
        Thu, 02 Jan 2025 10:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735841935; x=1736446735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0Qe4ppfMb0zVlMFJxlO8X1Mm4KvjWS+KLYaYeS1TX8=;
        b=LCRe+hBEI2gvCTS/jss3ELht7m08bVU2yQgc6vE8vzI0wThGipCYPsRmCD0hXfes9M
         l7mYvFT9+Lpedd8mf7bJJaAxGyWs/qW9AE1EALSzdll0dhljaOYXMzqkdQF61P/XgWA3
         U4LdVjCgBvKm3xxOV4o9DMl2ZRD1Equ826SQNAm9IsctYdkJP2JlzbD1SqR6nwVcEhdD
         CY+IKhIa2jb2OvexiTgMZPxUkHLwHpzaC7YpUNOK4dqdvgivVvIuK/wRpX+u2vzKThnT
         V00L/2xiwa0x9BPHNPtQ6XnqOCXt3MSLBngfvNhXtKJcUsPHUD41bioYAWii9Mn8Y93U
         V6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735841935; x=1736446735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0Qe4ppfMb0zVlMFJxlO8X1Mm4KvjWS+KLYaYeS1TX8=;
        b=CsDJhgNcSe3EKW0uDk7jaMBR73zzCT8eD7+ZSxjC3GOXYVcvai/GnzwbexVyeGIEPE
         TRsXCGzjAxoNypbAlmgwLBKv6ir4qhyvIdpHx6GHEa5AEua2xP/IBHZNbhoaNAX/HOe3
         RQOniB7fbGRkIVl3o0h1UdxSbLSHjMbv04SmiqaOxjOpTyGlnvlXGI/jMLn+i2wzhlsA
         LIWVghOrxWohrHPOgysJRUka6BKxDwTCOSAndmCkuX6rYX7Ua0xYMIus9spU+szw00Gj
         RGt+6KaMsNVn+251P1SBTmHoB5hLpll3/DRFAOFP9OE2z1FtX/YN9NCNfRvWikyr0W/z
         G4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCU/9Qzj7Vf5NqLhCgDQWn0LPFt7qYsFfMWIXlXnHsSeeU8l28vFIKiGp78cXqiDLvWpJjWw15ryKF7MysH4@vger.kernel.org, AJvYcCVNxqIdpfXyMB6KZwNbnpGZu63ECEeyVvx5no7WMdP+n+/livGiuz96qxAoM75pRB2x0bqCNZqeECc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwchzLBnDswOWiD38Ows6V0pRHMEUjm0wGe4T8YfbouaszUrdpp
	bFcieIcMf/qUBnsuYqbj83ehi9c8AO2h7aVVrKZNAiiSfzIxNedN
X-Gm-Gg: ASbGnct+3T17ybAvewHGWo0yLn4ftgP9u1rb1r3nUUKe9GFVOB+NK/I2YY5FzhbPBoh
	oer+tURIx1UgWaZ68LDLiUWbalf/dSlLvPPOKtZjPZJ3nzl720G5aAY+AyvbyS3iN5wCSDb2Ypw
	Itq34pDyRMgjCrEtDxgR8lIR2lRhtAAbCjbtfIpAWjaBbUQ7XPQEScHzfU/oYtB+OeXYYnRz0SG
	KeA3JNrR97/H3chioTil6o05F0+XKLELPvnfjy5nP7PLFP2jQcHMSQQT9GBoDwx79WBab2fYxIy
	UmGjnkY8IA==
X-Google-Smtp-Source: AGHT+IH5KR3E6Jz6QvSdqpU1+FfFO52Vb1APmL5SRnsUQRv82ukZRNLKODQzqhsk3l1Cb/VPdhJIiA==
X-Received: by 2002:a05:600c:1396:b0:42f:7e87:3438 with SMTP id 5b1f17b1804b1-4366790cd9bmr439652885e9.0.1735841934379;
        Thu, 02 Jan 2025 10:18:54 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6cbbsm493291925e9.3.2025.01.02.10.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 10:18:53 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 6/6] clk: renesas: r9a09g057: Add clock and reset entries for GIC
Date: Thu,  2 Jan 2025 18:18:39 +0000
Message-ID: <20250102181839.352599-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for GIC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
- Included RB tag from Geert

v1->v2
- None
---
 drivers/clk/renesas/r9a09g057-cpg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 7ef681dfcba5..3705e18f66ad 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -117,6 +117,8 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 	DEF_MOD_CRITICAL("icu_0_pclk_i",	CLK_PLLCM33_DIV16, 0, 5, 0, 5,
 						BUS_MSTOP_NONE),
+	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
+						BUS_MSTOP(3, BIT(5))),
 	DEF_MOD("gtm_0_pclk",			CLK_PLLCM33_DIV16, 4, 3, 2, 3,
 						BUS_MSTOP(5, BIT(10))),
 	DEF_MOD("gtm_1_pclk",			CLK_PLLCM33_DIV16, 4, 4, 2, 4,
@@ -222,6 +224,8 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(3, 0, 1, 1),		/* SYS_0_PRESETN */
 	DEF_RST(3, 6, 1, 7),		/* ICU_0_PRESETN_I */
+	DEF_RST(3, 8, 1, 9),		/* GIC_0_GICRESET_N */
+	DEF_RST(3, 9, 1, 10),		/* GIC_0_DBG_GICRESET_N */
 	DEF_RST(6, 13, 2, 30),		/* GTM_0_PRESETZ */
 	DEF_RST(6, 14, 2, 31),		/* GTM_1_PRESETZ */
 	DEF_RST(6, 15, 3, 0),		/* GTM_2_PRESETZ */
-- 
2.43.0


