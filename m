Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2952415282
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2019 19:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfEFRMc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 May 2019 13:12:32 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:57457 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfEFRMb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 May 2019 13:12:31 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 843383C00C6;
        Mon,  6 May 2019 19:12:27 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tK9ZBC8iMECS; Mon,  6 May 2019 19:12:19 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 863563C004C;
        Mon,  6 May 2019 19:12:19 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 6 May 2019
 19:12:19 +0200
Date:   Mon, 6 May 2019 19:12:16 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>
CC:     Simon Horman <horms@verge.net.au>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "George G . Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Helge Deller <deller@gmx.de>,
        Michael Neuling <mikey@neuling.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Philip Yang <Philip.Yang@amd.com>,
        Matthew Wilcox <mawilcox@microsoft.com>,
        Borislav Petkov <bp@suse.de>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH 1/6] serial: sh-sci: Reveal ptrval in dev_dbg
Message-ID: <20190506171216.GA2181@vmlxhi-102.adit-jv.com>
References: <20190504004258.23574-1-erosca@de.adit-jv.com>
 <20190504004258.23574-2-erosca@de.adit-jv.com>
 <20190506134700.ya565idfzzc3enbm@verge.net.au>
 <20190506152433.GA22769@vmlxhi-102.adit-jv.com>
 <CAMuHMdXJzEYL48qwHAxrRsurQLBipZsQpv+w8i=+B2XCM_CZng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXJzEYL48qwHAxrRsurQLBipZsQpv+w8i=+B2XCM_CZng@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 06, 2019 at 06:46:57PM +0200, Geert Uytterhoeven wrote:
> Hi Eugeniu,
> 
> On Mon, May 6, 2019 at 5:24 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> > On Mon, May 06, 2019 at 03:47:05PM +0200, Simon Horman wrote:
> > > On Sat, May 04, 2019 at 02:42:53AM +0200, Eugeniu Rosca wrote:
> > > > Starting with v4.15-rc2 commit ad67b74d2469d9 ("printk: hash addresses
> > > > printed with %p"), enabling debug prints in sh-sci.c would generate
> > > > output like below confusing the users who try to sneak into the
> > > > internals of the driver:
> > > >
> > > > sh-sci e6e88000.serial: sci_request_dma: TX: got channel (____ptrval____)
> > > > sh-sci e6e88000.serial: sci_request_dma: mapped 4096@(____ptrval____) to 0x00000006798bf000
> > > > sh-sci e6e88000.serial: sci_request_dma: RX: got channel (____ptrval____)
> > > > sh-sci e6e88000.serial: sci_dma_tx_work_fn: (____ptrval____): 0...2, cookie 2
> > > >
> > > > There are two possible fixes for that:
> > > >  - get rid of '%p' prints if they don't reveal any useful information
> > > >  - s/%p/%px/, since it is unlikely we have any concerns leaking the
> > > >    pointer values when running a debug/non-production kernel
> > >
> > > I am concerned that this may expose information in circumstances
> > > where it is undesirable. Is it generally accepted practice to
> > > use %px in conjunction with dev_dbg() ?
> > >
> > > ...
> >
> > Below commits performed a similar s/%p/%px/ update in debug context:
> >
> > Authors (CC-ed)   Commit         Subject
> > ----------------------------------------
> > Christophe Leroy  b18f0ae92b0a1d ("powerpc/prom: fix early DEBUG messages")
> > Helge Deller      3847dab7742186 ("parisc: Add alternative coding infrastructure")
> > Michael Neuling   51c3c62b58b357 ("powerpc: Avoid code patching freed init sections")
> > Kuninori Morimoto dabdbe3ae0cb9a ("ASoC: rsnd: don't use %p for dev_dbg()")
> > Philip Yang       fa7e65147e5dca ("drm/amdkfd: use %px to print user space address instead of %p")
> > Matthew Wilcox    68c1f08203f2b0 ("lib/list_debug.c: print unmangled addresses")
> > Borislav Petkov   0e6c16c652cada ("x86/alternative: Print unadorned pointers")
> > Darrick J. Wong   c96900435fa9fd ("xfs: use %px for data pointers when debugging")
> > Helge Deller      04903c06b4854d ("parisc: Show unhashed HPA of Dino chip")
> >
> > To quote Matthew, with respect to any debug prints:
> > If an attacker can force this message to be printed, we've already lost.
> 
> I think the issue with using %px in debug code is that a distro may enable
> CONFIG_DYNAMIC_DEBUG (it is enabled in several defconfigs), after which
> an attacker just has to convince/trick the system into enabling debug for that
> particular driver.

How about going the route of commit c96900435fa9fd ("xfs: use %px for
data pointers when debugging"), i.e. s/%p/"PTR_FMT"/ like below (this
would enable the expected debug output only on manually defining DEBUG
in the *.c file, while still keeping the output hashed on
DYNAMIC_DEBUG=y if DEBUG is undefined).

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 3cd139752d3f..69cd87c5ef0c 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -56,6 +56,12 @@
 #include <asm/sh_bios.h>
 #endif
 
+#ifdef DEBUG
+#define PTR_FMT "%px"
+#else
+#define PTR_FMT "%p"
+#endif
+
 #include "serial_mctrl_gpio.h"
 #include "sh-sci.h"
 
@@ -1434,7 +1440,7 @@ static void sci_dma_tx_work_fn(struct work_struct *work)
 		goto switch_to_pio;
 	}
 
-	dev_dbg(port->dev, "%s: %p: %d...%d, cookie %d\n",
+	dev_dbg(port->dev, "%s: "PTR_FMT": %d...%d, cookie %d\n",
 		__func__, xmit->buf, xmit->tail, xmit->head, s->cookie_tx);
 
 	dma_async_issue_pending(chan);

> 
> > In any case, I won't be affected much if the change is not accepted,
> > since it doesn't resolve any major issue on my end. Thanks!
> 
> OK.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Best Regards,
Eugeniu.
