Return-Path: <linux-renesas-soc+bounces-11259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6578A9EE930
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 15:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05CB31636D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 14:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA8C2165F0;
	Thu, 12 Dec 2024 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oj8Z3JQ8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAA384D02;
	Thu, 12 Dec 2024 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734014415; cv=none; b=bwgSgzGywQbbiTbLXfQnu+qzIfOgLTkO2lD2GM13f3picjf2lxcLKukCVjI/PDm3PsUYkBOPFX5Z58OJmeWu6/Z2wUrC1O0eIaX1Qpq1Y5zskR+jrZ9bz1ELA81u5gHlquqJD1crgySNHJleJOuu7cinquAH9y94vKXaWJ0FTjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734014415; c=relaxed/simple;
	bh=/Ky1TjEMqMmdBX6ENCab3yb/0zJeeh5IYioN9EiSoiA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WqmmYR0RVhsGGKGid8XC26NfK51Ejgn35lDN3Zj54z4zX3E2vEwEuK5UUBUA56iTc/sLRwGmMaCdTq8D6CSqYrrBdCfbCCycwXKQPIoNmObAbreO0xZuqxoCVjnURthi06EBy0t67/VFpvxcfLKbiRq/QnkLjCIpJjJWHsllf0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oj8Z3JQ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E93C4CED0;
	Thu, 12 Dec 2024 14:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734014415;
	bh=/Ky1TjEMqMmdBX6ENCab3yb/0zJeeh5IYioN9EiSoiA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oj8Z3JQ8qgqeFoMOv0d9oqDruytqvr6L790Nh8dMYMrrA4I02IRZbKlX43hndHcuS
	 u6d+GA9vNA6TlCAWeZxC+rGXOA8MrVIhE6C3RFl8NyHmTvMZxUKWgC5n5aGcEbgLkW
	 FSCdeJLDzsof3F9IfrLr2aUXYuhX9dR3ji7zYrK/sf0ZfRjxts7Cx1iGbEOZxnsTmz
	 HEDb0heCZueNH2otYHrh63r10WZF85I7P/Gx5u/TjSnoKkBc8INZjWwXt7IdxIa1rX
	 YoPkbN1bGPhkJwke24++nteNDGJ/xPDaPlPcPyH7IOPEwDp/bEs2xjqxgwHe+0aaGV
	 nB937KYV1PSHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id A764E380A959;
	Thu, 12 Dec 2024 14:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: renesas: rswitch: fix initial MPIC register
 setting
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173401443152.2321054.1307990572279207194.git-patchwork-notify@kernel.org>
Date: Thu, 12 Dec 2024 14:40:31 +0000
References: <20241211053012.368914-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20241211053012.368914-1-nikita.yoush@cogentembedded.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: yoshihiro.shimoda.uh@renesas.com, andrew@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 geert+renesas@glider.be, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael.dege@renesas.com, christian.mardmoeller@renesas.com,
 dennis.ostermann@renesas.com

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 11 Dec 2024 10:30:12 +0500 you wrote:
> MPIC.PIS must be set per phy interface type.
> MPIC.LSC must be set per speed.
> 
> Do that strictly per datasheet, instead of hardcoding MPIC.PIS to GMII.
> 
> Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: renesas: rswitch: fix initial MPIC register setting
    https://git.kernel.org/netdev/net/c/fb9e6039c325

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



