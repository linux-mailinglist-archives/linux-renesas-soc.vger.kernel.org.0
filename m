Return-Path: <linux-renesas-soc+bounces-16709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5D3AAC1B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 12:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FD213B16A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 10:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09F8272E47;
	Tue,  6 May 2025 10:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJOjeiwg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1146B20C028;
	Tue,  6 May 2025 10:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746528461; cv=none; b=Gbb83aT4IwjRyopkqs7+IYlG8R80YRPDXlR8K7cgqs5MYDzmwhIOYR8TumuTDhLHY0gRgxUYobYs5iQ0XV/re3n4cBi23SQm2xrKC4lZRn86Z6L8XUYSDCYtoefBogMZFlAO/qGaQdtl8c8RK1tarBRTDHiidF/YKGUOuiZ5Vyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746528461; c=relaxed/simple;
	bh=RJOdQvD8Ks3O/jhG5Emd2srC27RM9q+QyB5dXiu9tJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HW5HFBs7yPRaEUVOmGLwwpsxld0esFS3uCTwHJG540JsoIfjfYbAAtDgQT4rdzwE/SieBzWiiFnOGL4ladE7yiiaCjhX2O0eK5vSJKIGQG1uO7yDVCyBKYwcQti+b6zFM+eQwSXX+RuLOoxondrooMTAo8Me6+5wTuXBrLk9h2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJOjeiwg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso52211735e9.1;
        Tue, 06 May 2025 03:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746528458; x=1747133258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wIfNMsT8O9nvAkQBhkNVejksqz8g55txJ4JLMV7nKWk=;
        b=dJOjeiwg1fCy0oRWS+wyD9yREmTx4GzETroOL8I2tgfdkrdQ5VfArxx0pkLJpvyMtr
         H/GaFniqP8UNxBayRTzMOqHIM0OYu47whbskbQSysNHSCwfPFc2w9Vzff3MZ31e9ebSN
         q+DDtiFvqGUldzNTgFneRCSzoI4UP7AswjTKG+4iS6sZ2CprjSCliSE6rpK3h7S9uYwV
         yDWirPOavf8vuBr/eS6XLMtHDce2urEE7OxxR+0FbYzw4A+5WmuozN1m91hGL1uOYQc6
         DEXrUOsa6n5ozfqAfNSXCt7n0OQz3/bRGREJGn8TvVLrVxa8s4xYq0HwC2NMLG4e3yl9
         JnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746528458; x=1747133258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIfNMsT8O9nvAkQBhkNVejksqz8g55txJ4JLMV7nKWk=;
        b=YQtVNwIE5RJvFX0NSl+kKR1QDHToOYh/0eOvirpMY4OgWSjIX9GgAnGoHkPMuvlGJk
         IVkCwqPPrZ9kCzgsDxlguWdw2umnjhpt2Ob6dOg2zyX6ifN1HMl5j1/p6qwcif4xk77c
         cx04/diPXwfxOs6TNBSdE4psOjRkjBmHrrNMEcYxRs7l8G7494w2CkJNLjq2iSe3cZFU
         ZULsHhXw0jyqbCs5ZWvF1iQBR9uNr7xlQwaul5t+kg1wPgjo4WKCika6iD4JLgTBZuPK
         dOr+SAPE9A4OXK9es2EbzLFVBaAGp583NAoagOMfKLtKO4bK0QllIK95QDFW/kFjyEji
         0XEw==
X-Forwarded-Encrypted: i=1; AJvYcCUEDjPjWNSN10EgCCg1kZhYLSuV6qDjsXM797n3zbxHihgL8Wh1lzX/R57wkKNzwl//wqfQh1v2kuPCJI8=@vger.kernel.org, AJvYcCUlFJ4fHoBO5ZNJEpM1FFPap/Uy97Pu3eGimE0ZeHybhY+VKOVsY4I6QXmIEb6OB9z4SXytJIlPMtL51yE2npJaZEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTuOwAwixzuyC7b83FP2lcdWlsc5uK9tp9wHYzbsl6N0vpEOQ3
	kI5vw8AlBGJjAkp0EnO4j47x4zM5RCcGjiRtLft8ySx1roXy1KvP
X-Gm-Gg: ASbGncv/BKBu3PRqB5UxmtL4i4ZsusfzWEpv6crEGe2SVVFGbactYpJVM16YLxX+O6l
	t3Fzq3G9zO5djx9dFXG5HgkzUiUJhDfLgP2KQf89u2QVlIEjtbkJ8gRQ4TqUUXR/0xSekLf55vo
	PCFuvVbR9VKvbu8JdMwVKJqNO+UozKaI7bFPKN/ReBinTIsUZOde+Vhfy/xbNojiL3aZSbFFdCF
	sQkcoYqrFqiNUCfJniiqZ6yvhwzxqisx0rlu56BG3o8SuN+323Iwc2XaJ2gpzOhXQw8Q5/NFir1
	aWlW0g/Y4ltXeTGNGEs4KSKQdjEboL0wNfnBrUr+4LFBK1oTjNYVPa3BU4EWa6NSWg==
X-Google-Smtp-Source: AGHT+IFbOOi0CwP25W3mb1EecVHcVYg7s1inUJIQOiVSHdAui0pMrHrZ128xfLXxDZ7/qvBJkzaEbg==
X-Received: by 2002:a05:600c:37c3:b0:439:6118:c188 with SMTP id 5b1f17b1804b1-441c48dc55fmr94329725e9.19.1746528458003;
        Tue, 06 May 2025 03:47:38 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:26ec:c7bf:3d4f:d8ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89edfc2sm162391725e9.20.2025.05.06.03.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:47:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the kernel for NFS boot
Date: Tue,  6 May 2025 11:47:31 +0100
Message-ID: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
ensure the Ethernet driver is available early in the boot process. This
is necessary for platforms mounting the root filesystem via NFS, as the
driver must be available before the root filesystem is accessed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
With this change, the Renesas RZ/V2H EVK board can boot from NFS
which has the DWMAC IP.
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2dd75c799848..38d1c2ff3aa9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -379,7 +379,7 @@ CONFIG_SMC91X=y
 CONFIG_SMSC911X=y
 CONFIG_SNI_AVE=y
 CONFIG_SNI_NETSEC=y
-CONFIG_STMMAC_ETH=m
+CONFIG_STMMAC_ETH=y
 CONFIG_DWMAC_MEDIATEK=m
 CONFIG_DWMAC_TEGRA=m
 CONFIG_TI_K3_AM65_CPSW_NUSS=y
-- 
2.49.0


