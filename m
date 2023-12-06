Return-Path: <linux-renesas-soc+bounces-754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 219338065EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 05:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C142F1F216CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 04:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07379DDC3;
	Wed,  6 Dec 2023 04:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYE/lnhN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EB9D52D;
	Wed,  6 Dec 2023 04:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EAC3C433C7;
	Wed,  6 Dec 2023 04:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701835226;
	bh=Ch1hvqB7GoU/Da3vC7CIzaXtBMwgu6lLK49eDRsfEOE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZYE/lnhNZ3fA7P/wA+eB9LFbhPHXs3kAIOnr+YOv9rCZ7ppJ3BYKlspx+veJIu9IR
	 1tlRQS64na1gSBNEEIFPG9UqDgeWg3Pzkh7R/92HmqN1NPxi17zWLTaO9Y61cgTzXF
	 ImL8dzW3qa2OpjM0VveLuVfHJ74VtOrtCgufpD1OwFK9ndVEF0GNaKnIrnG6pqU5R5
	 Jbz4BGfJON0+RNpKFFJFdJBwzRVA0W5LIzCXZ1yCu+rM2YNdydCpYqGZxpJ9duTFKY
	 pxXFLizsaqjyP1mldslbUD4XscngoE7J7MOFl2QNIYfkK+YxeNha9XX74dRmWfsoLm
	 C1zuuBh2FM9WQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30028C41671;
	Wed,  6 Dec 2023 04:00:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/9] net*: Convert to platform remove callback
 returning void
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170183522618.32207.8967841669098706210.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 04:00:26 +0000
References: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@codeaurora.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, elder@kernel.org, netdev@vger.kernel.org,
 kernel@pengutronix.de, mkl@pengutronix.de, nnac123@linux.ibm.com,
 ansuelsmth@gmail.com, clement.leger@bootlin.com, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk,
 linux-renesas-soc@vger.kernel.org, qiang.zhao@nxp.com,
 linuxppc-dev@lists.ozlabs.org, linusw@kernel.org, kaloz@openwrt.org,
 linux-arm-kernel@lists.infradead.org, stephan@gerhold.net, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, loic.poulain@linaro.org,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
 linux-arm-msm@vger.kernel.org, alex.aring@gmail.com,
 stefan@datenfreihafen.org, miquel.raynal@bootlin.com,
 linux-wpan@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  4 Dec 2023 19:30:40 +0100 you wrote:
> Hello,
> 
> (implicit) v1 of this series can be found at
> https://lore.kernel.org/netdev/20231117095922.876489-1-u.kleine-koenig@pengutronix.de.
> Changes since then:
> 
>  - Dropped patch #1 as Alex objected. Patch #1 (was #2 before) now
>    converts ipa to remove_new() and introduces an error message in the
>    error path that failed before.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/9] net: ipa: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/a92dbb9cdf04
  - [net-next,v2,2/9] net: fjes: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/2ce19934a4dc
  - [net-next,v2,3/9] net: pcs: rzn1-miic: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/e36dc85c245f
  - [net-next,v2,4/9] net: sfp: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/bb1afee98466
  - [net-next,v2,5/9] net: wan/fsl_ucc_hdlc: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/2d0c06fd39be
  - [net-next,v2,6/9] net: wan/ixp4xx_hss: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/2d8590858753
  - [net-next,v2,7/9] net: wwan: qcom_bam_dmux: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/a06041e2f4ae
  - [net-next,v2,8/9] ieee802154: fakelb: Convert to platform remove callback returning void
    (no matching commit)
  - [net-next,v2,9/9] ieee802154: hwsim: Convert to platform remove callback returning void
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



