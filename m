Return-Path: <linux-renesas-soc+bounces-21887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61982B58B52
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 03:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 810731B27AB6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 01:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4761B2222AA;
	Tue, 16 Sep 2025 01:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbjgEDhp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCD61DFDA1;
	Tue, 16 Sep 2025 01:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757986817; cv=none; b=Nl22CJsameJap4WTFPfmHHb3A1KWJlv8Hfg5MnZagjWqOVVT5Utt7xNW5AQJdp7Qo/HfAmEcfiM6c8D60VL9UNs6U8KA3Dx/8h+fH3kISt2Cv5VWiyfxxWuzfiIGGDlggu2wQZ6dNxIp+R7NeG3VFomwVNsEBvmTjPXk7M0XIV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757986817; c=relaxed/simple;
	bh=3kpxLji/xRcRxJxLCAlMf/+ZIeRWsZRmmpAJjEZdb34=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DmdCOKD+CYocFH6uKCmAwpKs2Kgds7E/2PXzXGuu6oqEpVU+l5XQWRhhx/TCpROLhMDYvsvAsuQ6CYCv7+AFj//+ddxLA4dLMyDL8mkS4LDGZ07gSp0p6Hb4XD1G9VT/ZwlwTCn9NBBT6dHO8d13p/VheOUrw91eiY/i+wVOoLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbjgEDhp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DDDC4CEF5;
	Tue, 16 Sep 2025 01:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757986816;
	bh=3kpxLji/xRcRxJxLCAlMf/+ZIeRWsZRmmpAJjEZdb34=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dbjgEDhpot6JXVL47LDWz2F9FKbcoHcgVLhSTwNiJbGN9LTTSRgmHYzpB9k7YzbTX
	 0m5uUqSt/EbN6xdUlTW9xoTekRM6boS/uVFSkY9Mt7zpa2CeuK+KpRz8SKsI37FxKF
	 R0zTBgDYjLGqzOZofi3iK3hhAMEYd3Sqygg+FxEBzSE5ROtIMhhkDUX+1H20eOCJ6e
	 u/hMprHaMQ7AkPQVFUHDt1LXX40Xn/fgbFvNMixqcrq75l0CLFUMMEQA9NRleK7+Kj
	 nECaz4S7QnqGnaTas8E94OM1drJsgR80Mt9nVC+DL6KyIWe75FxApUKjLR2JFEU9Ci
	 /yKhnuM21TFtg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D3939D0C17;
	Tue, 16 Sep 2025 01:40:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next,v2] net: ravb: Fix -Wmaybe-uninitialized warning
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175798681799.561918.2218938223734656047.git-patchwork-notify@kernel.org>
Date: Tue, 16 Sep 2025 01:40:17 +0000
References: <20250913133229.2087822-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250913133229.2087822-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: paul@pbarker.dev, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 przemyslaw.kitszel@intel.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 13 Sep 2025 15:32:29 +0200 you wrote:
> Fix a -Wmaybe-uninitialized warning by initializing the variable to
> NULL. The warning is bogus and should not happen, but fixing it allows
> running the check on the driver to catch potential future problems.
> 
>   $ make CFLAGS_ravb_main.o=-Wmaybe-uninitialized
> 
>   In function 'ravb_rx_csum_gbeth',
>       inlined from 'ravb_rx_gbeth' at .../linux/drivers/net/ethernet/renesas/ravb_main.c:923:6:
>   .../linux/drivers/net/ethernet/renesas/ravb_main.c:765:25: error: 'skb' may be used uninitialized [-Werror=maybe-uninitialized]
>     765 |         if (unlikely(skb->len < csum_len))
>         |                      ~~~^~~~~
>   .../linux/include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
>      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>         |                                             ^
>   .../linux/drivers/net/ethernet/renesas/ravb_main.c: In function 'ravb_rx_gbeth':
>   .../linux/drivers/net/ethernet/renesas/ravb_main.c:806:25: note: 'skb' was declared here
>     806 |         struct sk_buff *skb;
>         |                         ^~~
>   cc1: all warnings being treated as errors
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: ravb: Fix -Wmaybe-uninitialized warning
    https://git.kernel.org/netdev/net-next/c/05c05d14d95f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



