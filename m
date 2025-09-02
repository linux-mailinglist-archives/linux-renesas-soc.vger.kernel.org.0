Return-Path: <linux-renesas-soc+bounces-21228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC6EB410E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 01:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B790B1B22E06
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 23:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824B02882A9;
	Tue,  2 Sep 2025 23:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qg4Mmyix"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E2D279359;
	Tue,  2 Sep 2025 23:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756856405; cv=none; b=NIEafi1ElIYapa7gYb44Xm154hPltX9Av/4B1vl4bVGrvERTbcI59YmQu/2h/x+cu1XlJzEMUJPYE0T8lUGRSVxPIWVXAEReZMx8BoBCzyrsxXhLp0/1LuK1BaGe1rih4GD+f7OTYJZVLP0BxvOqoIIBHYrjikyUnDxeJnIc1Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756856405; c=relaxed/simple;
	bh=uDpCbvYpxyXICiyn+K2uvvcRtzBFtDer1dBT3HfmcM8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fz8Kqffsfw3nvygkw5HpfdCX9bLg41t6BL8niaS3AXrH247u8+MmIUnPr2a7IYxkxmD5iwVOkrXtsD/BvO2rMQohGCTiD4BcZwyZkAushqdG2rGCyULcurzCcBwogC7pL3Q+UBvc3zjDjDLNuv2t2+bmCyjrEsd7Th1DBjZC4U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qg4Mmyix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34EDC4CEED;
	Tue,  2 Sep 2025 23:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756856404;
	bh=uDpCbvYpxyXICiyn+K2uvvcRtzBFtDer1dBT3HfmcM8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qg4MmyixaP+Wj8rMI3vy5lF9Qxk/z5NmRRk29GIJ40+5MIg+dQ9or/cXtbYNfYfya
	 rEEON88NCXjW56NON6zixk3j7C4EzEhEcUxgBoPVRNUsykQQpw53PCcCu6dJI31BVS
	 v+//cJ6ykyU/IM9nfUPltxm+CY572HqIn9/Ad6KphfjrT+JFUkqjn9/aE9qDjNvzV+
	 FiGW14I42FxWXc2ctIhD+iZUjnWFDJFTZvejeZMpxiPQCE0OXXeN5/ESm8fMt6zyNE
	 x/HHN6SxXPztLgScRMLM5qsdj81BRk9pBYHLYq9Q4Kzar4+hXcZXHlIZ/HIh/64LtV
	 wluZ7351CNO4Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B93383BF64;
	Tue,  2 Sep 2025 23:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] net: pcs: rzn1-miic: Correct MODCTRL register offset
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175685641028.469813.9562190313607514125.git-patchwork-notify@kernel.org>
Date: Tue, 02 Sep 2025 23:40:10 +0000
References: <20250901112019.16278-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250901112019.16278-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad@codeaurora.org, Prabhakar <prabhakar.csengg@gmail.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, stable@kernel.org,
 wsa+renesas@sang-engineering.com, rmk+kernel@armlinux.org.uk,
 geert+renesas@glider.be

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  1 Sep 2025 12:20:19 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Correct the Mode Control Register (MODCTRL) offset for RZ/N MIIC.
> According to the R-IN Engine and Ethernet Peripherals Manual (Rev.1.30)
> [0], Table 10.1 "Ethernet Accessory Register List", MODCTRL is at offset
> 0x8, not 0x20 as previously defined.
> 
> [...]

Here is the summary with links:
  - [v3] net: pcs: rzn1-miic: Correct MODCTRL register offset
    https://git.kernel.org/netdev/net/c/a7195a3d67da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



