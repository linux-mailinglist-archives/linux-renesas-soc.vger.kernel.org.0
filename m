Return-Path: <linux-renesas-soc+bounces-11352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A86E9F275E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 00:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 068ED1885685
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Dec 2024 23:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE551C5494;
	Sun, 15 Dec 2024 23:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkHsIFiL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902E51C462C;
	Sun, 15 Dec 2024 23:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734304214; cv=none; b=JIHJ79w10vsyZuRNufMkO0AFmYK8sxY7k2AELYfsDXDGPjeaE2hCeSh84iEIifvV9cUpj7mMWr3sWz9fZB0J4uAZklSRxrzGq+wK0zhpHDBYzrOvGv2mm59u9wsm2ileR2Z231VU0EpCblurqGEKK3+/Zc0YHfvSGAxGsQD84YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734304214; c=relaxed/simple;
	bh=YzPQlIKbyJ6GzWzr9RAVd1jdZO/5cdxHaMoXVbYx2Gc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TXU2dX2MCNWrLJ8k6Ep514O+/AEglR0Ksx1kfkmRzacRVriekkuUwiEO00kWp0+tHI6spTThkACUxppDVxG3h3LNDitIqjEg3Q1U/FG6l4o/zpbB7vny6TsH6PBeu6kgfJHaHya4cqk7unw8hgZe9zOHdxJq5Fr0qqJT+SnARRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkHsIFiL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158A1C4CED4;
	Sun, 15 Dec 2024 23:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734304214;
	bh=YzPQlIKbyJ6GzWzr9RAVd1jdZO/5cdxHaMoXVbYx2Gc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RkHsIFiLYSXEUx42Cv5TxaNRLM4OpQqY14N4QeG0QD3FX1ONQeFLekv5z+i3fbQ27
	 2BoxOj5/YX5/sGJB3TrOAblsZEOPkYk/LvSsJ1EDZU6t1MLv376hDmjzFYDMHfc2/a
	 HFgEjXW0WtF+CzclCfVhlW33ydUotwVde5CyyfzK0VLKMCxCMaaWJRTVa7mnn1CJjF
	 xsTfSfLluwvJidFL/FOl3TvH+GqiZO98KChtaQBG1VHRAwZ+GeuYTH/oflifWzo/IL
	 a7T8e5WHEe7JLaIrTDaZoOMUwfonnEu4Hl/roMCFr7fKYzlZHRb8XhYXvVT1EUN0Bf
	 W355ebtGTRm3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 359483806656;
	Sun, 15 Dec 2024 23:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: renesas: rswitch: rework ts tags management
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173430423099.3600507.2957319591923005123.git-patchwork-notify@kernel.org>
Date: Sun, 15 Dec 2024 23:10:30 +0000
References: <20241212062558.436455-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20241212062558.436455-1-nikita.yoush@cogentembedded.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: yoshihiro.shimoda.uh@renesas.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 geert+renesas@glider.be, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael.dege@renesas.com, christian.mardmoeller@renesas.com,
 dennis.ostermann@renesas.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Dec 2024 11:25:58 +0500 you wrote:
> The existing linked list based implementation of how ts tags are
> assigned and managed is unsafe against concurrency and corner cases:
> - element addition in tx processing can race against element removal
>   in ts queue completion,
> - element removal in ts queue completion can race against element
>   removal in device close,
> - if a large number of frames gets added to tx queue without ts queue
>   completions in between, elements with duplicate tag values can get
>   added.
> 
> [...]

Here is the summary with links:
  - [net] net: renesas: rswitch: rework ts tags management
    https://git.kernel.org/netdev/net/c/922b4b955a03

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



