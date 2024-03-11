Return-Path: <linux-renesas-soc+bounces-3695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51525878AEE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 23:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C6EE282423
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 22:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FF25821C;
	Mon, 11 Mar 2024 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCzCnNYS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2015820E;
	Mon, 11 Mar 2024 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710197437; cv=none; b=ITova/f1WocxYo4Xpgp7vX7tmU9Abkau3NaN2njwViVrCwW5j682DR+MVYuepE2yw895BTYCVymT+swvfdTFblJwUirhLe80Rz5+/3wsZ23XpiyygmqzYZ2hwJvNgaSl27A9XgSoMTglT0xxWZj0NlHRSeRK2CaLkINQp+q3Bcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710197437; c=relaxed/simple;
	bh=SRcA7FiTyQvtn5OuoLvrtlIkPJ82904uJqyGOT8yNVs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RuklxaJCrz04BqXidV4b0swhB0Iz0Uofg7gx2tRBsljunQiCO5mZQgof7WkyhknQf8VgaUTkJxDrkNbjpoBoe+xJIbWNafWMBT3a0Mf/VS5FjsioDDJc6YiPjI2qrwQr5k8q4X4yio4d40ciX9LR0I22Gqfo1Nbp7AlL9kQboss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCzCnNYS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19DD2C433B2;
	Mon, 11 Mar 2024 22:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710197437;
	bh=SRcA7FiTyQvtn5OuoLvrtlIkPJ82904uJqyGOT8yNVs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SCzCnNYSw80guTyubGfuw+k3aYl9CbKkivTplswz2FHhBdgAxJeEYkIU0K9kP7pTq
	 0JH5BZ9Yl3SdxjuvPYdk6ECiqta6Zq7kEha11MPQfLLt8vHAjZm6f6pQ7SqzIl1RhA
	 am5nedbUa6nSRliRSSXN8v7/IAcvrKS1BkcS1LAzOpBK7o9LmDj0M4THRpWMihHRt0
	 63aHZmYo7/IJS3AxvjBuf0a7UIGDVrbLHtRhQvRyUS9wqQYsEvwB9CNSUb2XFguC2M
	 fiaSMxdkbgam8uFxHzU1XKxn/tBzcTJtBrU9xDsLi0Ott2ish7qytmXDwHzGtL+LYA
	 aZsFzfwd7Osmw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 03E78D95057;
	Mon, 11 Mar 2024 22:50:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next] ravb: Correct buffer size to map for R-Car Rx
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171019743700.8733.13687567059309127067.git-patchwork-notify@kernel.org>
Date: Mon, 11 Mar 2024 22:50:37 +0000
References: <20240308224237.496924-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240308224237.496924-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, biju.das.jz@bp.renesas.com,
 claudiu.beznea.uj@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  8 Mar 2024 23:42:37 +0100 you wrote:
> When creating a helper to allocate and align an skb one location where
> the skb data size was updated was missed. This can lead to a warning
> being printed when the memory is being unmapped as it now always unmap
> the maximum frame size, instead of the size after it have been
> aligned.
> 
> This was correctly done for RZ/G2L but missed for R-Car.
> 
> [...]

Here is the summary with links:
  - [net-next] ravb: Correct buffer size to map for R-Car Rx
    https://git.kernel.org/netdev/net-next/c/a290d4cb892d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



