Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94DF417B0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 15:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbfEHNvR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 09:51:17 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:41342 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbfEHNvR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 09:51:17 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 8372E3C004C;
        Wed,  8 May 2019 15:51:14 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Y4yrqlMfhgbt; Wed,  8 May 2019 15:51:07 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 499FD3C00C6;
        Wed,  8 May 2019 15:51:07 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 8 May 2019
 15:51:07 +0200
Date:   Wed, 8 May 2019 15:51:04 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Marek Vasut <marek.vasut@gmail.com>
CC:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        <u-boot@lists.denx.de>, <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Gotthard Voellmeke <gotthard.voellmeke@renesas.com>,
        Adam Bass <adam.bass@renesas.com>,
        Bastian Farkas <bfarkas@de.adit-jv.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Philipp Ahmann <pahmann@de.adit-jv.com>,
        Simon Maleyka <smaleyka@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Matthias Weise <mweise@de.adit-jv.com>,
        Christoph Gellner <cgellner@de.adit-jv.com>
Subject: Re: Automated/remote flashing of R-Car3
Message-ID: <20190508135104.GA22152@vmlxhi-102.adit-jv.com>
References: <20190507104115.GA27355@vmlxhi-102.adit-jv.com>
 <79ae01fb-6945-05c5-a08d-92aaffeaa6f0@gmail.com>
 <20190507155308.GA1600@vmlxhi-102.adit-jv.com>
 <48af9a12-57d9-0279-581f-e81698b18adb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <48af9a12-57d9-0279-581f-e81698b18adb@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Tue, May 07, 2019 at 06:09:10PM +0200, Marek Vasut wrote:
[..]
> >>> 1.c Use OpenOCD
> >>> + Presumably same advantages as using a Lauterbach
> >>> + Based on Kieran's https://github.com/kbingham/renesas-jtag
> >>>   and on Adam's https://github.com/ntfreak/openocd/commit/1afec4f561392
> >>>   the solution is currently in use.
> >>> ? Any ideas on the model/price of the JTAG adapter?
> >>
> >> Any FT2232H (the H is important, due to MPSSE) works.
> >> I like Flyswatter2 from TinCanTools.
> >>
> >>> ? Not tested. Any patches needed on top of vanilla OpenOCD?
> >>
> >> http://openocd.zylin.com/5149 and related ones, it adds RPC HF support.
> >> However, there are two problems with this:
> >> 1) Even with buffered write, the programming is slow
> >>    - This could be improved by running code on one of the Gen3 CPUs
> >>      instead of whacking registers via JTAG adapter. I believe that's
> >>      what lauterbach and everyone else does too. The data upload to
> >>      SRAM/DRAM is fast via JTAG, register IO is not great.
> >> 2) LifeC locks the RPC HF access
> >>    - This is a problem, since the JTAG probe cannot access it once
> >>      it's locked. There might be a way around it, but it's rather
> >>      nasty -- use boundary scan test mode to either flip MD pins or
> >>      access the HF bus directly and bitbang at least erase command
> >>      to wipe the first few sectors, then reset the CPU and have it
> >>      drop to SCIF loader mode, then stop the CPU and reprogram the
> >>      HF (since the SCIF loader runs in EL3 and does not touch the
> >>      lifec settings.
> >>
> >> Neither of 1) and 2) is implemented, but can be implemented if there is
> >> interest.
> > 
> > 1) looks like a performance issue to me (suboptimal flashing time).
> > To be honest, I don't think this is a deal-breaker, assuming that
> > erasing/re-writing the whole 64MiB HF doesn't exceed ~10-15min.
> > It is also my understanding this is subject of future optimization.
> 
> It will have to be optimized further.
> 
> > 2) looks like a functional issue (insufficient permission to
> > write-access HF). To make things clear, could you please stress if
> > http://openocd.zylin.com/5149 already allows updating ATF/U-Boot/OPTEE
> > on HF of R-Car Gen3 or is it still awaiting some fixes?
> 
> You can read/write/erase the HF with it. Just keep in mind the HF has to
> be unlocked.
>
> Maybe there is some magic/sectret way to unlock the LifeC RPC access
> restriction via JTAG, but we don't know about it.

Well, "unlocking" HF via LifeC registers (set in BL2) is pretty much
equivalent to diverging from the Renesas-delivered BL2/IPL, by
accepting a solution like [0] referenced in my initial e-mail
(linked again below). Spawning multiple build variants of ATF (i.e.
tested vs released) is what we would like to avoid.

Thanks for pointing out this limitation.
Hopefully it can be addressed in a future iteration of
http://openocd.zylin.com/5149.

[0] https://github.com/CogentEmbedded/meta-rcar/blob/v3.15.0/meta-rcar-gen3-adas/recipes-bsp/arm-trusted-firmware/files/0001-plat-renesas-rcar-Make-RPC-secure-settings-optional.patch

-- 
Best Regards,
Eugeniu.
