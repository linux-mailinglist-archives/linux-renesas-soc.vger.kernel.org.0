Return-Path: <linux-renesas-soc+bounces-25366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 362A9C937EA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 05:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C91D93A7EB2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 04:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7702822F76F;
	Sat, 29 Nov 2025 04:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ch2N2R2i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D54226D02;
	Sat, 29 Nov 2025 04:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764389608; cv=none; b=GCwI8cQWqnXDyh7W1S/7JgFN8fow+1wi4Ut0gtDDXppE6Z4mCu52qMgaqvR6yeQQTE7FlJrAPSSTCiMhdDPyW2C+HznExIJ/8M4aOStwhV9rvEMfm35wmJYcMcVzzAnYJHqCdi2c3veGb+OnZtmSKxLWRCaIq0arrvvyceHVxN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764389608; c=relaxed/simple;
	bh=jVt2VZrxSvr4OBx8ByQS9DhjVELgdDft9Gv+fjiNEMc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lCJKmT59XZNs3y0fDWlw1+yzkwuhgBsJ7crrmL72CiJ0rUgZzQiDCZ2I/HOZFv56pLNZic9rs2BjNLIgToMYf37PWEyeZIn5uiy3zQQhXqC0T25we2XzUnR79Sy+wNG1PjvNyXnjlDYL/b7hLUw4T8F7sE2TG2hkRJcQkbVMxwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ch2N2R2i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CDFC4CEF7;
	Sat, 29 Nov 2025 04:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764389607;
	bh=jVt2VZrxSvr4OBx8ByQS9DhjVELgdDft9Gv+fjiNEMc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ch2N2R2iF2KrK0IGpW2AlE2RI5VVft01ynxAybUgtLurY+YcyOXgYe4E4TyRimhz2
	 g1RAAnhPuxs2Gve0HMoMYMfUd8+rGoLIzQ7UKQvT5rLzvLLk3q9Lew4G2c3gq3Uxtf
	 PlbO37fiapVgKJvy/ThqxLPtplBjjPVwF1oHnnSNEzakoZ+wH/HG/vY9o/q5g9S9I5
	 dTWB7yt7PAFaL4bWNeWGYz57rRuXowcX8B2bxaSCKIOOTcnsCBSzNWTOQUa+mJ6QN0
	 VuLBZ9fICY5Eus3YretVQvRoyRQTt4OqLQmdrSs9GuHSZqPOUh7PBQQFSncd381ywO
	 PZKz5kyRUVqKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AA5C9380692B;
	Sat, 29 Nov 2025 04:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/15] Introduce the dsa_xmit_port_mask() tagging
 protocol helper
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176438942956.896171.5589128104353485627.git-patchwork-notify@kernel.org>
Date: Sat, 29 Nov 2025 04:10:29 +0000
References: <20251127120902.292555-1-vladimir.oltean@nxp.com>
In-Reply-To: <20251127120902.292555-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 alsi@bang-olufsen.dk, clement.leger@bootlin.com, daniel@makrotopia.org,
 mmyangfl@gmail.com, dqfext@gmail.com, florian.fainelli@broadcom.com,
 george.mccollister@gmail.com, hauke@hauke-m.de, jonas.gorski@gmail.com,
 kurt@linutronix.de, linus.walleij@linaro.org,
 linux-renesas-soc@vger.kernel.org, sean.wang@mediatek.com,
 UNGLinuxDriver@microchip.com, woojung.huh@microchip.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 27 Nov 2025 14:08:47 +0200 you wrote:
> What
> ----
> 
> Some DSA tags have just the port number in the TX header format, others
> have a bit field where in theory, multiple bits can be set, even though
> DSA only sets one.
> 
> [...]

Here is the summary with links:
  - [net-next,01/15] net: dsa: introduce the dsa_xmit_port_mask() tagging protocol helper
    https://git.kernel.org/netdev/net-next/c/6f2e1c75bc5e
  - [net-next,02/15] net: dsa: tag_brcm: use the dsa_xmit_port_mask() helper
    https://git.kernel.org/netdev/net-next/c/621d06a40e47
  - [net-next,03/15] net: dsa: tag_gswip: use the dsa_xmit_port_mask() helper
    https://git.kernel.org/netdev/net-next/c/e094428fb40c
  - [net-next,04/15] net: dsa: tag_hellcreek: use the dsa_xmit_port_mask() helper
    https://git.kernel.org/netdev/net-next/c/f59e44cc0d6c
  - [net-next,05/15] net: dsa: tag_ksz: use the dsa_xmit_port_mask() helper
    https://git.kernel.org/netdev/net-next/c/ea659a9292b1
  - [net-next,06/15] net: dsa: tag_mtk: use the dsa_xmit_port_mask() helper
    https://git.kernel.org/netdev/net-next/c/84a60bbec503
  - [net-next,07/15] net: dsa: tag_mxl_gsw1xx: use the dsa_xmit_port_mask() helper
    https://git.kernel.org/netdev/net-next/c/a4a00d9e365a
  - [net-next,08/15] net: dsa: tag_ocelot: use the dsa_xmit_port_mask() helper
    https://git.kernel.org/netdev/net-next/c/5733fe2a7ad1
  - [net-next,09/15] net: dsa: tag_qca: use the dsa_xmit_port_mask() helper
    https://git.kernel.org/netdev/net-next/c/48afabaf4aaa
  - [net-next,10/15] net: dsa: tag_rtl4_a: use the dsa_xmit_port_mask() helper
    https://git.kernel.org/netdev/net-next/c/4abf39c8aef5
  - [net-next,11/15] net: dsa: tag_rtl8_4: use the dsa_xmit_port_mask() helper
    https://git.kernel.org/netdev/net-next/c/5afe4ccc33f4
  - [net-next,12/15] net: dsa: tag_rzn1_a5psw: use the dsa_xmit_port_mask() helper
    https://git.kernel.org/netdev/net-next/c/b33aa90e68b4
  - [net-next,13/15] net: dsa: tag_trailer: use the dsa_xmit_port_mask() helper
    https://git.kernel.org/netdev/net-next/c/3c1975bbdf92
  - [net-next,14/15] net: dsa: tag_xrs700x: use the dsa_xmit_port_mask() helper
    https://git.kernel.org/netdev/net-next/c/24099389a63f
  - [net-next,15/15] net: dsa: tag_yt921x: use the dsa_xmit_port_mask() helper
    https://git.kernel.org/netdev/net-next/c/64b0d2edb61a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



