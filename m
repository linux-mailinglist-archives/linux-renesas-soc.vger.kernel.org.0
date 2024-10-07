Return-Path: <linux-renesas-soc+bounces-9505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA54A9928AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 12:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EE711F24534
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 10:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F531D89F7;
	Mon,  7 Oct 2024 09:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvPLdlxM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618881D8A00
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Oct 2024 09:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728294654; cv=none; b=nqyD58+qydzRO8gSVBK1t5xONrIyOjPOH8ikMstJ6M7O5/imijqJ/1neLMcoEM+hHUgBALs/Owx8kGpMWfpUvDpNlFXpT/7GckF7OiDy5ROFNXQtUEpJXSgq4Z14FLDvJRazkBtdL4qIZT9/YJum5jtTYM2ciyT54afRCSYoaY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728294654; c=relaxed/simple;
	bh=dSqzcqXMYkI0tJ/fkDn8KjmUCBiosiUemk9jJon0VWc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=k4tF3lvi0Bosgfq/kDiLEpoN3UTZcm6tLkHyXtsJ0kjAK2+J3ucgVMq5A6RrPtTvdP/fKsN9eTLQfkEezxACR44mIkJ+Ot4TYyxBvASzGP608BRG0OMFPAkqUk73Igu+SVMSo3P8AKVcmT+b1m23KYXDwammO71aFodGyQjnYL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvPLdlxM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D383C4CECD
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Oct 2024 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728294654;
	bh=dSqzcqXMYkI0tJ/fkDn8KjmUCBiosiUemk9jJon0VWc=;
	h=Subject:From:Date:To:From;
	b=UvPLdlxM+ErenUd4We4hHZwps+BILHbHPLXE8zI2bqfdLrlXmCio/5nkcV/OcZjS6
	 FZLVsqkEL3L7HjGInbsSB0IO+8wtrwWQNiQxFnoOBDO2kPMMhxiNIrdHul9wi1raRu
	 y2BdWdy14jpJKVgCwy/65oh00YZN2GD/VW8Wzt/Mu1Blte+7aiB9+MKOSub0LGlmeZ
	 T3MLZLZtFdjlY9W8ZjjaripkpZex+n/krfUATa5ZkeKuzP1bqR7zGMtWM5ZVlV63NQ
	 ndZHaPPwyYJwUdY5Z49qJ3yP6K9sFAelU8Eq1zZjma35KSUHZoU0jPtCQCDs4TGEsu
	 r28xmpYC2UFIg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3821539E54C7
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Oct 2024 09:50:59 +0000 (UTC)
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
 <172829465767.3959652.7539087838918204704.git-patchwork-summary@kernel.org>
Date: Mon, 07 Oct 2024 09:50:57 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: ARM: dts: renesas: fix BSC nodes
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=893099
  Lore link: https://lore.kernel.org/r/20240926103340.16909-4-wsa+renesas@sang-engineering.com
    Patches: [v2,1/2] ARM: dts: renesas: add proper node names to (L)BSC devices
             [v2,2/2] ARM: dts: renesas: r8a7778: rename 'bsc' to 'lbsc'

Series: ARM: dts: renesas: use proper node names for keys
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=893120
  Lore link: https://lore.kernel.org/r/20240926110718.20519-5-wsa+renesas@sang-engineering.com
    Patches: [1/3] ARM: dts: renesas: lager: use proper node names for keys

Series: ASoC: Clean up {hp,mic}-det-gpio handling
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=893457
  Lore link: https://lore.kernel.org/r/cover.1727438777.git.geert+renesas@glider.be
    Patches: [treewide,01/11] ASoC: fsl-asoc-card: Add missing handling of {hp,mic}-dt-gpios
             [treewide,05/11] arm64: dts: renesas: beacon-renesom: Switch to mic-det-gpios

Patch: gpiolib: Fix potential NULL pointer dereference in gpiod_get_label()
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=895189
  Lore link: https://lore.kernel.org/r/20241003131351.472015-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: ASoC: dt-bindings: renesas,rsnd: correct reg-names for R-Car Gen1
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=893129
  Lore link: https://lore.kernel.org/r/20240926113241.24060-2-wsa+renesas@sang-engineering.com

Series: ARM: dts: renesas: genmai: enable SDHI and MMCIF
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=893604
  Lore link: https://lore.kernel.org/r/20240928092953.2982-5-wsa+renesas@sang-engineering.com
    Patches: [v2,1/3] ARM: dts: renesas: genmai: enable SDHI0
             [v2,2/3] ARM: dts: renesas: r7s72100: 'bus-width' is a board property

Series: usb: renesas_usbhs: Deprecate renesas,enable-gpio
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=894741
  Lore link: https://lore.kernel.org/r/cover.1727853953.git.geert+renesas@glider.be
    Patches: [1/2] dt-bindings: usb: renesas,usbhs: Deprecate renesas,enable-gpio
             [2/2] ARM: dts: renesas: rcar-gen2: Switch HS-USB to renesas,enable-gpios


Total patches: 11

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



