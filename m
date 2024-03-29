Return-Path: <linux-renesas-soc+bounces-4171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 233B6891060
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Mar 2024 02:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D306128ACDB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Mar 2024 01:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4513717554;
	Fri, 29 Mar 2024 01:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5xgAT22"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2B51E51F;
	Fri, 29 Mar 2024 01:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711675834; cv=none; b=sk2h1bWUpjDLdqWSTV3dQwEtN/6S2qQxgsKEzolTQFtdoF2ltLCFB/Tv9Zxf8pxP2vJjN6uxfcZeaqOyTH8oYVTgS+cY32GjdCiD+YJjvRNiT4PpJfaanp1yFcBhRZadoFrGFNgUJ/MMuLZdkSq3bBQSWl72/Uzgdqhe7Um+UP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711675834; c=relaxed/simple;
	bh=tSKjOurxTImfcZRINn6L0HX8JmpfpDZHjiLkqPQspzM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RQNFIppUpEcfR0+en9skdXUqXZCJIno0zpZrDif244FTfmQ6bYwWQxWt8tY9ObxBtvmph5W+u8egn/jO0/vvFgXRZzUGxaqs6iUjPIPYb/bfpzU33J/PkqB6I1ZtzQFHsm0Wm/rkTldKnDpskEGzNVfDj4zY5wAPgl98oVA9VAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5xgAT22; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2E0FC43399;
	Fri, 29 Mar 2024 01:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711675833;
	bh=tSKjOurxTImfcZRINn6L0HX8JmpfpDZHjiLkqPQspzM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q5xgAT22unENvm56ivkfpLyA12NIc6t2mdMXc7YvFhjpawgDplIzfsiLaTqPXFR20
	 OAcg6qgSrOVsA4KCd6jLprPtFKHKzsgpSUIqTbZlhsQ4XgneoJmG59VKVaTTFPfysl
	 gRkFijrTnyLcE9RvWMXN3NBXYVJN2S4U8iusEqSgVemTJQzvMi5QxrK9KjYBoCrZax
	 9oV4FnNBeRBG6B5XGTLJ5qrB2VqOjyOcTKEYSkyZKcR/8tO+BZHAEaqL7mg4z0e4Ro
	 T/iSRsPieoVci07LQ5OWkr5RZUUjEC+/tBJBpGCG1xHNPcjMB0YmE90bHrZaVlTreN
	 coYpYmRIrVI3A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C3901D8BD1D;
	Fri, 29 Mar 2024 01:30:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next,v4 0/2] ravb: Support describing the MDIO bus
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171167583378.32458.14130024450721126576.git-patchwork-notify@kernel.org>
Date: Fri, 29 Mar 2024 01:30:33 +0000
References: <20240325153451.2366083-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240325153451.2366083-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 geert+renesas@glider.be, claudiu.beznea.uj@bp.renesas.com,
 yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 25 Mar 2024 16:34:49 +0100 you wrote:
> Hello,
> 
> This series adds support to the binding and driver of the Renesas
> Ethernet AVB to described the MDIO bus. Currently the driver uses the OF
> node of the device itself when registering the MDIO bus. This forces any
> MDIO bus properties the MDIO core should react on to be set on the
> device OF node. This is confusing and non of the MDIO bus properties are
> described in the Ethernet AVB bindings.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] dt-bindings: net: renesas,etheravb: Add optional MDIO bus node
    https://git.kernel.org/netdev/net-next/c/a87590c45c87
  - [net-next,v4,2/2] ravb: Add support for an optional MDIO mode
    https://git.kernel.org/netdev/net-next/c/2c60c4c008d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



