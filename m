Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0031EF8F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2020 15:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgFENZv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Jun 2020 09:25:51 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:53265 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbgFENZt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jun 2020 09:25:49 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E7135C0008;
        Fri,  5 Jun 2020 13:25:39 +0000 (UTC)
Date:   Fri, 5 Jun 2020 15:29:00 +0200
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
Message-ID: <20200605132900.on527xcggg6f6pil@uno.localdomain>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200527071555.GA23912@lxhi-065.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Eugeniu,
   sorry for the late reply

On Wed, May 27, 2020 at 09:15:55AM +0200, Eugeniu Rosca wrote:
> Hi Jacopo,
>
> On Tue, Oct 15, 2019 at 12:46:13PM +0200, Jacopo Mondi wrote:
>  ----8<---
>
> > * Testing
> > I have tested by injecting a color inversion LUT table and enabling/disabling it
> > every 50 displayed frames:
> > https://jmondi.org/cgit/kmsxx/log/?h=gamma_lut
>
> Could you kindly share the cross compilation steps for your kmsxx fork?
>

I usually build it on the target :)

> Just out of curiosity, have you ever tried to pull the display's HDMI
> cable while reading from CM2_LUT_TBL?

Ahem, not really :) Did I get you right, you mean disconnecting the
HDMI cable from the board ?

>
> At least with the out-of-tree CMM implementation [*], this sends the
> R-Car3 reference targets into an unrecoverable freeze, with no lockup
> reported by the kernel (i.e. looks like an serious HW issue).
>
> >
> > CMM functionalities are retained between suspend/resume cycles (tested with
> > suspend-to-idle) without requiring a re-programming of the LUT tables.
>
> Hmm. Is this backed up by any statement in the HW User's manual?
> This comes in contrast with the original Renesas CMM implementation [**]
> which does make use of suspend (where the freeze actually happens).
>
> Can we infer, based on your statement, that we could also get rid of
> the suspend callback in [**]?

As Geert (thanks) explained what I've tested with is suspend-to-idle,
which retains the state of the LUT tables (and I assume other
not-yet-implemented CMM features, like CLU). I recall the out-of-tree
driver has suspend/resume routines but I never really tested that.

Thanks
   j

>
> [*] https://github.com/renesas-rcar/du_cmm
> [**] https://github.com/renesas-rcar/du_cmm/blob/c393ed49834bdbc/meta-rcar-gen3/recipes-kernel/linux/linux-renesas/0001-drm-rcar-du-Add-DU-CMM-support.patch#L1912
>
> --
> Best regards,
> Eugeniu Rosca
