Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40A592041A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 13:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbfEPLJa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 07:09:30 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:54182 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726569AbfEPLJa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 07:09:30 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CFF8725AD69;
        Thu, 16 May 2019 21:09:27 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 035A6E21EEB; Thu, 16 May 2019 13:09:24 +0200 (CEST)
Date:   Thu, 16 May 2019 13:09:23 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH V2] ARM: dts: r8a779x: Configure PMIC IRQ pinmux
Message-ID: <20190516110923.amgrvejmndypgoie@verge.net.au>
References: <20190515082326.6449-1-marek.vasut@gmail.com>
 <CAMuHMdVNskLjMpr+RgL_+d_g7=QfO_51wWVYb_itf_19kugLjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVNskLjMpr+RgL_+d_g7=QfO_51wWVYb_itf_19kugLjA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 15, 2019 at 10:32:18AM +0200, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Wed, May 15, 2019 at 10:23 AM <marek.vasut@gmail.com> wrote:
> > From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >
> > The PMIC IRQ line pin multiplexing configuration is missing from the DTs.
> > Since the line is configured correctly by default, the system works fine.
> > However, add the IRQ line pin multiplexing configuration for completeness.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Simon Horman <horms+renesas@verge.net.au>
> > Cc: linux-renesas-soc@vger.kernel.org
> > To: linux-arm-kernel@lists.infradead.org
> > ---
> > V2: Move the pin control node from iic3 controller to pmic on 7792 Blanche,
> >     since there's only one PMIC on that board.
> 
> Thanks for the update!
> 
> As the tag condition from v1 is now fulfilled:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.3.
