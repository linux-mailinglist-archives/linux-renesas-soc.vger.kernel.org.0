Return-Path: <linux-renesas-soc+bounces-16678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C01EAAA912A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 12:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 368FB1740FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 10:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5CF1FBEA2;
	Mon,  5 May 2025 10:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzFkF9L0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896F22BAF8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 May 2025 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746441045; cv=none; b=AZ7rVJbE/RR5ADYo1mLbXjvT+vNhfocTFO8jM476p+xDS/IGPvMSqAv5EGQhnEs1UwVJAXylSWizNAwttKRi54bA0BwBu9t/Fvn2yJRPYF26w9yvBr0kWJ68CPC9wwywPtOE8lwr+MRH5rVwNHH0x44C2nf/2RKagsDSuPMzNnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746441045; c=relaxed/simple;
	bh=q/m6YIsW2DNS3yTdmcNkM3eoJR7Kl4BSrF+kX6gFESo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=BpsrbBuwaGJSLDXKZAbMJJUYv98nloRv5sRTbb4eKrVhNfe1VT6c+WVf3rYtOHqcdLTCSjqf/WZ0Zd5l5ByWLdyjmcfHoB2uorLzlid23QDzJ30RgT6ICmTlP8GKA4Hr+m0DbGoqnrDGNzkmDjT6Bx0LgxwhfDnOJwf/FcGMluE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzFkF9L0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CB6C4CEE4
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 May 2025 10:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746441044;
	bh=q/m6YIsW2DNS3yTdmcNkM3eoJR7Kl4BSrF+kX6gFESo=;
	h=Subject:From:Date:To:From;
	b=RzFkF9L0vnfIFmr0RPtfrRPuqLrKCsiPN7WmQxjnNJi9PhROaCSqRt7CijVPLVBOf
	 hoACCd97D67zMyN6USwCuF41DadLMPyMMod7RLVMotDmRxkKYgPsaMgg7C0phqaynq
	 ScQqV1YsjRPXNSs5riA7G1QnvMm+YXkDzUQ05DtxLrcAledLWIfIXShkpFkd3+/XVJ
	 FCt3BwSoLgYydswcrTfliFJF/5N78zGUE7+KL4MuM+i2ZC2CK+ySTLvMqijcaxnVaT
	 YVjxndZjm9VkIi6g1dzPa0jpqnuMrbO8h3mevMUBtoP914LO6BEyX4k1p7yjMUzqf7
	 faxAOxnGgQ1tA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7517E380DBF5
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 May 2025 10:31:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <174644108300.719014.13497870620027202669.git-patchwork-summary@kernel.org>
Date: Mon, 05 May 2025 10:31:23 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: ASoC: add Renesas MSIOF sound driver
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=954673
  Lore link: https://lore.kernel.org/r/871ptq4blr.wl-kuninori.morimoto.gx@renesas.com
    Patches: [v4,1/9] dt-bindings: renesas,sh-msiof: Add MSIOF I2S Sound support
             [v4,8/9] arm64: dts: renesas: sparrow hawk: Add MSIOF Sound support
             [v4,9/9] arm64: defconfig: add Renesas MSIOF sound support

Series: Enable GPT
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=956446
  Lore link: https://lore.kernel.org/r/20250424054050.28310-1-biju.das.jz@bp.renesas.com
    Patches: [1/4] arm64: dts: renesas: r9a07g044: Add GPT support
             [2/4] arm64: dts: renesas: r9a07g054: Add GPT support
             [3/4] arm64: dts: renesas: rzg2l-smarc: Enable GPT on carrier board
             [4/4] arm64: defconfig: Enable Renesas RZ/G2L GPT config

Patch: MAINTAINERS: Generalize ARM/RISC-V/RENESAS ARCHITECTURE
  Submitter: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=949878
  Lore link: https://lore.kernel.org/r/20250404080045.367845-2-u.kleine-koenig@baylibre.com

Patch: arm64: dts: renesas: Align wifi node name with bindings
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=956523
  Lore link: https://lore.kernel.org/r/20250424084748.105255-1-krzysztof.kozlowski@linaro.org

Series: Add basic SPI support for SOPHGO SG2042 SoC
  Submitter: Zixian Zeng <sycamoremoon376@gmail.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=956815
  Lore link: https://lore.kernel.org/r/20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com
    Patches: [v6,1/3] spi: dt-bindings: snps,dw-apb-ssi: Merge duplicate compatible entry
             [v6,2/3] spi: dt-bindings: snps,dw-apb-ssi: Add compatible for SOPHGO SG2042 SoC

Series: Enable CANFD and CAN Transceiver
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=945986
  Lore link: https://lore.kernel.org/r/20250320164121.193857-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/3] arm64: dts: renesas: r9a09g047: Add CANFD node
             [v2,2/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable CANFD
             [v2,3/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable CAN Transceiver

Patch: ASoC: renesas: rz-ssi: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=952069
  Lore link: https://lore.kernel.org/r/20250410141525.4126502-1-claudiu.beznea.uj@bp.renesas.com

Patch: [v3] soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=953450
  Lore link: https://lore.kernel.org/r/20250415085438.83856-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 16

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



