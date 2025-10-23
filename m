Return-Path: <linux-renesas-soc+bounces-23454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 422DABFF080
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 05:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D5F9189578F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 03:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C08221FCF;
	Thu, 23 Oct 2025 03:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="keiTn97A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2FF26290;
	Thu, 23 Oct 2025 03:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761191182; cv=none; b=QUWbR44bG96Bumj+M7SyWVEqMZAi0dIUuw3TCo/6lpPKmBpFHBySvvQqhf6yCNtkTtLH49HRbX27osF0PC9gujqULmpf+ErUs3RLqqlxHKZLpA67l4cRUAX7wTZJUNba33tQ6C9bMXI5RXh6rJvHIFQuuCHVrNTmfLU4w2VlQ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761191182; c=relaxed/simple;
	bh=GdCibJvtuTRMiV7L0zjAW0Jnxh9es9ba4KecbvOdUhc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Vzl61QY4jH3ucwT6473Eo+V4cFa7bG07szMZrCQ7KqNPNbS1moPaTPaFs3gI2VcP3+jZUaUM8Gc9KvInmesgvogHzwmgn1qHPPY4yfnYeAXk6XvXLD4i8kNQrNrvGuMw9pgLNEtJgCAmSU1KAv1/onV6dtYmUa52nLfu7xJCgK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=keiTn97A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493CDC4CEE7;
	Thu, 23 Oct 2025 03:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761191180;
	bh=GdCibJvtuTRMiV7L0zjAW0Jnxh9es9ba4KecbvOdUhc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=keiTn97Ajzj/FfKg/YHHtQyv0Pbw0WLoOlqSHK68ESE1cifevpCkXeyaS4ARpRIYu
	 diNx6lragK2CrXXvvCbLtRvyOQfyextC3IRDMSyo2oKu9JGZei3G1ES5gXHt+ddj3c
	 zYpUPn5qON4UT7T6D2YqXj+Od33lb3CIP6Wp39XPM6+eae8oBrpsP8O41w6M6mqi0h
	 9OWPgv9S9bMLCgIJzs9d16OgUEGzPztuKYIBIRROE7Rbi+6LvpKP/avlGYwTsRjQwF
	 zZhM8Nq61FS5NHUFINYMIvr5b8Sd1O1+C4bDdw4JqA2gi1BVPpJ1gCjCIZ8gJIuvDk
	 WEhW2/LkIY2LQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33EDA3809A04;
	Thu, 23 Oct 2025 03:46:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] net: ravb: Fix SoC-specific configuration and
 descriptor handling issues
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176119116074.2145463.12912329630398549835.git-patchwork-notify@kernel.org>
Date: Thu, 23 Oct 2025 03:46:00 +0000
References: <20251017151830.171062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251017151830.171062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad@codeaurora.org, Prabhakar <prabhakar.csengg@gmail.com>
Cc: niklas.soderlund@ragnatech.se, paul@pbarker.dev, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 geert+renesas@glider.be, mitsuhiro.kimura.kc@renesas.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 17 Oct 2025 16:18:26 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi all,
> 
> This series addresses several issues in the Renesas Ethernet AVB (ravb)
> driver related to SoC-specific resource configuration and descriptor
> ordering.
> 
> [...]

Here is the summary with links:
  - [v2,1/4] net: ravb: Make DBAT entry count configurable per-SoC
    (no matching commit)
  - [v2,2/4] net: ravb: Allocate correct number of queues based on SoC support
    (no matching commit)
  - [v2,3/4] net: ravb: Enforce descriptor type ordering
    https://git.kernel.org/netdev/net/c/5370c31e84b0
  - [v2,4/4] net: ravb: Ensure memory write completes before ringing TX doorbell
    https://git.kernel.org/netdev/net/c/706136c57236

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



