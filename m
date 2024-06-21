Return-Path: <linux-renesas-soc+bounces-6606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B754491233C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 13:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 711F0284CDF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 11:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8F6173323;
	Fri, 21 Jun 2024 11:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="guo/Uduo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B3016F84A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 11:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718968997; cv=none; b=MoaPkKLkSntAAydJPCIIzHqgKZTu/VbCjMkk2FUFykMCCDgCdUp7vjudzP8Uo4e5Hnef6mM+t3KjdtOUPcHyj2Q4SXr5ap7FnFb+4sK2EBJFAm3eyyOtH0ClCgBpOKDrXGQbRXq8fGYXToG1jVbk5CkaYWK20gd610Srdud7lWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718968997; c=relaxed/simple;
	bh=Fv7NlUCZI/OUwx7K8zdVj8ejFf+r5TqNY1XP6u/JAqY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lmFXfTNJbR/WkNvi8782NT2O67xRnaYlTwpHsDYvze29Fny4g3efdjxW3Ob1h869CCUygHIylKGRcMphZX+zmZMgYwNyHaVBjkTcvNTANfjR6tzXtXiHyNgTRLFme1OQQrBtHCJD0+V00XRihyD9pG8gse2t2z2P4kuxKdxnXOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=guo/Uduo; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so26677961fa.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 04:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718968993; x=1719573793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6WDv/9m0rJF3vWnUpTVye3S1d4XL2apMBP+n7COuLg8=;
        b=guo/UduoPOCW0J8rlt2S0YiTH4ajsrBArTKZrPZWklzsuhhR3FLKzvNSr5Vc/WAzXk
         Dj2jCZN9i59mS90J0FoCOLH5GyA3ay2K8p+WBqGkvgwFqI7IjoTP/Yx7WUy5TKQKWpQA
         vaeRissI5re4/EUfEAqnxf/Zt9gV+Nla52LjnLn07f02+aQVNVfAYVv8VTLzXSuNaa3g
         SSkcsSYcPlQG6H6tNXbQEwGXJkquuaN34Kmnw+gut/g7ai6PPnIia+G+dTXptyW34tCF
         95ych5/Ww5Hm/G2Z5LCVDse1a7afAb3pYbw74hScX9OSfFaTdlEPpVDl3FECFf9WWq+/
         zfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718968993; x=1719573793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WDv/9m0rJF3vWnUpTVye3S1d4XL2apMBP+n7COuLg8=;
        b=nL3MRy3hx1QAtPEXIeem9zxxaITf0e0DQuf08QGPST5WB+3VwPJbZrZOCNPA+w6rvZ
         zoerkfGDc/5IlGyFOdYz/QUNilLY2hqaLeaYxm0J51LLY5xsYTRk+D56yWqovBEU765s
         WgBEDey/l5iefgll6nQH77+sdEOLTH4O3e+RJS+ZYdN/QiG+ToqUhydgClTuWc0dgOHI
         36LkQ0mpy60QOwQr4y+U+Y77xZ/8ufPzC1ilzVEiHTLQit88n5NgvX2Ag9ypZxPbZJpt
         +Q5N2We1rLo7yi72lFDYOq7UT56Di5aMh1dGOmYl1XzYRlpL+Il1KCVKBr+acZ3XLd+P
         Z+Jw==
X-Gm-Message-State: AOJu0YxBSGh93E1MAKsC1QJRuh4wAe5BHdcWCcRMY1UvZ3NQohgFGBbs
	Ogm3LheS530TM2tNLRDSp7JJBumAev8JDCIRWjOBqfMgb6ttkaVUxQMO/MrZIVc=
X-Google-Smtp-Source: AGHT+IHpweSE3KdQsDRimuTsrhI6yOPpZ5O4BdQG93h1/gDFsFb9X1ELgh9R/GgZ3UFZqqr7CMVgfA==
X-Received: by 2002:a2e:850f:0:b0:2ec:efb:8b60 with SMTP id 38308e7fff4ca-2ec3cec0d9dmr65254451fa.13.1718968993480;
        Fri, 21 Jun 2024 04:23:13 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fd0838345sm64498466b.99.2024.06.21.04.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:23:13 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 00/12] i2c: riic: Add support for Renesas RZ/G3S
Date: Fri, 21 Jun 2024 14:22:51 +0300
Message-Id: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds I2C support for the Renesas RZ/G3S SoC.

Series is split as follows:
- patch 01/12      - add clock, reset and PM domain support
- patch 02-03/12   - add some cleanups on RIIC driver
- patch 05/12      - enable runtime autosuspend support on the RIIC driver
- patch 06/12      - add suspend to RAM support on the RIIC driver
- patch 07/12      - prepares for the addition of fast mode plus
- patch 08/12      - updates the I2C documentation for the RZ/G3S SoC
- patch 09/12      - add fast mode plus support on the RIIC driver
- patches 10-12/12 - device tree support

Thank you,
Claudiu Beznea

Claudiu Beznea (12):
  clk: renesas: r9a08g045: Add clock, reset and power domain support for
    I2C
  i2c: riic: Use temporary variable for struct device
  i2c: riic: Call pm_runtime_get_sync() when need to access registers
  i2c: riic: Use pm_runtime_resume_and_get()
  i2c: riic: Enable runtime PM autosuspend support
  i2c: riic: Add suspend/resume support
  i2c: riic: Define individual arrays to describe the register offsets
  dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
  i2c: riic: Add support for fast mode plus
  arm64: dts: renesas: r9a08g045: Add I2C nodes
  arm64: dts: renesas: rzg3s-smarc: Enable i2c0 node
  arm64: dts: renesas: rzg3s-smarc-som: Enable i2c1 node

 .../devicetree/bindings/i2c/renesas,riic.yaml |   8 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  90 +++++++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   5 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |   7 +
 drivers/clk/renesas/r9a08g045-cpg.c           |  20 ++
 drivers/i2c/busses/i2c-riic.c                 | 240 ++++++++++++------
 6 files changed, 299 insertions(+), 71 deletions(-)

-- 
2.39.2


