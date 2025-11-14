Return-Path: <linux-renesas-soc+bounces-24608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C7CC5AF75
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 03:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 629314E5920
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 02:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87001A26B;
	Fri, 14 Nov 2025 02:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ao/9NrpN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB59435CBBC;
	Fri, 14 Nov 2025 02:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763085643; cv=none; b=aPU08HupuDsrxmbvctAZL5iyCHcoR2d9C6HfMjG3wGQtgj5agCg6EEkDh6gs/TXgd6200E8n6e7d92ralbIxbBj4Dme8F5rT03/BmjGYx7D+i/VKs2UdGwcyqQC9t+B7sycGpYq4K0QYkitpVIgn5jPVM83gnE99FrSBV+uuGYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763085643; c=relaxed/simple;
	bh=hgLeirv24sSKgLUQUIUCllXdjV3fWHMNoHK00Xj9qsw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OEJGhpb2yq+QtwL0q4zK/c1w4NQBZ01JkWQVINGKiPye8YqXtCpFhEcaVZiOjo2qI3+zwiZ+SBDYEuR58Pg1jRqkUnum2n28zDeAgBKiGMKF7WrBU9HxGSza+gU5nwJnG+gawOsZla0K65LS0X9x2SskKvANBN1Yv4kQU2KAZVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ao/9NrpN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F7CC4CEF7;
	Fri, 14 Nov 2025 02:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763085643;
	bh=hgLeirv24sSKgLUQUIUCllXdjV3fWHMNoHK00Xj9qsw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ao/9NrpNTFLdUthL00PkrQ1mT1qpRaMaxUMHEUbQHfpCKCvGvSm2gB294X9jh4ZG/
	 XytI/eVZx98dhCIyJ4IrKKXYMBN4o3z4kDarUQcaHP+kBuI70ZxJm0IqYidQlfucKz
	 NsMmTCpwgvPKifDPi+GyjkWNbaNDyzzpiHA7iU90N1BXn3gsKjflRwsu1Ifb3mmR3i
	 K5UTbJ0+NNdvwovEfV+APMd28PYE/Q/lzc8MbI2WbSnTFhDVEmIvWsjNdqM5Qx4+3K
	 ZYND7GXpA+KBHDDe/NaGUCiou2oAgWdxZzcAtI4iRj3pjFfm2TwXROHEB7dq2uVITJ
	 OtCCb0fMEF92A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EB93A55F84;
	Fri, 14 Nov 2025 02:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/4] net: phy: mscc: Add support for PHY LED
 control
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176308561226.1083043.7639792003725622974.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 02:00:12 +0000
References: <20251112135715.1017117-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: 
 <20251112135715.1017117-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad@codeaurora.org, Prabhakar <prabhakar.csengg@gmail.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horatiu.vultur@microchip.com, geert+renesas@glider.be,
 vladimir.oltean@nxp.com, vadim.fedorenko@linux.dev,
 Parthiban.Veerasooran@microchip.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 12 Nov 2025 13:57:11 +0000 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series adds support for controlling the PHY LEDs on the
> VSC85xx family of PHYs from Microsemi (now part of Renesas).
> The first two patches simplify and consolidate existing probe code
> the third patch introduces the LED control functionality.
> The LED control feature allows users to configure the LED behavior
> based on link activity, speed, and other criteria.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/4] net: phy: mscc: Simplify LED mode update using phy_modify()
    (no matching commit)
  - [net-next,v4,2/4] net: phy: mscc: Consolidate probe functions into a common helper
    https://git.kernel.org/netdev/net-next/c/217eb2d60f56
  - [net-next,v4,3/4] net: phy: mscc: Add support for PHY LED control
    https://git.kernel.org/netdev/net-next/c/eb47c5c4888d
  - [net-next,v4,4/4] net: phy: mscc: Handle devm_phy_package_join() failure in vsc85xx_probe_common()
    https://git.kernel.org/netdev/net-next/c/df397943196f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



