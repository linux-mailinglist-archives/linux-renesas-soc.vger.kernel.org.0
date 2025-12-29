Return-Path: <linux-renesas-soc+bounces-26149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CF5CE67AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Dec 2025 12:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C493B3009762
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Dec 2025 11:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE4B2FBDF5;
	Mon, 29 Dec 2025 11:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="paVk6Nk0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051522FA0C4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Dec 2025 11:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767006839; cv=none; b=g5sNlFUpuHiKMaxUFKQVUFPFLCbcO8ySQFI7PR+QxXaVSZJvQEQQIKO3XsnOaGU61t+nkmWCmwF0ANhPEzW54aGXm9Ezqm7qw3ju6D85qKV4wcwEiLfeNFzkoOoGKAG5Ddquv8DzBXn0KzNCZoB0rZM92f94HNn79LQEeqHMsEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767006839; c=relaxed/simple;
	bh=8/nhrJaYYycrE2yYEIBvYujjSROXTP7VQT/HoEchTgo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=T6rqCWXv1ZNXLztgqRRHUG3U7xK21FHPXXZQYYZ15QMpocdcJ0wkqw0uRYMM1pgSelXXY8CxV4Elg1lAv28qhDLXd6t6tV3E6lbj7WAjL8sgdtv4DnccTIczYYXtqXNhFX2YT/8sND2IStn673GoXcWanm+gH+6WJsMlOVLel7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=paVk6Nk0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8601C4CEF7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Dec 2025 11:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767006838;
	bh=8/nhrJaYYycrE2yYEIBvYujjSROXTP7VQT/HoEchTgo=;
	h=Subject:From:Date:To:From;
	b=paVk6Nk0Agf7LIlbW4UrxIuudLPj+jExiFttjE0qyRtB0Xg40SLQz8tG4Q5c2zQYY
	 0R/5oUeMoVxvdM+mDtT6Ezo5Iqx2M+/oYtLlxF+dBtqUZpkkEE384QT1t34oIJ16d4
	 LqBghgDM3VYxwdb6kCwVO5ZuSKiR8IhFQ2jwwP3FtO2SaCvgaDVAzRv4e2pDS9dbuz
	 /BDDngogAPOTNMSK8NHOUzRMNXqiKyFPjAfrUrQAAuXA3A16bxMMXOSHKKgCpjc5bk
	 os7KuU+c3fizVBok39g4uQ+8/6r2oQ8wBXesmszJ6hsARQ0nDsZ649lJpcQ4aSQXP1
	 aibjRKSQyUpTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7E8F23808200
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Dec 2025 11:10:42 +0000 (UTC)
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
 <176700664103.2918506.4978068191361928191.git-patchwork-summary@kernel.org>
Date: Mon, 29 Dec 2025 11:10:41 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: Add WWDT nodes
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1033043
  Lore link: https://lore.kernel.org/r/20251215034715.3406-8-wsa+renesas@sang-engineering.com
    Patches: [1/6] arm64: dts: renesas: r8a77970: Add WWDT nodes
             [2/6] arm64: dts: renesas: r8a77980: Add WWDT nodes
             [3/6] arm64: dts: renesas: r8a779a0: Add WWDT nodes
             [4/6] arm64: dts: renesas: r8a779f0: Add WWDT nodes
             [5/6] arm64: dts: renesas: r8a779g0: Add WWDT nodes
             [6/6] arm64: dts: renesas: r8a779h0: Add WWDT nodes

Patch: ARM: shmobile: defconfig: Refresh for v6.19-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1035636
  Lore link: https://lore.kernel.org/r/2dc339bee5bee0a425e2b00bbb784b0ec21a0a33.1766394793.git.geert+renesas@glider.be

Series: Add TSU support for the Renesas RZ/V2N SoC
  Submitter: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1031630
  Lore link: https://lore.kernel.org/r/20251209091115.8541-1-ovidiu.panait.rb@renesas.com
    Patches: [1/3] dt-bindings: thermal: r9a09g047-tsu: Document RZ/V2N TSU
             [3/3] arm64: dts: renesas: r9a09g056: Add TSU nodes

Series: Add DMA support for RZ/T2H and RZ/N2H
  Submitter: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1030880
  Lore link: https://lore.kernel.org/r/20251205151254.2970669-1-cosmin-gabriel.tanislav.xa@renesas.com
    Patches: [v3,1/6] dmaengine: sh: rz_dmac: make error interrupt optional
             [v3,5/6] arm64: dts: renesas: r9a09g077: add DMAC support
             [v3,6/6] arm64: dts: renesas: r9a09g087: add DMAC support

Series: arm64: dts: renesas: v3h: add SWDT node
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1033036
  Lore link: https://lore.kernel.org/r/20251215031318.2219-4-wsa+renesas@sang-engineering.com
    Patches: [1/2] arm64: dts: renesas: r8a77980: add SWDT node
             [2/2] arm64: dts: renesas: v3h: mark SWDT as reserved

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.19-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1035637
  Lore link: https://lore.kernel.org/r/b6cab5810eb468a3e57693123ed17a8afcd5eba1.1766394880.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: r9a09g057h48-kakip: Enable SPI NOR Flash
  Submitter: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1018457
  Lore link: https://lore.kernel.org/r/20251101072951.2681630-1-iwamatsu@nigauri.org


Total patches: 16

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



