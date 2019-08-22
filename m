Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45E55997A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 17:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732878AbfHVPDC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 11:03:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48132 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbfHVPDC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 11:03:02 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C69E42AF;
        Thu, 22 Aug 2019 17:02:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566486180;
        bh=iftq3nJgJssug7RTlAUxv4Dz4YoWQSuHsGPqItfclIY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ubL4ZyHTybZNdyZ3zyxXyULmW0yoknWg1BLEC7hqPh7GTlsFxMOR6PPOpN1OSlXff
         A5zvEx0Wgx7/PiM4LZmjjXOFINmOgwF4KtWHWprNnucR/LLUQ4Krr+Iugdy7ijJiXz
         NqB81BKPG6dIoULHrTctLW1kV+knoafjdQMFcpsI=
Date:   Thu, 22 Aug 2019 18:02:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 03/19] arm64: renesas: Update 'vsps' property
Message-ID: <20190822150253.GA5027@pendragon.ideasonboard.com>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-4-jacopo+renesas@jmondi.org>
 <CAMuHMdVXQaqFg-m3a4xTiKLWQLz+itKQgGEBAQpHtG+MkTNzQw@mail.gmail.com>
 <20190822100051.yhguosvfz3zzykze@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190822100051.yhguosvfz3zzykze@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Thu, Aug 22, 2019 at 12:00:51PM +0200, Jacopo Mondi wrote:
> On Wed, Aug 21, 2019 at 02:16:02PM +0200, Geert Uytterhoeven wrote:
> > On Sat, Jul 6, 2019 at 4:07 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > > Update the 'vsps' property in the R-Car Gen3 SoC device tree files to
> > > match what's in in the documentation example.
> >
> > double in (no worries, I'll fix that up myself)
> >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > Thanks!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v5.4.
> >
> > BTW, any plans to add channel indices to the vsps properties in the
> > remaining DTS files?
> 
> According to what I read in the parsing 'vsps' proeprties parsing
> routine rcar_du_vsps_init(), if the channel index is not specified, it
> is defaulted to 0.
> 
>            /* Store the VSP pointer and pipe index in the CRTC. */
>            rcdu->crtcs[i].vsp = &rcdu->vsps[j];
>            rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;
> 
> The DU bindings documentation does not state that the channel index is
> optional, so yes, it might be worth changing this and simplify the
> parsing routing to always assume the channel index is there.
> 
> What does Laurent think? Is this worth the effort?

I think it's worth the effort to keep the upstream DT sources in sync
with the latest bindings, but We can't change the code as we need to
ensure backward compatibility. So, yes to the DT update, but the driver
should stay unmodified (or should receive a new comment explaining the
required backward compatibility if there's not one already).

-- 
Regards,

Laurent Pinchart
