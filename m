Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E71F8842F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Aug 2019 22:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbfHIUlw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Aug 2019 16:41:52 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:39704 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfHIUlw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Aug 2019 16:41:52 -0400
Received: from penelope.horms.nl (unknown [66.60.152.14])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3A61525AEE2;
        Sat, 10 Aug 2019 06:41:50 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 1E295E21D63; Fri,  9 Aug 2019 22:41:49 +0200 (CEST)
Date:   Fri, 9 Aug 2019 13:41:49 -0700
From:   Simon Horman <horms@verge.net.au>
To:     marek.vasut@gmail.com
Cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] of: Fix of_empty_ranges_quirk()
Message-ID: <20190809204148.fv3cvdbgg5e3mzq5@verge.net.au>
References: <20190809173321.19944-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809173321.19944-1-marek.vasut@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 09, 2019 at 07:33:21PM +0200, marek.vasut@gmail.com wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> The of_empty_ranges_quirk() returns a mix of boolean and signed integer
> types, which cannot work well. Replace that with boolean only and fix
> usage logic in of_translate_one() -- the check should trigger when the
> ranges are NULL and the quirk is applicable on the hardware.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: devicetree@vger.kernel.org

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/of/address.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index b492176c0572..ae2819e148b8 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -616,7 +616,7 @@ static struct of_bus *of_match_bus(struct device_node *np)
>  	return NULL;
>  }
>  
> -static int of_empty_ranges_quirk(struct device_node *np)
> +static bool of_empty_ranges_quirk(struct device_node *np)
>  {
>  	if (IS_ENABLED(CONFIG_PPC)) {
>  		/* To save cycles, we cache the result for global "Mac" setting */
> @@ -631,7 +631,8 @@ static int of_empty_ranges_quirk(struct device_node *np)
>  			quirk_state =
>  				of_machine_is_compatible("Power Macintosh") ||
>  				of_machine_is_compatible("MacRISC");
> -		return quirk_state;
> +		if (quirk_state > 0)
> +			return true;
>  	}
>  	return false;
>  }
> @@ -662,8 +663,8 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
>  	 * This code is only enabled on powerpc. --gcl
>  	 */
>  	ranges = of_get_property(parent, rprop, &rlen);
> -	if (ranges == NULL && !of_empty_ranges_quirk(parent)) {
> -		pr_debug("no ranges; cannot translate\n");
> +	if (ranges == NULL && of_empty_ranges_quirk(parent)) {
> +		pr_err("no ranges; cannot translate\n");
>  		return 1;
>  	}
>  	if (ranges == NULL || rlen == 0) {
> -- 
> 2.20.1
> 
