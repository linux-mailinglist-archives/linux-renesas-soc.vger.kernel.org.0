Return-Path: <linux-renesas-soc+bounces-29842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI8mDglIu2kliQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 01:49:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 917C62C42E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 01:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8A9631DF0D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 00:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8D623D7CF;
	Thu, 19 Mar 2026 00:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZdA4du1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AED238C1F;
	Thu, 19 Mar 2026 00:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773881077; cv=none; b=pAo08Nn2WWK9TbT0An5+Nz3T03tdsB5mHjnHsk5Y/1hdQV4kgKuAyXPagImJK9Lbb5ePguVYKC7puH9sRPq8HJdpqf8ZPeuT+9ZN8fTIJsc6fZLXeSK+Z694vSlN1ckPVTecT41yThU9LkMcOraJCWovbVuSU/4xjX+1mxwhaa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773881077; c=relaxed/simple;
	bh=GzYi/jrtTlNMK+iHdYJOu1dfREM0Aom7yQwJfnjWg4Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=vEkvUTR2fIZOChbGx0OnEyVWHH91WscSyBpFR0SLf3JNSG8AHW0CBO03COGGkuKSZvBeOHy6sxc/fcBcBJaUnjKVXirU3w1gOrx1/iOlYTI/RdbKaplpeNz2ZkMQHQgSe+MgOAfSA4zIMJgrWyooj3w0iHUAex8Fkkr8ReH9fas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZdA4du1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D50CC19421;
	Thu, 19 Mar 2026 00:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773881077;
	bh=GzYi/jrtTlNMK+iHdYJOu1dfREM0Aom7yQwJfnjWg4Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GZdA4du1hSwVH6gEngWuvUXJLLxvgHfzJoj7LOqqcxRehRV8Oxm75U69uiQPTl5l4
	 lmomRsONz8dRTJ/ri+g+7b06krdM5DntAS9ks7SBRKpB4XX1lhFm54t3l8RkT0dN4A
	 W7viOxlXlUYIJ2BH31tfR6dzQNlLSSfpF9o4KHZQoiYmHnbVDrR/AMHBU3UyCNi+iO
	 95Hl43J3+O8z16eadzrF0wpKSklZqyEak31jqtF9OwImDt3Wd+xtrpNKySJkC24NKm
	 ohkCl7/fwogmRAQR2n/DmK+XC+qIrAQlXsaNoLanyWUIRw6ojFxUAlMPwiGJJMa3im
	 1Hv27hVqUokbQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FA53808200;
	Thu, 19 Mar 2026 00:44:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] dt-bindings: net: micrel: Fix KSZ8041RNLI
 dtbs_check
 warnings
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177388106828.935482.9940657343984545762.git-patchwork-notify@kernel.org>
Date: Thu, 19 Mar 2026 00:44:28 +0000
References: <cover.1773734298.git.geert+renesas@glider.be>
In-Reply-To: <cover.1773734298.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: eichest@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29842-lists,linux-renesas-soc=lfdr.de,netdevbpf];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.959];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 917C62C42E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 17 Mar 2026 09:02:44 +0100 you wrote:
> Hi all,
> 
> "make dtbs_check" reports several warnings due to some KSZ8041RNLI PHY
> nodes having the "micrel,led-mode" property, while the DT bindings
> prohibit this.
> 
> Apparently the DT bindings are incorrect, so this patch series fixes
> that, after a customary cleanup.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] dt-bindings: net: micrel: Sort lists
    https://git.kernel.org/netdev/net-next/c/46906242fe61
  - [v2,2/2] dt-bindings: net: micrel: KSZ8041RNLI supports LED mode
    https://git.kernel.org/netdev/net-next/c/22214fb2fad0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



