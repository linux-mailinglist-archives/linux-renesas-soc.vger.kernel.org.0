Return-Path: <linux-renesas-soc+bounces-24293-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B88C3E299
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 02:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20B593AC603
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 01:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7408E2EC097;
	Fri,  7 Nov 2025 01:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afxGjvyD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CF820C037;
	Fri,  7 Nov 2025 01:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762480242; cv=none; b=LQSDBPU7tup/zGivPLTZbMZ5KWDSh+xJh5IZ2Vw4/TbpgaPVKSBL18YhfGw1iIPr2YrQ8fygm7t5+Z8y8CRF4jgWTS71CYJ4hYtDyyajyzs4CKZWhh0c8utCjNMyue7+xIQu3ieMmlOUSEzpJDJSqmQPi/bP5XK+CZ8wWBPxTps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762480242; c=relaxed/simple;
	bh=Xq51Z/9D2fZDatgMXKL0KxpS0FoLycB7VoFYeF3j0NQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=a0f2dTIWP7V5YNweYCnyLr4Lg5qW1m2jRQLfHcZwFDdjuwdN1hr+sTv733RDzwcntseFLd+kUp5ADVoHj03mkY+sBQbZNy5oHGhHJ9eVxxwpDcUdXzxfNe22G1BTW+G2qrQQW4ZrUMwGZqJh2wZxq2soV9BI2FoPvvFbOMiNDRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afxGjvyD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C40C4CEF7;
	Fri,  7 Nov 2025 01:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762480241;
	bh=Xq51Z/9D2fZDatgMXKL0KxpS0FoLycB7VoFYeF3j0NQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=afxGjvyDQkcynlOHFmuYaA8bA0ELkiZO3OVHeiI/ZLaV8Evb1QgXFOF/OjvpUirpI
	 VkSjiHKXJNqt1SnlNx5z+VeRALHg6Pf4sZTaQlyncsjgUoW5Su7Hp+9CdrOxAPoKDb
	 gIEc6auI/rkDePtrCvDlxcyR6M80MbbYQNy9KhffhJG3Bi/ICodlsn7aKaq/DCcUfo
	 OtEL7kj1eMp2NUbqVZFKvf1oe3xmKKUMMe0x7EPs4MNIVpm0psL7xvMd6ADdrtso7O
	 UKwGUbLeKyE2bBc9OehxwgahyYK0llr8eM34Lvg01KG1jQJYzNS6zj8wrv/nLDRr7V
	 ZmsQL344pMLDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDA539EF976;
	Fri,  7 Nov 2025 01:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next,v2 0/7] net: renesas: Cleanup usage of gPTP flags
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176248021450.451816.5444160112650392345.git-patchwork-notify@kernel.org>
Date: Fri, 07 Nov 2025 01:50:14 +0000
References: <20251104222420.882731-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251104222420.882731-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: paul@pbarker.dev, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
 magnus.damm@gmail.com, richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  4 Nov 2025 23:24:13 +0100 you wrote:
> Hello,
> 
> This series aim is to prepare for future work that will enable the use
> of gPTP on R-Car RAVB on Gen4. Currently RAVB have a dedicated gPTP
> implementation supported on Gen2 and Gen3 (ravb_ptp.c). For Gen4 a new
> implementation that is already upstream (rcar_gen4_ptp.c) and used by
> other Gen4 devices such as RTSN and RSWITCH is needed.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/7] net: rswitch: Move definition of S4 gPTP offset
    https://git.kernel.org/netdev/net-next/c/e98d8792929d
  - [net-next,v2,2/7] net: rcar_gen4_ptp: Move control fields to users
    https://git.kernel.org/netdev/net-next/c/50ab1c6becde
  - [net-next,v2,3/7] net: rswitch: Use common defines for time stamping control
    https://git.kernel.org/netdev/net-next/c/b314e4f7a9d9
  - [net-next,v2,4/7] net: rtsn: Use common defines for time stamping control
    https://git.kernel.org/netdev/net-next/c/e43791f40b81
  - [net-next,v2,5/7] net: rcar_gen4_ptp: Remove unused defines
    https://git.kernel.org/netdev/net-next/c/3614d249d1da
  - [net-next,v2,6/7] net: ravb: Break out Rx hardware timestamping
    https://git.kernel.org/netdev/net-next/c/5ce97b8d6132
  - [net-next,v2,7/7] net: ravb: Use common defines for time stamping control
    https://git.kernel.org/netdev/net-next/c/16e2e6cf75e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



