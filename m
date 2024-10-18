Return-Path: <linux-renesas-soc+bounces-9834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C7A9A32DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 04:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 770201C21819
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 02:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3406E13D890;
	Fri, 18 Oct 2024 02:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PyJ3Jmly"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AD6558BA;
	Fri, 18 Oct 2024 02:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729218629; cv=none; b=GPbmjIF59xCvY51bAi6/pm/GxC50hpoj13ei8ZzUylT6JK9msdOajH0vlpBcH1aF4IHrzkkenhlRIvJd1uZsl7ig5HNM8H2JX9w+g1O4gE8dHliZYMkbnDv7ITSkXZj2F5c5mOHyjIdQxpXZ7qmleD1xm+Fq3lvK+fU6yCD7EUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729218629; c=relaxed/simple;
	bh=CKe5O12E+humFBuot3Y+NbiGJaEHz5Dd8obSMaCzwqs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XR+zBHguz+ivEzrT2ktlxBWy+eL26B+W4iPoeFg3FrW6n8Kmgh285hZQ1xXmMKHvMrZ3sIH526Ee9S5h50iP070B0f0glljbNgiUb9sVPY0PMfathtkZGZmsncyZpVJDv/7Wb0Yzh/Mi2sYwFYp18vVxTodcgt1OElJWLMh1qOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PyJ3Jmly; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72097C4CECD;
	Fri, 18 Oct 2024 02:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729218628;
	bh=CKe5O12E+humFBuot3Y+NbiGJaEHz5Dd8obSMaCzwqs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PyJ3Jmly5PnCTONLmmk4tAfS+c0H+t12KYVT1b13rzVOD/fskZsic9Lpi5xfRozRq
	 bvN85LnqQz+M2ggaWnQ849XOw/X1YbygVEN/B2cE2jKLEnTEI78wO0eyAdr3dkt51D
	 TuikhmRt70Nyd4ozVOxO/g6iA8Bn2E5aITqk3N4nQaExYUf3Hft6UGB7/l68p+yUkb
	 Md5at39W5IeEljKeCX/M7RIp2sht1eJK8FESpP2EdbvkBF6CamqTELaSPBVsIuKz1Y
	 8G6FsHwmap2rCsRnleNGcRbKMm8Q69+orT5mCRxoX2x+pI9Inhr/Lceg86nxeedQIb
	 s7B7269yOFP2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CFF3809A8A;
	Fri, 18 Oct 2024 02:30:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next PATCH v2 00/10] Extend GbEth checksum offload support to
 VLAN/IPv6 packets
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172921863374.2663866.18249824814360801095.git-patchwork-notify@kernel.org>
Date: Fri, 18 Oct 2024 02:30:33 +0000
References: <20241015133634.193-1-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20241015133634.193-1-paul.barker.ct@bp.renesas.com>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, geert+renesas@glider.be,
 niklas.soderlund+renesas@ragnatech.se, biju.das.jz@bp.renesas.com,
 claudiu.beznea.uj@bp.renesas.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Andrew Lunn <andrew@lunn.ch>:

On Tue, 15 Oct 2024 14:36:24 +0100 you wrote:
> The GbEth IP found in Renesas RZ/G2L, RZ/G3S and related SoCs supports
> hardware checksum offload for packets in the following cases:
> 
>  - there are zero or one VLAN headers with TPID=0x8100
>  - the network protocol is IPv4 or IPv6
>  - the transport protocol is TCP, UDP or ICMP
>  - the packet is not fragmented
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/10] net: ravb: Factor out checksum offload enable bits
    https://git.kernel.org/netdev/net-next/c/8e3037924a36
  - [net-next,v2,02/10] net: ravb: Disable IP header RX checksum offloading
    https://git.kernel.org/netdev/net-next/c/c4e347a02b14
  - [net-next,v2,03/10] net: ravb: Drop IP protocol check from RX csum verification
    https://git.kernel.org/netdev/net-next/c/8d2109c1a515
  - [net-next,v2,04/10] net: ravb: Combine if conditions in RX csum validation
    https://git.kernel.org/netdev/net-next/c/5a2d973e3606
  - [net-next,v2,05/10] net: ravb: Simplify types in RX csum validation
    https://git.kernel.org/netdev/net-next/c/faacdbba0180
  - [net-next,v2,06/10] net: ravb: Disable IP header TX checksum offloading
    https://git.kernel.org/netdev/net-next/c/4574ba5b711d
  - [net-next,v2,07/10] net: ravb: Simplify UDP TX checksum offload
    https://git.kernel.org/netdev/net-next/c/e63b5fd02a00
  - [net-next,v2,08/10] net: ravb: Enable IPv6 RX checksum offloading for GbEth
    https://git.kernel.org/netdev/net-next/c/59cceae40c67
  - [net-next,v2,09/10] net: ravb: Enable IPv6 TX checksum offload for GbEth
    https://git.kernel.org/netdev/net-next/c/85c171509821
  - [net-next,v2,10/10] net: ravb: Add VLAN checksum support
    https://git.kernel.org/netdev/net-next/c/546875ccba93

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



