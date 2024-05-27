Return-Path: <linux-renesas-soc+bounces-5481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E91858CFB21
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 10:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17F101C208B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 08:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2ECA3B298;
	Mon, 27 May 2024 08:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNPSsqAM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1642030B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 May 2024 08:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716797932; cv=none; b=OKmLTNkqv9K3/hKA9Oj7JFHUd0CJqhSs5plpjxxH61NvPHCAgipwWxEnVaA9jRo2hn1zmjRwwaD2hB9pepj9q7Ce2v225H/im3e2oImYMz40B4gKze2zgNlIb2+WqCV2o8ANpT3trMP160lTFZlvG6oykHzbdXgdZYHn7VChc0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716797932; c=relaxed/simple;
	bh=WVFEWzpjN9/0Ea+/rgyBNYUOJpEBtzoK0v1aIM047wE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=aug7MkxeJlbhICwIqApnd/TecsDMTr1wT8WlqTzK/9mUoZhyCufj3pjVILdyNBFQpOrkurIC72m3cw7vyHGZjfC9P6ZBcNqAIinhD9zcYr72YUFhHrjw8rBV+xNxafQipUnDT8y0cwaZ3PNk+hx5hzQ7bIVB3QQRcPWvTdRqQPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNPSsqAM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26E5DC2BBFC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 May 2024 08:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716797932;
	bh=WVFEWzpjN9/0Ea+/rgyBNYUOJpEBtzoK0v1aIM047wE=;
	h=Subject:From:Date:To:From;
	b=aNPSsqAMz+GVDtPN5CL+XMf6efVSwbVnpqrqk6cglI7BPA2oY8hU2GOvhdfXsWEHx
	 rNFBVzR4dp26FyF61VW7OZfMNRWa/qd7hpyI1iHV6BMdG515uO2wjIaBYagOZfZzDg
	 xdvxmf5wY0XVBsi5INhpPoiZ9CvsH1Rj5QE89Eck18kVUaLBQq1q8HPnoDGvz04uBd
	 UnVYwE0H0pA8pkDxkdlsBaUbxoSR5yITFrVixMHFlZxXJe7/mKexG2xGSXyxD+po0O
	 a7DOtseekfJm/Nwz8YLsTNBrj4vEyfMSi/kTefRpJ7x8Ga8SNaTELJkx+wv1E+2EwY
	 P+33Pg2NDpFyw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1541CCF21F8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 May 2024 08:18:52 +0000 (UTC)
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
 <171679793203.18134.11425943111309203721.git-patchwork-summary@kernel.org>
Date: Mon, 27 May 2024 08:18:52 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: drm: Restore helper usability
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Maxime Ripard <mripard@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=846620
  Lore link: https://lore.kernel.org/r/cover.1713780345.git.geert+renesas@glider.be
    Patches: [01/11] Revert "drm: fix DRM_DISPLAY_DP_HELPER dependencies, part 2"
             [02/11] Revert "drm/display: Select DRM_KMS_HELPER for DP helpers"
             [03/11] Revert "drm/bridge: dw-hdmi: Make DRM_DW_HDMI selectable"
             [04/11] Revert "drm: fix DRM_DISPLAY_DP_HELPER dependencies"
             [05/11] Revert "drm: Switch DRM_DISPLAY_HDMI_HELPER to depends on"
             [06/11] Revert "drm: Switch DRM_DISPLAY_HDCP_HELPER to depends on"
             [07/11] Revert "drm: Switch DRM_DISPLAY_DP_HELPER to depends on"
             [08/11] Revert "drm: Switch DRM_DISPLAY_DP_AUX_BUS to depends on"
             [09/11] Revert "drm: Switch DRM_DISPLAY_HELPER to depends on"
             [11/11] Revert "drm/display: Make all helpers visible and switch to depends on"

Patch: pinctrl: renesas: pinctrl-rzg2l: Remove extra space in function parameter
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=829995
  Lore link: https://lore.kernel.org/r/20240226192530.141945-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: dt-bindings: serial: renesas,scif: Document r8a779h0 bindings
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=834557
  Lore link: https://lore.kernel.org/r/49b854603c2c3ed6b2edd441f1d55160e0453b70.1709741175.git.geert+renesas@glider.be

