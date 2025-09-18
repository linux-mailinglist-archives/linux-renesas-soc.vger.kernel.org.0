Return-Path: <linux-renesas-soc+bounces-22010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0682DB83965
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 10:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 916F21C03AC7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 08:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7497F2F5315;
	Thu, 18 Sep 2025 08:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWzYt53A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435892FDC31;
	Thu, 18 Sep 2025 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758185406; cv=none; b=Vvc79GlWF95xcDry9Y0xjxoDrYMT0pCjDOsnc2m3QiAKkkjhiRmdTnp904igIwAfwtDlzEeOLVZmJRJE6pB+x7Dd1N35P86EkI2bj5j9SebFZOoK9ZqfE79ItrQ9v55WqA3O3xHQCoyo7WHx0V+wBYBad6NISRvL6bEr3KAyY8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758185406; c=relaxed/simple;
	bh=G1GCeshk4QsyKNSYTqiJ/79uKcB4QREhZTsb19sHev8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bt/J5v7LOh3qIhgwLv3Bmpt0whV0T4kZwaGHskhnT20CADoIHAHyj8I+Def9lzrnr2MidPrYc6ZhXLFf7tTO6NbAK3dHvd+5ekZqOw8fYLEPLipGB9FAAoV2ezALnk0jN1FVFXkGNBGjM1lYebGMR9xjk2IHU6SpHT2jJaIuq80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWzYt53A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C151BC4CEE7;
	Thu, 18 Sep 2025 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758185405;
	bh=G1GCeshk4QsyKNSYTqiJ/79uKcB4QREhZTsb19sHev8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OWzYt53AKXcVhAAcWIIkBnuz3UyDHmYsUOsxbzQm/4R5dqDCINVI5bw1GaA6aEBsF
	 2osTHHDUcY9FWrplKoBLPjC6QEcejo+wjis5KA/R/jdxZ+GKEm72W4txsT8dD65tll
	 EwIMmNNbjOhhagRsFE1w8N9gQQ94ozT1N3d63s8F3S/lcZHPTCtMZbvZe12msCz8gw
	 j/7ammcOEuawuITOq3m9S0rI7JELC5OBhG9PhXjUgFuZaDMMCq6JxtFheeiL7ytK2k
	 XhMx0kv2qYvd9RuFMF5RBhHR/xOs4tlgQ+rDvOptVbBaIvkq5rXwrUeXcSEo5d4UAj
	 C6QhqE9gaayKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E9639D0C28;
	Thu, 18 Sep 2025 08:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND net-next v2] net: renesas: rswitch: simplify
 rswitch_stop()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175818540600.2325622.11829783040903406814.git-patchwork-notify@kernel.org>
Date: Thu, 18 Sep 2025 08:50:06 +0000
References: <20250916163516.486827-1-yury.norov@gmail.com>
In-Reply-To: <20250916163516.486827-1-yury.norov@gmail.com>
To: Yury Norov (NVIDIA) <yury.norov@gmail.com>
Cc: yoshihiro.shimoda.uh@renesas.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 nikita.yoush@cogentembedded.com, michal.swiatkowski@linux.intel.com,
 geert+renesas@glider.be, u.kleine-koenig@baylibre.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 16 Sep 2025 12:35:16 -0400 you wrote:
> rswitch_stop() opencodes for_each_set_bit().
> 
> CC: Simon Horman <horms@kernel.org>
> Reviewed-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
> v1: https://lore.kernel.org/all/20250913181345.204344-1-yury.norov@gmail.com/
> v2: Rebase on top of net-next/main
> 
> [...]

Here is the summary with links:
  - [RESEND,net-next,v2] net: renesas: rswitch: simplify rswitch_stop()
    https://git.kernel.org/netdev/net-next/c/18cfe3c1a121

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



