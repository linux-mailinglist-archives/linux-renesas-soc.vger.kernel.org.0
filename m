Return-Path: <linux-renesas-soc+bounces-24602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B517EC59F91
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 21:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8E1D93502B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 20:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB4631B116;
	Thu, 13 Nov 2025 20:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ay/3Vaj8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB05F3195F7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 20:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763065840; cv=none; b=P5/aFMFV9bclueePm6riYpfJ36kd5ssu9+MmM5oD0p895Ynq19x0IxbCiZWzyXKshTYMhUWgiPB/UPWOat4BFBZbSVFka0VDDLQ+CZKEL45DxPJw+da87c8rL0VS7FEWaSiD3+OQ9u8lVcZAEWUzYXmWhwV4puTlB/ghPsPPDtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763065840; c=relaxed/simple;
	bh=DpwFOkuocL0in7TMqKYJ8dDDGtdiant1Vd0ZiGGD6jM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=EJadIQDLOunhfDmXEYuZAn6Fc60M2Bcq/V+X1qrDHRQNRSG82vV+y2GhuICBfdeXtW/ZM0HDGmwHQBzHbdK/WTDB8GZVjEtei3e280mwIPmh83mvjN4MTYk9hqFdgY+QtmtDLbhT04hidupYtOab2n7o+7eC85rXFRNbe9E/H3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ay/3Vaj8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF2BC19421
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 20:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763065840;
	bh=DpwFOkuocL0in7TMqKYJ8dDDGtdiant1Vd0ZiGGD6jM=;
	h=Subject:From:Date:To:From;
	b=Ay/3Vaj8bb45jcW5sQHa2n+C6j0JEIWNaqu3t9GpgYDX3PB4X4G3cbxiiSaA56rYU
	 k+btoPuRuXFwXlITjSSu9XgPW+urdJG3K3RqklewrbnBOZ93uBTlhimPvHHaFJhUop
	 upAAIshVWpiihD8/yl2FY2gVyCy2sG49zoaABnxcirZKeAGa1+VtrNK8EaOUB4YFJV
	 BnIgl6c/RMOYrBEYJIRnx5tG1NK3hr2HddxSxDgdbJNnK8LVh2W4N+pCRcRNxqbgVj
	 ZT4tMzwWf+jYfPuK1aY2DZA3xr2ntN/WFMHQg6ECgD2BQU68a4/WP/fKwhNcDkQRlK
	 YenNgw2gfYmmg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 74FA43A549BD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 20:30:10 +0000 (UTC)
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
 <176306580905.995745.1658827067168553692.git-patchwork-summary@kernel.org>
Date: Thu, 13 Nov 2025 20:30:09 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add TSU support for the Renesas RZ/V2H SoC
  Submitter: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1013613
  Lore link: https://lore.kernel.org/r/20251020143107.13974-1-ovidiu.panait.rb@renesas.com
    Patches: [v2,1/3] clk: renesas: r9a09g057: Add clock and reset entries for TSU
             [v2,3/3] arm64: dts: renesas: r9a09g057: Add TSU nodes

Series: Add RTC support for the Renesas RZ/V2H SoC
  Submitter: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1021090
  Lore link: https://lore.kernel.org/r/20251107210706.45044-1-ovidiu.panait.rb@renesas.com
    Patches: [v4,1/4] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
             [v4,3/4] arm64: dts: renesas: r9a09g057: Add RTC node
             [v4,4/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable RTC

Patch: arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add NMI pushbutton support
  Submitter: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1016307
  Lore link: https://lore.kernel.org/r/20251027140651.18367-1-ovidiu.panait.rb@renesas.com

Series: Add initial USB support for the Renesas RZ/G3S SoC
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1015037
  Lore link: https://lore.kernel.org/r/20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v8,1/7] dt-bindings: phy: renesas,usb2-phy: Mark resets as required for RZ/G3S
             [v8,6/7] arm64: dts: renesas: r9a08g045: Add USB support
             [v8,7/7] arm64: dts: renesas: rzg3s-smarc: Enable USB support

Series: soc: renesas: rz-sysc: Fixes
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1019734
  Lore link: https://lore.kernel.org/r/20251105070526.264445-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [1/2] soc: renesas: r9a09g056-sys: Populate max_register
             [2/2] soc: renesas: rz-sysc: Populate readable_reg/writeable_reg in regmap config

Patch: [v3] arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1021771
  Lore link: https://lore.kernel.org/r/20251110203926.692242-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



