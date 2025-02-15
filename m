Return-Path: <linux-renesas-soc+bounces-13182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 009F5A36ACA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Feb 2025 02:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E4FE16FFB0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Feb 2025 01:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A901519B7;
	Sat, 15 Feb 2025 01:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gn57QJf4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C09B15198B;
	Sat, 15 Feb 2025 01:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739582409; cv=none; b=IBvi+ZpOjjCXchhpooHMwUPGC9Wz4Sw94WpCPSjqHTQs17Ji1jJ4ctoyAgYh1tTxYNCA2TJAwaginwSfMVo2NKJ3Y6LKUx6EpmqI1LcaBSb+Uxl1fFrjNi/0OZnAHnfWRBPz+k1woq57c9tBrI24gabVrl1yMTrf5cC3Vi2uITs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739582409; c=relaxed/simple;
	bh=MTMnbHfP7UmJ4+8AVRrDwbtZaMSAaGd1tx0ryrdVYM4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sWWWmABt6pjLoQ8OxePYwbkjTPeYvwpPGalBj7bhOxwzkdujATiqajCpyHsoYBmZfdrpPBT+O7yF0mYmpXwx2XAr9h7sMeeKsU13yg3QI1gdThV4u9Br9e3fb913RzzGtV5RICkaZmb/ST///y49WQZKjPpT8Alc2FQ1dJAC2cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gn57QJf4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38A9C4CEE7;
	Sat, 15 Feb 2025 01:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739582408;
	bh=MTMnbHfP7UmJ4+8AVRrDwbtZaMSAaGd1tx0ryrdVYM4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gn57QJf422/GzkD0zjSqMIEpc4JDO1lQpobI8GAIgmrRFp5XifgxlxOwF67fd4n0D
	 pXSTdIQX3RwAZNc4l2uCkXKFrqa+YMo1qVrzC/CrJNDbuKNBPxurYtYcqT86GTjh7J
	 uOuA8QEpBWjMgUWcWYhk6efsdhHMGmUXehZvN/RHGzDca42LR679s6TooPGQB5+E9V
	 G9IDDsQ4Yj40ibLuJVktPoVuuG4d0FJM7ctkOBjOFkYBPXZr9o0nWEU+qftHecf2hw
	 xCIDVB4CiJlOyb+huCG/UvI9/8W5w5NaJNkRT2A31HPnyZ9buOBNNpZv9eKmYi4h/g
	 K9QHtqMFX8DAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E39380CEE8;
	Sat, 15 Feb 2025 01:20:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: remove phylink_pcs .neg_mode boolean
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173958243825.2159741.12525730465881025727.git-patchwork-notify@kernel.org>
Date: Sat, 15 Feb 2025 01:20:38 +0000
References: <E1tidPn-0040hd-2R@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tidPn-0040hd-2R@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, florian.fainelli@broadcom.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, chester.a.unal@arinc9.com, daniel@makrotopia.org,
 dqfext@gmail.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, nicolas.ferre@microchip.com,
 claudiu.beznea@tuxon.dev, madalin.bucur@nxp.com, sean.anderson@seco.com,
 marcin.s.wojtas@gmail.com, taras.chornyi@plvision.eu, alexanderduyck@fb.com,
 kernel-team@meta.com, horatiu.vultur@microchip.com,
 UNGLinuxDriver@microchip.com, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, radhey.shyam.pandey@amd.com,
 michal.simek@amd.com, ioana.ciornei@nxp.com, lynxis@fe80.eu,
 clement.leger@bootlin.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 13 Feb 2025 17:54:19 +0000 you wrote:
> As all PCS are using the neg_mode parameter rather than the legacy
> an_mode, remove the ability to use the legacy an_mode. We remove the
> tests in the phylink code, unconditionally passing the PCS neg_mode
> parameter to PCS methods, and remove setting the flag from drivers.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: remove phylink_pcs .neg_mode boolean
    https://git.kernel.org/netdev/net-next/c/de38503b74e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



