Return-Path: <linux-renesas-soc+bounces-12930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E2A2B82C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 02:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD4F01889D0E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 01:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744A7192D63;
	Fri,  7 Feb 2025 01:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLrVqAlU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472F51917D0;
	Fri,  7 Feb 2025 01:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892407; cv=none; b=kNzflBP5JbAOpphQKZ6wyIdUQcQTiWLWAez1mFEfY1DX0n1LSqo66dnzuOAE7q3sPOT89fT1dNZ5ZToMgAFjauWRc7Qmyyvvg04k+Xw++JWd72OvFRJ9HnCgM0WEktJOtoABKV3NIqJAUQd/k78BB3VeRv56ylapsc+0x2QMH1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892407; c=relaxed/simple;
	bh=OcXGlxwvKY6BmuZjapRwTS5hzMOVbwYesypuU3LvrWY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jxaMcqgZVNLlU1fNHu4vj7L7RJtdEoSSZ5ynSkl04Qrbyo9dCgjnCshFa1mamWnHdbvVA/PiVDLDQZGr2ZoKcEhG6lLFF52Yj7vcxW5M/EqbjKMOkpP3A3wetwfPlY+JCQLJ+JnELWbHcSJqiGnFFuRAyJKQe6Mk55HjawvZjyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLrVqAlU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA52C4CEE7;
	Fri,  7 Feb 2025 01:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738892406;
	bh=OcXGlxwvKY6BmuZjapRwTS5hzMOVbwYesypuU3LvrWY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HLrVqAlUYYzoq23IamYtnv7NK4Is+n2V6NmoYVa+cKue47pf/T+AvPZ3KAbnxUyYP
	 6cXPxHyd0F0UzLzBv6IInXpcV0BdV2i4C46Wb/WCTjZ6XHV3b1eJJ2cqsCaSmSOEfN
	 unKAn/5xL5w2NP5h+LfyC98+B2YprWlttH36Ft2sTu1QxaiJKZj/mTfCrfkvcnKR1I
	 C+E1LEe6m+Aup27hdEo63bTGz9o+h4gJ14dUwU0o6syA+tOtkGXHOSwReCOGmdbHfF
	 RmOVeSc0aEss+LwcftfEP2OAytvHeWvbEQD+6c2+ZHzwAMtM+WSPccURELk8ewTKux
	 24tHlBZuU1Iiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE13F380AAE9;
	Fri,  7 Feb 2025 01:40:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: pcs: rzn1-miic: fill in PCS
 supported_interfaces
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173889243427.1729543.16878322191543297960.git-patchwork-notify@kernel.org>
Date: Fri, 07 Feb 2025 01:40:34 +0000
References: <E1tfhYq-003aTm-Nx@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tfhYq-003aTm-Nx@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, clement.leger@bootlin.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 05 Feb 2025 15:43:32 +0000 you wrote:
> Populate the PCS supported_interfaces bitmap with the interfaces that
> this PCS supports. This makes the manual checking in miic_validate()
> redundant, so remove that.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)

Here is the summary with links:
  - [net-next] net: pcs: rzn1-miic: fill in PCS supported_interfaces
    https://git.kernel.org/netdev/net-next/c/508df2de7b3e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



