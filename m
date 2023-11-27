Return-Path: <linux-renesas-soc+bounces-284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 047327FA05E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 14:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B28AA280401
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 13:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6472CCBB;
	Mon, 27 Nov 2023 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/MYFV2C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5721DFD5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 13:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E190C433C8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 13:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701090647;
	bh=Yc7s/WfXaKA/UP9JmjPm4eMGaq6zUNufz5BZe/xwIdY=;
	h=Subject:From:Date:To:From;
	b=C/MYFV2C8aPTs4Vzored4jVNv/q1hL1sPDqHEbWXInYfAjldu1iXyf2XBdS6wp8cM
	 4PRXBly0ew6BcbSUCtWvFLZxNWlI9wl1FpFxIYwx1kEvsxm/CresLkSAyN5JuDDrby
	 AaIiLPxYgehVCQ8NzeIgrQRKb3YtPBYws4/T4I4P6KO+4rG8U9r1xEYaxZyTgDlH8f
	 qQYWgQcK2e4+r7L6DImT7PRqkGMhmKIk/OBWD4xDk+Yp1TeMqDGUivyStNBcMWTyZq
	 NDPFWico/Y5py/bj/xkLeQ2W1XGj+TxDNkIMeK7p5XMAByvrwGDoV7CzuNctdtZ9hv
	 1EKF3wzf9nB5g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6309DE1F66D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 13:10:47 +0000 (UTC)
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
 <170109064733.29074.5472266324427460026.git-patchwork-summary@kernel.org>
Date: Mon, 27 Nov 2023 13:10:47 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: ARM: shmobile: defconfig: Refresh for v6.7-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=803343
  Lore link: https://lore.kernel.org/r/b9bdb0fe3635a7eb51a7eca9a06e8146d6ad82db.1700667824.git.geert+renesas@glider.be

Series: ARM: dts: renesas: r8a7740/armadillo800eva: Add LCD support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=803353
  Lore link: https://lore.kernel.org/r/cover.1700669207.git.geert+renesas@glider.be
    Patches: [v2,1/3] ARM: shmobile: defconfig: Switch to DRM_SHMOBILE
             [v2,2/3] ARM: dts: renesas: r8a7740: Add LCDC nodes
             [v2,3/3] ARM: dts: renesas: armadillo800eva: Add LCD panel

Series: renesas: rzg3s: Add support for Ethernet
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=802368
  Lore link: https://lore.kernel.org/r/20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [01/14] clk: renesas: rzg2l-cpg: Reuse code in rzg2l_cpg_reset()
             [14/14] arm: multi_v7_defconfig: Enable CONFIG_RAVB

Patch: [PATCH/LOCAL,v2] arm64: renesas: defconfig: Refresh for v6.7-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=803620
  Lore link: https://lore.kernel.org/r/f690f4ab553305df9ff738e5f00db80532ff4f46.1700731806.git.geert+renesas@glider.be

Series: arm64: dts: renesas: draak: Make HDMI default video source
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=795436
  Lore link: https://lore.kernel.org/r/20231022181910.898040-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v2,1/2] arm64: dts: renesas: draak: Make HDMI the default video input
             [v2,2/2] arm64: dts: renesas: draak: Move HDMI bus properties to correct node

Patch: arm64: defconfig: Enable Renesas versa3 clock generator config
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=778889
  Lore link: https://lore.kernel.org/r/20230824083006.88944-1-biju.das.jz@bp.renesas.com


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



