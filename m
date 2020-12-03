Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBBC2CDB2A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Dec 2020 17:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgLCQ0t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Dec 2020 11:26:49 -0500
Received: from pb-smtp1.pobox.com ([64.147.108.70]:65456 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbgLCQ0s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 11:26:48 -0500
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id CB8C497A9C;
        Thu,  3 Dec 2020 11:26:05 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=SsF41bWK2/VOQbXL/fDJh0HyIq4=; b=rXOeAz
        bueE7KRSz0xyCVsJryOk/NVONjP0e7MqU7JdrnT64tLoJ9qSyO+JQhYEz+/snBjL
        SBsKyJb1hw+Eoz1cGUBSYxzPgug2+RTSiKx9XVZicfWiLBFdZssAd8eoDvm27acP
        GowQaFuhHmyLONtckgBhSc0XJ1nOlfqLDHCBk=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id B993797A9B;
        Thu,  3 Dec 2020 11:26:05 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=ngdZLDLTfBeh0afHFgm1CorSO481UJ51DdhdoMaESS4=; b=wwm8Iyp3J2rGNnPNxqFFN2IKegZ13UBSVVSy50IOeZ31EojqiTYWlVb572lYFOwdN6AOE3lSHwZd22utAe3egboQ3B857lTbGrWMQK5nX2El+bG+oAFZ9X0mf/ZG5W21eczHmzhpqbrMqC9N918rACNSIRqm5PJmdNTfHM1UMHw=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id AD96F97A9A;
        Thu,  3 Dec 2020 11:26:04 -0500 (EST)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 9C9142DA0B35;
        Thu,  3 Dec 2020 11:26:03 -0500 (EST)
Date:   Thu, 3 Dec 2020 11:26:03 -0500 (EST)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
cc:     Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 1/3] ARM: uncompress: Add be32tocpu macro
In-Reply-To: <20201203121916.2870975-2-geert+renesas@glider.be>
Message-ID: <25r4pns0-srrp-nq3s-q4p5-11s925rq9sr0@syhkavp.arg>
References: <20201203121916.2870975-1-geert+renesas@glider.be> <20201203121916.2870975-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 3D6BA2B8-3584-11EB-B0DA-D152C8D8090B-78420484!pb-smtp1.pobox.com
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 3 Dec 2020, Geert Uytterhoeven wrote:

> DTB stores all values as 32-bit big-endian integers.
> Add a macro to convert such values to native CPU endianness, to reduce
> duplication.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I agree with Ard's suggestions. In any case:

Reviewed-by: Nicolas Pitre <nico@fluxnic.net>

> ---
> v10:
>   - New.
> ---
>  arch/arm/boot/compressed/head.S | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
> index 835ce64f1674c9a2..aabdc544c03aafdc 100644
> --- a/arch/arm/boot/compressed/head.S
> +++ b/arch/arm/boot/compressed/head.S
> @@ -165,6 +165,16 @@
>  		orr	\res, \res, \tmp1, lsl #24
>  		.endm
>  
> +		.macro	be32tocpu, val, tmp
> +#ifndef __ARMEB__
> +		/* convert to little endian */
> +		eor	\tmp, \val, \val, ror #16
> +		bic	\tmp, \tmp, #0x00ff0000
> +		mov	\val, \val, ror #8
> +		eor	\val, \val, \tmp, lsr #8
> +#endif
> +		.endm
> +
>  		.section ".start", "ax"
>  /*
>   * sort out different calling conventions
> @@ -345,13 +355,7 @@ restart:	adr	r0, LC1
>  
>  		/* Get the initial DTB size */
>  		ldr	r5, [r6, #4]
> -#ifndef __ARMEB__
> -		/* convert to little endian */
> -		eor	r1, r5, r5, ror #16
> -		bic	r1, r1, #0x00ff0000
> -		mov	r5, r5, ror #8
> -		eor	r5, r5, r1, lsr #8
> -#endif
> +		be32tocpu r5, r1
>  		dbgadtb	r6, r5
>  		/* 50% DTB growth should be good enough */
>  		add	r5, r5, r5, lsr #1
> @@ -403,13 +407,7 @@ restart:	adr	r0, LC1
>  
>  		/* Get the current DTB size */
>  		ldr	r5, [r6, #4]
> -#ifndef __ARMEB__
> -		/* convert r5 (dtb size) to little endian */
> -		eor	r1, r5, r5, ror #16
> -		bic	r1, r1, #0x00ff0000
> -		mov	r5, r5, ror #8
> -		eor	r5, r5, r1, lsr #8
> -#endif
> +		be32tocpu r5, r1
>  
>  		/* preserve 64-bit alignment */
>  		add	r5, r5, #7
> -- 
> 2.25.1
> 
> 
