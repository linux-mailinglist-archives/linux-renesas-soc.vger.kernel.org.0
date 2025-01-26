Return-Path: <linux-renesas-soc+bounces-12515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 514FDA1C81B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 14:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1E623A53F2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 13:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F44782890;
	Sun, 26 Jan 2025 13:46:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5AA25A653;
	Sun, 26 Jan 2025 13:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737899195; cv=none; b=GWRbDG16DHYTGnpSNWCu41a5ExY+rAxjoHgICYd8KzGCvGsV9Lz0mYtFtlRNtzHqx3rcNGyp1RNWTGIwKfYC2bQB1LbgwaseLspETP5dlvP52pVHWBoQH0Ghnb9/jQRyfKyekkuh2nhiSedfZPvyi5ARiNQIvH8zIHzYnJ2qkJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737899195; c=relaxed/simple;
	bh=I8htk56yCQqWvtHXnwPQk+SpzplwyeO+eWzx14Z/5Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sFEYXyX/+YQjrOjw7cRYosmCP9wJW4MZSZFJSOHPKd0SYcx7eyAiER8j6xDJzmx32s/xpHCrfzSrmh1ApKcj3WfSZJ/K7HDQw0Piwjo4A/HSCowMG6X/tYT3hyZ/ymx69lEB3A2gRAC9sATL74ovZUU2wKA46/uj662UwUppaZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: SbUwMhuNSEm0V1fktbOtfw==
X-CSE-MsgGUID: 7IRuzLtCSPCsoaIks3R74g==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jan 2025 22:46:31 +0900
Received: from localhost.localdomain (unknown [10.226.92.41])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 61A1740031E4;
	Sun, 26 Jan 2025 22:46:19 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/7] Add RZ/G3E SDHI support
Date: Sun, 26 Jan 2025 13:46:02 +0000
Message-ID: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SD/MMC block on the RZ/G3E ("R9A09G047") SoC is similar to that
of the RZ/V2H, but the SD0 channel has only dedicated pins, so we must
use SD_STATUS register to control voltage and power enable (internal
regulator).

For SD1 and SD2 channel we can either use gpio regulator or internal
regulator (using SD_STATUS register) for voltage switching.

Biju Das (7):
  dt-bindings: mmc: renesas,sdhi: Document RZ/G3E support
  clk: renesas: r9a09g047: Add SDHI clocks/resets
  mmc: renesas_sdhi: Arrange local variables in reverse xmas tree order
  mmc: renesas_sdhi: Add support for RZ/G3E SoC
  arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
  arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
  arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1

 .../devicetree/bindings/mmc/renesas,sdhi.yaml |  20 +++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  57 ++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  65 +++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      |   9 ++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     |  89 ++++++++++++
 drivers/clk/renesas/r9a09g047-cpg.c           |  31 +++++
 drivers/mmc/host/renesas_sdhi.h               |   1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 131 +++++++++++++++++-
 drivers/mmc/host/tmio_mmc.h                   |   5 +
 9 files changed, 407 insertions(+), 1 deletion(-)

-- 
2.43.0


