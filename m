Return-Path: <linux-renesas-soc+bounces-12929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 593D5A2B828
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 02:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB8BB1675DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 01:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7CD16F0E8;
	Fri,  7 Feb 2025 01:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+80s+YD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89C614B06C;
	Fri,  7 Feb 2025 01:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892405; cv=none; b=KcG0bhrECiNP2EwSgHVDHezajFuA4vWsVXZfgYBOebwscVx3RZH8eWZsaJoBuwWr4gqJMMLcTDttbVP3ZOutfTOJdC7trg2H7GSEL1vftml9qYYwhsZ4GXNk3XfcnEOyGlkir1cBu1lmYSOnHc9c96nKad6xeRWiXbZ5beAK030=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892405; c=relaxed/simple;
	bh=cBFEGERzjQPgeoxZy5JQKhdwajbGR6m9YkCCCPuJKAg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jEmhsYQQ+rGBHOCtXrem/GtKGRsvFQ+oGv1rIk9nbW+XJ7si3zkNBotMSq/LQHNTLkaKTf9a70Z/0Oa4c+19yi+4e4C2dVPo1IsjLLvN5XMkWiTTcv9ixhFMbQcs1VjCJd4agi/hXT4Bi/lTNWT4nhvlPPHG0Tdx6lCoB/bU40I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+80s+YD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415D0C4CEDD;
	Fri,  7 Feb 2025 01:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738892405;
	bh=cBFEGERzjQPgeoxZy5JQKhdwajbGR6m9YkCCCPuJKAg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=A+80s+YDRLAJPTO7v2J8qxgnRsYhho6wLSLFu9dv9knPmNwkcK/mI7WWFgOWA/aCG
	 0W/yHzLsx8Tij9EUbqZjVi9SBbz0lZi6aAVkETzLcPxF5y9MKYtv2+D4QkdGdEyah/
	 4UjkUCwhDfgWPMG0/v+2WY3P2LgO4bJMSLh5rF75jdS5oTuEnJ9lBY5FX1IWD0tvjJ
	 9QNyVXlqTC5UbuCQq2rKw8up/+7UWv85lENLOejMjZod0LsWNPeXXC0XW+RYLrF8VM
	 jzFk6fyo+ey1LTsPGSQ3r2AUfeAPb3fo0o4st4l6RNRCZ29U5FxgsZHgyTJP4xI/UW
	 HrmiXQMHu3ywQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 36157380AAE9;
	Fri,  7 Feb 2025 01:40:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: pcs: rzn1-miic: Convert to
 for_each_available_child_of_node() helper
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173889243303.1729543.6341736161086801972.git-patchwork-notify@kernel.org>
Date: Fri, 07 Feb 2025 01:40:33 +0000
References: <3e394d4cf8204bcf17b184bfda474085aa8ed0dd.1738771631.git.geert+renesas@glider.be>
In-Reply-To: <3e394d4cf8204bcf17b184bfda474085aa8ed0dd.1738771631.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: clement.leger@bootlin.com, wsa+renesas@sang-engineering.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  5 Feb 2025 17:09:47 +0100 you wrote:
> Simplify miic_parse_dt() by using the for_each_available_child_of_node()
> helper instead of manually skipping unavailable child nodes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Here is the summary with links:
  - [net-next] net: pcs: rzn1-miic: Convert to for_each_available_child_of_node() helper
    https://git.kernel.org/netdev/net-next/c/ec7309525a37

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



