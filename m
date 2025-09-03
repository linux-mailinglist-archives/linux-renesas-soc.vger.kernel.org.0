Return-Path: <linux-renesas-soc+bounces-21305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C749B42CE1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 00:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC4341BC7531
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 22:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7732EC0BF;
	Wed,  3 Sep 2025 22:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6RhNx8j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FB42D9485;
	Wed,  3 Sep 2025 22:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756939205; cv=none; b=Mq8H3M3bxbWvFAjUKTxzRktuXDguR1C4QwxHGJ/WRxR81S51pMlKxdIAzSelv2H9JTAWQfXVNeIXMN6po29Qf/hI+84XjvEmGQJKfWaVBQK3vn7xTbaAcai9R1hF9TE0mlfX12gjPHzOwuIxh1jAbLNQixRcuNKlbizW6r3LIqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756939205; c=relaxed/simple;
	bh=vb66h9+AzAw2lQhvhLgXxbLZecvq8uS2NeBKhLSK7Gk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HU0nhMARdDqXUAWv5q/RI5TVh4B63qFR1TYz9XiWBofLjY8K8WSp/YxlRKV8jcWLBvaoLuJaiLqF+tFAKoxMzAhInm9g3s8hT/5D3rWTzL/2HEE4dvNojea+4lz2roM3Z5e00g3dnYmTNtOWENv2xKds2+ClN+71VSjKLY+4jl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6RhNx8j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CC8C4CEF4;
	Wed,  3 Sep 2025 22:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756939204;
	bh=vb66h9+AzAw2lQhvhLgXxbLZecvq8uS2NeBKhLSK7Gk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=N6RhNx8jpRROyDZe+XUWTkfm1JtwHinLea//T8JIUgoujDUDTvV/fzLjeq3NijALK
	 PtjnUz3Ij0I3iRQtKM1m9RNvrnmDApzwbQx3DBMhiX7JOOeUA2urDZkNIxMZ0oPUFO
	 dyITwlOW6DDwDGzF7Y1Kb2xdl1XGQETChSx8ShkWKCZUtOx3IfQYRmjL7smjHE5SSN
	 BGMSgo8qzH9Ebb66sbypzr/QVW4mg4EFBIWBxo7IuTjs+6wjgLR/pK1Xc5pJIcZ0e3
	 gHJccWVPVB72HhNsUbLlqomja6f6Hu/0MWKeb8Qlvpz+7YaPAi7hm1hcRgDfZmvdg/
	 3hHfOr3aaAJpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE77D383C259;
	Wed,  3 Sep 2025 22:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] dt-bindings: net: altr,socfpga-stmmac: Constrain
 interrupts
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175693920948.1224224.17708323821757004154.git-patchwork-notify@kernel.org>
Date: Wed, 03 Sep 2025 22:40:09 +0000
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: matthew.gerlach@altera.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, romain.gantois@bootlin.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  2 Sep 2025 17:40:52 +0200 you wrote:
> STMMAC on SoCFPGA uses exactly one interrupt in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> [...]

Here is the summary with links:
  - [v2,1/2] dt-bindings: net: altr,socfpga-stmmac: Constrain interrupts
    https://git.kernel.org/netdev/net-next/c/f672fcd8e6c4
  - [v2,2/2] dt-bindings: net: renesas,rzn1-gmac: Constrain interrupts
    https://git.kernel.org/netdev/net-next/c/69cd99350740

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



