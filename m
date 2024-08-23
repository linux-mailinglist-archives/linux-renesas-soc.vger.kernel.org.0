Return-Path: <linux-renesas-soc+bounces-8172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2932795CE8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 16:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B1221C20B9C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 14:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B5818453E;
	Fri, 23 Aug 2024 14:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCplXdrb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA191DA5E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2024 14:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724421638; cv=none; b=FdOMCnWO1JPeZ4ioGnQh4Ujr1OqNkUAxkhm2xqnsDXIl2GhEj+gorrd6eRJHOeFT9wgl1UJIMBFV31QQTB7/xNoDC8qozD97qFybZhOgGqH9hEPeZ2/uPCd7Rpotuj9N8DYwQP3N6lCOqN8RWaw49i/qXp/jMaj7omn8O9FyHgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724421638; c=relaxed/simple;
	bh=y/UyQS05ed/ZY5oB2J59WiygdpRfpEJRVO5/qIl+NIU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=YL632ieZwgr6m6vNhDWhN1Xb2F0g7sRNLTymxjhgap1blA4lbN4LbW2SsRGbqmI33UksEHK9ZtYIRrBMZtHy9KgiCWhQ7hjUAcWh/Xt9zdssBO/NooQYhyKk+qBjUuE88mg7QNopHx6n5P2q7tK9e6SFumKepufMVynjD5h5SkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCplXdrb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D918BC32786
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2024 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724421637;
	bh=y/UyQS05ed/ZY5oB2J59WiygdpRfpEJRVO5/qIl+NIU=;
	h=Subject:From:Date:To:From;
	b=cCplXdrbOYrtKFoXl/q0dd5IgYiCroM9t6ii5fEcEes+udQ44srVH3CMYKCklQCso
	 uYbcrS1OyRlg2vDjLNhsNxE5UvTmfJ8fRHTe403fUM2bhBhmViSPe6ueq1gMfcPZ4v
	 Yn7/6EBlZKoVkEiHER8rZdsEMdEPSGBapPIxuiUoynUoe+zMN+T7soqznUnDulIn/k
	 9ze1RTc0ClKDaBPjUKLBaezgdNQa6hPTlvwBTIwg1JxSIBYF6fNycMOTiCeDOwZSxw
	 QDgN+Xk21w/oO3jeOrf4qElx2b0Mne+ZPUaSrIYCTQZ8rU2XNjx+TP+2ZUWwH1JOx9
	 6NsSFLSo+HSNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B33FB3804CB0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2024 14:00:38 +0000 (UTC)
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
 <172442163729.2974674.7573753579112331111.git-patchwork-summary@kernel.org>
Date: Fri, 23 Aug 2024 14:00:37 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: Correct GICD and GICR sizes
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=875057
  Lore link: https://lore.kernel.org/r/20240730122436.350013-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/4] arm64: dts: renesas: r9a08g045: Correct GICD and GICR sizes
             [v2,2/4] arm64: dts: renesas: r9a07g043u: Correct GICD and GICR sizes
             [v2,3/4] arm64: dts: renesas: r9a07g054: Correct GICD and GICR sizes
             [v2,4/4] arm64: dts: renesas: r9a07g044: Correct GICD and GICR sizes

Series: arm64: dts: renesas: r8a779g0: add PCIe support
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=881932
  Lore link: https://lore.kernel.org/r/20240822004454.1087582-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [v3,1/2] arm64: dts: renesas: r8a779g0: Add PCIe Host and Endpoint nodes
             [v3,2/2] arm64: dts: renesas: white-hawk-cpu-common: Enable PCIe Host ch0

Series: arm64: dts: renesas: Add TSN support for V4H
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=867171
  Lore link: https://lore.kernel.org/r/20240701145012.2342868-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v2,1/2] arm64: dts: renesas: r8a779g0: R-Car Ethernet TSN support
             [v2,2/2] arm64: dts: renesas: white-hawk-single: Wire-up Ethernet TSN

Series: Add RZ/G2UL {fcpvd, vspd} device nodes
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=876715
  Lore link: https://lore.kernel.org/r/20240805131709.101679-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/2] arm64: dts: renesas: r9a07g043u: Add fcpvd node
             [v3,2/2] arm64: dts: renesas: r9a07g043u: Add vspd node

Series: i2c: riic: Add support for Renesas RZ/G3S
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=881284
  Lore link: https://lore.kernel.org/r/20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v5,01/11] i2c: riic: Use temporary variable for struct device
             [v5,09/11] arm64: dts: renesas: r9a08g045: Add I2C nodes
             [v5,10/11] arm64: dts: renesas: rzg3s-smarc: Enable i2c0 node
             [v5,11/11] arm64: dts: renesas: rzg3s-smarc-som: Enable i2c1 node

Patch: arm64: dts: renesas: r9a07g0{43,44,54}: Move regulator-vbus device node
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=871393
  Lore link: https://lore.kernel.org/r/20240715140705.334183-1-biju.das.jz@bp.renesas.com

Series: Add support for RZ/G2UL Display Unit
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=882260
  Lore link: https://lore.kernel.org/r/20240822162320.5084-1-biju.das.jz@bp.renesas.com
    Patches: [v4,1/4] dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings
             [v4,3/4] arm64: dts: renesas: r9a07g043u: Add DU node


Total patches: 17

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



