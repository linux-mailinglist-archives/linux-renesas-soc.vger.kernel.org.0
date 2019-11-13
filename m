Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8473FAEA7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 11:39:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbfKMKjl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 05:39:41 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:39116 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbfKMKjk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 05:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=7WKOt0PU1d3nL/CCCTgJgokym6dAZxK4zFfjfXkPRJw=; b=isF6o5VXck6A2W28IBRVYOlkl
        Vak7XScn5Sx2IAnHQtN6A00WUoEsEVwaQ//2q4YOaZcowM0E0/t0fQLA415Q1d/tcI163ypTRwkVs
        FR4mdozBxCtJzUn1HN5RYLi3LCPXXcQGHlnWIZkD0lZjHtTsgu18nXygZ+lTJPG/BTUTJIHtgyKJw
        f4QXifIa9KBESKFQ53cTIu6NX4YLC3SPlR0EgxjoUyXTdy0gRkHkKIsu/0wsO7d5GnQs1Uz0940Ta
        Z37l6uIlCF7+2VOIaoWJuAGMaH2B1wgk++6fqfVEVLrLHiVlCIhz71nw8z79GkIuq072QdfB7MYJH
        lrzGi8t2g==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:55632)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iUq3X-0003a3-NZ; Wed, 13 Nov 2019 10:39:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iUq3T-0002ON-If; Wed, 13 Nov 2019 10:39:19 +0000
Date:   Wed, 13 Nov 2019 10:39:19 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.miao@nvidia.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC] ARM: boot: Relax kernel image alignment for RZ/A
 with CS3 SDRAM
Message-ID: <20191113103919.GM25745@shell.armlinux.org.uk>
References: <20191113102729.29303-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113102729.29303-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 13, 2019 at 11:27:29AM +0100, Geert Uytterhoeven wrote:
> The RZA2MEVB sub board has 64 MiB of SDRAM at 0x0C000000 (CS3 space).
> Hence the mask for CONFIG_AUTO_ZRELADDR needs to be changed, otherwise
> the system will crash because it will try to decompress a zImage or
> uImage to a non-RAM garbage address.
> 
> Based on a patch in the BSP by Chris Brandt <chris.brandt@renesas.com>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> No idea what to do with the rest of the comment, or if this breaks
> existing platforms.

We occasionally have discussions about this - the last one was a big
one in Edinburgh, and the answer is we can't change this in mainline.
They've also come up on the mailing lists as well.

I'm not going to rehash this old argument yet again - the comment
details the reason for it, and is there to prevent exactly this.

If someone is silly enough to come up with a platform that violates
the documented 32-bit ARM booting protocol, then they can't expect
the kernel to bend to their platform's requirements at the expense of
already merged platforms.

Sorry.

> 
> Thanks for your comments!
> ---
>  arch/arm/boot/compressed/head.S | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
> index 93dffed0ac6e02b4..cfee6bd1e7a0a582 100644
> --- a/arch/arm/boot/compressed/head.S
> +++ b/arch/arm/boot/compressed/head.S
> @@ -231,10 +231,10 @@ not_angel:
>  		 * address.
>  		 *
>  		 * This alignment is a balance between the requirements of
> -		 * different platforms - we have chosen 128MB to allow
> +		 * different platforms - we have chosen 64MB to allow
>  		 * platforms which align the start of their physical memory
> -		 * to 128MB to use this feature, while allowing the zImage
> -		 * to be placed within the first 128MB of memory on other
> +		 * to 64MB to use this feature, while allowing the zImage
> +		 * to be placed within the first 64MB of memory on other
>  		 * platforms.  Increasing the alignment means we place
>  		 * stricter alignment requirements on the start of physical
>  		 * memory, but relaxing it means that we break people who
> @@ -242,7 +242,7 @@ not_angel:
>  		 * of this range.
>  		 */
>  		mov	r4, pc
> -		and	r4, r4, #0xf8000000
> +		and	r4, r4, #0xfc000000
>  		/* Determine final kernel image address. */
>  		add	r4, r4, #TEXT_OFFSET
>  #else
> -- 
> 2.17.1
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
