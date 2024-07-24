Return-Path: <linux-renesas-soc+bounces-7494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E893B69E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 20:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81F38B22C64
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 18:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F0E16C84B;
	Wed, 24 Jul 2024 18:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLesQd+c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7710A16B722;
	Wed, 24 Jul 2024 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721845375; cv=none; b=pW15o6DxHGhIVuXnsJmrR9/zeQFz7hJbF1P+q3N2xx80A5WZlb8cRAOL6jJ6fo+MWYTmTXS+yemAvSw1olkImTlZLVAwJEvTqKanuFUvYeITCwG1tue6YZizU6xtRjyzpgJ84K2AZpwuV9CUS3o4WzwWNA61/bQ5EjJm+KDwdqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721845375; c=relaxed/simple;
	bh=Z4Cg2TnJwYE1DhCcNn4gkS8Vcn8aJDytk1xPw1gfdgM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z+U7D7un/z8QEP1+DUwKsKMdwQ4Hn9hGyV9I8u4UcGkogL/p45WM+5LID2mBK+7KqQ+LaCpFVimVS5APEa8hDA5EbXsPFLPSOHuGpAHwgZ427RVonOk5jMRWX3rnlNdEtEOcuefmaw9kh0cveEocLGUIPfz1T+4hnwzSSwrnBnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLesQd+c; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42797289c8bso666555e9.0;
        Wed, 24 Jul 2024 11:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721845372; x=1722450172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVCfTE0NROhZ28TaZGaiQuIpHQXct/DwD9UUx7joZTQ=;
        b=GLesQd+cpZ7ZLLTFCN+jysRMVaXUrmoEwAlotcWLoOHGAJDKVX6NbPJC+PF7XSIVry
         cb0wcJ7t2TTj8WgSB78n96ALXUnNvVaJIavFmJGcprDRDpELmlU8Ssgz1lUzuKIfV1jx
         Az8eGJAVOdtbVbAMoGKBsKA8QcZhLdjkaU2HxI77O3WVPUwX4dyAKEvVzLkp3Qy3gjO5
         a8HdyJQMPEMcjwcRIIAth0DcDbfnxUCk0ZEwB6z65132Rtp3aSDjOrhq/pgGFmCOvg19
         v2UqwTE0TJsdOcCWOpKGdYSbbt1FFGQBx1eJuhdYL7ogCzuD1K+neShQkwWHgE6WLv4r
         Flsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721845372; x=1722450172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVCfTE0NROhZ28TaZGaiQuIpHQXct/DwD9UUx7joZTQ=;
        b=s+he/4IXhK5TgowM81uWhndef1rwuNefP4fc/I+ynRJwH4+i2O9AxSejMtAAKQD8ZO
         6KY7+wFqjw1XLrGf1afFK0786Pv5mAOpvpZ+yZZrzWPI8SqVIkpfEaqr1KnubaqIzKPn
         xLLokiP+bcOB2UeQ7tSPEdeGHw9qiROCEXfn9U2UNPGv3KyCzEwu7psmMDrouTBD9o6D
         74oCfJ4Os7fo9o7JjRnht+pFY3ecXJ0GuPb1oE04bacAWaUt4xP4KEuUiTzp2C0EFXFC
         +Cjq3rvegzAufSgoAZ1ew21q48O2OBEMD8t2jG/PwqL38QNXsAcCvgfYg0HDmqXDA7sN
         ryXA==
X-Forwarded-Encrypted: i=1; AJvYcCXJQVOppUfUF7Bmql0IczWfaq6fRLRIRPgVX6SowMsmyoB01aveWDgLYaBjjhc4+LT6ySU5SGb0w2+N0NDqEt187l7aK++qGiL8B48NcLn40zRQWZDkr4Docd7j1SRDV+NxJAmHn20qjnfQOUgBI9/dcbu7bf6MP2JK+3qc8hxyWrtjoKq5Z1XGy+8+
X-Gm-Message-State: AOJu0YzKZYfZpTXWF7kq+RMGaUp9G4+9wrUACveu+poD9THmhmwL2DJv
	MsVyYEpncYlrxUBZ7fRaijDQ+Drr25G8WTvoq+51/7sTuEcJ2qve
X-Google-Smtp-Source: AGHT+IFCEhSdnrVOIE8vJ1FPGPxhox+YI1nRJa9GWRRVVmzaw1A79Giz7J/3ENdOdIGJv0HOfOUjyA==
X-Received: by 2002:a05:600c:1d04:b0:427:d8f2:332 with SMTP id 5b1f17b1804b1-427f954c3b8mr21405895e9.7.1721845371735;
        Wed, 24 Jul 2024 11:22:51 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687868b5fdsm14909882f8f.38.2024.07.24.11.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:22:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 3/3] mmc: renesas_sdhi: Add RZ/V2H(P) compatible string
Date: Wed, 24 Jul 2024 19:21:19 +0100
Message-Id: <20240724182119.652080-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240724182119.652080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240724182119.652080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to that
of the R-Car Gen3, but it has some differences:
- HS400 is not supported.
- It has additional SD_STATUS register to control voltage,
  power enable and reset.
- It supports fixed address mode.

To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g057'
compatible string is added.

Note for RZ/V2H(P), we are using the `of_rzg2l_compatible` OF data as it
already handles no HS400 and fixed address mode support. Since the SDxIOVS
and SDxPWEN pins can always be used as GPIO pins on the RZ/V2H(P) SoC, no
driver changes are done to control the SD_STATUS register.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5
- Dropped handling of regulator

v3->v4
- Dropped using 'renesas,sdhi-use-internal-regulator' property
- Now using of_device_is_available() to check if regulator is available and enabled
- Dropped extra spaces during operations 
- Included tested by tag from Claudiu
- Rebased patch on top of https://patchwork.kernel.org/project/linux-renesas-soc/patch/20240626085015.32171-2-wsa+renesas@sang-engineering.com/

v2->v3
- Moved regulator info to renesas_sdhi_of_data instead of quirks
- Added support to configure the init state of regulator
- Added function pointers to configure regulator
- Added REGULATOR_CHANGE_VOLTAGE mask

v1->v2
- Now controlling PWEN bit get/set_voltage
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 422fa63a2e99..6b858393f19f 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -284,6 +284,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77995", .data = &of_rcar_gen3_nohs400_compatible, },
 	{ .compatible = "renesas,sdhi-r9a09g011", .data = &of_rzg2l_compatible, },
+	{ .compatible = "renesas,sdhi-r9a09g057", .data = &of_rzg2l_compatible, },
 	{ .compatible = "renesas,rzg2l-sdhi", .data = &of_rzg2l_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
 	{ .compatible = "renesas,rcar-gen4-sdhi", .data = &of_rcar_gen3_compatible, },
-- 
2.34.1


