Return-Path: <linux-renesas-soc+bounces-19388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E94CDAFCF6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 17:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4EBE7A5E05
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 15:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7913C2E06D2;
	Tue,  8 Jul 2025 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7WxHPgG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49831261595;
	Tue,  8 Jul 2025 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751989183; cv=none; b=AXrlJ/K9eifMbeQYrkRyd6WNWt1Qhqw92gqChbIg9n0eQfCt6qZ/pQJV4TO/ckLqITTAD6GtloFjwHgNVqjV//LEAA4JHCjudcrMUqziqv95sbR4pI6Pmc6lSB78TASmgQixxp5cfeGbhJ7LKWmq+DmY7WNOSancmAKxN7+ZCQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751989183; c=relaxed/simple;
	bh=3uJaLMDGxq7dEIsrm2iuxqbE/biEgPL0woqTvJAxdqs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fMC7xJ3KhmdlZHFE8D3t+B/vgC8+FrBqYTRW4NDbTN6NL9M+1wOJvQRXkTNkWwxzyBUdl2+wsJOoOt6jpPySqRoGWXx8ZDxigW0klT09h5YnKMwrrAGrcABIihE6/Ff6TrRGDt/DG4tg5c0b19iuET1oX5tj6P9oMX2yKWVxKCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7WxHPgG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9AFC4CEF9;
	Tue,  8 Jul 2025 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751989182;
	bh=3uJaLMDGxq7dEIsrm2iuxqbE/biEgPL0woqTvJAxdqs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=M7WxHPgGke5vGo5mIjMVRSDpsiFORtah5Y+YXENqW0HFFi9U4+UlFosXLuhQU+bXM
	 52EFVgtOdkqBIpvkvdeVbNsHonIx4XCGbmGnL99C/EOaVAOtKHSwQXXHoW5Sjjjduh
	 uPiY+9Nay8A7EXLVSMIikkqgl2JDwg0Dn6HW4HNMvBsGB60Rnwc1nT9WHdBfr5ognM
	 N3x1qxPwNxFp5WZvK8umJ53oWNML4FatXIbwOa+3/roqb+Jf6lnonE0Sl1CxsdLiZz
	 fF4+1HBA12L9uwBz5TEzgEQtFlRPM/Nen05RDx5PK+Vl1PB4l1EYN6XUO/Y354ThNT
	 tYFV432lO7WNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB153380DBEE;
	Tue,  8 Jul 2025 15:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: ethernet: rtsn: Fix a null pointer dereference in
 rtsn_probe()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175198920590.4109948.2039600149085241168.git-patchwork-notify@kernel.org>
Date: Tue, 08 Jul 2025 15:40:05 +0000
References: <20250703100109.2541018-1-haoxiang_li2024@163.com>
In-Reply-To: <20250703100109.2541018-1-haoxiang_li2024@163.com>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: niklas.soderlund@ragnatech.se, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  3 Jul 2025 18:01:09 +0800 you wrote:
> Add check for the return value of rcar_gen4_ptp_alloc()
> to prevent potential null pointer dereference.
> 
> Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> 
> [...]

Here is the summary with links:
  - [v2] net: ethernet: rtsn: Fix a null pointer dereference in rtsn_probe()
    https://git.kernel.org/netdev/net/c/95a234f6affb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



