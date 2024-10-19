Return-Path: <linux-renesas-soc+bounces-9908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 923119A4C5F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Oct 2024 10:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33906B22E61
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Oct 2024 08:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C211E103E;
	Sat, 19 Oct 2024 08:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BDMnWk26"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B2F1E0E10
	for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Oct 2024 08:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327695; cv=none; b=Q6j+pQW0jZkrM8YBlqHc9ODw35RiH1Zt3e4iGuRF3YgdnHQqFpPe3eDBn9W/b1t3YvBU+1+WqK+U6XRbwhKnt+GtbAAFGYABeL3M3HRaji4DqYJCHGFB5qjQA5hqWbSiRlkbGMq2t7Bcfmi2C2obJclKqwrjVtQMJrqPYbYn+Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327695; c=relaxed/simple;
	bh=8GAcD1p4qmOxAT6LKl7/yGsIxlJCeks3lmvdsRJmH8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=si/yt9zcOHPijONWzUQg/50apxhPnObfXClhCdz04JM9oKh3JjsUwF5gFdR8cPjf+VnGR3GcqNk/A3dB6hI3Ry9SXaY9DTwE+4EjROtL/5J96EP2mdF5M4AEKhgIYkS/kxE8f6bRw27OfO8EDUmlKzz6r9uFCW/AKjOMc7GGe8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BDMnWk26; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d808ae924so1979325f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Oct 2024 01:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729327692; x=1729932492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iR9u43Hyk1vIKlajLYqnwdEXv51OaTqN1pUoQT3Fdw0=;
        b=BDMnWk26U1NXmigmt9PPdQJsjydfhPNLC20W/rjKSc0fdXeT9HE4BoXu7dRPs2i4MD
         188C70Jx0VaAn8l/X0tc8qti3Ws3KxYeifODbCtRR85A23/AO5etkJKMbrDRSh+Ec8yJ
         8TmbGHAd+iKqXTIR5GMRPWcMbRLxZT09JBUAQiFeH6PH0MBlhTPW7u9ZSXi/5MKNI65c
         n/eKzY5oPCD0FqIXpGm3fRwnbAD0YiTkMvq3AdbAYkDFOrYgm8L1dUIaKpdTJJTtny9h
         rRMHpaR6bVo1flmmo2xiDMhlwSkN5UkMPWLbhOHKD2BG3VDOlUiqphVfvcZKHnw0eUqp
         93wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729327692; x=1729932492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iR9u43Hyk1vIKlajLYqnwdEXv51OaTqN1pUoQT3Fdw0=;
        b=tv/O/EhoV9n870uwuPHuSO0B2TLiGekzxdiLnrjYREyojvxwyolA4e3xRyI5wINudt
         68hWVbGbISOpbs3a7E/jf9nzYbWSMDTG2QrWcxlFRa0XW/FKFMcvKp/O62cj0/LSJIEp
         wvdUjPgzvmYWvwXzjopsBg8gCiMsV5KYq1FCWQGtRShEajKZF81MnzZDNY9Vp6hmuNDz
         A2gcvxgG6M6H58sSuKIafC1EjwGNTtg5zowulwQj5A01eq1n7y8aSVeO/qZadVlHT9Zy
         5gIsY/jqE6whPuZFCzuDfAP3sczr3q3smdPV0sQx4414xw30i8cBf2ElRITxY5+U40o3
         5fMg==
X-Gm-Message-State: AOJu0YzxSYTdZMtsX62c/hWqWWYMopMdiML1/ZP7zdcPS4CM36gkvhAE
	PgkJJyM0rhD9FKj48MBMFeZUI7H/QPG3EIXObC29nwDZ8Ktw2YDt5jnnbdhwWyQ=
X-Google-Smtp-Source: AGHT+IHsNssw3nPyESTNLOiP+9Mlv4+US3nWRprCJSeU2x+CacNFKb3J8zoQ9J/1GgCM0O9zmVhHzQ==
X-Received: by 2002:a5d:61ce:0:b0:37c:c5be:1121 with SMTP id ffacd0b85a97d-37eab4d1227mr3498805f8f.9.1729327692261;
        Sat, 19 Oct 2024 01:48:12 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0eccbasm3898731f8f.81.2024.10.19.01.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 01:48:11 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 12/12] arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3 flags
Date: Sat, 19 Oct 2024 11:47:38 +0300
Message-Id: <20241019084738.3370489-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the Renesas VBATTB clock and RTCA-3 RTC drivers. These are
available on the Renesas RZ/G3S SoC. VBATTB is the clock provider for
the RTC counter.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- squashed w/ patch "arm64: defconfig: Enable Renesas RTCA-3 flag" from v3
- updated patch description
- collected tags

Changes in v3:
- update patch title and description
- dropped CONFIG_MFD_RENESAS_VBATTB

Changes in v2:
- added CONFIG_MFD_RENESAS_VBATTB
- added vendor name in the VBATTB clock flag

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8067bf051377..e3252e24bd4d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1216,6 +1216,7 @@ CONFIG_RTC_DRV_IMX_SC=m
 CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
+CONFIG_RTC_DRV_RENESAS_RTCA3=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
@@ -1362,6 +1363,7 @@ CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
+CONFIG_CLK_RENESAS_VBATTB=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
-- 
2.39.2


