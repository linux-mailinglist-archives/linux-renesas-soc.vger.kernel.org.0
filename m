Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 407792CD889
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Dec 2020 15:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730591AbgLCOGI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Dec 2020 09:06:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbgLCOGI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 09:06:08 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049C8C061A4E;
        Thu,  3 Dec 2020 06:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=QFnw1VAMIMbQicaf3rgoSZRJ6IT9RzN8Pv4ZM1fxb14=; b=v+PlqEPtOHZQXJBag6IUKH0QS
        WYGHluAVUxystXwSqMh1BGc6fWamXExl7QyzeUjlsxhIZIztWKny4hYzmWwYfQucdiphA/W8IOi6J
        cyCixIG1llVtduxNbXriWI1n/DclNg/F5xPuAhA8pHIGwaOKEaWiHOKJuqBGijmdMiXto4YmIKysA
        sf62p2IGRAtwCAIYove4EDk61sfuvjUNyjmkjSLvzlGo5BI3Py+42hFjxKfl63O/7trDPkBqTB/q2
        kNdsFI7jEEyZfWENgvZkBudMHZMcArbCBwl4JmWdyeXQLN5BOdNaUrxqUQVDp3fU9XnFAyibTDl45
        3BzBafBdA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39274)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1kkpEB-00038k-FQ; Thu, 03 Dec 2020 14:04:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1kkpE2-000871-J6; Thu, 03 Dec 2020 14:04:50 +0000
Date:   Thu, 3 Dec 2020 14:04:50 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/3] ARM: uncompress: Validate start of physical
 memory against passed DTB
Message-ID: <20201203140450.GH1551@shell.armlinux.org.uk>
References: <20201203121916.2870975-1-geert+renesas@glider.be>
 <20201203121916.2870975-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203121916.2870975-4-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 03, 2020 at 01:19:16PM +0100, Geert Uytterhoeven wrote:
> diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
> index d9cce7238a365081..1b6425df87e84e71 100644
> --- a/arch/arm/boot/compressed/head.S
> +++ b/arch/arm/boot/compressed/head.S
> @@ -282,10 +282,36 @@ not_angel:
>  		 * are already placing their zImage in (eg) the top 64MB
>  		 * of this range.
>  		 */
> -		mov	r4, pc
> -		and	r4, r4, #0xf8000000
> +		mov	r0, pc
> +		and	r0, r0, #0xf8000000
> +#ifdef CONFIG_USE_OF
> +		adr	r1, LC1
> +#ifdef CONFIG_ARM_APPENDED_DTB
> +		/*
> +		 * Look for an appended DTB.  If found, we cannot use it to
> +		 * validate the calculated start of physical memory, as its
> +		 * memory nodes may need to be augmented by ATAGS stored at
> +		 * an offset from the same start of physical memory.
> +		 */
> +		ldr	r2, [r1, #4]	@ get &_edata
> +		add	r2, r2, r1	@ relocate it
> +		ldr	r2, [r2]	@ get DTB signature
> +		ldr	r3, =OF_DT_MAGIC
> +		cmp	r2, r3		@ do we have a DTB there?
> +		beq	1f		@ if yes, skip validation
> +#endif /* CONFIG_ARM_APPENDED_DTB */
> +
> +		/* Make sure we have some stack */
> +		ldr	sp, [r1]	@ get stack location
> +		add	sp, sp, r1	@ apply relocation
> +
> +		/* Validate calculated start against passed DTB */
> +		mov	r1, r8
> +		bl	fdt_check_mem_start

I don't think this is going to work. You can only run C code when
it has been linked for a specific address and is loaded at the
correct address as it contains absolute addresses. We work around
that in the decompressor by (ab)using the GOT table, and the code
that fixes up the GOT table is run later, after you've called out
to some C code here.

Quite how this works for you without the GOT fixups having been
done, I'm not sure.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
