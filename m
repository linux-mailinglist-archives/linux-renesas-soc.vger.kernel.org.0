Return-Path: <linux-renesas-soc+bounces-4753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A64488AC6C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 10:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BC6E1F216B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 08:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD105502B4;
	Mon, 22 Apr 2024 08:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLoWmC7X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994BE50246
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 08:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713774047; cv=none; b=k6duTLhVUPIbK40d3VVigo/3l/iB9I/QySFyf/5vrsodwt0xutNPTgxXoxwg5gylI07SagLjFavHIjFwppnrRM4bpJzuQ0sBcSPyTgBuEHrqj2Ks2HQKwY+sGQF6LLupSzHj3UZ2rlgVC9Haw/ACk41a5emV7HUE+bcRxMPFNXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713774047; c=relaxed/simple;
	bh=dZFn+1dEDGdLOYAQ8w3UtozsZkQt3gyZt5JPBG3mr5c=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=DGXKMHZja2OWwWlQNGqJ5YmqLmH/8t+x38895yt1UkV5AjSpHZtQ2Mc1ARZXDkNMxmaWZOTJfj9MoS9uwvIJtNMUffzg/vZk2Dny18XtE9jlYD3Cg8TMujk+FJy9wsz9j8X7et9K6nPPz4nNBkkz81mcbhzy3odNzktqB2BG444=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLoWmC7X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28F43C113CC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713774047;
	bh=dZFn+1dEDGdLOYAQ8w3UtozsZkQt3gyZt5JPBG3mr5c=;
	h=Subject:From:Date:To:From;
	b=WLoWmC7XTKncAEMayGFHC2hZOPQV6nSl5MQKsqjgFixm6GnPDbvKjYv6NRJBD8CmD
	 d9bvtBwA5L0AuFdbw2xUZv7XkzNbHUedhWiYF8iN5zXROw3OEwOJFgg0QWTyXz2gEo
	 TWvG7BEbDYvCelsR2fruTDjAOfiPGYESwSQDXRAj96lhsCkKSgcOoY9APbKWz/D287
	 p5TK3rAstFdY60mUlvuJbdnc9Bh3K8+7KsZozuPbLx0PCq+E74yjMfmR+DwbP2M7ob
	 cPFbDwsyHV3hUw7tiHuVQG7f6NirPJ+XXk6YpEvI6lTXO8Qd8OB56K0LqJXbZRdOa5
	 CY+EoyUi8mniw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1C565C4339F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 08:20:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <171377404704.21182.5760306475414159398.git-patchwork-summary@kernel.org>
Date: Mon, 22 Apr 2024 08:20:47 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: ravb Ethernet driver bugfixes
  Submitter: Paul Barker <paul.barker.ct@bp.renesas.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=845023
  Lore link: https://lore.kernel.org/r/20240416120254.2620-1-paul.barker.ct@bp.renesas.com
    Patches: [net,v3,1/4] net: ravb: Count packets instead of descriptors in R-Car RX path
             [net,v3,2/4] net: ravb: Allow RX loop to move past DMA mapping errors
             [net,v3,3/4] net: ravb: Fix GbEth jumbo packet RX checksum handling
             [net,v3,4/4] net: ravb: Fix RX byte accounting for jumbo packets

Patch: arm64: dts: renesas: rzg3s-smarc-som: Enable eMMC by default
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=845410
  Lore link: https://lore.kernel.org/r/20240417112003.428348-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: Add IAX45 support for RZ/Five SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=841218
  Lore link: https://lore.kernel.org/r/20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/5] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/Five SoC
             [v2,3/5] riscv: dts: renesas: r9a07g043f: Add IRQC node to RZ/Five SoC DTSI
             [v2,4/5] arm64: dts: renesas: r9a07g043: Move interrupt-parent property to common DTSI
             [v2,5/5] riscv: dts: renesas: rzfive-smarc-som: Drop deleting interrupt properties from ETH0/1 nodes


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



