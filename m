Return-Path: <linux-renesas-soc+bounces-10471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E549C5221
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 10:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAF5F2877C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 09:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0907B20A5E5;
	Tue, 12 Nov 2024 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsPzRm3Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E26A1ABEC2;
	Tue, 12 Nov 2024 09:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731404066; cv=none; b=lnNUQ67qUlz9BE4FH++dse/1mspa/zeB2DDAYTtoEqGXt+Q12gjdgT3M5XNZBq0RYUB+oCsdbgy3pJwOPhWID2PGYZZktPWs9lxr4X/Tnhlb0KJt+X8dkZwk5t/z2r+cqf/EhQEjqc27EKmZxc4noSXxnoxNLrLXzpTIVhXc+ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731404066; c=relaxed/simple;
	bh=2oJC61B3cj9hNS0FEGQ89rFN3UKKVg+d+eYizlcOTs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bB+B8cLxVu/34lBiLBKSbXP1lWJLQ/Np4uncdhB4PNhlDzM+lKPVUrq9cDxZFCl/DOP28sbH3jDFFpIJQ8GQMlrYpX5rw4ZoUPmxWF01y4KQwK955mzbtx6m+5/LMGbbsEWDNnvltC2a3YsPu1QIP8YMigSLlM90z3y6B6nlYN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsPzRm3Y; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f2b95775so6771208e87.1;
        Tue, 12 Nov 2024 01:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731404063; x=1732008863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aIvy7sHDIF/P0xKV5ZB06CXppqkV1x6iHD+MoKg51ak=;
        b=fsPzRm3YBmRGYqp4l9mZSv4NbpjT5s/O/R1zs9MXPe8WyeuadQOWuKngA4j9UuUCUp
         Kl67VXM5boBEymfN793f7cPpy4coh/GMLf3ZVLbbmNsFKTuTAKmE9VaPTwuIPHwjXz4m
         pA+FowdfQI7m4EpxxTnqcwU5WV9FydushKJ3Ah5ZpNDH32ydyRQ6xVDGztQfL+oYMfHw
         b4FpqzmAQMxr/n65DdLvE5fSLA8R6eVPqkgptw582aYaHvDv9Wf8S9jWbtQeAKMYQ+dh
         mGE6C69pf8CiRvmB9Ou6jpM26kkZqYhriQx4BZgk3v42xs3KIwUIHYXJ63XTvWee7zuJ
         u5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731404063; x=1732008863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIvy7sHDIF/P0xKV5ZB06CXppqkV1x6iHD+MoKg51ak=;
        b=YwZKQcCe6bQN5HsotGqWnf0nXt78open6I8TtOSdeF+MWatJRBNphMmZnBCn7ZdzVz
         UIYXRfYU3nu5hVw9SEe9B9IYG/NNxlMkRu0NfL5UoYDEJkeWzbBXRFYdvqd4YXl6cOmT
         JZ1SMsifusUg3j4SKFH89SFblD06RyQPFnSm8Ca/HZfr6PbgnFbY+L3dincPaokJkbkZ
         uoB+/8Wy2tAGh4vRnPjyelsUB32AtS97oDggpl8FM45ehpL3/b6yLVan+5WBjvaF2SgC
         QcExJcJv6L+D4hrV10E+r1A9WOK2RiKJ4Bmua/L+L0n6Oc+s07e1GFk3yXCme/45NtGM
         YDxw==
X-Forwarded-Encrypted: i=1; AJvYcCVukDgbsL/xsnTfk0r3S/1DlikKhk9D+Iss0bgx+pVv/8KBd5bEj7gsZ+xV1XZNtY/rYG45qDIxx8jK4bwSewE2cA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxma45kCntf52kuLx6gyP/0L+Hr7jBgdJYXKuAuX0QNHVi+SeUo
	HY2T7ppeagwSppdhxWU7OeCbtUWSjbP8qfGAIb1FMT/EdcH2vurd
X-Google-Smtp-Source: AGHT+IEpW0kWN4jGRG2H2u9atBg0cacZuFn9Qtzcnuig3NeGX17ybEcw+CsSoFEVQbnsHKCmTB+GnA==
X-Received: by 2002:a05:6512:2809:b0:533:4785:82ab with SMTP id 2adb3069b0e04-53d862bec24mr11091711e87.1.1731404062919;
        Tue, 12 Nov 2024 01:34:22 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:4221:c5a8:8273:369b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a18521sm704085866b.20.2024.11.12.01.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 01:34:22 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: defconfig: Enable Renesas RZ/V2H(P) Watchdog driver
Date: Tue, 12 Nov 2024 09:34:12 +0000
Message-ID: <20241112093412.20093-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the watchdog driver for the Renesas RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd82ef9d7adc..cb04c7c98a7e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -736,6 +736,7 @@ CONFIG_MESON_WATCHDOG=m
 CONFIG_ARM_SMC_WATCHDOG=y
 CONFIG_RENESAS_WDT=y
 CONFIG_RENESAS_RZG2LWDT=y
+CONFIG_RENESAS_RZV2HWDT=y
 CONFIG_UNIPHIER_WATCHDOG=y
 CONFIG_PM8916_WATCHDOG=m
 CONFIG_BCM2835_WDT=y
-- 
2.43.0


