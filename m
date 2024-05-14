Return-Path: <linux-renesas-soc+bounces-5353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A81A8C4A82
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2024 02:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A10E1F234E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2024 00:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D308CEC5;
	Tue, 14 May 2024 00:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3R/oS7C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF84625;
	Tue, 14 May 2024 00:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715647231; cv=none; b=XmfdmvTjVHyz/aCCSuHx/pnhLqQul8gsYb/YcbDUpKIgmilnyl/M0qzf2nEdnw9cyzV3RtoQxLkVFE8T+qQRWjBF9S8RWpMJq2dAApaEl1A3ogRytZPY+ldEP+8TecQ+gCm4GdCZyBMghKcdYm6eK6+q8LYrYTzEIyWBc02IXsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715647231; c=relaxed/simple;
	bh=93n0YB5LyuStAJQCV97FzZlYnXBJBJnFNuQFhpwqgUg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nggKxZP6AuYhMLNNrWoFDBiXd/GhRGC1HToNsop9Q6aNQ1qi/36EttPZVWkd81oskdGuvEPYndqKgUTDroces/zwZAiXs0ev/treJ7NpD4oUMdQ4nGlQ0MfvDfgqtxlggW1cFLxNiDRdWIaO2z1B/yduMHB7GHncz1h34Ixmh2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3R/oS7C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E908AC32781;
	Tue, 14 May 2024 00:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715647231;
	bh=93n0YB5LyuStAJQCV97FzZlYnXBJBJnFNuQFhpwqgUg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Y3R/oS7CelvSJjiGRbUYW0K3tTmD6WxGxsVSkpWnpXYoAOjcKZl4btM0HUThza2le
	 hcwU2XonmUY5W5XsN4x0lYg50gj5wBh8Q3NxemDvgrn/6Gp/3F3NSuHdCNPAdbU2Ot
	 YXCeFiZSRhqzxXa4kfQAEQEL0pAHY0fT/fNXlq/0TOpwLUqOHRDGFj08xaBYrZ2eBc
	 yJgAWLD6nztNlG2kGwIF1MjF36GE5cMmYVGdTVdfuHy6KQ+lRNimUYmjv/mbygHnWO
	 T4xQ2Gl5nP/coZ9Ys/E8UDB6eRhFN0nksAP7aNr6uwYjr8CF8wLkRK3zSU2YYI9rf9
	 reY0tk1AOa/+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D5F95C43443;
	Tue, 14 May 2024 00:40:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v7 0/7] net: stmmac: Add support for RZN1 GMAC
 devices
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171564723087.24946.4336582223559029417.git-patchwork-notify@kernel.org>
Date: Tue, 14 May 2024 00:40:30 +0000
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
In-Reply-To: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, linux@armlinux.org.uk, clement.leger@bootlin.com,
 fancer.lancer@gmail.com, thomas.petazzoni@bootlin.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 13 May 2024 09:25:11 +0200 you wrote:
> Hello everyone,
> 
> This is version seven of my series that adds support for a Gigabit Ethernet
> controller featured in the Renesas r9a06g032 SoC, of the RZ/N1 family. This
> GMAC device is based on a Synopsys IP and is compatible with the stmmac driver.
> 
> My former colleague Clément Léger originally sent a series for this driver,
> but an issue in bringing up the PCS clock had blocked the upstreaming
> process. This issue has since been resolved by the following series:
> 
> [...]

Here is the summary with links:
  - [net-next,v7,1/7] dt-bindings: net: renesas,rzn1-gmac: Document RZ/N1 GMAC support
    https://git.kernel.org/netdev/net-next/c/ab5588703981
  - [net-next,v7,2/7] net: stmmac: Add dedicated XPCS cleanup method
    https://git.kernel.org/netdev/net-next/c/d5c50937d50f
  - [net-next,v7,3/7] net: stmmac: Make stmmac_xpcs_setup() generic to all PCS devices
    https://git.kernel.org/netdev/net-next/c/f9cdff1bdacc
  - [net-next,v7,4/7] net: stmmac: introduce pcs_init/pcs_exit stmmac operations
    https://git.kernel.org/netdev/net-next/c/f0ef433fc264
  - [net-next,v7,5/7] net: stmmac: dwmac-socfpga: use pcs_init/pcs_exit
    https://git.kernel.org/netdev/net-next/c/81b418a65657
  - [net-next,v7,6/7] net: stmmac: add support for RZ/N1 GMAC
    https://git.kernel.org/netdev/net-next/c/f360446ec1d0
  - [net-next,v7,7/7] ARM: dts: r9a06g032: describe GMAC1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



