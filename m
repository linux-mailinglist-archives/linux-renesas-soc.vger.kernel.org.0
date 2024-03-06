Return-Path: <linux-renesas-soc+bounces-3513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 794EA87359B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 12:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 198B01F22F68
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 11:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFD17F7ED;
	Wed,  6 Mar 2024 11:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooRVI+Q5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0AB60B91;
	Wed,  6 Mar 2024 11:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709724634; cv=none; b=SKUlPXu3QwUawXVqLoJQ+JtD1MiGgDd4eJ+I6l9RV0TsXiTYeGpTR8at6CjHEpTqn6gsn8oacUM9w2YyJSM2O2rsnnM74U5CI8T9JV7hdnWaJ8Bq4Vj+AwqRVaQGQ/IpUb0362//F+JJy4dNvKwllT1N7dC8l+6umoG3zjNtvIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709724634; c=relaxed/simple;
	bh=4plpbTtIVx3Ts7FtdZwPPw5fpsv/7WDrVYESNPlWxj0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=V2JejOVw/XdDoPK0lj05beME2I0He/MPo9ZQXmDmUOlsCBtIfdusbHjvBJD2b9tTw+ji097C7O0+s8egzja61IaSU9SVo0qqnFEKiuZTctIZ2k9FjGCK6Msl5upTvkJVN6IUA75HtGtWB+xVzYULklPYxk49RbHrqTTYX5O8oU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooRVI+Q5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BCBAC43394;
	Wed,  6 Mar 2024 11:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709724634;
	bh=4plpbTtIVx3Ts7FtdZwPPw5fpsv/7WDrVYESNPlWxj0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ooRVI+Q5Fe232sYc0V4dBK9EFaus+iyMiDl8BqY6VBBmKsMJeQP/eZYVgucZg1KKx
	 YMRDIOmYcYjSdKYY/UOsrndgotA5xD+evQ3Zjwu+P9AzspbQY14o1faDe95B9OBfj1
	 C2mt86LwqjBzGfug/2hi+ZgwINrNZvntdTh09P86t6nq1DdTjl3jTfHuhBCsb7YflT
	 MTvQB9cS/w6TZHJTO9njSlZxuhoVCE1gS0UDXthit7HNSqeV7mqMUT7Z8zSBWmJI9a
	 NAzrNVvBMhG9mixeV20UcK51JgwX2ta6bU3oCVvaYLT3mFeM9SYwAeluuDzAB8pA8r
	 vS3dJFKYuMQmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 72451D88F81;
	Wed,  6 Mar 2024 11:30:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next,v3 0/6] ravb: Align Rx descriptor setup and maintenance
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170972463446.20219.15728780718001738211.git-patchwork-notify@kernel.org>
Date: Wed, 06 Mar 2024 11:30:34 +0000
References: <20240304110858.117100-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240304110858.117100-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, biju.das.jz@bp.renesas.com,
 claudiu.beznea.uj@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon,  4 Mar 2024 12:08:52 +0100 you wrote:
> Hello,
> 
> When RZ/G2L support was added the Rx code path was split in two, one to
> support R-Car and one to support RZ/G2L. One reason for this is that
> R-Car uses the extended Rx descriptor format, while RZ/G2L uses the
> normal descriptor format.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/6] ravb: Group descriptor types used in Rx ring
    https://git.kernel.org/netdev/net-next/c/4123c3fbf863
  - [net-next,v3,2/6] ravb: Make it clear the information relates to maximum frame size
    https://git.kernel.org/netdev/net-next/c/e82700b8662c
  - [net-next,v3,3/6] ravb: Create helper to allocate skb and align it
    https://git.kernel.org/netdev/net-next/c/cfbad64706c1
  - [net-next,v3,4/6] ravb: Use the max frame size from hardware info for RZ/G2L
    https://git.kernel.org/netdev/net-next/c/496863388136
  - [net-next,v3,5/6] ravb: Move maximum Rx descriptor data usage to info struct
    https://git.kernel.org/netdev/net-next/c/555419b2259b
  - [net-next,v3,6/6] ravb: Unify Rx ring maintenance code paths
    https://git.kernel.org/netdev/net-next/c/644d037b2c44

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



