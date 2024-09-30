Return-Path: <linux-renesas-soc+bounces-9187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB6D98A5E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 15:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D322B2138F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 13:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD7118D63F;
	Mon, 30 Sep 2024 13:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qBDxl7tf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1F34D9FE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Sep 2024 13:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704302; cv=none; b=snzeKVH8q2gXRQCAqjowpgF+G5yQ+do0YXUOrlZt4NcT+l70lS1HUiVFU6uwApxGZ1jnLoEZMcm21nuZKd8ydTtWVm0H/wjfA+N3BBOEwagKBkLuC+64t0/wl/Q21cq/fvj295to5zsMla6M2ipgqTjgVTffwzfktQ5lKHfzQVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704302; c=relaxed/simple;
	bh=C3LhBn6QsQM3ijgGfKGAdWQnnjHcSjsZl0YMR/eJhoQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=tDg5gbUagQzYaW3UuyNBda/O/LDd7aCjTczMSm8/uuLT7lx93lCDCdYQt6l+x/ZV6SgYG1KdXzzy3CoD/YoqjLE3HNG0j/egs4a4hgjDKPNGjZSrRfgYOCVJGzRXXqfZfumt3iqeeTOdA1pCZy7nxJ0pID4h5dkEEBY+INYm8Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qBDxl7tf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD70C4CEC7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Sep 2024 13:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704301;
	bh=C3LhBn6QsQM3ijgGfKGAdWQnnjHcSjsZl0YMR/eJhoQ=;
	h=Subject:From:Date:To:From;
	b=qBDxl7tfyQ+x87A8mex7+868umPSGoSV1Q+y7MaD09LNP/QX3h/TwhPj9QSEm3b4O
	 izhzvvGSTLw88TfDfc68maEreKZLBxotNm+IHSSkLq776+wUYqWNY7lyU1RnEJouZB
	 5sC2I4fqSAYr0v7gVmT9TDEbcZDX0hZddG05j4BanYn5/pUEwL542Bd2x07i5hlQfg
	 6qtpbhdcE8HbofYsDatJZ9o8Fglr8ra/rL5J5sp4ZzaBYq/tiUjSJqOhjDwe87H4ov
	 wmcRG2+NRzLJbj0BlN7sBv2irbwcmqf0VQp18BS1ToKo2HpK0X+K8VeAeKVK7yi47J
	 gAYjEqqPmvCfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EF73C3804CB9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Sep 2024 13:51:45 +0000 (UTC)
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
 <172770430463.3657837.9856821621204848791.git-patchwork-summary@kernel.org>
Date: Mon, 30 Sep 2024 13:51:44 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: pmdomain: core: Debug summary improvements
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=886851
  Lore link: https://lore.kernel.org/r/cover.1725459707.git.geert+renesas@glider.be
    Patches: [1/4] pmdomain: core: Harden inter-column space in debug summary
             [2/4] pmdomain: core: Fix "managed by" alignment in debug summary
             [3/4] pmdomain: core: Move mode_status_str()
             [4/4] pmdomain: core: Reduce debug summary table width

Series: PCI: qcom: Add 16.0 GT/s equalization and margining settings
  Submitter: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
  Committer: Krzysztof Wilczyński <kwilczynski@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=889416
  Lore link: https://lore.kernel.org/r/20240911-pci-qcom-gen4-stability-v7-0-743f5c1fd027@linaro.org
    Patches: [v7,1/4] PCI: dwc: Rename 'dw_pcie::link_gen' to 'dw_pcie::max_link_speed'
             [v7,2/4] PCI: dwc: Always cache the maximum link speed value in dw_pcie::max_link_speed
             [v7,3/4] PCI: qcom: Add equalization settings for 16.0 GT/s
             [v7,4/4] PCI: qcom: Add RX lane margining settings for 16.0 GT/s

Patch: [PATCH/RFC] riscv: defconfig: Disable RZ/Five peripheral support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Palmer Dabbelt <palmer@rivosinc.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=875130
  Lore link: https://lore.kernel.org/r/89ad70c7d6e8078208fecfd41dc03f6028531729.1722353710.git.geert+renesas@glider.be

