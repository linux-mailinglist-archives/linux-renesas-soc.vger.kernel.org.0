Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9391B52C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 13:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbfEMLma (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 07:42:30 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56708 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbfEMLma (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 07:42:30 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B8BAC25AD63;
        Mon, 13 May 2019 21:42:27 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 9FA36E2232E; Mon, 13 May 2019 13:42:25 +0200 (CEST)
Date:   Mon, 13 May 2019 13:42:25 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "George G. Davis" <ggdavisiv@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "George G. Davis" <george_davis@mentor.com>
Subject: Re: [PATCH] serial: sh-sci: disable DMA for uart_console
Message-ID: <20190513114225.jhd5in7zavd5wvbw@verge.net.au>
References: <20190506194233.GA32430@vmlxhi-102.adit-jv.com>
 <1557413011-1662-1-git-send-email-george_davis@mentor.com>
 <CAMuHMdUCcxfVdY1PqfYRZMjHN2eP_-NAsniCY39XyrDysAu1Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUCcxfVdY1PqfYRZMjHN2eP_-NAsniCY39XyrDysAu1Pw@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 13, 2019 at 01:13:16PM +0200, Geert Uytterhoeven wrote:
> Hi George,
> 
> On Thu, May 9, 2019 at 4:44 PM George G. Davis <ggdavisiv@gmail.com> wrote:
> > As noted in commit 84b40e3b57ee ("serial: 8250: omap: Disable DMA for
> > console UART"), UART console lines use low-level PIO only access functions
> > which will conflict with use of the line when DMA is enabled, e.g. when
> > the console line is also used for systemd messages. So disable DMA
> > support for UART console lines.
> >
> > Fixes: https://patchwork.kernel.org/patch/10929511/
> > Reported-by: Michael Rodin <mrodin@de.adit-jv.com>
> > Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
> > Signed-off-by: George G. Davis <george_davis@mentor.com>
> 
> I think this makes sense.  In addition to OMAP 8250, the same approach
> is used in the Mediatek 8250 and iMX serial drivers.
> 
> Regardless, this is definitely better than removing the "dmas" properties
> from DT, as DT describes hardware, not usage policies.

+1

> Anyone else with a comment?

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
