Return-Path: <linux-renesas-soc+bounces-23596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 629A9C088C6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 04:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 388371C2267C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 02:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418F726D4F7;
	Sat, 25 Oct 2025 02:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQ6580lb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176F426B762;
	Sat, 25 Oct 2025 02:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761358264; cv=none; b=Yu6MJ4CBHyMxUiQXLlbXjfsGrrBiCqdk25rhu7uTainGY8i6NQMA5br1m5m9Mr2ApDfPGX1EabloICFvTTfC89mXyYJBWmvNCF68yDQdir9yn/kJ0xYkcYrw6+Tl144PUvHI9EUEBb8rxGSUMYdOzzhkln0t+0vOFonot08sl2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761358264; c=relaxed/simple;
	bh=C+fePlO9hnUYH7CcIHOpRSLZRmhQNTI0YSFSBM7Aek4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Imih++k9e0gTxislpMNUNLBRupKO5JfkThjqOg03QWxU7V4h2lbP5aSgpslLD+S3QiNPIryqrXD60IDWGi5Z+mQpNQzPth83KiOSJyCpSeCK6PI4ukl2I+l1jqf8KByd661FAwHoxrmPeO7qPxDand5JdO9SRVbV3zAzwevQ8MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQ6580lb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930E5C4CEF5;
	Sat, 25 Oct 2025 02:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761358263;
	bh=C+fePlO9hnUYH7CcIHOpRSLZRmhQNTI0YSFSBM7Aek4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PQ6580lb+QwqIay7/+M+BB6gMknqCs23u5c9ZoxNet2vCIJaE/eN62r3TA97AAtRu
	 ZgZ+emkVS/JT5XozbL0hK/taqGrVdX4X8G4s4gSJStHSWjU7XAjQGWH/H3hsa0BMaZ
	 p21lPhwYelOTz1Ulr7UufNnWGqumioA5RdTnBPORHHer/h/WxRyggywOAUOecB7GgW
	 uT0XWN4xkcWGFPaQXHXQoM3JRShHIBiFyycSql1KpPQgviI32EGRhJEWeEfA+CaHVu
	 BZWOZpSOa92wtvIwiZ5Aju8kfgdXfzK9uDcE0k+xsdGzrsaTBxNkmErxz/2Fb0MtVA
	 +XbfTPVZ9Drzg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70ECC380AA59;
	Sat, 25 Oct 2025 02:10:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/2] net: ravb: Fix SoC-specific configuration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176135824299.4124588.1034559849793895351.git-patchwork-notify@kernel.org>
Date: Sat, 25 Oct 2025 02:10:42 +0000
References: <20251023112111.215198-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251023112111.215198-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: niklas.soderlund@ragnatech.se, paul@pbarker.dev, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 23 Oct 2025 12:21:09 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This series addresses several issues in the Renesas Ethernet AVB (ravb)
> driver related to SoC-specific resource configuration.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] net: ravb: Make DBAT entry count configurable per-SoC
    https://git.kernel.org/netdev/net-next/c/9078e6c5f1de
  - [net-next,v3,2/2] net: ravb: Allocate correct number of queues based on SoC support
    https://git.kernel.org/netdev/net-next/c/3912e804ff6a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



