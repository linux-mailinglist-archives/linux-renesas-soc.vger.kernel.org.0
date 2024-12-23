Return-Path: <linux-renesas-soc+bounces-11695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E489FB3A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 18:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FA6E166A9E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 17:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6B51C5F31;
	Mon, 23 Dec 2024 17:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8wn8GdV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9341BBBE3;
	Mon, 23 Dec 2024 17:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734975462; cv=none; b=IVSk2UMeTRbxgXBZUErwXZjepTTjl1gz13rkHY4ZlIi8oLDrdAGHojut4eQ9DhBUIwpzOCkkxgouRQeoTu2jwvOq6/EaUjenY8g8MCtFa2VmSmfe2absq369ba9UZfSW+JLduJSjNz3lc/EIYq5/FuuMipcV2gys5OEccfnbAeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734975462; c=relaxed/simple;
	bh=iblG0/v4MjzULID8kCYJJ5wEGwJ0PXtbn3jbV+n/RXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GyGxH0lMc0Nh4euIOSCfB5+PAukQmlU+R3I1Ba/wsUP9Ol5v4Qy6mSoJlvr5FOeBa+3m5M7NrJdH98wDZHSSixwtJwIpUd3Uw1RZzfzfuFDZSIgZvxhQvhZRtqdO2qKkkQg8M/Fin/RiyPp/+e+D/rUl8+xmzVIM+IZqMupReRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8wn8GdV; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso3095760a91.1;
        Mon, 23 Dec 2024 09:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734975461; x=1735580261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pto2WYjD2wd646rliD7JsPdaGRxtckGnXDunW7upba0=;
        b=M8wn8GdVDbbw2n4L/7qO/EgLbskZYf9IeYeH5/Ws8uUR5wZVLVi/cdo4loTIXhiEBy
         4Xye+pN79fs5/7s/0lGCx335p8wLz4NTcGRdKGIuqCtw20KuqQSwiyDwjkmoVqgVuVDs
         n3ENUnB/UJK9MhJxX2eBceq+grCPn8RtmM7ffj2nJbhuFUhQFd0cR53MnP7y5QBhLheM
         xD/8HnHMkMQKG1R0cQNOOIGIeKwzyYYQV5+js3lcDb/0k2nHS+VXHJkimfN8Ieo2FdSz
         7Cq/YpXNdskEjh8d4go+AR7EoqQP3HFtRPrWL/uKOvwEHVw8H+mqsl1JNEoNiA3PKvFN
         yDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734975461; x=1735580261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pto2WYjD2wd646rliD7JsPdaGRxtckGnXDunW7upba0=;
        b=s69jbqqmTc+tBnNAdJBL/xq6po/pwvWI+dbrq6mURt2znY1H6lSCxT5IauCOueOs9h
         kT8+9+Rj0mwtiithwRhhzjnOVx/5/HeDxVFyx5F6na2LbdbkT5qqungr3TGISZt9xrv2
         Hyjx0aZYk8oi2dlcPpgAmLdBtEp5viYWnbJDFCHhXOaZQwKLuWBHTdVdXm+M1F/XBYgR
         I3S3BOhjF05WKpRPOxg1B8Du6JfFf1/7UdeZCenXBcIWve/+FpqXhT5GyywqgeBXVVXP
         5CIdvqlnNnf0+x3Le+UKl+tvx3MENiDgJrWCEOq8G0YP7prR8z0X1/gdUl6kDgNGraFm
         4AiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLrF/LUC3oUx0D+PKQQoIpG5Ud8fNaW+dn7dPBFv3Ti3q/T5XEf9KwL1YmEHIFibdlANIi9l0fMyM=@vger.kernel.org, AJvYcCXTuuoZXz4r7MqPGlAeX6YWcs9IjWqT6BZSo6EmpmijMbc4xglsyKYpLx10kJKSALfp6qSgBahwdrQ8WzFI@vger.kernel.org
X-Gm-Message-State: AOJu0YwcWcea8l7cCtXTVqeaX5efxuWhznVpzwm3haRDGTG/eP1xgmdY
	xfBIs+vN44dp/SJpq2YCPB1hsL/gxNP1K8HDtrQLDOfs6qvoV3MT
X-Gm-Gg: ASbGncvkzAVoyz8oLEQfshllF2TiR/zN1TyM4Q06TBOtwX2VsiYVvHbjd4bjpSs11Yf
	jml+wtwizfhqRnUnASOFuSUY14PegJbUHSXooPH3JGog26sBzyIzhvAqLpmlhl/OeEaxdGoCU7T
	2yftgp1LvgAuMdg7Ro2c0RCJYB6z7dA7WOKeOd4iVW3STK1ueGTg0WLrXqkpuWZcez5zqUOgzZ3
	2wGq0yOyTE1IqEn6p7goHEu2tDunYigi/NINLRDInW1JPuGaUTX1RnOyZ1YO7hyi26bUAn9/vox
	XJdsbgo=
X-Google-Smtp-Source: AGHT+IHRnjJUDf7Y9//bg8F8V0HlgYu1MfS8Q2ypqioz2mtn+aijfdONo1cjBqh8pQQjzldDBPATvg==
X-Received: by 2002:a17:90b:1f83:b0:2ee:fd53:2b17 with SMTP id 98e67ed59e1d1-2f452eb3ce1mr21651446a91.29.1734975460798;
        Mon, 23 Dec 2024 09:37:40 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:689d:b086:b856:9280:38c3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52cec5sm10664032a91.7.2024.12.23.09.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 09:37:40 -0800 (PST)
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
Subject: [PATCH v2 6/6] clk: renesas: r9a09g057: Add clock and reset entries for GIC
Date: Mon, 23 Dec 2024 17:37:08 +0000
Message-ID: <20241223173708.384108-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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


