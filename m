Return-Path: <linux-renesas-soc+bounces-19599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64654B0CEBF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 02:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A17E96C770B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 00:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F24146593;
	Tue, 22 Jul 2025 00:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNvVM2IL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B42A2AEFD;
	Tue, 22 Jul 2025 00:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753144208; cv=none; b=VZGM0d3IPaDQhu3x379odcmK+bVMjmTYUWDTU7HMM1V6H2BCa8hESk0rElXUrHl0JDIfP0L1I3/60pzYkBaRVL1C/HTjgFLf83Y7q+hWZcb/+MSshL+7N/mN6kEttx+m58bzOz77+8yU5dbx8FGDAGnZaeA6ilOuWSLFpnyKwgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753144208; c=relaxed/simple;
	bh=EuXF+5F3Ni9nk0OZtht9On3rD4KnpjFnW5CiFlFPJ4U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hqa3FjlFckMqaCMnhW7J6VMlRX9NGOihisqqslpHLZ8ZrmYU9Cr4P9X0sgPmik5dY1Y215KmFKHIKOm6ut0rueI5Ue9IWogtczVx5+9kNVrCpnsFxKlpu8eQiujCKHuD6wFE4WTscypIgXU+1Hj4x5KCt72dAM300paYa8A54PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNvVM2IL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B36C4CEF7;
	Tue, 22 Jul 2025 00:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753144208;
	bh=EuXF+5F3Ni9nk0OZtht9On3rD4KnpjFnW5CiFlFPJ4U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hNvVM2ILTkgT2tJhvZUztstWQeW8RdLLShELouOYs4IMW5F81FnEhAePJrVZN1iZA
	 LnRxGkRwfNx1V3F+vHpPpLbycJ52oZx4as5KD1Mq/OP2a3Mp8141w1YZdOnd6DVZsv
	 V7ml8aNpHm+5fYhrOWAfCYOCD8sVDD/1+RTYoz8DZFh9IrkYDIgCQCH65Mte84SzNq
	 LvYA3Xp8xB8zNX49Dx0UTdQhQup4aNiOkynqE5qbV7M+m/hZ8ufSOrMG6F1QJYTJjD
	 ulTMxFwpCH14Ze7CDqzNDZkRO9nxNX9K8ycX14X03wId75FQ0nHQNR6aiNoKXTLf+J
	 xYHdQ/G1KxnzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE02383B267;
	Tue, 22 Jul 2025 00:30:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175314422650.243210.16859795582435366531.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 00:30:26 +0000
References: <20250717071109.8213-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250717071109.8213-1-biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 geert+renesas@glider.be, biju.das.au@gmail.com, rmk+kernel@armlinux.org.uk

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 17 Jul 2025 08:11:06 +0100 you wrote:
> Add PM suspend/resume callbacks for RZ/G3E SMARC EVK.
> 
> The PM deep entry is executed by pressing the SLEEP button and exit from
> entry is by pressing the power button.
> 
> Logs:
> root@smarc-rzg3e:~# PM: suspend entry (deep)
> Filesystems sync: 0.115 seconds
> Freezing user space processes
> Freezing user space processes completed (elapsed 0.002 seconds)
> OOM killer disabled.
> Freezing remaining freezable tasks
> Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> printk: Suspending console(s) (use no_console_suspend to debug)
> NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
> NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
> NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
> NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
> NOTICE:  BL2: SYS_LSI_PRR: 0x0
> NOTICE:  BL2: Booting BL31
> renesas-gbeth 15c30000.ethernet end0: Link is Down
> Disabling non-boot CPUs ...
> psci: CPU3 killed (polled 0 ms)
> psci: CPU2 killed (polled 0 ms)
> psci: CPU1 killed (polled 0 ms)
> Enabling non-boot CPUs ...
> Detected VIPT I-cache on CPU1
> GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
> CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
> CPU1 is up
> Detected VIPT I-cache on CPU2
> GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
> CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
> CPU2 is up
> Detected VIPT I-cache on CPU3
> GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
> CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
> CPU3 is up
> dwmac4: Master AXI performs fixed burst length
> 15c30000.ethernet end0: No Safety Features support found
> 15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
> 15c30000.ethernet end0: configuring for phy/rgmii-id link mode
> dwmac4: Master AXI performs fixed burst length
> 15c40000.ethernet end1: No Safety Features support found
> 15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
> 15c40000.ethernet end1: configuring for phy/rgmii-id link mode
> OOM killer enabled.
> Restarting tasks: Starting
> Restarting tasks: Done
> random: crng reseeded on system resumption
> PM: suspend exit
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: dwmac-renesas-gbeth: Add PM suspend/resume callbacks
    https://git.kernel.org/netdev/net-next/c/72b4612af36f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



