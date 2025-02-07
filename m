Return-Path: <linux-renesas-soc+bounces-12952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0FCA2C416
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 14:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 753F2188BFFB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 13:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA071F1509;
	Fri,  7 Feb 2025 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+vOcqO+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CEF13BAE4;
	Fri,  7 Feb 2025 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936208; cv=none; b=JhUpmnHmFqH6WDKpu/z+pqZg4mWdBQo9yX/qokGggHER4yZe0K8mPvgW4S1gKz0bJHMJDz9LBEt9fyGVpqQDMg0dxjL1ShNJ9gAAA6aOaAflEHdN63vuR/o5ZBQyfEjsKU5lQO95fMtXcDvs4MXO/J5Q1luTxpda/II4Vi2CysA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936208; c=relaxed/simple;
	bh=wTtl5yJ8SjYiIxrTRTttS85uraz4y2R/n0v+mo941ls=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VNGTsLlga1p8RuKYnyXTAlw3tFkKcTDBpgN4OHXDzi66qBFYP58X2IAYLjACuaLFuiRjxUxr4g/XjU+5RGiOkXU20w80KYYrddbEz+bZhrkgk/w1QQaztqZYVLQg4XfMrPhdYTbOB8/2+OGcL9r1xQv6A34iOHfK3pGCfHkCiFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+vOcqO+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E9FC4CED1;
	Fri,  7 Feb 2025 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936208;
	bh=wTtl5yJ8SjYiIxrTRTttS85uraz4y2R/n0v+mo941ls=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B+vOcqO+5ZsH5kpNEe1fCWSSclq4+rOI7n4L+pVZWLuBRvAQkNBcHDjngccsWITGB
	 xSHq/0zB7wOHAdKBGeMZm1j3wDBplMqYddIEG+j9R2JSJ6OXz4bVhlJFODvozVy2vW
	 2iTJUXi+i4j6c4hp0UUqrHirYRllKEmdZsc4F+FtHxZx89HuFMtLDu1NMzCDcL3B0R
	 rHw8qtyKC5bXPyFArICs3JfCVa8vXY3RueTYapxhLhJy3U39nAuS00C1+Dc3HaiZeX
	 TywTaaeA4p8ah+t60i+QguHPmOxZ80BV3bRh6D/YZwqi8TGtc1n6Dm08oAJ9jpJ//e
	 idS7DXhsYAbTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E57380AAF2;
	Fri,  7 Feb 2025 13:50:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/7] Add of_get_available_child_by_name()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173893623629.2244005.12944730869712078303.git-patchwork-notify@kernel.org>
Date: Fri, 07 Feb 2025 13:50:36 +0000
References: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: robh@kernel.org, saravanak@google.com, matthias.bgg@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 andrew@lunn.ch, angelogioacchino.delregno@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, geert+renesas@glider.be,
 prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.au@gmail.com,
 linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed,  5 Feb 2025 12:42:20 +0000 you wrote:
> There are lot of net drivers using of_get_child_by_name() followed by
> of_device_is_available() to find the available child node by name for a
> given parent. Provide a helper for these users to simplify the code.
> 
> v1->v2:
>  * Make it as a series as per [1] to cover the dependency.
>  * Added Rb tag from Rob for patch#1 and this patch can be merged through
>    net as it is the main user.
>  * Updated all the patches with patch suffix net-next
>  * Dropped _free() usage.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/7] of: base: Add of_get_available_child_by_name()
    https://git.kernel.org/netdev/net-next/c/8d3bbe4355ad
  - [net-next,v2,2/7] net: dsa: rzn1_a5psw: Use of_get_available_child_by_name()
    https://git.kernel.org/netdev/net-next/c/46df19a8dfdf
  - [net-next,v2,3/7] net: dsa: sja1105: Use of_get_available_child_by_name()
    https://git.kernel.org/netdev/net-next/c/a76568865c15
  - [net-next,v2,4/7] net: ethernet: mtk-star-emac: Use of_get_available_child_by_name()
    https://git.kernel.org/netdev/net-next/c/876e52b2d3f4
  - [net-next,v2,5/7] net: ethernet: mtk_eth_soc: Use of_get_available_child_by_name()
    https://git.kernel.org/netdev/net-next/c/1364004b5b91
  - [net-next,v2,6/7] net: ethernet: actions: Use of_get_available_child_by_name()
    https://git.kernel.org/netdev/net-next/c/76c82eb04332
  - [net-next,v2,7/7] net: ibm: emac: Use of_get_available_child_by_name()
    https://git.kernel.org/netdev/net-next/c/0584a917a209

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



