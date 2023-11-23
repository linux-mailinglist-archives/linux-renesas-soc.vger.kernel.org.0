Return-Path: <linux-renesas-soc+bounces-173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C48E67F5D70
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 12:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AB651C20B64
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 11:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C39822EF7;
	Thu, 23 Nov 2023 11:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tljlidVv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1D022EE7;
	Thu, 23 Nov 2023 11:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5EB5C433C7;
	Thu, 23 Nov 2023 11:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700737824;
	bh=OFh6cOOLb8LLtFm5PuV1Wm6e/CoyEQczZ8jI3qPkLmw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tljlidVvYB0khypDT2rYH5AaGw4uN4q/MI23T7Xi5laqwlWG/O6lu7w4rYXYgA1Ji
	 OyupAjJ9yV9aoGVe5osVWLYfuDLwtAYx+j2ttQsbV8OoQWVYEqvflXVTynV1g9CVp+
	 K/mqU/zdEb0z1y9iaXfvmvMe9lUNW0pjEcq+ugnx1taiaynq4ckyFkToFkRnlRhgbU
	 33l1fScKv8SisrdQO/0L7mIckeeED2UjP29RZAqaIofHZZMOcrhhwZiM7SwL2y7uzd
	 8qVXuRR/WfmQQhcT4g0nfIJgicFCxMSiqgwF73TtLLg3U/DSj3qO2ubR1FALqZo3mA
	 Nj5jrtX7mxz/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AC764C3959E;
	Thu, 23 Nov 2023 11:10:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next v3 0/5] net: ethernet: renesas: rcar_gen4_ptp: Add V4H
 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170073782470.401.3343558436830393692.git-patchwork-notify@kernel.org>
Date: Thu, 23 Nov 2023 11:10:24 +0000
References: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 21 Nov 2023 16:53:01 +0100 you wrote:
> Hello,
> 
> This small series prepares the rcar_gen4_ptp to be useable both on both
> R-Car S4 and V4H. The only in-tree driver that make use of this is
> rswtich on S4. A new Ethernet (R-Car Ethernet TSN) driver for V4H is on
> it's way that also will make use of rcar_gen4_ptp functionality.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/5] net: ethernet: renesas: rcar_gen4_ptp: Remove incorrect comment
    https://git.kernel.org/netdev/net-next/c/d73dcff9eb0d
  - [net-next,v3,2/5] net: ethernet: renesas: rcar_gen4_ptp: Fail on unknown register layout
    https://git.kernel.org/netdev/net-next/c/9f3995707e35
  - [net-next,v3,3/5] net: ethernet: renesas: rcar_gen4_ptp: Prepare for shared register layout
    https://git.kernel.org/netdev/net-next/c/46c361a04635
  - [net-next,v3,4/5] net: ethernet: renesas: rcar_gen4_ptp: Get clock increment from clock rate
    https://git.kernel.org/netdev/net-next/c/be5f81d37f79
  - [net-next,v3,5/5] net: ethernet: renesas: rcar_gen4_ptp: Break out to module
    https://git.kernel.org/netdev/net-next/c/8c1c66235e03

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



