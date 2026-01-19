Return-Path: <linux-renesas-soc+bounces-27047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 302D2D3ABF7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 15:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8FC03040BAA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 14:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377CE37C0F0;
	Mon, 19 Jan 2026 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6jamMd4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DFA37BE7E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832696; cv=none; b=oKeRp4E86XfWD6DoJL1ggYnYt62KMFKaMJSNHpHlcuh92BbAXhtNQo6s0UAX7VKzfMfHTObAJyT4z+J3POI6ZoC1SkUX+BN3KD8tBihb0dhRf1er+vs7SC2ciFR+5WeREFnyIW+Nd+ngFIt9RbD9ucSWYGdV4cumpHoAIoNulEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832696; c=relaxed/simple;
	bh=9kLnJHBpne2891DdEPoyhbjvuay1mdtqo+YzKVstwlQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Y7Aeh677aNZUKkIoJ5mIDrpfnkXPDqv3RiOizTTO4TCAwXBAo/cFJJJYWt/gyeochVJclKUhq6MAl+FjD+dtZfk1ZWTXSZoygMJNTYFSlsTFKgNKJqnTyA4PUmgWJNCX6rybmXmVHRLcsDtSRMvcZU456RsTcCJ/B4958EmUG9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6jamMd4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7B6C116C6;
	Mon, 19 Jan 2026 14:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768832695;
	bh=9kLnJHBpne2891DdEPoyhbjvuay1mdtqo+YzKVstwlQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=R6jamMd4+CQe5SUkc6mNBELdpffvqL0sViD3g9nwHKhLUhnomtTCyLeaFrExBDymB
	 NlpEBkhCUQi8jfG73YXwgtGHjDIYNP6sXfAK5GCYDMU6P+kKt+yVDZ7gT209TJ+yD0
	 z7epdeXjsG6q17nfMYdeyFedDmeC6zWqBu46W/WT03H7v+C2gdqrtk5RQofdTSo7lF
	 JkC7lRiX8sY/8PnmfADKVF8qwH+GyKf9wMKka5q7R+fpD893Igbv7XaTXuPJK29Yij
	 Z/lC8u9JTM/SYsPIJvA9ej9E9II41DIdsMisE6M9yOFVPDScfHuJp9zddL64udtTwP
	 jXMXSBtYcqLEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5B373A55FAF;
	Mon, 19 Jan 2026 14:21:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] riscv: Fix missing select CACHEMAINT_FOR_DMA
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <176883248553.1426077.13963011396978260082.git-patchwork-notify@kernel.org>
Date: Mon, 19 Jan 2026 14:21:25 +0000
References: <20251210160047.201379-1-Jonathan.Cameron@huawei.com>
In-Reply-To: <20251210160047.201379-1-Jonathan.Cameron@huawei.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, paul@pgazz.com,
 fazilyildiran@gmail.com, linux-renesas-soc@vger.kernel.org,
 linuxarm@huawei.com, arnd@arndb.de

Hello:

This series was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Wed, 10 Dec 2025 16:00:45 +0000 you wrote:
> The drivers/cache/Kconfig menu was changed to a menuconfig so as to be able
> to hide the menu for non RISCV. The select of drivers under the original
> menu were broken as the menuconfig itself could be disabled.  Fix this by
> adding SELECT CACHEMAINT_FOR_DMA alongside the driver specific symbol
> selects.
> 
> Jonathan Cameron (2):
>   riscv: ERRATA_STARFIVE_JH7100: Fix missing dependency on new
>     CONFIG_CACHEMAINT_FOR_DMA
>   soc: renesas: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: ERRATA_STARFIVE_JH7100: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA
    https://git.kernel.org/riscv/c/521cadb4b69e
  - [2/2] soc: renesas: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA
    https://git.kernel.org/riscv/c/8fdc61faa730

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



