Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64ACC1B40A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 12:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbfEMK3N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 06:29:13 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:60030 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbfEMK3N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 06:29:13 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 5AD173C00D1;
        Mon, 13 May 2019 12:29:09 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8oozwrA1y91j; Mon, 13 May 2019 12:29:02 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 9F0EF3C00BF;
        Mon, 13 May 2019 12:29:02 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 13 May
 2019 12:29:02 +0200
Date:   Mon, 13 May 2019 12:28:59 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     "George G. Davis" <george_davis@mentor.com>
CC:     "George G. Davis" <ggdavisiv@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH] serial: sh-sci: disable DMA for uart_console
Message-ID: <20190513102859.GA18462@vmlxhi-102.adit-jv.com>
References: <20190506194233.GA32430@vmlxhi-102.adit-jv.com>
 <1557413011-1662-1-git-send-email-george_davis@mentor.com>
 <20190510171021.GA22691@vmlxhi-102.adit-jv.com>
 <20190510183847.GB28648@mam-gdavis-lt>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190510183847.GB28648@mam-gdavis-lt>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi George,

On Fri, May 10, 2019 at 02:38:47PM -0400, George G. Davis wrote:
> Hello Eugeniu,
> 
> On Fri, May 10, 2019 at 07:10:21PM +0200, Eugeniu Rosca wrote:
> > Hi George,
> > 
> > I am able to reproduce the SCIF2 console freeze described in the
> > referenced patchwork link using M3-ES1.1-Salvator-XS and recent
> > v5.1-9573-gb970afcfcabd kernel.
> > 
> > I confirm the behavior is healed with this patch. Thanks!
> > Hope to see it accepted soon, since it fixes a super annoying
> > console breakage every fourth boot or so on lots of R-Car3 targets.
> > 
> > Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> 
> Thanks for testing.
> 
> Also note, for the record, that the problem is not limited to SCIF2, e.g. try
> setting console=ttySC<n> wheren <n> is not SCIF2 on any other board which
> includes support for other serial ports, e.g. r8a7795-salvator-x, and you will
> observe the same problem on other SCIF ports too. It's just a concidence that
> most boards use SCIF2 as the default serial console where the console hangs
> (resolved by this patch) have been observed on multiple boards.

Thanks for the additional level of detail.

FTR, trying to track the origin of the problem, it looks to me that the
issue was _unmasked_ by v4.16-rc1 commit be7e251d20e6c8 ("tty: serial:
sh-sci: Hide DMA config question") which turned on DMA on SCIF by
default.

I wonder if it'd be helpful to resend the patch w/o using --in-reply-to,
so that it appears as standalone entry in linux-renesas-soc patchwork.
Currently, assuming that the R-Car maintainers filter out any "Rejected"
patches (which is the default patchwork behavior), your patch would be
hidden from their eye.

-- 
Best Regards,
Eugeniu.
