Return-Path: <linux-renesas-soc+bounces-16235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EB2A97C9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 04:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10E371B61BC2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 02:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78921263F43;
	Wed, 23 Apr 2025 02:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJRyZofH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477DC10F9;
	Wed, 23 Apr 2025 02:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745374203; cv=none; b=G610RlfBd3t9NWZBOv6eYWMaZGAQ1uccgeqohOcb5AkXJOqjIfgJOxV8Xq6ic8NNUduWVTad6wp6/xfhFeYTTLcCN0eQL55iqE5PuFPCn7euVX2mr7KUnfQcORYlejDpCLGlk2Bhg0VXOhmTQD14g/MaCTywWw9NRhG79V5AlBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745374203; c=relaxed/simple;
	bh=mfA8LCGyK1ft3dVgLyO0no1zPL7rJ2QqTHlgV6oRXU8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Ad3pnjpuGClcRuSZDICz70V7/XnEJhwVsFn5q1tHYRATPXuznHE3Y8/ES3PBiuLA2MYnmsUM/z6lqj/YjumXH0rRUhaKWhjsJb60gsv1JetENV7lTETcLcdXcs+0oJ9e8yzQ8qmUZhNFb/JmhTMDq0oFOR9TlPeKXmas+HeGssM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJRyZofH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF178C4CEE9;
	Wed, 23 Apr 2025 02:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745374202;
	bh=mfA8LCGyK1ft3dVgLyO0no1zPL7rJ2QqTHlgV6oRXU8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LJRyZofHrIWVdj2cNJN1mYZWKFIhGf3r1M1ry/4o1nWCmhs6Zhjnd4sNg4r2Qn6pn
	 IiaA8KEJLeT75wSHPxOS/ngZtJ8B6oySkr+bMelzKJCEbnS8N99qWBk26xWHVMJvE4
	 hHFYXcL9kzdxCvp0Sk5FCAmq51rj8Ffg3J078GTPz9CMJkwvHYjj2c67Hm2o9xpyUG
	 r1FPDhMgJ6j/wWvOKcux+suI2FeimfPxnFs/toD0xcZjZW+mGU84VF1HWkayF0fQ5P
	 0UgtHgkgjwU4W+K/7astVsKcHZcP9Qa9m99UIoplFVZoMI2QVcunOBAtjz7843j8ZI
	 XXHK9hx/qKcyg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C7A380CEF4;
	Wed, 23 Apr 2025 02:10:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v8 0/4] Add GBETH glue layer driver for Renesas
 RZ/V2H(P) SoC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174537424123.2115098.14548979135070706572.git-patchwork-notify@kernel.org>
Date: Wed, 23 Apr 2025 02:10:41 +0000
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad@codeaurora.org, Prabhakar <prabhakar.csengg@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, p.zabel@pengutronix.de, geert+renesas@glider.be,
 magnus.damm@gmail.com, rmk+kernel@armlinux.org.uk, peppe.cavallaro@st.com,
 joabreu@synopsys.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 17 Apr 2025 09:40:11 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series adds support for the GBETH (Gigabit Ethernet) glue layer
> driver for the Renesas RZ/V2H(P) SoC. The GBETH IP is integrated with
> the Synopsys DesignWare MAC (version 5.20). The changes include updating
> the device tree bindings, documenting the GBETH bindings, and adding the
> DWMAC glue layer for the Renesas GBETH.
> 
> [...]

Here is the summary with links:
  - [net-next,v8,1/4] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
    https://git.kernel.org/netdev/net-next/c/8c989368c04c
  - [net-next,v8,2/4] dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
    https://git.kernel.org/netdev/net-next/c/8fff7ae84d18
  - [net-next,v8,3/4] net: stmmac: Add DWMAC glue layer for Renesas GBETH
    https://git.kernel.org/netdev/net-next/c/461f6529e594
  - [net-next,v8,4/4] MAINTAINERS: Add entry for Renesas RZ/V2H(P) DWMAC GBETH glue layer driver
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



