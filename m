Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED43E2CDB32
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Dec 2020 17:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728687AbgLCQ2C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Dec 2020 11:28:02 -0500
Received: from pb-smtp21.pobox.com ([173.228.157.53]:53374 "EHLO
        pb-smtp21.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727518AbgLCQ2C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 11:28:02 -0500
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 8B74210A4DD;
        Thu,  3 Dec 2020 11:27:18 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=jM4hyLW+TSH6eWSfoM8RCvw63Lg=; b=CHo7hv
        AikdQ7XbJBXtw/sMbKd77sMQQE+YXkwV9L/kZQ9VHDPqJyCyoa4d/mnNVPGbgSHG
        4olx+JIDjDidSxAznBucOGdOln8ouoLxjfL+NmTC7AeowDuB5A1P392pLx6+7hh9
        IGOZf10kmoExAqvupniSnNE1OW2Cp6KxSivOQ=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 824F110A4DC;
        Thu,  3 Dec 2020 11:27:18 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=3PGlveTzkl/T/55mZzO73S7cfYNfZVyY/4IhZFtmgvk=; b=yFQ4F901q8j6hQqmrmc9p8nd+Dw6HIN7NaGkKozfC4cC/rlfBXmEpYDXqWrasaKVA5RZO64PjmTPQheRlcr4SncIoHhjKf2eXlWY/9UJuJE4hnmb0WVN/0BccASPfbD//0ZdhL1gYmbP8FML1nNCIfr+kM6DMcuA62zlgFDJCKo=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id F2B3410A4D6;
        Thu,  3 Dec 2020 11:27:14 -0500 (EST)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 49F712DA0B35;
        Thu,  3 Dec 2020 11:27:13 -0500 (EST)
Date:   Thu, 3 Dec 2020 11:27:13 -0500 (EST)
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
Subject: Re: [PATCH v10 2/3] ARM: uncompress: Add OF_DT_MAGIC macro
In-Reply-To: <20201203121916.2870975-3-geert+renesas@glider.be>
Message-ID: <n5sr2s9o-3n53-91q0-noo6-o576n6o36253@syhkavp.arg>
References: <20201203121916.2870975-1-geert+renesas@glider.be> <20201203121916.2870975-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 674F0A34-3584-11EB-BA09-D609E328BF65-78420484!pb-smtp21.pobox.com
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 3 Dec 2020, Geert Uytterhoeven wrote:

> The DTB magic marker is stored as a 32-bit big-endian value, and thus
> depends on the CPU's endianness.  Add a macro to define this value in
> native endianness, to reduce #ifdef clutter and (future) duplication.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Nicolas Pitre <nico@fluxnic.net>


> ---
> v10:
>   - New.
> ---
>  arch/arm/boot/compressed/head.S | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
> index aabdc544c03aafdc..d9cce7238a365081 100644
> --- a/arch/arm/boot/compressed/head.S
> +++ b/arch/arm/boot/compressed/head.S
> @@ -11,6 +11,12 @@
>  
>  #include "efi-header.S"
>  
> +#ifdef __ARMEB__
> +#define OF_DT_MAGIC 0xd00dfeed
> +#else
> +#define OF_DT_MAGIC 0xedfe0dd0
> +#endif
> +
>   AR_CLASS(	.arch	armv7-a	)
>   M_CLASS(	.arch	armv7-m	)
>  
> @@ -335,11 +341,7 @@ restart:	adr	r0, LC1
>   */
>  
>  		ldr	lr, [r6, #0]
> -#ifndef __ARMEB__
> -		ldr	r1, =0xedfe0dd0		@ sig is 0xd00dfeed big endian
> -#else
> -		ldr	r1, =0xd00dfeed
> -#endif
> +		ldr	r1, =OF_DT_MAGIC
>  		cmp	lr, r1
>  		bne	dtb_check_done		@ not found
>  
> -- 
> 2.25.1
> 
> 
