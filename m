Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D02C410EE94
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 18:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbfLBRik (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 12:38:40 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:38733 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727453AbfLBRij (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 12:38:39 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id F35B03C0597;
        Mon,  2 Dec 2019 18:38:36 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LZ4Jx6L_J6h4; Mon,  2 Dec 2019 18:38:30 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 648993C003B;
        Mon,  2 Dec 2019 18:38:30 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 2 Dec 2019
 18:38:30 +0100
Date:   Mon, 2 Dec 2019 18:38:27 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Nilkanth Ahirrao <external.anilkanth@jp.adit-jv.com>,
        <alsa-devel@alsa-project.org>, <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH] ASoC: rsnd: Calculate DALIGN inversion at run-time
Message-ID: <20191202173827.GA13630@vmlxhi-102.adit-jv.com>
References: <20191202155834.22582-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191202155834.22582-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Dec 02, 2019 at 04:58:34PM +0100, Geert Uytterhoeven wrote:
> There is no need to store the inverted DALIGN values in the table, as
> they can easily be calculated at run-time.  This also protects against
> the introduction of inconsistencies between normal and inverted values
> by a future table modification.
> 
> Reorder the two subexpressions in the AND check, to perform the least
> expensive check first.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>

> ---
> Compile-tested only.
> 
> Interestingly, this decreases code size on arm64, but increases on arm32
> (both gcc version 7.4.0 (Ubuntu/Linaro 7.4.0-1ubuntu1~18.04.1)).
> 
> arm32:
> 
>        text	   data	    bss	    dec	    hex	filename
>       16186	    276	     84	  16546	   40a2	sound/soc/sh/rcar/core.o.orig
>       16194	    276	     84	  16554	   40aa	sound/soc/sh/rcar/core.o
> 
> arm64:
> 
>        text	   data	    bss	    dec	    hex	filename
>       17426	    392	    104	  17922	   4602	sound/soc/sh/rcar/core.o.orig
>       17414	    392	    104	  17910	   45f6	sound/soc/sh/rcar/core.o
> ---
>  sound/soc/sh/rcar/core.c | 31 +++++++++++++------------------

jFTR, using ARM's aarch64 gcc-8.3-2019.03 and v5.4-10271-g596cf45cbf6e:

$ size sound/soc/sh/rcar/core.o.before sound/soc/sh/rcar/core.o.after
   text	   data	    bss	    dec	    hex	filename
  21433	    380	     88	  21901	   558d	sound/soc/sh/rcar/core.o.before
  21505	    380	     88	  21973	   55d5	sound/soc/sh/rcar/core.o.after

>  1 file changed, 13 insertions(+), 18 deletions(-)
> 
> diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
> index 399dc6e9bde5b042..d20f03dfdee66643 100644
> --- a/sound/soc/sh/rcar/core.c
> +++ b/sound/soc/sh/rcar/core.c
> @@ -376,20 +376,15 @@ u32 rsnd_get_adinr_bit(struct rsnd_mod *mod, struct rsnd_dai_stream *io)
>   */
>  u32 rsnd_get_dalign(struct rsnd_mod *mod, struct rsnd_dai_stream *io)
>  {
> -	static const u32 dalign_values[8][2] = {
> -		{0x76543210, 0x67452301},
> -		{0x00000032, 0x00000023},
> -		{0x00007654, 0x00006745},
> -		{0x00000076, 0x00000067},
> -		{0xfedcba98, 0xefcdab89},
> -		{0x000000ba, 0x000000ab},
> -		{0x0000fedc, 0x0000efcd},
> -		{0x000000fe, 0x000000ef},
> +	static const u32 dalign_values[8] = {
> +		0x76543210, 0x00000032, 0x00007654, 0x00000076,
> +		0xfedcba98, 0x000000ba, 0x0000fedc, 0x000000fe,

FWIW, using below test procedure, I can reconstruct the original
two-dimensional dalign_values[8][2] array on the host:

#include <stdio.h>
#include <stdint.h>

typedef uint32_t u32;

void main(void)
{
	u32 dalign, i;

	static const u32 dalign_values[8] = {
		0x76543210, 0x00000032, 0x00007654, 0x00000076,
		0xfedcba98, 0x000000ba, 0x0000fedc, 0x000000fe,
	};

	for (i = 0; i < 8; i++) {
		u32 keep = dalign = dalign_values[i];
		dalign = (dalign & 0xf0f0f0f0) >> 4 |
			 (dalign & 0x0f0f0f0f) << 4;
		printf("{0x%08x, 0x%08x},\n", keep, dalign);
	}
}

-- 
Best Regards,
Eugeniu
