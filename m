Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34BEA38D5AD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 May 2021 13:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhEVLfQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 22 May 2021 07:35:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37934 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbhEVLfP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 22 May 2021 07:35:15 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAA2088F;
        Sat, 22 May 2021 13:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621683230;
        bh=emUjreUYvg3g6g/U8FGHpQSA2JyGGLK22FRkpGBQEqo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pccG+kbCNXLQN7JECDVgeiMknKZxskv+RH9Xwl6Ln4ptS5D4Kzz2qvaUvW3a8BLVH
         eI5PqO8oJmRs7oelgG/cetBdAq4ZfeNl/SdkM/ntsdt+sXWy6QbdOj20t9DOZWJlka
         1rQo2Nru2dSt8/EtqPaRTZN3Y6YrlclBQVnnAyVY=
Date:   Sat, 22 May 2021 14:33:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2] yavta: Fix usage documentation for --field option
Message-ID: <YKjsG1iacoqoMnVG@pendragon.ideasonboard.com>
References: <20210421121838.3060973-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210421121838.3060973-1-niklas.soderlund@ragnatech.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Wed, Apr 21, 2021 at 02:18:38PM +0200, Niklas Söderlund wrote:
> The --field option takes an argument selecting the field order. Update
> the usage text to reflect this.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - List all valid filed values.
> ---
>  yavta.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/yavta.c b/yavta.c
> index 4e5b62a96eb66f8d..1129ab245966384b 100644
> --- a/yavta.c
> +++ b/yavta.c
> @@ -2290,7 +2290,9 @@ static void usage(const char *argv0)
>  	printf("    --enum-formats		Enumerate formats\n");
>  	printf("    --enum-inputs		Enumerate inputs\n");
>  	printf("    --fd                        Use a numeric file descriptor insted of a device\n");
> -	printf("    --field			Interlaced format field order\n");
> +	printf("    --field field		Set the format field order\n");
> +	printf("\tValid values for field are none, top, bottom, interlaced, seq-tb, seq-bt\n");

Missing ',' after seq-bt.

> +	printf("\talternate, interlaced-tb and interlaced-bt.\n");

One may argue that it would be nice to iterate over the fields array,
but that's likely overkill.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied with the added comma.

>  	printf("    --log-status		Log device status\n");
>  	printf("    --no-query			Don't query capabilities on open\n");
>  	printf("    --offset			User pointer buffer offset from page start\n");

-- 
Regards,

Laurent Pinchart
