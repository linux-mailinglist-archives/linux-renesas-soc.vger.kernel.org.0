Return-Path: <linux-renesas-soc+bounces-16581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F36AA5E81
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 14:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E0EB4C10E2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 12:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2599229B1A;
	Thu,  1 May 2025 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmwzTU+9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7147224AFC;
	Thu,  1 May 2025 12:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746103042; cv=none; b=RK1id9o9NQc1tLyRQ8GTdb6cc31B+AP5T+eVvp0J99oLysuWyaqT95AoX2X/BMkZu4RWSdpsxvlnWoGUdHKGJSvRenYpzCwVCbvGp3YynX5KKXYMqlUU4FObHQCOdBedUGe3/1U/nAyy+pbsX3snAu/XtbumyD1zZk6jthk11eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746103042; c=relaxed/simple;
	bh=Jt/bhCUtQhRuKq/brWUKsM1yeV7e41XOn5vG6Q3Rv9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cW7P7l1LLlnLjkpz+FXvyzGFFRNfimqIWrfmUc+Yx8FaeT7ASDXnSG1Ep5v/CvTMficK70FZ4DIVJCKN+21wCTkTSEY+EKUENwla9WzQYW8+9uGdZSj03+VgmMNz2fcEVTvnK5EP0zFlFxxK319QRe9qc9PAXaTokmdmqKSX6r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmwzTU+9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso3170845e9.0;
        Thu, 01 May 2025 05:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746103039; x=1746707839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgNFNroZGE50So2AWpgZdGIy0x5cNaOcuHUkn58CMQw=;
        b=FmwzTU+96RuYh0Q4haG5h4VSn68r+GiEgDtXby+ZeIIPCkpd/GFFqg6xG/SXD4cl+z
         em2NgxF5ITRvd1s/li+jyR0acs8/R/t1R2bbj4xWmcu5l8ayCFALiSOn84P36wKQ2oIO
         pGvxHkvYBuypcYyxkQBHsvbprISQEN/AilSFnsSQSVyL9JBKkoIa4YvveaehWyrIfDZh
         /uy/KZHkeqU94TkqzSj/Pz4veZOG11I9E9Zdy2qgWghJwnWFeTviUyQo6Qs0vGdWPWH8
         81SNXZpj8JQgtaMU9020G/dFEByqDxsBkCSChhuO7/cMZGd2LZqrO41Ur8/spZJsSaTp
         6hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746103039; x=1746707839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgNFNroZGE50So2AWpgZdGIy0x5cNaOcuHUkn58CMQw=;
        b=C0vGjng0+jfwCRz6jwk09iJDEA9Bt0aoITHtY+DcsCibZoXjPjkHgn91vtmjG6/YPs
         SoUa3TBnFoEfGkR5G68AX7x/7Vx8ERhzQfVzM/3BGceo9eghbaB9IkzC4+OVklLVctA+
         tqqALNqFyubNOvwD0Hrf208R/R6u3iMMYlL6UmAt3jrjWg1zwPCdCwEIRVZvGpucoqTd
         theTCQShmgGmf0Xaj34VU0Voir5SGr6R+MqoSVMc7HQ/CW4MGYvpDuqgox93tWRz4puZ
         jrCVTzqRwuDzR5a6ykWUldnWZLmMoy7Dj3WA4eZRjKZXeI5YCrvkug08RF37sI+ZUZop
         n1mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqdVN0+Hx7/UvwBgap99g53KkGsXK3O3ltRDVXwzNECpIkEUECpJbBiExsr7h9kcs+pUQG9zpqamVEGLV43h1ytSo=@vger.kernel.org, AJvYcCWYa6YjSAGLJxt2t5G0xJLHCTEmAxWxOrIe3mMq4rbZqZw4YnP1pYcstyllf/0BF0fcQcuMRjPR0jdl@vger.kernel.org
X-Gm-Message-State: AOJu0YxNH/gG7ADJsHsTJWi4Mj/qCpp1nWU2geeAOZHUxSz13heRhvhr
	KfoRlFU3sWzvnTyO/FMFx4uFrs1OvPPpW9wLO74rvbFI3Jzx+2PP
X-Gm-Gg: ASbGncvmZni+dEJeG+9cF4WGP/CA6vagk5iJ7xPw2jRGD37mTTuIJyFhbwtMHOU1n7/
	69nuLR/k7zB7QgzxG0WSpeyPfV6PUyfFW7VV2LS0s0G6bykVczwaD02P7PwA75FXHwgszLKcvCx
	LkajSykUjgDw/R3ceKc1bHcP+g7yVDcQL3KhkZ/JxaqDzsvORbzST2kLAFEM4uFOZha4iuNsF1o
	pUdiX8Zv+baUaqiWFjQWrOjytTpaXUyeAWEaIRZQhUW5p+ZG7TFVbqzDCHiHJvjz2TXnitvSXH5
	ls/3CKBIfEDIyLZ1Eqo1b1tk2/XlgHKbc58E2bWYFRBAvIOyNIDeWAJ7UU3stbmRGrwCREsQ5DM
	=
X-Google-Smtp-Source: AGHT+IGZmSJD1oy0UDx7tiBsVyBgeklEmdSHp8LD1zMwNv+uQkPtE63Em2e0OxJJDKeaXfUi9AR2yw==
X-Received: by 2002:a05:600c:5128:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-441b705a882mr13841645e9.26.1746103039065;
        Thu, 01 May 2025 05:37:19 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:f0e:4490:d947:2c92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm11144765e9.6.2025.05.01.05.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 05:37:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] clocksource/drivers/renesas-ostm: Enable OSTM reprobe for RZ/V2N SoC
Date: Thu,  1 May 2025 13:37:09 +0100
Message-ID: <20250501123709.56513-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add CONFIG_ARCH_R9A09G056 to the probe condition in renesas-ostm.c so that
the OSTM platform driver can reprobe for the RZ/V2N (R9A09G056) SoC. Like
RZ/G2L and RZ/V2H(P), the RZ/V2N contains the Generic Timer Module (OSTM)
which requires its reset to be deasserted before any register access.
Enabling the platform_device probe path ensures the driver defers until
resets are available.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clocksource/renesas-ostm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 3fcbd02b2483..c9919811542e 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
 
-#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
+#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057) || defined(CONFIG_ARCH_R9A09G056)
 static int __init ostm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.49.0


