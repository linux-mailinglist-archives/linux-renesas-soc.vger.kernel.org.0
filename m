Return-Path: <linux-renesas-soc+bounces-19789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 921BEB164F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 18:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8464562842
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 16:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6DF2DAFA9;
	Wed, 30 Jul 2025 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUYKl430"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939A1299AA4;
	Wed, 30 Jul 2025 16:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753893985; cv=none; b=W3RfR2u3GRvTuKONuHYcUXqC1WZhPn3LrsLRwMiaLj3zoWeklNzDmOGdzgXiDIAhu4PgEwAL6bNG7sdhm0iGDkb+n7jdht0BRfunsVS7CqyJ/79F79MxCTVa+sXlkg16N4CnxOZvEKCuh+1bhG4f6Iy0TEXTi6RsRPKlDwMqthU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753893985; c=relaxed/simple;
	bh=LZARjLvzBZFjM3RmA19eFmnzbOWlVNKlKSM0tiqy62A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4obWdFHngjrVghZwIIa2qkyw2MutG3KZfGq4BNnUmxdJhybRDmJMdCyqJ2BlDxgFrenT4yc6+y8FYuBSltF1vAYbfzXIHx9WJh846jEkC+as8uNZTJGE3tcDUGCcBicUNHLM/TfnYye6xCRV3ecfSLUaSbynKOjMYY3uhrb3JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUYKl430; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b783ea502eso959653f8f.1;
        Wed, 30 Jul 2025 09:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753893982; x=1754498782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQs/dqIajSMMhMoY0aI6/yRw3xd1em+8T6SR7Mv78dc=;
        b=KUYKl430a5NrM8fKBJEJ0bRb4GxZwjm/SYFlCCUFQ8S/yKwpVNA6Vi0ZMAQ3/IKRfF
         0QSKGum5MYqpHFsdu7uu0l5UOaYA7AhA5V4QwI2b8mXVrS7xOvXTY+CRqjwjQtHLyEX5
         Eoj01v/4yAT+poEES/q3VrMSDvcBEr1zZyur1gItiyJm0jPxaesV9R9zI6ljB2QEXaOL
         gy8mV/PZRYwbtOIiU/NY2qEWScydvTC9s+OIrSO4i5OqVzD+vt0NmW+yXiID6BFc1KQi
         FOr/I99AZi2z86Eh+V0aCW1GnDWKdRMt9pa1sMiJnHcFdgl8+gzNu2xXCas30ZiCjnmp
         Wgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753893982; x=1754498782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQs/dqIajSMMhMoY0aI6/yRw3xd1em+8T6SR7Mv78dc=;
        b=hm1sspgTl6f+ofv00/STOIHbu84kL9fXCF6JWNXup/6YexWWxyF8agcrAa228ztj9y
         k+2nlASQ45E22J/KVNUGERw21Gfm2LR66pRBNFTfiwIZv7TK7cYA3Dgqk+9qprPCyasD
         8Jnf/ddJ8ylSsYBXbxsl8vKAFI/TtURPJgAoEV8v39KKO804iEDSkvApvZEC4mg7zDL2
         Tn46U7idA/GyEVwSKvo1Kyi6E4/j2vluKbMJrPBcv2GK4T94H746iLx9MRynShLsQVdi
         qvBZXTsMayZEXyBByWJaq0uCWsi5mGS+XfsieqAEvRIdULHK75BvKiYTR1Ed5K5CPBW+
         VRIA==
X-Forwarded-Encrypted: i=1; AJvYcCUG6ZG2/NKGDLCFAeKULR9caWRQqQrZTu11hhQGS1nNyF7DXFVTSa1c5PLZpga3LYOu/ODKxUYPxbW06vY=@vger.kernel.org, AJvYcCVYaCiRAQbff+6/vyD2n+X6vPLGpGflv7LXArecjP8yQrS0UzpHWIdwlvDEWXlEprhCEqsXkLEHpCGgM8N1E38vNGY=@vger.kernel.org, AJvYcCVgThrYt7VPCl6GZNA8XoW3bMj7OmgOV7GgXIYPRKdsAmILk0S9W/lTp5xU6PvuW2erE1iqQyvw2+bF@vger.kernel.org
X-Gm-Message-State: AOJu0YxRA5RTN6HdVnX6vmxFkD/RPF5jGBBfWvm0SMSAljI2rLZPUpUO
	OpEI09jx66Si+vMs1gY1SLd2HQdoVTypKS5/03/2qFX3JBiupAhzQqgI
X-Gm-Gg: ASbGncvHJJKq9slMoP1lym/M0i+HwFZYop31ts+qO54f1raDQqdRRHbTGJ95Pd7tSLY
	MyQeLXBe8TUglRGEwH0Pvv8XswETpbUSXi7EvxsJ9hZ2fZd/SUASbTQjJYZ2/a1Ak23Sz2OOVIr
	yYkdyoLbGrN3safGVedrC/VEjUl4Xs80iAQ61x5Mobgeh4kLU2l5cq7lhWcj+rfdy2WUoef77hN
	0kgK+5d34hfgjWN5uLLNKGIKcLBZweQUi5V8tHP3FNSi62XOmTfwaHpf+AcbGtJXbY7zmmWnH38
	CS+ivZPUBa0Gwe5TV5AFzGLztvHTyaiS2V/Rlb/QL6ziFbLhJyxzTT+Pcf9GgbgwWyIcEpyOeXV
	ENbQgkw9oNCzqeJK6Q/LcIfqYFja2gmur6bAUqQ+o13upGYnjJkU+wE6bT6SfJGkziHf6Ryry7A
	==
X-Google-Smtp-Source: AGHT+IFdlAk+bDf8WtMWs7xZ1WESW0oEyPIAnozDGgppjs1A9m5aiQ5vD1hHltTMRTg1cWSNdFle5A==
X-Received: by 2002:a05:6000:2306:b0:3b7:9ae0:4abb with SMTP id ffacd0b85a97d-3b79ae04dd1mr550108f8f.22.1753893981815;
        Wed, 30 Jul 2025 09:46:21 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78ba267e3sm8564042f8f.59.2025.07.30.09.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 09:46:21 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 2/2] mmc: renesas_sdhi: Enable 64-bit polling mode
Date: Wed, 30 Jul 2025 17:46:15 +0100
Message-ID: <20250730164618.233117-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730164618.233117-1-biju.das.jz@bp.renesas.com>
References: <20250730164618.233117-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable 64-bit polling mode for R-Car gen3 and RZ/G2L SoCs.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
RFT->v2:
 * Collected tags
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 4b389e92399e..9e3ed0bcddd6 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -107,7 +107,8 @@ static const struct renesas_sdhi_of_data of_data_rza2 = {
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
-			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
+			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
+			  TMIO_MMC_64BIT_DATA_PORT,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
-- 
2.43.0


