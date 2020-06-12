Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F631F7A63
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2020 17:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgFLPKa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jun 2020 11:10:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55996 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbgFLPKa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jun 2020 11:10:30 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4444E24F;
        Fri, 12 Jun 2020 17:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591974626;
        bh=SSuOGDqv8rqKOzejgdO9SGLPWgm9R0N81SolLTYDpr8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wFlkE5SqP+m9RJWQsRC0dbw7Xw67arphpXNe3OdACDHvNp4ihNn+U+LBMccieFQf8
         7tGCX1R2Dt7Ol4mVk69EoNvmy86/3zLaTImwDZfhErcNyU96OCC1ZAnRv0v/j6dnsD
         LvC8FAvwlJsVYU9EVf+bEUHnCeZApBK73GniDF8o=
Date:   Fri, 12 Jun 2020 18:10:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
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
Message-ID: <20200612151005.GA28336@pendragon.ideasonboard.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <20200605132900.on527xcggg6f6pil@uno.localdomain>
 <20200605134124.GA28734@lxhi-065.adit-jv.com>
 <20200605135315.xlph44pl7kvmt23a@uno.localdomain>
 <20200607024158.GD7339@pendragon.ideasonboard.com>
 <20200609142959.GA621@lxhi-065.adit-jv.com>
 <20200612150032.pnqaqip54qfrbqst@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200612150032.pnqaqip54qfrbqst@uno.localdomain>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Fri, Jun 12, 2020 at 05:00:32PM +0200, Jacopo Mondi wrote:
> On Tue, Jun 09, 2020 at 04:29:59PM +0200, Eugeniu Rosca wrote:
> > On Sun, Jun 07, 2020 at 05:41:58AM +0300, Laurent Pinchart wrote:
> > > Note that the CMM driver is controlled by the DU driver. As the DU
> > > driver will reenable the display during resume, it will call
> > > rcar_du_cmm_setup() at resume time, which will reprogram the CMM. There
> > > should thus be no need for manual suspend/resume handling in the CMM as
> > > far as I can tell, but we need to ensure that the CMM is suspended
> > > before and resumed after the DU. I believe this could be implemented
> > > using device links.
> >
> > Based on below quote [*] from Jacopo's commit [**], isn't the device
> > link relationship already in place?
> 
> Yes, it's in place already.
> 
> I added pm_ops to cmm just to be able to printout when suspend/resume
> happens and the sequence is what comment [*] reports
> 
> [  222.909002] rcar_du_pm_suspend:505
> [  223.145497] rcar_cmm_pm_suspend:193
> 
> [  223.208053] rcar_cmm_pm_resume:200
> [  223.460094] rcar_du_pm_resume:513
> 
> However, Laurent mentioned that in his comment here that he expects
> the opposite sequence to happen (CMM to suspend before and resume after
> DU).
> 
> I still think what is implemented is correct:
> - CMM is suspended after DU: when CMM is suspended, DU is not feeding
>   it with data
> - CMM is resumed before: once DU restart operations CMM is ready to
>   receive data.
> 
> Laurent, what do you think ?

I think I shouldn't have written the previous e-mail in the middle of
the night :-) Suspending CMM after DU is obviously correct.

> > [*] Quote from commit [**]
> >    Enforce the probe and suspend/resume ordering of DU and CMM by
> >    creating a stateless device link between the two.
> >
> > [**] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8de707aeb45241
> >     ("drm: rcar-du: kms: Initialize CMM instances")

-- 
Regards,

Laurent Pinchart
