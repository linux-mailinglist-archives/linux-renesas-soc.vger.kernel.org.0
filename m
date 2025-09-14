Return-Path: <linux-renesas-soc+bounces-21846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FB0B56B56
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Sep 2025 20:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CEDE3A2C86
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Sep 2025 18:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4005B2DA759;
	Sun, 14 Sep 2025 18:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEiY5IJy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097A6635;
	Sun, 14 Sep 2025 18:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757875208; cv=none; b=BNvlzdBBYeIrgZQkyBhPdjVvlSQEhREOwu4uAd2g8KlJjnK8iI4lZkO6zuCaUoJjnXC32hiiF9T01QWBefm6XE48J8sIUSGZxt8qE6Ga9aMPtKqxi8bizciLHFJyuTNS4L6viJ9XIszjmY1Un4mLuhueNq/nEkhS9n4qbW7yoC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757875208; c=relaxed/simple;
	bh=YieT40UUJGq33KYU6kqgUp5hNH+j4q3y+c8x9dfZKSI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=M/lT6E9OUPQwA5o2RnsRnmN01rmyMdVUGsyunLo0qXU4VriITsKv/mtrh6QYKDbYDg9Za7Fru1ST5oxqIob7n6QVFdxw3kUdC6WyDYgB+nEyAxzd7YegAunRGDHAeVv5Hu0QGj58BHUKSPjtKbc0x/A0sKDsRzxTKZCaTD3Yiig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEiY5IJy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA79C4CEF1;
	Sun, 14 Sep 2025 18:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757875207;
	bh=YieT40UUJGq33KYU6kqgUp5hNH+j4q3y+c8x9dfZKSI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AEiY5IJyCBvKp5SFmrw9R3Ld8gUZhhaZLJpAyli3NTlg1zp8qmByc0FjidSZy+O23
	 y+TN7mR8rYpW9PJrTO/tFTR9wIokRxb/80u4VDGNAOZFEJQglgib91C7vRkhDROSaH
	 8DnXF8PQ7ES4aPlP8qpfKvkxx/2RH/wN80qKJF5KirSFhTauyPDZjr1lXAgBa3+Jiv
	 2y6T56wj52TGAYWKP0Kmh6FWnpdOcn1tEGB6KOc1KQK48gtpN4y6PopQ5PhQyreqJe
	 ZVZtYYAvHQL6IzBqxd+ZLgDFuosA79V00dReDKONnsmbTsa1YKTcuHZxsCy7scdD0t
	 QGbEa59BgbHDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E9F39B167D;
	Sun, 14 Sep 2025 18:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/3] Add GMAC support for Renesas RZ/{T2H,
 N2H} SoCs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175787520925.3525025.295266235162136621.git-patchwork-notify@kernel.org>
Date: Sun, 14 Sep 2025 18:40:09 +0000
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: 
 <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad@codeaurora.org, Prabhakar <prabhakar.csengg@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, p.zabel@pengutronix.de, linux@armlinux.org.uk,
 geert+renesas@glider.be, magnus.damm@gmail.com, vladimir.oltean@nxp.com,
 peppe.cavallaro@st.com, joabreu@synopsys.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  8 Sep 2025 11:58:58 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This series adds support for the Ethernet MAC (GMAC) IP present on
> the Renesas RZ/T2H and RZ/N2H SoCs.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and RZ/N2H SoCs
    https://git.kernel.org/netdev/net-next/c/d43ce9822349
  - [net-next,v3,2/3] net: stmmac: dwmac-renesas-gbeth: Use OF data for configuration
    https://git.kernel.org/netdev/net-next/c/264c26934f75
  - [net-next,v3,3/3] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC
    https://git.kernel.org/netdev/net-next/c/57e9e4d7023a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



