Return-Path: <linux-renesas-soc+bounces-1007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EFE811DD0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 20:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 732CF1F21DEE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 19:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844B067B43;
	Wed, 13 Dec 2023 19:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZD+0aVJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6607464712
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 19:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAF56C433C7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 19:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702494027;
	bh=UcSDlg1PrHyY6kCiFcbCZkUHvnnlMmzla4WCoSRxkpY=;
	h=Subject:From:Date:To:From;
	b=CZD+0aVJwVClzR/W7G5xj2NYOzRqN25l9Zso+TJbH757mndiOETnyR/KxOIza4JjL
	 B6Pb85iDfGcAg22y/P9c5SDIFyK2IC5PIxhVgncQEqtqRdxj29ghBOn2LxAS7jF+8J
	 gJzdDsitDWc4s8DIQDDm8VssqlgD62CbRhIzOqkWvfmWKAyN//0bZaR9apSnp9qj/s
	 ykzr/8loAGM8HPKGuDE8cOcFpCnurXvxYzbf3LKG67qpJ5b52IjwiNe0Esl1dG10CA
	 V+wRo/08Y6n59mZkCDIVTrzUzjXp4YgDOIFLMVIwho4aran+6+2GECiT8R7ko+sNEZ
	 xeYeUdDxoXV9w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D3242DD4EF0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 19:00:26 +0000 (UTC)
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
 <170249402681.16244.1438899787025101394.git-patchwork-summary@kernel.org>
Date: Wed, 13 Dec 2023 19:00:26 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: soc: renesas: Remove duplicate setup of soc_device_attribute.family
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=806622
  Lore link: https://lore.kernel.org/r/4c5e4d0d1819028466748ed684254fec41aae816.1701696627.git.geert+renesas@glider.be

Series: irqchip/renesas-rzg2l: add support for RZ/G3S SoC
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=802440
  Lore link: https://lore.kernel.org/r/20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v3,1/9] clk: renesas: r9a08g045: Add IA55 pclk and its reset
             [v3,9/9] arm64: dts: renesas: r9108g045: Add IA55 interrupt controller node

Patch: [v1] soc: renesas: make ARCH_R9A07G043 depend on !DMA_DIRECT_REMAP
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=808954
  Lore link: https://lore.kernel.org/r/20231211-primate-arbitrate-fbcd307a0b00@spud

Series: renesas: rzg3s: Add support for Ethernet
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=807731
  Lore link: https://lore.kernel.org/r/20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v2,01/11] clk: renesas: rzg2l-cpg: Check reset monitor registers
             [v2,09/11] arm64: renesas: r9a08g045: Add the Ethernet nodes
             [v2,10/11] arm64: renesas: rzg3s-smarc-som: Use switches' names to select on-board functionalities
             [v2,11/11] arm64: dts: renesas: rzg3s-smarc-som: Enable the Ethernet interfaces

Patch: arm64: dts: renesas: white-hawk-cpu: Fix missing serial console pin control
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=809587
  Lore link: https://lore.kernel.org/r/8a51516581cd71ecbfa174af9c7cebad1fc83c5b.1702459865.git.geert+renesas@glider.be


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



