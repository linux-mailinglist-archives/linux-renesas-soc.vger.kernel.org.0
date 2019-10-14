Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5BBD6A7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2019 21:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730912AbfJNT6w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Oct 2019 15:58:52 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:45390 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbfJNT6w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Oct 2019 15:58:52 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 9F3DF3C04C1;
        Mon, 14 Oct 2019 21:58:48 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ndyLU4RMPQkS; Mon, 14 Oct 2019 21:58:42 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id A62473C003F;
        Mon, 14 Oct 2019 21:58:42 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 14 Oct
 2019 21:58:42 +0200
Date:   Mon, 14 Oct 2019 21:58:42 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH/RFC 00/19] arm64: dts: renesas: Initial support for R-Car
 M3-W+
Message-ID: <20191014195842.GB10366@vmlxhi-102.adit-jv.com>
References: <20191007102332.12196-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191007102332.12196-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Oct 07, 2019 at 12:23:13PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This RFC patch series adds support for the R-Car M3-W+ (R8A77961) SoC
> and the Salvator-XS board with R-Car M3-W+.  This SoC is a derivative of
> R-Car M3-W (R8A77960), and also known as R-Car M3-W ES3.0.
> As this is an RFC, I'm sending it to a limited audience.
> 
> Based on experience with previous SoCs in the R-Car Gen3 family, the
> following design decisions were made:
>   - Use different compatible values (r8a77961-based),

Given that a potentially incomplete list of M3-W compatible strings
counts 40 occurrences [1] and this series adds only 7 [2], current RFC
looks like the first step in a multi-phase approach. Do you plan to add
the missing r8a77961 compatibles in the next revision or do you expect
other people to contribute those later?

>   - Use different clock and SYSC DT binding definitions
>     (R8A77961-based), but the same numerical values, to allow sharing
>     drivers,
>   - Share the pin control driver,
>   - Share the clock driver,
>   - Share the system controller driver.
> 
> While the DT ABI is stable (hence we cannot s/r8a7796/r8a77960/ in DTS),
> kernel source code and kernel config symbols can be changed at any
> time.  As changing kernel config symbols impacts the user, they weren't
> renamed yet.
> 
> Questions:
>   - What's the board part number of Salvator-XS with R-Car M3-W+?

I guess my board is an exception, since it got the SiP simply upgraded
from SoC ES1.x to ES3.0 by resoldering. IOW the board carries the same
serial number as M3-ES1.1 Salvator-XS.

[..]

>   - Should the R8A77961 config symbols be dropped?
>       - CONFIG_ARCH_R8A77961
>       - CONFIG_CLK_R8A77961
>       - CONFIG_PINCTRL_PFC_R8A77961
>       - CONFIG_SYSC_R8A77961
> 
>   - If not, should the R8A7796 config symbols be renamed?
>       - CONFIG_ARCH_R8A7796 to CONFIG_ARCH_R8A77960?
>       - CONFIG_CLK_R8A7796 to CONFIG_CLK_R8A77960?
>       - CONFIG_PINCTRL_PFC_R8A7796 to CONFIG_PINCTRL_PFC_R8A77960?
>       - CONFIG_SYSC_R8A7796 to CONFIG_SYSC_R8A77960?
>     Due to dependencies on CONFIG_ARCH_R8A7796, this should be a single
>     commit.

[2 cents] Both adding CONFIG_*_R8A77961 and renaming CONFIG_*_R8A7796 to
CONFIG_*_R8A77960 make sense to me.

> Related questions for old R-Car H3 ES1.x support:
>   - Should CONFIG_PINCTRL_PFC_R8A77950 be added, to allow compiling out
>     R-Car H3 ES1.x pin control support?

[2 cents] Adding CONFIG_*_R8A77950 makes sense in spite of the fact that
R8A77950 is not documented in R-Car HW man. In fact, it is quite clear
why R8A77950 is _not_ documented while R8A77960 _is_ documented. The
former is obsolete (the community is nice by not obliterating its
support) while the latter is expected to hit the market.

>     If yes, should CONFIG_PINCTRL_PFC_R8A7795 be renamed to
>     CONFIG_PINCTRL_PFC_R8A77951?

In a perfect/ideal world, I would say yes.

> This patch series is based on renesas-drivers-2019-10-01-v5.4-rc1).  For
> your convenience, it is available in the topic/r8a77961-v1 branch of my
> renesas-drivers git repository at
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.
> 
> This has been tested using remote access.
> 
> Thanks for your comments!

Thanks for the bring-up!

[..]

[1] linux (geert-renesas-drivers/topic/r8a77961-v1) \
git grep -o "\"renesas[^\ ]*r8a7796\b[^\"]*\"" | cut -f2 -d: | sort -u
"renesas,can-r8a7796"
"renesas,dmac-r8a7796"
"renesas,du-r8a7796"
"renesas,etheravb-r8a7796"
"renesas,gpio-r8a7796"
"renesas,hscif-r8a7796"
"renesas,i2c-r8a7796"
"renesas,iic-r8a7796"
"renesas,intc-ex-r8a7796"
"renesas,ipmmu-r8a7796"
"renesas,msiof-r8a7796"
"renesas,pcie-r8a7796"
"renesas,pfc-r8a7796"
"renesas,pwm-r8a7796"
"renesas,r8a7796"
"renesas,r8a7796-canfd"
"renesas,r8a7796-cmt0"
"renesas,r8a7796-cmt1"
"renesas,r8a7796-cpg-mssr"
"renesas,r8a7796-csi2"
"renesas,r8a7796-drif"
"renesas,r8a7796-hdmi"
"renesas,r8a7796-imr-lx4"
"renesas,r8a7796-lvds"
"renesas,r8a7796-rcar-usb2-clock-sel"
"renesas,r8a7796-rst"
"renesas,r8a7796-sysc"
"renesas,r8a7796-thermal"
"renesas,r8a7796-usb3-peri"
"renesas,r8a7796-usb3-phy"
"renesas,r8a7796-usb-dmac"
"renesas,r8a7796-wdt"
"renesas,rcar_sound-r8a7796"
"renesas,scif-r8a7796"
"renesas,sdhi-r8a7796"
"renesas,tpu-r8a7796"
"renesas,usb2-phy-r8a7796"
"renesas,usbhs-r8a7796"
"renesas,vin-r8a7796"
"renesas,xhci-r8a7796"

[2] linux (geert-renesas-drivers/topic/r8a77961-v1) \
git grep -o "\"renesas[^\ ]*r8a77961\b[^\"]*\"" | cut -f2 -d: | sort -u
"renesas,hscif-r8a77961"
"renesas,pfc-r8a77961"
"renesas,r8a77961"
"renesas,r8a77961-cpg-mssr"
"renesas,r8a77961-rst"
"renesas,r8a77961-sysc"
"renesas,scif-r8a77961"

-- 
Best Regards,
Eugeniu
