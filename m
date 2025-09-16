Return-Path: <linux-renesas-soc+bounces-21884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BACCB58A11
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 02:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC6431B2157E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 00:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A59199935;
	Tue, 16 Sep 2025 00:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZaKu7U9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8502C1CD2C;
	Tue, 16 Sep 2025 00:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757983816; cv=none; b=q9a5qwEr5079Qk2uWbnCz2wrhNAz2NNkYWJQYgT0V5K6yYwa5fWfqkP+AKkpiSnkN7xnS1XxPzPPCQI3EdEV+ezSFD+o9zWmgeqI02tW0+cI1du7uxwI4+nOcpISP5FpSn8pca/kqcZ8BBOzzuFsRubdl8jgfQWDQ/VA7pJm48E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757983816; c=relaxed/simple;
	bh=20xMqf7x7OJmuH7fFjAsJXvXWV2SutHIerjaBjyjWD0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rXZzyJfW3Ajuj4PnHcL7L3FAEWLD6rOiYgA0X1bTy+NcjM6bUhyyzi54aYiOdSfwSuD+XXGxZXWAkjbzc55NX9/UZl9hxm0RiCjW6mfvf4JlOYkR6LtooC4D7yjV5aYxMXcGy5PP2cWr9rxEIpDlZUCi+Bkaj2Fh+npDDH6cPLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZaKu7U9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C48C4CEF1;
	Tue, 16 Sep 2025 00:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757983816;
	bh=20xMqf7x7OJmuH7fFjAsJXvXWV2SutHIerjaBjyjWD0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RZaKu7U9yVfdNBHoLpC1wVXaqbkDS9ynou3O2LasTk0j6bcG4TsBIj6aZKCOd6X4d
	 efE/C42jV3BkHymT/fpZp8K1fj7eKVqX3RbAPBUZunlzA0L0Uk2mX7tsNhzdvTR0S2
	 zbDFLWlqbcAd967ug5rI3UaCMd60Halnhrirbvt/P4CI5EzclOXOptoO0mGoKvLLSJ
	 SCL6ZvDk11o4EkK7MytrbFjuMISHM13ADhzJKYQX0AmUCZ2yS4fTtmQ+6+98na4SLs
	 AkwtoH7gkgPsZG69sV7yxkSEtDUGjwhgn2OmYpSbCYcEKEEXD0cHp9OKJtcob5DMCa
	 F7INYP1QCIkKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0A139D0C18;
	Tue, 16 Sep 2025 00:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/9] Add PCS support for Renesas RZ/{T2H,N2H}
 SoCs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175798381775.548349.11396728695783446846.git-patchwork-notify@kernel.org>
Date: Tue, 16 Sep 2025 00:50:17 +0000
References: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: clement.leger@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, p.zabel@pengutronix.de,
 wsa+renesas@sang-engineering.com, geert+renesas@glider.be,
 magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 10 Sep 2025 21:41:21 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This series aims to add PCS support for the Renesas RZ/T2H and RZ/N2H SoCs
> These SoCs include a MII converter (MIIC) that converts MII to RMII/RGMII
> or can be set in pass-through mode for MII similar to the RZ/N1 SoC. The
> MIIC is used in conjunction with the Ethernet switch (ETHSW) available on
> these SoCs.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/9] dt-bindings: net: pcs: renesas,rzn1-miic: Add RZ/T2H and RZ/N2H support
    https://git.kernel.org/netdev/net-next/c/8c01cc2382bc
  - [net-next,v3,2/9] net: pcs: rzn1-miic: Drop trailing comma from of_device_id table
    https://git.kernel.org/netdev/net-next/c/b2e12fca3164
  - [net-next,v3,3/9] net: pcs: rzn1-miic: Add missing include files
    https://git.kernel.org/netdev/net-next/c/861d10f09250
  - [net-next,v3,4/9] net: pcs: rzn1-miic: Move configuration data to SoC-specific struct
    https://git.kernel.org/netdev/net-next/c/f39e968dc168
  - [net-next,v3,5/9] net: pcs: rzn1-miic: move port range handling into SoC data
    https://git.kernel.org/netdev/net-next/c/c112520de041
  - [net-next,v3,6/9] net: pcs: rzn1-miic: Make switch mode mask SoC-specific
    https://git.kernel.org/netdev/net-next/c/6245237abae3
  - [net-next,v3,7/9] net: pcs: rzn1-miic: Add support to handle resets
    https://git.kernel.org/netdev/net-next/c/882a8bb0706c
  - [net-next,v3,8/9] net: pcs: rzn1-miic: Add per-SoC control for MIIC register unlock/lock
    https://git.kernel.org/netdev/net-next/c/419747319e3a
  - [net-next,v3,9/9] net: pcs: rzn1-miic: Add RZ/T2H MIIC support
    https://git.kernel.org/netdev/net-next/c/08f89e42121d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



