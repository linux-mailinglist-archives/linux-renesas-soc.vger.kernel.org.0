Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC72198E7B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 10:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731427AbfHVI6I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 04:58:08 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57232 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729109AbfHVI6I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 04:58:08 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9628625AD59;
        Thu, 22 Aug 2019 18:58:06 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 66FAA940804; Thu, 22 Aug 2019 10:58:04 +0200 (CEST)
Date:   Thu, 22 Aug 2019 10:58:04 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] [RFC] ARM: shmobile: defconfig: Disable
 PL310_ERRATA_588369
Message-ID: <20190822085804.rgyjxisnznmnura5@verge.net.au>
References: <20190821124602.29317-1-geert+renesas@glider.be>
 <20190821124602.29317-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821124602.29317-4-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 02:46:02PM +0200, Geert Uytterhoeven wrote:
> PL310 Erratum 588369 affects PL310 cache controller revisions older than
> r2p0.
> 
> As Renesas ARM SoCs contain the following revisions:
>   - SH-Mobile AG5: r3p1,
>   - R-Mobile A1: r3p1-50rel0,
>   - R-Car H1: r3p2,
>   - RZ/A1: r3p2,
>   - RZ/A2: r3p3,
> none of them are affected, and support for the errata can be disabled
> safely.
> 
> The EMMA Mobile EV2 documentation doesn't mention the revision of its
> PL310 cache controller, so this SoC might be affected.  However, the L2
> cache controller is not enabled by Linux.

If the controller is not enabled by Linux then I would think that the
Errata is not needed. If that is true then I agree with this patch.

Regarding making assumptions about the version of the PL310 cache
controller, I suggest that we cannot assume that it is not affected
without further information.

> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/configs/shmobile_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index 123821e63873dafa..95a127cbe8e6fcd7 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -8,7 +8,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>  CONFIG_PERF_EVENTS=y
>  CONFIG_SLAB=y
>  CONFIG_ARCH_RENESAS=y
> -CONFIG_PL310_ERRATA_588369=y
>  CONFIG_SMP=y
>  CONFIG_SCHED_MC=y
>  CONFIG_NR_CPUS=8
> -- 
> 2.17.1
> 