Patch: media: videobuf2: Drop minimum allocation requirement of 2 buffers
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=883078
  Lore link: https://lore.kernel.org/r/20240825232449.25905-1-laurent.pinchart+renesas@ideasonboard.com

Patch: None
  Submitter: Rafael J. Wysocki <rjw@rjwysocki.net>
  Committer: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=874662
  Lore link: https://lore.kernel.org/r/2636988.Lt9SDvczpP@rjwysocki.net

Series: Fix maximum TX/RX frame sizes in ravb driver
  Submitter: Paul Barker <paul.barker.ct@bp.renesas.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=891094
  Lore link: https://lore.kernel.org/r/20240918081839.259-1-paul.barker.ct@bp.renesas.com
    Patches: [net,v3,1/2] net: ravb: Fix maximum TX frame size for GbEth devices
             [net,v3,2/2] net: ravb: Fix R-Car RX frame size limit

Patch: watchdog: rzv2h_wdt: Add missing MODULE_LICENSE tag to fix modpost error
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Wim Van Sebroeck <wim@linux-watchdog.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=889349
  Lore link: https://lore.kernel.org/r/20240911132031.544479-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: media: v4l2: Improve media link validation
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=883319
  Lore link: https://lore.kernel.org/r/20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v3,1/7] media: microchip-isc: Drop v4l2_subdev_link_validate() for video devices
             [v3,2/7] media: sun4i_csi: Implement link validate for sun4i_csi subdev
             [v3,3/7] media: sun4i_csi: Don't use v4l2_subdev_link_validate() for video device
             [v3,4/7] media: v4l2-subdev: Refactor warnings in v4l2_subdev_link_validate()
             [v3,5/7] media: v4l2-subdev: Support hybrid links in v4l2_subdev_link_validate()
             [v3,6/7] media: renesas: vsp1: Implement .link_validate() for video devices

Patch: drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=865303
  Lore link: https://lore.kernel.org/r/20240625123244.200533-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: rcar-vin: Add support for R-Car V4M
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=868526
  Lore link: https://lore.kernel.org/r/20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v5,1/6] dt-bindings: media: renesas,vin: Add Gen4 family fallback
             [v5,4/6] media: rcar-vin: Add family compatible for R-Car Gen4 family
             [v5,5/6] dt-bindings: media: renesas,vin: Add binding for V4M

Series: mtd: Use for_each_child_of_node_scoped()
  Submitter: Jinjie Ruan <ruanjinjie@huawei.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=883250
  Lore link: https://lore.kernel.org/r/20240826094328.2991664-1-ruanjinjie@huawei.com
    Patches: [-next,RESEND,01/10] mtd: rawnand: arasan: Use for_each_child_of_node_scoped()
             [-next,RESEND,08/10] mtd: rawnand: renesas: Use for_each_child_of_node_scoped()

Series: i2c: Use devm_clk_get_enabled() helpers
  Submitter: Rong Qianfeng <rongqianfeng@vivo.com>
  Committer: Andi Shyti <andi.shyti@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=883619
  Lore link: https://lore.kernel.org/r/20240827034841.4121-1-rongqianfeng@vivo.com
    Patches: [v4,1/3] i2c: emev2: Use devm_clk_get_enabled() helpers

Series: Add initial USB support for the Renesas RZ/G3S SoC
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=882233
  Lore link: https://lore.kernel.org/r/20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [01/16] clk: renesas: r9a08g045: Add clocks, resets and power domains for USB
             [12/16] phy: renesas: rcar-gen3-usb2: Add support for the RZ/G3S SoC

Series: media: Drop one user of the deprecated graph walk API
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=882343
  Lore link: https://lore.kernel.org/r/20240822212445.2037-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [1/4] media: vsp1: Build the pipeline after starting it
             [4/4] media: Documentation: mc: Replace deprecated graph walk API


Total patches: 31

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



