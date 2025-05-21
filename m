Return-Path: <linux-renesas-soc+bounces-17280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C86DBABE94E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 03:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5B094E1989
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 01:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA30F1D619D;
	Wed, 21 May 2025 01:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlMSMh1t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD051D5CE5;
	Wed, 21 May 2025 01:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747792192; cv=none; b=hwtoB7DLJ4CwMc+wIsMjdetbImcw1mPX5jQ31jZojsE3xFJb7xZzleesgqD6i2qHw+GnJmBICjzPd6Xf57e+ji6E5JL58uaSERASYI2KwbXttR+wZJxUDSTk/i8o8e1O3uodOqFWFgXZPzXzGTMP+Vzorbl1134AhGCHNL7CN7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747792192; c=relaxed/simple;
	bh=XWa4ueLt22rZ4t9UOEKW1yv2gOymIJ9GFKCfz0SUiYU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Kn0lWPJaLvzsP2+ejzx68YY+Ee5Fpz2/oYo8FjvotDz9Lh4iz1ZJXf5DdG2R4SoCaYLnmkV82LR8m3nEJSVbSlwq9g/+8cAbXO/kiwtApkLC6kfCT6MK3tpH1yHqMbKqNHWLX3Q2UqeBARIlKUg1F+pYzrtXc7B8nCxa2jR8twc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlMSMh1t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A4CC4CEF0;
	Wed, 21 May 2025 01:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747792192;
	bh=XWa4ueLt22rZ4t9UOEKW1yv2gOymIJ9GFKCfz0SUiYU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mlMSMh1tTOH91lR/9YjQfa4PWnz/CglIDwtTHJT6tkwZgV0wmsuJWl5UtX924MI5H
	 AhYwjtqvtRsQYW7mWMbYNwtiClNipFZjt/iDU5xlo4/vCOjxMmkkuTDti8SekynAa6
	 FrtFqNcziYnkntAhDQnHzU3C/YJJ8PvDcYKKpIvOgHDW16BFE8SChHx6wONcXC7iKS
	 wqhM47Le7Z48TqKihbQ+/Pa0TX1yZBphJ4Z3oYzPUIWal45Gymw64ES8+cRFkOELR+
	 GM4eVDfhnznMH7iSgqFP30b93FLlUXZwG1nD8GKDLZVj+y62AKlqwGWL+gh9AGVZwO
	 fPhPRyqg32Ogw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BD1380AAD0;
	Wed, 21 May 2025 01:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Drop myself to reviewer for ravb driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174779222800.1533629.8746907397008314305.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 01:50:28 +0000
References: <20250519133354.6564-1-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20250519133354.6564-1-paul.barker.ct@bp.renesas.com>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: niklas.soderlund@ragnatech.se, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 geert+renesas@glider.be, s.shtylyov@omp.ru, paul@pbarker.dev,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 19 May 2025 13:33:51 +0000 you wrote:
> Maintenance of the ravb driver will be handled by Niklas for now. I
> still intend to review patches, and will be using my own email address
> going forward.
> 
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - MAINTAINERS: Drop myself to reviewer for ravb driver
    https://git.kernel.org/netdev/net/c/48a62855073b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



