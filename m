Return-Path: <linux-renesas-soc+bounces-3215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76885868167
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 20:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 290DC1F24A5D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 19:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6FC130AEE;
	Mon, 26 Feb 2024 19:47:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5156C12FF76;
	Mon, 26 Feb 2024 19:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708976850; cv=none; b=jT0M0GfnwYNv3RYrUVkO5uJvZg6S749QmNZtqzIzRJDS5wAf1SRdKBvjjPOuwgVzp0YkEhnoZ6LT4LovaWo96LMInZDRVuzKB6Uzf6xTP0NRansNFkaVUBm4r62niLhjmLHxTaK0URgxo6HJlJn1oTzq2zjwCOORjk6to6Aytcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708976850; c=relaxed/simple;
	bh=T6WPBIbXET+vtxSpPV/khpA+dkmBCIX+HZRrAkVIPKE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bFhVHnikcDY9Ijep/XSYfZMgFp+bTVV/73dR4QFB9KikdrzmHICwJmRqP7EtL4xH6+RjbXQ+mIp/jhfAadOXdrJVM3emETHBM143ddLv131/ZqV+UCaO/FzPQuoa3JTddTqXgF4csmWh3qGthZeWk2cV/e7Xrb/1g4By2JCKUqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,186,1705330800"; 
   d="scan'208";a="199322571"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Feb 2024 04:47:21 +0900
Received: from localhost.localdomain (unknown [10.226.93.86])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6B58940065B4;
	Tue, 27 Feb 2024 04:47:18 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] Enable DA9062 PMIC and built-in RTC, GPIO and ONKEY
Date: Mon, 26 Feb 2024 19:47:13 +0000
Message-Id: <20240226194715.427597-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to enable DA9062 PMIC and built-in RTC, GPIO and
ONKEY modules on the RZ/{G2UL,Five} SMARC EVK development boards.

Logs:
GPIO:
root@smarc-rzg2ul:~#  cat /sys/kernel/debug/gpio | grep da9062 -A5
gpiochip1: GPIOs 664-668, parent: platform/da9062-gpio, da9062-gpio, can sleep:
 gpio-665 (                    |SD0_PWR_SEL         ) in  lo
 gpio-666 (                    |SD1_PWR_SEL         ) in  lo
 gpio-667 (                    |SW_ET0_EN#          ) in  hi
 gpio-668 (                    |PMIC_PGOOD          ) out hi
RTC:
 da9063-rtc da9062-rtc: setting system clock to 2023-06-14T15:45:44 UTC (1686757544)
ONKEY:
 input: da9062-onkey as /devices/platform/soc/10058000.i2c/i2c-0/0-0058/da9062-onkey/input/input0

Biju Das (2):
  arm64: dts: renesas: rzg2ul-smarc: Enable PMIC and built-in RTC, GPIO
    and ONKEY
  arm64: dts: renesas: rzg2ul-smarc: [DO NOT APPLY] Add PMIC IRQ
    property

 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

-- 
2.25.1


