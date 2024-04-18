Return-Path: <linux-renesas-soc+bounces-4695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E721A8A90D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Apr 2024 03:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AA73B225ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Apr 2024 01:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1904EB2B;
	Thu, 18 Apr 2024 01:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHPohald"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31D44EB45;
	Thu, 18 Apr 2024 01:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713404428; cv=none; b=FV9sW33dinJNpATm4GNuRF1sFT2M+sjGXYgjKJfC98p/+B2j2eaLX2SRf/r2Wtiqz7m6ZfSr8Y3riY9pxjw5meRScp5sQDLzLMUg/UWhMwP9rL13WAdmE282ed0i8e4JFRMEqzpaFUXSWzgYAGlHJduj714QAzem1oXemujfJAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713404428; c=relaxed/simple;
	bh=FypjU3Cv9Xbkes0N0jwShTnlpibEfiXMY7aFZo2oBQw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NWktEHvas5hTe4n6v6GdxtnMMETAV0e/xK2/AzddhHXgAH4Cr5K0cLSILdvybM0DLvsV9JY/dyW3doKyuOEKY5ncA3hM3BqW7MSjnRKWSCKM9PFL6wNRRRYIP5sGSh6wJ8WBikzEc2CH1OkYv+MAKa3S9q1R5N0bVhkpRIzAOek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHPohald; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C321C4AF0E;
	Thu, 18 Apr 2024 01:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713404428;
	bh=FypjU3Cv9Xbkes0N0jwShTnlpibEfiXMY7aFZo2oBQw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FHPohald5fY4ULFcXvQ9RYKcSK1zk3XFCNL4argR/vFjiVU25mYbcOfrI03hG1ULs
	 WkgnF/ZMumF0RUpHoFjDYbqpvWEG8doI9qbYh5jfT4EbdfSuZFpmoAJwP02xgloMGK
	 hhBVMqTTpAjT2hXoTNEJ+cL1lNurfDkP5+3llpmM7IqtPn4mgDxrN0kLpqdUzf4m7b
	 HspSVVfCpLwCuMgbbgHwkiJzmOexlsDt+zfOdGGN+zjEizgDoQW5zcs1hksTC3h264
	 oua7/Qa5ArmzPEthpmviHPP1ucRiss4eqBItdqDrQA1ysk+B8pNGQ2rCbmPpW1NWVy
	 wgMEjcUmHrltQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 390BFC43638;
	Thu, 18 Apr 2024 01:40:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: dsa: rzn1_a5psw: provide own phylink MAC
 operations
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171340442822.27861.17034756086086126855.git-patchwork-notify@kernel.org>
Date: Thu, 18 Apr 2024 01:40:28 +0000
References: <E1rwfuJ-00753D-6d@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1rwfuJ-00753D-6d@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, olteanv@gmail.com, clement.leger@bootlin.com,
 f.fainelli@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 16 Apr 2024 11:19:19 +0100 you wrote:
> Convert rzn1_a5psw to provide its own phylink MAC operations, thus
> avoiding the shim layer in DSA's port.c. We need to provide a stub for
> the mac_config() method which is mandatory.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/dsa/rzn1_a5psw.c | 47 ++++++++++++++++++++++++------------
>  1 file changed, 31 insertions(+), 16 deletions(-)

Here is the summary with links:
  - [net-next] net: dsa: rzn1_a5psw: provide own phylink MAC operations
    https://git.kernel.org/netdev/net-next/c/a3c363df0ad2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



