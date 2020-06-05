Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4991EF99E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2020 15:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgFENuE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Jun 2020 09:50:04 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:54221 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbgFENuE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jun 2020 09:50:04 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4FDF4240009;
        Fri,  5 Jun 2020 13:49:55 +0000 (UTC)
Date:   Fri, 5 Jun 2020 15:53:15 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com,
        seanpaul@chromium.org, linux-renesas-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        michael.dege@renesas.com, gotthard.voellmeke@renesas.com,
        efriedrich@de.adit-jv.com, mrodin@de.adit-jv.com,
        ChaitanyaKumar.Borah@in.bosch.com,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200605135315.xlph44pl7kvmt23a@uno.localdomain>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <20200605132900.on527xcggg6f6pil@uno.localdomain>
 <20200605134124.GA28734@lxhi-065.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200605134124.GA28734@lxhi-065.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu

On Fri, Jun 05, 2020 at 03:41:24PM +0200, Eugeniu Rosca wrote:
> Hi Jacopo,
>
> On Fri, Jun 05, 2020 at 03:29:00PM +0200, Jacopo Mondi wrote:
> > On Wed, May 27, 2020 at 09:15:55AM +0200, Eugeniu Rosca wrote:
> > > Could you kindly share the cross compilation steps for your kmsxx fork?
> >
> > I usually build it on the target :)
>
> Interesting approach. With ARM getting more and more potent, why not? :)
>

For 'small' utilities like kmsxx it's doable

> >
> > > Just out of curiosity, have you ever tried to pull the display's HDMI
> > > cable while reading from CM2_LUT_TBL?
> >
> > Ahem, not really :) Did I get you right, you mean disconnecting the
> > HDMI cable from the board ?
>
> Right.
>

So, no, I have not tried. Do you see any intersting failure with the
mainline version ?

> > >
> > > At least with the out-of-tree CMM implementation [*], this sends the
> > > R-Car3 reference targets into an unrecoverable freeze, with no lockup
> > > reported by the kernel (i.e. looks like an serious HW issue).
> > >
> > > >
> > > > CMM functionalities are retained between suspend/resume cycles (tested with
> > > > suspend-to-idle) without requiring a re-programming of the LUT tables.
> > >
> > > Hmm. Is this backed up by any statement in the HW User's manual?
> > > This comes in contrast with the original Renesas CMM implementation [**]
> > > which does make use of suspend (where the freeze actually happens).
> > >
> > > Can we infer, based on your statement, that we could also get rid of
> > > the suspend callback in [**]?
> >
> > As Geert (thanks) explained what I've tested with is suspend-to-idle,
> > which retains the state of the LUT tables (and I assume other
> > not-yet-implemented CMM features, like CLU). I recall the out-of-tree
> > driver has suspend/resume routines but I never really tested that.
>
> I see. JFYI, there is a flaw in the suspend handling in the out-of-tree
> CMM patch [*], which renders the SoC unresponsive on HDMI hotplug. The
> fix is currently under review. Hopefully it will make its way to [*]
> in the nearest future. Just to keep in mind for the moment when CMM
> s2ram will become a mainline feature.

Thanks, let's keep this in mind. Next week I'll run a few tests again
with s2ram and will get back to you.

Thanks
  j

>
> > >
> > > [*] https://github.com/renesas-rcar/du_cmm
> > > [**] https://github.com/renesas-rcar/du_cmm/blob/c393ed49834bdbc/meta-rcar-gen3/recipes-kernel/linux/linux-renesas/0001-drm-rcar-du-Add-DU-CMM-support.patch#L1912
>
> --
> Best regards,
> Eugeniu Rosca
