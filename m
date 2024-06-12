Return-Path: <linux-renesas-soc+bounces-6116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84176905EF5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 01:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A879D1C21C32
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 23:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2BD12C816;
	Wed, 12 Jun 2024 23:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqh/t+tA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961EB12C544;
	Wed, 12 Jun 2024 23:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718233844; cv=none; b=p2M8UsM0adA2NG+mhjsWoZdggDmQPKyMQC9PPyvGVHwugfQ7odYzOMd/UXNo6VgTiXATljkfLxFI9bAtTiB5LWM9bXtcuYWk5Z/dosRex5RM4sBLK5V9LHhDjw4JNWwGmN2UQW/A2A+90hbxFI/FIFF5uqoDjbtSb2iAs38bXD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718233844; c=relaxed/simple;
	bh=qFB2jQOwUKWKzkcuGZ7mKae6/NHf2syqzBYm0kmw03E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qBVJcJVty4xvbGKVWI1w1RnkeJW4HsS4l0lkHTjqxxBYUvgyjDnVWHm+NQD9f8YoFQpH1rwjg4x7ypg1tGYanBkUAP7dzPQoIW49JyJ8CzRB7STfyvs4DH0hSEfmjl4G0tVnZUlbYmAbuur3UsdqIrONF8ASYdX/H1wY167RyrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqh/t+tA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23BBEC4AF49;
	Wed, 12 Jun 2024 23:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718233844;
	bh=qFB2jQOwUKWKzkcuGZ7mKae6/NHf2syqzBYm0kmw03E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iqh/t+tA+sHxblVopC2SuDgfI/ZNHDjHh7HgK+MTRjybwBstzXZ35+kQmdLEK0rwj
	 RBZFCWcQcvgSXSK38CEAPJ41tNIldQckI41NN7ZV+OPQxgcqVeFav6SItjxLHWAwqa
	 IWORVSFOYWqbHLDY9pb8kSSzl4/eaIQWftapHOiE9cfrAIRdtat/oUzfFcyuSkKU9Z
	 rB85GkesHIdh6mNftKahmF0wJQba9H61NVTbjzoo9VTztjdsAebDRHmBVnmx8ZNvhh
	 HXVJCaQLm/A/e/glN8SGIVCAhDS2mWTupFqm87Dpg6MvYk18/bvckEsjhy770UChsQ
	 GfhNMRUGbrjoQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0AE19C43616;
	Wed, 12 Jun 2024 23:10:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] [net] ravb: RAVB should select PAGE_POOL
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171823384403.4751.5556280902526090414.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jun 2024 23:10:44 +0000
References: <fa61b464ae1aa7630e9024f091991937941d49f1.1718113630.git.geert+renesas@glider.be>
In-Reply-To: <fa61b464ae1aa7630e9024f091991937941d49f1.1718113630.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: paul.barker.ct@bp.renesas.com, s.shtylyov@omp.ru, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 11 Jun 2024 15:48:48 +0200 you wrote:
> If CONFIG_PAGE_POOL is not enabled:
> 
>     aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
>     aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
>     aarch64-linux-gnu-ld: drivers/net/ethernet/renesas/ravb_main.o: in function `ravb_rx_ring_refill':
>     ravb_main.c:(.text+0x8d8): undefined reference to `page_pool_alloc_pages'
>     aarch64-linux-gnu-ld: ravb_main.c:(.text+0x944): undefined reference to `page_pool_alloc_frag'
>     aarch64-linux-gnu-ld: drivers/net/ethernet/renesas/ravb_main.o: in function `ravb_ring_init':
>     ravb_main.c:(.text+0x1d4c): undefined reference to `page_pool_create'
> 
> [...]

Here is the summary with links:
  - [net] ravb: RAVB should select PAGE_POOL
    https://git.kernel.org/netdev/net-next/c/721478fe6a5c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



