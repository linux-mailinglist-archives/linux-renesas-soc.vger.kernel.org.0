Return-Path: <linux-renesas-soc+bounces-3580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 647A7875D5D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 06:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2043F283A06
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 05:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055D831A83;
	Fri,  8 Mar 2024 05:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMfT0Pz9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E252E62B;
	Fri,  8 Mar 2024 05:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709874037; cv=none; b=NOhb1aXiJStm/EaIYFBaR9mYWZqy9unJli1LkLMZLrRz/sHitwJOXJVJDnCSlZY+2sPxF9wiPzvOPbte5AzIASRLoHWX+0rrspga+KzLZJUog+5+xPb5zLFOoHF4xmOq8bbfKojGmx/gjp2FY1R60avVUgZcQdDFX2BDryXBSjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709874037; c=relaxed/simple;
	bh=mDyfc4HxHklKAckvdF0ZDiSMXALIJ1oUmKv3xM1/+qA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=djI76DIbDVvs59YN7EMnf8A+zeb442RgiM0jXQZz1ShPKoZGUrg6NcxploptbU5LD0FaTkxZefRUOfgsz/i5Qzjb1ttADNenltKdxGmj2WyttS1nJgSZ0mYY2dE5i7LgLoOAZxfzbgnDGjJiSrJ2fVuMoxCHqwFcMuust4mvQE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMfT0Pz9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69FBCC433A6;
	Fri,  8 Mar 2024 05:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709874037;
	bh=mDyfc4HxHklKAckvdF0ZDiSMXALIJ1oUmKv3xM1/+qA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KMfT0Pz9n7Eg7euXut2zOElHNvCfqwsS3+nt00jRvbfgJy31fDyo8haamOr529pKn
	 h5xT5w2g0wU20oaU8kX8SndVWqmytSoUsB2Z90iMsQFWKFXXnGDJzEKwskbcUhRWac
	 PuMCgZM5E0xNAi2Rkg2AmD4bU5cDj626NlutHr2brQCagKxm2SUYlCLflNjzl/TV+H
	 Ql2/b70XCMCHDxQHaeZxS2p9k/0EIaFbCGSsPzdQXz36COtSWzHFQqkQb4o6vT8Nm/
	 MbZ81D/4R5W27uRf1HhdAoacnWe78HUXNYzmbeLYT3uUDXB4iqX6emGBEHz38B3YFF
	 Uyp4ymzUhAK9Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4A598D84BDC;
	Fri,  8 Mar 2024 05:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: pcs: rzn1-miic: update PCS driver to use
 neg_mode
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170987403729.8362.3876887391139822840.git-patchwork-notify@kernel.org>
Date: Fri, 08 Mar 2024 05:00:37 +0000
References: <E1rhos9-003yuW-Az@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1rhos9-003yuW-Az@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, clement.leger@bootlin.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 06 Mar 2024 10:51:41 +0000 you wrote:
> Update the RZN1-MIIC PCS driver to use neg_mode rather than the mode
> argument to match the other updated PCS drivers.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [net-next] net: pcs: rzn1-miic: update PCS driver to use neg_mode
    https://git.kernel.org/netdev/net-next/c/dd9a730011fa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