Series: [v3,1/4] dt-bindings: PCI: cdns,cdns-pcie-host: drop redundant msi-parent and pci-bus.yaml
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Krzysztof Wilczyński <kwilczynski@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=844271
  Lore link: https://lore.kernel.org/r/20240413151617.35630-1-krzysztof.kozlowski@linaro.org
    Patches: [v3,1/4] dt-bindings: PCI: cdns,cdns-pcie-host: drop redundant msi-parent and pci-bus.yaml
             [v3,2/4] dt-bindings: PCI: mediatek,mt7621: add missing child node reg
             [v3,3/4] dt-bindings: PCI: host-bridges: switch from deprecated pci-bus.yaml
             [v3,4/4] dt-bindings: PCI: mediatek,mt7621-pcie: switch from deprecated pci-bus.yaml

Patch: i2c: remove printout on handled timeouts
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Andi Shyti <andi.shyti@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=843199
  Lore link: https://lore.kernel.org/r/20240410112418.6400-20-wsa+renesas@sang-engineering.com

Patch: drm: tilcdc: don't use devm_pinctrl_get_select_default() in probe
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=786523
  Lore link: https://lore.kernel.org/r/20230922073714.6164-1-wsa+renesas@sang-engineering.com

Patch: pinctrl: renesas: rzg2l: Limit 2.5V power supply to Ethernet interfaces
  Submitter: Paul Barker <paul.barker.ct@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=845412
  Lore link: https://lore.kernel.org/r/20240417114132.6605-1-paul.barker.ct@bp.renesas.com

Patch: media: i2c: max9271: Add header include guards to max9271.h
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=602287
  Lore link: https://lore.kernel.org/r/20220102224803.27463-1-laurent.pinchart+renesas@ideasonboard.com

Patch: [GIT,PULL] Renesas DTS updates for v6.10 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=848113
  Lore link: https://lore.kernel.org/r/cover.1714116737.git.geert+renesas@glider.be

Patch: media: i2c: rdacm20: Fix indentation in comment
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=602226
  Lore link: https://lore.kernel.org/r/20220101173540.9090-1-laurent.pinchart+renesas@ideasonboard.com

Series: Renesas SoC updates for v6.10
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=843991
  Lore link: https://lore.kernel.org/r/cover.1712915528.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.10
             [GIT,PULL,2/4] Renesas driver updates for v6.10
             [GIT,PULL,3/4] Renesas DT binding updates for v6.10
             [GIT,PULL,4/4] Renesas DTS updates for v6.10

Series: pinctrl: renesas: r8a779h0: Add INTC-EX support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=845118
  Lore link: https://lore.kernel.org/r/cover.1713282028.git.geert+renesas@glider.be
    Patches: [1/2] pinctrl: renesas: r8a779h0: Fix IRQ suffixes
             [2/2] pinctrl: renesas: r8a779h0: Add INTC-EX pins, groups, and function

Series: Convert Tasklets to BH Workqueues
  Submitter: Allen Pais <apais@linux.microsoft.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=838943
  Lore link: https://lore.kernel.org/r/20240327160314.9982-1-apais@linux.microsoft.com
    Patches: [1/9] hyperv: Convert from tasklet to BH workqueue
             [5/9] mailbox: Convert from tasklet to BH workqueue

Patch: [net-next] net: dsa: rzn1_a5psw: provide own phylink MAC operations
  Submitter: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=844999
  Lore link: https://lore.kernel.org/r/E1rwfuJ-00753D-6d@rmk-PC.armlinux.org.uk

Patch: media: rcar-vin: work around -Wenum-compare-conditional warning
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=837370
  Lore link: https://lore.kernel.org/r/20240322133353.908957-1-arnd@kernel.org

Patch: clk: renesas: r9a07g043: Add clock and reset entry for PLIC
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=841208
  Lore link: https://lore.kernel.org/r/20240403200952.633084-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: dt-bindings: mfd: Use full path to other schemas
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Lee Jones <lee@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=850147
  Lore link: https://lore.kernel.org/r/20240503072116.12430-1-krzysztof.kozlowski@linaro.org


Total patches: 34

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



