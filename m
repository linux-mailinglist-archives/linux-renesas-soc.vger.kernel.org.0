Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD10872D04
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2019 13:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727465AbfGXLMc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jul 2019 07:12:32 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45414 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfGXLMc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jul 2019 07:12:32 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1176C25BE45;
        Wed, 24 Jul 2019 21:12:30 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id F34ACE22041; Wed, 24 Jul 2019 13:12:27 +0200 (CEST)
Date:   Wed, 24 Jul 2019 13:12:27 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, geert+renesas@glider.be,
        daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, tglx@linutronix.de
Subject: Re: [PATCH 6/7] clocksource/drivers/sh_cmt: r8a7740 and sh73a0
 SoC-specific match
Message-ID: <20190724111227.qaeq3d5mkeyvlkq3@verge.net.au>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
 <156345032407.5307.16702422867507502597.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156345032407.5307.16702422867507502597.sendpatchset@octo>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jul 18, 2019 at 08:45:24PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Add SoC-specific matching for CMT1 on r8a7740 and sh73a0.
> 
> This allows us to move away from the old DT bindings such as
>  - "renesas,cmt-48-sh73a0"
>  - "renesas,cmt-48-r8a7740"
>  - "renesas,cmt-48"
> in favour for the now commonly used format "renesas,<soc>-<device>"
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> 
>  drivers/clocksource/sh_cmt.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> --- 0001/drivers/clocksource/sh_cmt.c
> +++ work/drivers/clocksource/sh_cmt.c	2019-07-18 19:29:06.005414716 +0900
> @@ -928,6 +928,14 @@ static const struct of_device_id sh_cmt_
>  		.data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
>  	},
>  	{
> +		.compatible = "renesas,r8a7740-cmt1",
> +		.data = &sh_cmt_info[SH_CMT_48BIT]

Perhaps as a follow-up SH_CMT_48BIT could be renamed.

> +	},
> +	{
> +		.compatible = "renesas,sh73a0-cmt1",
> +		.data = &sh_cmt_info[SH_CMT_48BIT]
> +	},
> +	{
>  		.compatible = "renesas,rcar-gen2-cmt0",
>  		.data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
>  	},
> 
