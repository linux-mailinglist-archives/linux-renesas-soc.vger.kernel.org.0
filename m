Return-Path: <linux-renesas-soc+bounces-543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2BD801AA7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Dec 2023 05:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EF20B20D2E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Dec 2023 04:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95198F7D;
	Sat,  2 Dec 2023 04:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvNYn0gi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52F1BE67;
	Sat,  2 Dec 2023 04:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40B38C433CB;
	Sat,  2 Dec 2023 04:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701491425;
	bh=PoWIqTH0mN0BrOjN4NLWRNHF3E0J9dWWpted9GPFRUA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZvNYn0giq7DMnwjgNSKhirQCJUmEzOe9bhVkB1dyQiyBi+fH/a938arbitJtLpLt/
	 au/6g0KM74GNWdo5LISxwz4wNbTDJ72Dbae4jKH2HkZaK1sMYNiMpZl/6jSQDD7e5o
	 V+85zQCUqUEkL/22yohcavSeWf12pfQJqsbh4u6JAdaYA0hSJlgGL7Lu3ld/RQTymA
	 u5Xd49XPhsDlmpj10QXqij3I1duC7m+QzqWkpYPc9T9qDJfXll+jtKCMGmXgo8MV/t
	 /Zg6tiPFGuesqk5Fb4yd/3sD3UlNpwVrdiaRDwd7HDbbsHU/ktNUEOlbsoV+/pnjDg
	 sdTFu+9Wn67UQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 29448C73FEA;
	Sat,  2 Dec 2023 04:30:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next] net: ethernet: renesas: rcar_gen4_ptp: Depend on
 PTP_1588_CLOCK
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170149142516.10970.16359351222269905219.git-patchwork-notify@kernel.org>
Date: Sat, 02 Dec 2023 04:30:25 +0000
References: <20231129111142.3322667-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20231129111142.3322667-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, arnd@arndb.de

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 29 Nov 2023 12:11:42 +0100 you wrote:
> When breaking out the Gen4 gPTP support to its own module the dependency
> on the PTP_1588_CLOCK framework was left as optional and only stated for
> the driver using the module. This leads to issues when doing
> COMPILE_TEST of RENESAS_GEN4_PTP separately and PTP_1588_CLOCK is built
> as a module and the other as a built-in. Add an explicit depend on
> PTP_1588_CLOCK.
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: renesas: rcar_gen4_ptp: Depend on PTP_1588_CLOCK
    https://git.kernel.org/netdev/net-next/c/078e07570359

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



