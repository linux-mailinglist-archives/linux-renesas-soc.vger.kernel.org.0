Return-Path: <linux-renesas-soc+bounces-176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A58E87F5EED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 13:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D765B1C20D08
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 12:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADB124A03;
	Thu, 23 Nov 2023 12:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m63I7MtK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFDB241E3;
	Thu, 23 Nov 2023 12:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F252C433C8;
	Thu, 23 Nov 2023 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700742022;
	bh=iRPD2oH2xSuu57qfHqlERidU0U3Ghu0S2ZFGpvnJ+D4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m63I7MtKyDGTNTEXOMJCUXdajXL628nKcovkysYgrbmJm8qIM5o7n76ixPiOkgoTE
	 5XyzypyuqduoiZ04FtfBoX1y1xrx0X0IwZt2F3UOvBh4LREoczEOAqkNOIRle83adv
	 f9S27ru92xzjdUfqUGpXbfqk0xptdclQkcsdAInednQ9zJr8eiaB2zF+8t640yPEGE
	 yeYBUr4NwXGGNunQDYPlOAUcho1pMjc02962xD1+u0oYCqUYzKkhcpAA50Gl3suc02
	 DbtHYTivrjXnoxyA0hqNjLOZBpRG4Tpans1v/gMMSnHg07eeoDLYwH9Yzr4N5f6VnR
	 ITMycC+bfR4nA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3554AE00087;
	Thu, 23 Nov 2023 12:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] dt-bindings: net: renesas,ethertsn: Add Ethernet TSN
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170074202221.6988.16476695247838476119.git-patchwork-notify@kernel.org>
Date: Thu, 23 Nov 2023 12:20:22 +0000
References: <20231121183738.656192-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20231121183738.656192-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, geert@linux-m68k.org, devicetree@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 21 Nov 2023 19:37:38 +0100 you wrote:
> Add bindings for Renesas R-Car Ethernet TSN End-station IP. The RTSN
> device provides Ethernet network.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Update patch subject, was "dt-bindings: net: renesas,ethertsn: Add
>   bindings for Ethernet TSN".
> - Add top-level $ref to ethernet-controller.yaml.
> - Rework compatible node to have a fallback, renesas,rcar-gen4-ethertsn.
> - Change compatible value to match renesas style, was
>   renesas,ethertsn-r8a779g0.
> - Change interrupt names from "tx_data", "rx_data" to "tx", "rx".
> - Add missing unevaluatedProperties.
> - Use the generic properties for internal delay tx-internal-delay-ps and
>   rx-internal-delay-ps instead of vendor specific ones.
> 
> [...]

Here is the summary with links:
  - [v2] dt-bindings: net: renesas,ethertsn: Add Ethernet TSN
    https://git.kernel.org/netdev/net-next/c/c5b9f4792ea6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



