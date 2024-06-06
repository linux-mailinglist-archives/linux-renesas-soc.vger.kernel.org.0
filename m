Return-Path: <linux-renesas-soc+bounces-5903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EFE8FE0C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 10:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05F141C24754
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 08:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05AA13A868;
	Thu,  6 Jun 2024 08:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDNe2zSc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739001C6A5;
	Thu,  6 Jun 2024 08:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717662032; cv=none; b=oD+VGjgCY0yJoG10HjmCPdTHh/quoD1x/C1dbMvEhOwdnX+aMYRgb7xc1xlwNfB0VfObRGFXaVMBrMMfwJUcqmYNyfhUvt84tXrToi6XCOOIsEeiBoMnRmJ7rO4G+BBLLfKQIaiFLLn53lMXZFhoCdABKRfR1UL77hPkhbcfvc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717662032; c=relaxed/simple;
	bh=bfxpRNZtKe1C4PHdEOcPjLmS2P7p3xcUsikhdkzmyzs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YcoehZVqAUA79lQS3D6zfIzFXFzf31XwIt3OdpmdEJ0mYrUN5cbDV1RYmZ3L0pq/BoPxSLXTbEK9oJm6S3RqupymtFcOXgsVLlqOEA3vKAr6i9FYoVa3FNe7jX5gceD8PB5RO5xlG/D9DHx1uLTuZN2DijxgS57Pgw/5aa0RfbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDNe2zSc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E724DC3277B;
	Thu,  6 Jun 2024 08:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717662032;
	bh=bfxpRNZtKe1C4PHdEOcPjLmS2P7p3xcUsikhdkzmyzs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JDNe2zSc0rdLpRlN+FzJcC3yr3R4SE0AqC479sCIzvesJUqNU8S9NI0XcMKGfVbQ4
	 p8ezja60MVYKlHFl3dfqrkIpBP5Ksu8Da9llP+v/v3g8Ld9kpQUxHWUDoWsA6JrNrm
	 LDEtd3jYMELFISCjkwbFS6q4fJG+FKSLFwKwflREkoUn+fF/c0A//dU3Sfm3hby8uA
	 l4Nv459BgBBI/HcW5i9PwRXkJ+C2ZcmKNfAezNCTg/6X5K7aXm0Sk0vUR2njCEN6gD
	 z2/FfL6cZnXxIRoPJnpWxJWMCMMIh9Z/1zWm4pt14QHloeLo6uLRfYVif8MAYOzr9T
	 fFIihuKAZFAAQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D29C1D2039D;
	Thu,  6 Jun 2024 08:20:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next PATCH v5 0/7] Improve GbEth performance on Renesas RZ/G2L
 and related SoCs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171766203185.3557.7483807066243458681.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jun 2024 08:20:31 +0000
References: <20240604072825.7490-1-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240604072825.7490-1-paul.barker.ct@bp.renesas.com>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, niklas.soderlund+renesas@ragnatech.se,
 horms@kernel.org, biju.das.jz@bp.renesas.com,
 claudiu.beznea.uj@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue,  4 Jun 2024 08:28:18 +0100 you wrote:
> This series aims to improve performance of the GbEth IP in the Renesas
> RZ/G2L SoC family and the RZ/G3S SoC, which use the ravb driver. Along
> the way, we do some refactoring and ensure that napi_complete_done() is
> used in accordance with the NAPI documentation for both GbEth and R-Car
> code paths.
> 
> Much of the performance improvement comes from enabling SW IRQ
> Coalescing for all SoCs using the GbEth IP, and NAPI Threaded mode for
> single core SoCs using the GbEth IP. These can be enabled/disabled at
> runtime via sysfs, but our goal is to set sensible defaults which get
> good performance on the affected SoCs.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/7] net: ravb: Simplify poll & receive functions
    https://git.kernel.org/netdev/net-next/c/118e640af30c
  - [net-next,v5,2/7] net: ravb: Align poll function with NAPI docs
    https://git.kernel.org/netdev/net-next/c/b0e0e20dc60e
  - [net-next,v5,3/7] net: ravb: Refactor RX ring refill
    https://git.kernel.org/netdev/net-next/c/37a01c12e9e8
  - [net-next,v5,4/7] net: ravb: Refactor GbEth RX code path
    https://git.kernel.org/netdev/net-next/c/3ee43f09cb2c
  - [net-next,v5,5/7] net: ravb: Enable SW IRQ Coalescing for GbEth
    https://git.kernel.org/netdev/net-next/c/7b39c1814ce3
  - [net-next,v5,6/7] net: ravb: Use NAPI threaded mode on 1-core CPUs with GbEth IP
    https://git.kernel.org/netdev/net-next/c/65c482bc226a
  - [net-next,v5,7/7] net: ravb: Allocate RX buffers via page pool
    https://git.kernel.org/netdev/net-next/c/966726324b7b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



