Return-Path: <linux-renesas-soc+bounces-7961-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6843959095
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 00:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91B501F220FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 22:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1A01C8235;
	Tue, 20 Aug 2024 22:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zif5NnJE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187961C7B7D;
	Tue, 20 Aug 2024 22:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724193632; cv=none; b=eoDwQzIMTaqvLVQFfKIjepjXFEDKWHnNnOeoAcbuAHmbXVv+KR/IiCOJTalFr3MKMRhFXPV5N6ZpXiH7t1Dmz05zMgxPanwZR7LeqpUHhCdMgatWXKOv+eahl/KGnD4JyeOhzKbEgXTxmB1LdbBSe5j2ksiBQUxrLSfWoEKiFOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724193632; c=relaxed/simple;
	bh=Z2W8i0+0KtSrExfZq0x4rSOeJ1fGjcgaUp6rqgGlQi8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TsAq/3emb3qZjkeIN+ftLqhtecEbB5t5kIUu6aLeOANoJzPuBwk0Qo+nRMUm5I9nGDIYDX9g+KG6JA+eUMgq2CEylAYp3f4/v5XVIQbtl3JRuHdWs/agz96N/ylhS/CBbr9ifBvukl5sNJfr59xjLH65q8Nn0GCgbv6SDOuNcEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zif5NnJE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74888C4AF09;
	Tue, 20 Aug 2024 22:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724193631;
	bh=Z2W8i0+0KtSrExfZq0x4rSOeJ1fGjcgaUp6rqgGlQi8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Zif5NnJEKiX1L45h590kjBXasecw2a9F+fYvoXTpMtZ7Jtn7mljcwoOX8g4shLp1J
	 E6EJW+GtRVG2ohvMnOzrsUpb3Ys7NLCRQLTWCFnAw1DyZFMqRvOWQCemvRgX/qlkFT
	 8fdvtHncCXi6W98SWPy+1LYjhwDbpcF25ZuaNUwkr6KQLPMFNyWSHT9wJaSLVqMXvn
	 5WjvIOa4jo/HgsRf3w15fzwcZx/+E2ivOxliJnxJZOj8aNm6y/+fGTTuI+kuqQ8UzO
	 iYLHb9K843Adjd0JRMvlTeyeFswNuBZ06EbN/LMcT9Pmu2Xn03Sj4XBb1XDg5bwM0s
	 Gpp6ywERsBFZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 342ED3804CAE;
	Tue, 20 Aug 2024 22:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: mediatek,net: narrow
 interrupts per variants
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172419363004.1257878.11782803911296798283.git-patchwork-notify@kernel.org>
Date: Tue, 20 Aug 2024 22:40:30 +0000
References: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 s.shtylyov@omp.ru, hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, lorenzo@kernel.org,
 nbd@nbd.name, sergei.shtylyov@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 18 Aug 2024 19:29:02 +0200 you wrote:
> Each variable-length property like interrupts must have fixed
> constraints on number of items for given variant in binding.  The
> clauses in "if:then:" block should define both limits: upper and lower.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - [net-next,1/4] dt-bindings: net: mediatek,net: narrow interrupts per variants
    https://git.kernel.org/netdev/net-next/c/55da77dec1be
  - [net-next,2/4] dt-bindings: net: mediatek,net: add top-level constraints
    https://git.kernel.org/netdev/net-next/c/06ab21c3cb6e
  - [net-next,3/4] dt-bindings: net: renesas,etheravb: add top-level constraints
    https://git.kernel.org/netdev/net-next/c/70d16e13368c
  - [net-next,4/4] dt-bindings: net: socionext,uniphier-ave4: add top-level constraints
    https://git.kernel.org/netdev/net-next/c/2862c9349d5d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



