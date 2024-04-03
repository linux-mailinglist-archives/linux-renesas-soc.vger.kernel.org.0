Return-Path: <linux-renesas-soc+bounces-4237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3E1896217
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Apr 2024 03:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DEB41F25466
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Apr 2024 01:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2F817C98;
	Wed,  3 Apr 2024 01:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEKNiE9u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D73515ACB;
	Wed,  3 Apr 2024 01:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712108435; cv=none; b=vGnR+juFy+DTpAkEkT9SlkWj587MoLc7c2zxPYXZp7BiKTcaCKwc2RPTQHk4LGrEyv2wGA5lBryqkvQ5C8nVX+A4ebNXW31WBLv/GxsiDVhbVcGDsKg5k1gxBpPZZyB0s+Z7tNuv5UK1eHwlLxxwGThouxlAkF006JdTxTfdCHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712108435; c=relaxed/simple;
	bh=2Cqggvi+FITuLPU6Wtv6kILJujsOux5eJcik4zu5h0w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=iTbRDnVy9Z+38O79PKzyTaYi0su+pZwdi9O0l7UcrH8jvTKTfR1hg2TIPL/ZrxzT48lXHlf9rvv1L+TXwhN6V1bsTom9wBVBEzk6woSj5+el4XLBidH5t9y0PQsj9nyJDP2jtKcP/PpADV50lcX8tg1I2yLetnaq/f9ZXl2iHFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEKNiE9u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E665CC43601;
	Wed,  3 Apr 2024 01:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712108435;
	bh=2Cqggvi+FITuLPU6Wtv6kILJujsOux5eJcik4zu5h0w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eEKNiE9uepjjn0InblW6b5qc1Cjff2kGHNImum7Ny2o6p/g0QHemub4K7RpYYWcpv
	 eamDHMzJ3CAKm3I5fkkBDh6XjxrvByJ/9z2YKVrx+SN+xQWk7oYLgfeDyP3tDFuJF7
	 mgPn/ReFV4rpRnSlzBYwPxtRh23STkx5fPOtzQSdhWSaGxI/SPsKsaD79avuKWEPVj
	 /7adJHehvQpkdcgJ65FR0MGkBQEiw//gyDKhwTh3hAFqE2p02faFTZKYETVivEJbyY
	 O+hI2Q+TZXnV+HEp7zAQ04Nu/fMtWaC7C+TJH4s3rmi+v3fxjV6oxYyHBYQSGSGg6B
	 RVv543O8rgxqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DDB22D8BD1F;
	Wed,  3 Apr 2024 01:40:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next,v2] dt-bindings: net: renesas,ethertsn: Create child-node
 for MDIO bus
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171210843490.14193.13793539310642230479.git-patchwork-notify@kernel.org>
Date: Wed, 03 Apr 2024 01:40:34 +0000
References: <20240330131228.1541227-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240330131228.1541227-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 geert+renesas@glider.be, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, robh@kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 30 Mar 2024 14:12:28 +0100 you wrote:
> The bindings for Renesas Ethernet TSN was just merged in v6.9 and the
> design for the bindings followed that of other Renesas Ethernet drivers
> and thus did not force a child-node for the MDIO bus. As there
> are no upstream drivers or users of this binding yet take the
> opportunity to correct this and force the usage of a child-node for the
> MDIO bus.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] dt-bindings: net: renesas,ethertsn: Create child-node for MDIO bus
    https://git.kernel.org/netdev/net-next/c/8da891720cd4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



