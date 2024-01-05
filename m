Return-Path: <linux-renesas-soc+bounces-1337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 724378257C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 17:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 892641C23251
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 16:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52852E84A;
	Fri,  5 Jan 2024 16:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwqF3vZ6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BCC2E829;
	Fri,  5 Jan 2024 16:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 514BEC433C9;
	Fri,  5 Jan 2024 16:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704471027;
	bh=NVV8eMS50jX4SZSXy7FU+fGkb6EANHXXbtII/+nwGcI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cwqF3vZ6TuEjS/o8phO9J/g2gjzz8XDCKN/PXBerowgFbc5af3qQ1YxHcOLMRZ3X0
	 6IlqqupWVnevk48v9qJ/Z07Lb3AzgBjcWDPpAenz0VreeG+2dTn9aZsWPhsSrygzwc
	 Wkr3cU9WpxMLfHkOvYMdEnFpyhKFIkkEuykvgVbMyDZgWSW4yQ9emD4VggKYVh0cNf
	 zdrX0k7s/72DadUInz/PJeMjKVVJ+WJZXvFn9jeIXtcfcGwSJE7G2Qzlz1SdFEc1cn
	 6LW0J1hEHMchPcdsdEgBgOpvMVUcFUzf+7zLSOf36wb8qoFvj7BWdFCA1GEZHR8Drt
	 fUNZOfonwIQ1Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30A9BDCB6FB;
	Fri,  5 Jan 2024 16:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: fill in MODULE_DESCRIPTION()s for DSA tags
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170447102719.8824.15799347638333080691.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jan 2024 16:10:27 +0000
References: <20240104143759.1318137-1-kuba@kernel.org>
In-Reply-To: <20240104143759.1318137-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
 hauke@hauke-m.de, kurt@linutronix.de, woojung.huh@microchip.com,
 UNGLinuxDriver@microchip.com, arinc.unal@arinc9.com, daniel@makrotopia.org,
 Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 claudiu.manoil@nxp.com, alexandre.belloni@bootlin.com,
 clement.leger@bootlin.com, george.mccollister@gmail.com,
 linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  4 Jan 2024 06:37:59 -0800 you wrote:
> W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
> Add descriptions to all the DSA tag modules.
> 
> The descriptions are copy/pasted Kconfig names, with s/^Tag/DSA tag/.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] net: fill in MODULE_DESCRIPTION()s for DSA tags
    https://git.kernel.org/netdev/net-next/c/0ed6e95255e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



