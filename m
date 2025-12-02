Return-Path: <linux-renesas-soc+bounces-25485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEB3C99B12
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 02:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E9DED345188
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 01:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0EF42AB7;
	Tue,  2 Dec 2025 01:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFN+JuxP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CED36D50A;
	Tue,  2 Dec 2025 01:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764637405; cv=none; b=GZTJY1e8PlzynGdW/vL+5I6bSjvWruNtCCQ7jEp3K04lBwR0ka2Ga5J6kgRhKZm2wd7Yl5OZ9iVhFOTuXP7qZq1iJgdRrn2uiXaQC8MVW75ZOm/pEykvUj7oMz/sVy6pjoe4wSqPKaG3TIyaMLiSX8SbQIfw70ai06OUU6axpKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764637405; c=relaxed/simple;
	bh=Y2oJi7Xgfz6iY/Jpadn6SRhwl9o7wLyu7pJoH0HejGo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QF5aK6VTA3pfOfzZbkv7nnf8fCTMlzWas1tMgM8oheQlbGW2k8Q4HUqmgd+A04zakkTztz+2ed8E7teEU/C0ANKJC5wkcPLQdwzNZw269s5MgVFbyMlLj0TDj6GVrm8785tHdaxK8SfNMXPobVq2jyXXyvsu2NSCqpsbQt5We20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFN+JuxP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A53C4CEF1;
	Tue,  2 Dec 2025 01:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764637405;
	bh=Y2oJi7Xgfz6iY/Jpadn6SRhwl9o7wLyu7pJoH0HejGo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KFN+JuxP5jkPOpE5F0O5bmS0OFNL2V5VibFwniiu9mPJxmaFNnZ0zEli3G24AjUF1
	 42FZ7f1Sm2dQJrKIbd5UtlQCudSmjmwJWhDqIF2UlSKyQYbimfd67PfdAxNZUKcq8e
	 lV5/8foJ2+ENx2Ao5fRlMUgtw8OTxI8Wm80yHkw2WwEFzXrhRnkwlOseJna0FmU1cY
	 /pxrzsE/jmGhM/BOI4oMHP+ceVbEUP8mG5/2Uw4l+m3N5YCd+0HRPf793BtGGVMu77
	 JjIPFD+/C0nH14HLZRKj2i50bSI3vcfod49DQXeHSst/EccbrzlqspUGetmjkBIRIB
	 Zg4BTskT9EutA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B95F381196B;
	Tue,  2 Dec 2025 01:00:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/15] DSA simple HSR offload
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176463722504.2619157.15424289331686189739.git-patchwork-notify@kernel.org>
Date: Tue, 02 Dec 2025 01:00:25 +0000
References: <20251130131657.65080-1-vladimir.oltean@nxp.com>
In-Reply-To: <20251130131657.65080-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, alsi@bang-olufsen.dk,
 clement.leger@bootlin.com, chester.a.unal@arinc9.com, daniel@makrotopia.org,
 mmyangfl@gmail.com, dqfext@gmail.com, florian.fainelli@broadcom.com,
 george.mccollister@gmail.com, hauke@hauke-m.de, jonas.gorski@gmail.com,
 kurt@linutronix.de, linus.walleij@linaro.org, lukma@denx.de,
 sean.wang@mediatek.com, bigeasy@linutronix.de, woojung.huh@microchip.com,
 xiaoliang.yang_1@nxp.com, linux-renesas-soc@vger.kernel.org,
 UNGLinuxDriver@microchip.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 30 Nov 2025 15:16:42 +0200 you wrote:
> Provide a "simple" form of HSR offload for 8 DSA drivers (just the
> NETIF_F_HW_HSR_DUP feature) based on the fact that their taggers use the
> dsa_xmit_port_mask() function. This is in patches 6-13/15.
> 
> The helpers per se are introduced in patch 5/15, and documented in patch
> 15/15. Patch 14/15 is another small (and related) documentation update.
> 
> [...]

Here is the summary with links:
  - [net-next,01/15] net: dsa: mt7530: unexport mt7530_switch_ops
    https://git.kernel.org/netdev/net-next/c/3b87e60d2131
  - [net-next,02/15] net: hsr: create an API to get hsr port type
    https://git.kernel.org/netdev/net-next/c/a0244e762139
  - [net-next,03/15] net: dsa: avoid calling ds->ops->port_hsr_leave() when unoffloaded
    https://git.kernel.org/netdev/net-next/c/bed59a86e91a
  - [net-next,04/15] net: dsa: xrs700x: reject unsupported HSR configurations
    https://git.kernel.org/netdev/net-next/c/30296ac76426
  - [net-next,05/15] net: dsa: add simple HSR offload helpers
    https://git.kernel.org/netdev/net-next/c/0e75bfe340bf
  - [net-next,06/15] net: dsa: yt921x: use simple HSR offloading helpers
    https://git.kernel.org/netdev/net-next/c/42e63b1373a3
  - [net-next,07/15] net: dsa: ocelot: use simple HSR offload helpers
    https://git.kernel.org/netdev/net-next/c/4b65d445556d
  - [net-next,08/15] net: dsa: realtek: use simple HSR offload helpers
    https://git.kernel.org/netdev/net-next/c/6db31942e347
  - [net-next,09/15] net: dsa: lantiq_gswip: use simple HSR offload helpers
    https://git.kernel.org/netdev/net-next/c/b6ad21ef286a
  - [net-next,10/15] net: dsa: mv88e6060: use simple HSR offload helpers
    https://git.kernel.org/netdev/net-next/c/4af9fa2ba65a
  - [net-next,11/15] net: dsa: hellcreek: use simple HSR offload helpers
    https://git.kernel.org/netdev/net-next/c/017bcff7321a
  - [net-next,12/15] net: dsa: mt7530: use simple HSR offload helpers
    https://git.kernel.org/netdev/net-next/c/585943b7ad30
  - [net-next,13/15] net: dsa: a5psw: use simple HSR offload helpers
    https://git.kernel.org/netdev/net-next/c/7271d4a08c39
  - [net-next,14/15] Documentation: net: dsa: mention availability of RedBox
    https://git.kernel.org/netdev/net-next/c/977839161f26
  - [net-next,15/15] Documentation: net: dsa: mention simple HSR offload helpers
    https://git.kernel.org/netdev/net-next/c/4e4c00f34d5d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



