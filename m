Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED1EAA4AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 15:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbfIENjO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Sep 2019 09:39:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55624 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727143AbfIENjO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 09:39:14 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98B5526D;
        Thu,  5 Sep 2019 15:39:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567690751;
        bh=b3KOuttUiB2EelRovaVecGiYFMN3AldXDLjxRMlXjhk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jwhgx2pxxHSjX7GaaFLi+jq16LH1ajMUk+bPprjKFjMCRXI85GuGACbKvWQcCTmx9
         +Gv5Xwnf60GMV4XjfcDcY9KRpH7dHhWEswVZFb3ZBdrzqk5dkJl2aay4DQU2Z0RChH
         9U0Q8tx9RIT61cB9EAinoS2G2+LWnyneEecbsIU8=
Date:   Thu, 5 Sep 2019 16:39:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/14] drm: rcar-du: Add support for CMM
Message-ID: <20190905133905.GN5035@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-9-jacopo+renesas@jmondi.org>
 <20190827002422.GQ5031@pendragon.ideasonboard.com>
 <20190827145619.33s7gkv7tgtsr6nz@uno.localdomain>
 <20190827163423.GB5054@pendragon.ideasonboard.com>
 <20190905095757.gg6s5pse5tvivxbs@uno.localdomain>
 <20190905111712.GG5035@pendragon.ideasonboard.com>
 <20190905131453.7ortosddn4afxd5j@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190905131453.7ortosddn4afxd5j@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Thu, Sep 05, 2019 at 03:14:53PM +0200, Jacopo Mondi wrote:
> On Thu, Sep 05, 2019 at 02:17:12PM +0300, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> >>>>>> +/**
> >>>>>> + * rcar_cmm_enable() - enable the CMM unit
> >>>>>> + *
> >>>>>> + * @pdev: The platform device associated with the CMM instance
> >>>>>> + *
> >>>>>> + * Enable the CMM unit by enabling the parent clock and enabling the CMM
> >>>>>> + * components, such as 1-D LUT, if requested.
> >>>>>> + */
> >>>>>> +int rcar_cmm_enable(struct platform_device *pdev)
> >>>>>> +{
> >>>>>> +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> >>>>>> +	int ret;
> >>>>>> +
> >>>>>> +	if (!rcmm)
> >>>>>> +		return -EPROBE_DEFER;
> >>>>>
> >>>>> This function is called in rcar_du_crtc_atomic_enable(), so that's not
> >>>>> the right error code. It seems we need another function for the CMM API
> >>>>> to defer probing :-/ I would call it rcar_cmm_init(). This check would
> >>>>> then be removed.
> >>>>
> >>>> I agree about the return code, but not the name, as this function
> >>>> actually enables the CMM.
> >>>
> >>> I meant creating a new rcar_cmm_init() function that would just have the
> >>> !rcmm check.
> >>>
> >>>> PROBE_DEFER does not make any sense here, I
> >>>> wonder where it come from, as the probing of CMM and DU has long
> >>>> happened once we get here (at least, I assume so, if we receive a
> >>>> gamma_table, userspace has already been running, and both DU and CMM
> >>>> should have probed. Otherwise, we can exploit the newly created device
> >>>> link, and make sure DU probes after the CMM).
> >>>>
> >>>> I would just change the return value here, and possibly use the device
> >>>> link to ensure the correct probing sequence.
> >>>
> >>> How does device link help here ?
> >>
> >> Currently it doesn't, as we are creating a stateless link.
> >>
> >> But if we go for a managed device link (which is the default, by the
> >> way, you have to opt-out from it) we can guarantee the CMM has probed
> >> before the DU probes, so that we have a guarantee when we get here
> >> !rcmm cannot happen.
> >>
> >> https://www.kernel.org/doc/html/v5.2-rc7/driver-api/device_link.html
> >> "The consumer devices are not probed before the supplier is bound to a driver,
> >>  and they’re unbound before the supplier is unbound."
> >>
> >> As we create the link, the CMM is the supplier of DU, so we could just
> >> drop the DL_FLAG_STATELESS flag in device_link_add() in 10/14.
> >>
> >> Does this match your understanding ?
> >
> > Except there's a bit of a chicken and egg issue, as you call
> > device_link_add() from rcar_du_cmm_init(), which thus require the DU
> > driver to probe first :-) For this to work we would probably need an
> > early initcall in the DU driver.
> 
> Yes indeed, the point where the link is created at the moment is too
> late... Is it worth an early initcall, or should we just assume that
> at the point where the LUT is operated userspace has already been
> running and both the CMM and the DU have probed already?

We should at least guard against crashes, that's why I've proposed an
init function in the CMM driver for the sole purpose of making sure the
device has been probed, and deferring probe of the DU.

-- 
Regards,

Laurent Pinchart
