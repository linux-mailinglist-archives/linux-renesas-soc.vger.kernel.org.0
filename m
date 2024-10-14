Return-Path: <linux-renesas-soc+bounces-9719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEE999C5B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 11:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4E0E1C22AFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 09:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713EC15666B;
	Mon, 14 Oct 2024 09:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tfUKEJAd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0F915625A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Oct 2024 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898249; cv=none; b=Q7bh+eIANE+5Zatc+MGAzDQS/fz0Q5fDzl2k/iQ0NaW00ZiA5KysYQovoibJmvULLwHvogHtnFszD+LEzn51VrYPSi1nEmqibk5UGiI6XhWCg38kHEOEe4EBX+NKM6uLvw/EsO04yRxzbSUW792aPG2TLCsNGJwdIIY1cgQjSO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898249; c=relaxed/simple;
	bh=zJnYn03YBA+VfytdraXMhMPg3fiYlpZwB6O1kOEyFec=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=DRWqh12wzNhVbf8dvBNEaFF82X12Q3qcbdVn6T92wWvj/m1o57Ebr5SszMokt5pEtASPAXqYU7/rlv5cT/Z7LPp0OiVhVrcboiBbbB2+oI8Vbi7VuK7l8uTwY/0e7BRhi3CvcA6q9YKPeJj3nyjXKqZWHeN1Ilsjqjt3QIGlXLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tfUKEJAd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDC2C4CEC3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Oct 2024 09:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728898248;
	bh=zJnYn03YBA+VfytdraXMhMPg3fiYlpZwB6O1kOEyFec=;
	h=Subject:From:Date:To:From;
	b=tfUKEJAdwAc4LP3L+dFzsC74vQTxjidFiFn7dkoq8eTf+lEYnnCDS1/kmBAKxt89E
	 1oS9QyMLfpZsyhZyf4CdkfOpznOvPm1YAPgoyqd6Uj8dt974u53xnEGV7gFsIookvN
	 4okAsdPlxk/h0XDLdxrIgbFonEvU9c6p148uauVpFeo8zQ2yoNPt+cZr4oXL0Ef14e
	 jchvsKOTIkJg3QN+mcvQnOHEFCxreqxYHGAXXi4xwdJMfh1Jrml106sJdzquJbZLmI
	 FoJMwIpfsCEzjkjXL+4wanzNOSdRS+r88Yk2ogWEVgoOS2VFTRulfpsB8goblJQz1O
	 XilN/8RMNkKXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EFBF83809A8A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Oct 2024 09:30:54 +0000 (UTC)
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
 <172889825347.443411.12068647645622320944.git-patchwork-summary@kernel.org>
Date: Mon, 14 Oct 2024 09:30:53 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: renesas: dts: Use interrupts-extended
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=895580
  Lore link: https://lore.kernel.org/r/cover.1728045620.git.geert+renesas@glider.be
    Patches: [01/20] ARM: dts: renesas: Use interrupts-extended for Ethernet MACs
             [02/20] ARM: dts: renesas: Use interrupts-extended for Ethernet PHYs
             [03/20] ARM: dts: renesas: Use interrupts-extended for HDMI bridges
             [04/20] ARM: dts: renesas: Use interrupts-extended for PMICs
             [05/20] ARM: dts: renesas: Use interrupts-extended for touchpanels
             [06/20] ARM: dts: renesas: Use interrupts-extended for video decoders
             [07/20] ARM: dts: renesas: iwg22d-sodimm: Use interrupts-extended for port expander
             [08/20] ARM: dts: renesas: r8a7742-iwg21m: Use interrupts-extended for RTC
             [09/20] ARM: dts: renesas: kzm9g: Use interrupts-extended for I/O expander
             [10/20] ARM: dts: renesas: kzm9g: Use interrupts-extended for sensors
             [11/20] arm64: dts: renesas: Use interrupts-extended for DisplayPort bridges
             [12/20] arm64: dts: renesas: Use interrupts-extended for Ethernet PHYs
             [13/20] arm64: dts: renesas: Use interrupts-extended for HDMI bridges
             [14/20] arm64: dts: renesas: Use interrupts-extended for I/O expanders
             [15/20] arm64: dts: renesas: Use interrupts-extended for PMICs
             [16/20] arm64: dts: renesas: Use interrupts-extended for USB muxes
             [17/20] arm64: dts: renesas: Use interrupts-extended for video decoders
             [18/20] arm64: dts: renesas: Use interrupts-extended for WLAN
             [19/20] arm64: dts: renesas: beacon-renesom: Use interrupts-extended for touchscreen
             [20/20] arm64: dts: renesas: rzg3s-smarc: Use interrupts-extended for gpio-keys

Patch: [v2,LOCAL/RFC] riscv: defconfig: Add rzfive_defconfig
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=898127
  Lore link: https://lore.kernel.org/r/9cdb288f9c800c34e42402de7dd64ed384b98213.1728634797.git.geert+renesas@glider.be


Total patches: 21

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



