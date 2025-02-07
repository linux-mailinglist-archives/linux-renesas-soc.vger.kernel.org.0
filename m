Return-Path: <linux-renesas-soc+bounces-12958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C57AAA2CDE1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 21:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74C581881A09
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 20:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017BB1E1041;
	Fri,  7 Feb 2025 20:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmoDmCRJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1DF1E1035;
	Fri,  7 Feb 2025 20:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738959011; cv=none; b=Y+h307crVooAUKPhx8+PFs0UQVqrdOOjj28KlNk27UqNAfGkv3942FRdWSx14baX4Zhw+UtRlu5xf0f2SiDV9XOmJSw2T/OrMUfuCRDNFz58TPkpg9hXcK+owD0Hq8idm72X+8vYZcM1YhuhqIvSyCWsEkeUm2DcL4bwYZeC3AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738959011; c=relaxed/simple;
	bh=Vx/uXCZMmWHxb9qb+6fT1bzndo7Dd4+PGUax25qZniI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WXUveiFniAJj6stcE0j8KHxqwdakbPERd2nyPZ6pXN96Ejk9epKK5P/t3gs+p6LCbPf2KgEFQqzRkESrcXaFuRGNDySFACAwW2tC/Cusy316CUagbm5dCEcjaP3YW4NDNnRA2zBax25n5ARIe/u8cTNLDUg96rgKvvqWnCoMFzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmoDmCRJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E077C4CED1;
	Fri,  7 Feb 2025 20:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738959011;
	bh=Vx/uXCZMmWHxb9qb+6fT1bzndo7Dd4+PGUax25qZniI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jmoDmCRJfwLMg8t82yS+sg/UBFLhVLyoBTnUVid5NGPQA/luwvnkg/fPdB0UF2jEh
	 c1pTos3dy01etIfxFCs4NGKoaS8E0UXaSfrbjiwQusnon0J1rzKy0ag77TGtDaQq7v
	 1KSLhmSb4SEDyfNpF/B8HJkrfp0pTbsF9/LewReVErIbk7zg7EhEEYsuF6IoYM1ctR
	 DYxqIPZpTeIQQJ1IlBxNOkhmSZbN8GSTUMWGAvN9/hyapVgBkmEshIY9PU4d2sDUaE
	 iJU+Rpf2ZgBNhrlfp0haenIRhB/sXNRXpJ4A9hGgAauZ1PwrexFYYaRh5OpKLTXDM2
	 MdLshq7XuWCkQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 716BD380AAF4;
	Fri,  7 Feb 2025 20:10:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: renesas: rswitch: Convert to
 for_each_available_child_of_node()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173895903900.2367164.169889700480879767.git-patchwork-notify@kernel.org>
Date: Fri, 07 Feb 2025 20:10:39 +0000
References: <54f544d573a64b96e01fd00d3481b10806f4d110.1738771798.git.geert+renesas@glider.be>
In-Reply-To: <54f544d573a64b96e01fd00d3481b10806f4d110.1738771798.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: yoshihiro.shimoda.uh@renesas.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 nikita.yoush@cogentembedded.com, niklas.soderlund+renesas@ragnatech.se,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  5 Feb 2025 17:12:09 +0100 you wrote:
> Simplify rswitch_get_port_node() by using the
> for_each_available_child_of_node() helper instead of manually ignoring
> unavailable child nodes, and leaking a reference.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested on R-Car S4 Starter Kit, which has port 2 disabled.
> 
> [...]

Here is the summary with links:
  - [net-next] net: renesas: rswitch: Convert to for_each_available_child_of_node()
    https://git.kernel.org/netdev/net-next/c/7bca2b2d5fcc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



