Return-Path: <linux-renesas-soc+bounces-10234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0615F9B71FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Oct 2024 02:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1C261F25805
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Oct 2024 01:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237C612FF72;
	Thu, 31 Oct 2024 01:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqadQ3m5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D666313AD0F;
	Thu, 31 Oct 2024 01:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730338247; cv=none; b=AHEnYnP7Po78X1x61rj0IS/bXz88Ar6LoSDPw/p2k2qjyXGzWNLJ91AEhARuNzd8jD/gftuIy3KW66HmO8w4zn9xJqAX1w+A2oMSrYluDimM0CaqQ/HvsKXK8/Eoc3Kn1OPfpdW8U6nqButWbRrYklO2Ju3r5nqa+Rclyg9+NU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730338247; c=relaxed/simple;
	bh=j+BB9YGaPQ5Jt/rM1wEWyTXGGJ8IZD0VG0ayICqAde4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gz9k8v3KtXiNyw2BYkvU5RnpCepX2lfbrQpZ61QwKWCmZjhXZe202CO031Ypi6IHLBhW2JCoa5fePPgAqFdFIQSgW4Sq4oy6EfIPvrPZ5cFabaSdv8CFevy+cVEBns2OxvEvfsDr1gBPvwrfr/9zGrle4K0dNAgXjlgE+utPVCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqadQ3m5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85DAC4CECF;
	Thu, 31 Oct 2024 01:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730338246;
	bh=j+BB9YGaPQ5Jt/rM1wEWyTXGGJ8IZD0VG0ayICqAde4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KqadQ3m5rQty8x5sVzIu6aGKXRSz+gGhEuzXteAbc/7khJUbaL4fd3HS3JmEshWZo
	 uE7C87CLAqM485F5EN/FXyayA7Ny+2aiqudjS5wskAYsdOZfCkhb0uA/4V3C9btUti
	 EVlrbMMRFmUUW2FnaLuMU+Z9XHajjFi4upK95ak4mRKNCdfA4Q3Q9E7Yt9CYv9Nlby
	 HwenkkxyYUC8NU9b8Ki35RG1r4iopYEqawRFfJ4Cd7sWaFbHcZm4EHRDiEi/vU/60B
	 vQ8z1VYe/Z+AqcqhmmxDXejeo7DO+mByDtNYVTGfynQ6YwCd+s9RKc1NUEFF37/MG5
	 4VxYr2QAhDi0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE41E380AC22;
	Thu, 31 Oct 2024 01:30:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: net: renesas,ether: Add iommus property
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173033825449.1516656.15513030725066077693.git-patchwork-notify@kernel.org>
Date: Thu, 31 Oct 2024 01:30:54 +0000
References: <2ca890323477a21c22e13f6a1328288f4ee816f9.1729868894.git.geert+renesas@glider.be>
In-Reply-To: <2ca890323477a21c22e13f6a1328288f4ee816f9.1729868894.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: sergei.shtylyov@gmail.com, paul.barker.ct@bp.renesas.com,
 niklas.soderlund+renesas@ragnatech.se, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 25 Oct 2024 17:12:24 +0200 you wrote:
> make dtbs_check:
> 
>     arch/arm64/boot/dts/renesas/r8a77980-condor.dtb: ethernet@e7400000: 'iommus' does not match any of the regexes: '@[0-9a-f]$', 'pinctrl-[0-9]+'
> 	    from schema $id: http://devicetree.org/schemas/net/renesas,ether.yaml#
> 
> Ethernet Controllers on R-Car Gen2/Gen3 SoCs can make use of the IOMMU,
> so add the missing iommus property.
> 
> [...]

Here is the summary with links:
  - dt-bindings: net: renesas,ether: Add iommus property
    https://git.kernel.org/netdev/net-next/c/1aea2c42d494

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



