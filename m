Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9600248239
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Aug 2020 11:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgHRJvG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Aug 2020 05:51:06 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:45630 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgHRJvE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Aug 2020 05:51:04 -0400
Received: by mail-oo1-f66.google.com with SMTP id u28so4003716ooe.12;
        Tue, 18 Aug 2020 02:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N3KQiXoRal1lq/bHBedgDpxTZXDkuHPF5NF/4ozPA4Y=;
        b=VQFwarOZlPOsEPbTY5eNudgeGV/2qfyoTs5+O1VXnt/nJ5btSROIgAuKlYqzcKf1/7
         HIO5FLRT8WKrWVVnSz/txbOpHBPzejlmxSjDYQy7t79E7vuJMk1EA+49uPHzN5KEZvcV
         xBRjnsGtDTdHB+tOCAhsAxgzHreA45jRFdnmqJoHphGhXCmNNfirBAR/9Dzh0evRXPoq
         vY0/rNnFOit0gU9hUuMXtPRUJ9s/sVgpXY4AgThX2Vw3mgVSRHw6ebL1RAXwavrVLY36
         vMgD8ptE0vy+NSG61ippsy2V+PA/n8KGfrBf4Ig7fwi4v30zlAaYDZzoraCk+2/nxrLJ
         T4fQ==
X-Gm-Message-State: AOAM532IKgu+janWL38EiHe3lmSqE/oU5ZyIiCiBw5QdlkseNThNgNgg
        /Bltvvdu3pQBmDshqmt1Q8mmRDrC33TwZ30hyEs=
X-Google-Smtp-Source: ABdhPJxB6zM/yyPNwUfUFu7JvOlqop8886ZCh/4k1BW096GuLnef3jyhFMETGMR876/vx9ybUme+OJvfr5N3XslvZUo=
X-Received: by 2002:a4a:6c13:: with SMTP id q19mr14520084ooc.11.1597744263093;
 Tue, 18 Aug 2020 02:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com> <20200605132900.on527xcggg6f6pil@uno.localdomain>
 <20200605134124.GA28734@lxhi-065.adit-jv.com> <20200605135315.xlph44pl7kvmt23a@uno.localdomain>
 <20200607024158.GD7339@pendragon.ideasonboard.com> <20200609142959.GA621@lxhi-065.adit-jv.com>
 <20200612150032.pnqaqip54qfrbqst@uno.localdomain> <20200612151005.GA28336@pendragon.ideasonboard.com>
 <20200612153607.GA23962@lxhi-065.adit-jv.com> <20200612155041.GB28336@pendragon.ideasonboard.com>
In-Reply-To: <20200612155041.GB28336@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Aug 2020 11:50:51 +0200
Message-ID: <CAMuHMdWwWs4avDMjWikFiE57Z7joYXBnsM557TzKa5Fd3XghxA@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        VenkataRajesh.Kalakodima@in.bosch.com,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Sean Paul <seanpaul@chromium.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        gotthard.voellmeke@renesas.com, efriedrich@de.adit-jv.com,
        Michael Rodin <mrodin@de.adit-jv.com>,
        ChaitanyaKumar.Borah@in.bosch.com,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Fri, Jun 12, 2020 at 5:51 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jun 12, 2020 at 05:36:07PM +0200, Eugeniu Rosca wrote:
> > On Fri, Jun 12, 2020 at 06:10:05PM +0300, Laurent Pinchart wrote:
> > > On Fri, Jun 12, 2020 at 05:00:32PM +0200, Jacopo Mondi wrote:
> > > > On Tue, Jun 09, 2020 at 04:29:59PM +0200, Eugeniu Rosca wrote:
> > > > > On Sun, Jun 07, 2020 at 05:41:58AM +0300, Laurent Pinchart wrote:
> > > > > > Note that the CMM driver is controlled by the DU driver. As the DU
> > > > > > driver will reenable the display during resume, it will call
> > > > > > rcar_du_cmm_setup() at resume time, which will reprogram the CMM. There
> > > > > > should thus be no need for manual suspend/resume handling in the CMM as
> > > > > > far as I can tell, but we need to ensure that the CMM is suspended
> > > > > > before and resumed after the DU. I believe this could be implemented
> > > > > > using device links.
> > > > >
> > > > > Based on below quote [*] from Jacopo's commit [**], isn't the device
> > > > > link relationship already in place?
> > > >
> > > > Yes, it's in place already.
> > > >
> > > > I added pm_ops to cmm just to be able to printout when suspend/resume
> > > > happens and the sequence is what comment [*] reports
> > > >
> > > > [  222.909002] rcar_du_pm_suspend:505
> > > > [  223.145497] rcar_cmm_pm_suspend:193
> > > >
> > > > [  223.208053] rcar_cmm_pm_resume:200
> > > > [  223.460094] rcar_du_pm_resume:513
> > > >
> > > > However, Laurent mentioned that in his comment here that he expects
> > > > the opposite sequence to happen (CMM to suspend before and resume after
> > > > DU).
> > > >
> > > > I still think what is implemented is correct:
> > > > - CMM is suspended after DU: when CMM is suspended, DU is not feeding
> > > >   it with data
> > > > - CMM is resumed before: once DU restart operations CMM is ready to
> > > >   receive data.
> > > >
> > > > Laurent, what do you think ?
> > >
> > > I think I shouldn't have written the previous e-mail in the middle of
> > > the night :-) Suspending CMM after DU is obviously correct.
> >
> > Thanks to Renesas team (kudos to Gotthard and Michael), we've
> > figured out that below sequence of clock handling (happening during
> > concurrent suspend and HDMI display unplug) leads to SoC lockup:
> >
> > cmm1 OFF      (caused by HDMI unplug)
> > x21-clock OFF         (caused by HDMI unplug)
> > du1 OFF       (caused by HDMI unplug)
> > cmm1 ON (caused by suspend to ram, as preparation for CMM register save)
> > # Freeze happens
> >
> > That seems to be explained by Chapter 35A.4.3 "Restriction of enabling
> > clock signal of the CMM" of HW User's manual (Rev.2.00 Jul 2019):
> >
> >  -----8<-----
> >  When the clock signal of the CMM is enabled (RMSTPCR7.CMMn or
> >  SMSTPCR7.CMMn = 0), the clock signal of the DU should be also enabled
> >  (RMSTPCR7.DUn or SMSTPCR7.DUn = 0).
> >  -----8<-----
> >
> > So, the lesson learned from the above is: do not enable the CMMi clock
> > while the DUi clock is disabled. I expect this to also potentially
> > give some input w.r.t. what to suspend/resume first, CMM or DU.
>
> This may be an ugly one. The DU driver needs to disable the CMM when
> suspending, and enabling the CMM when resuming. To do so, it calls
> functions of the CMM driver, and those functions access CMM registers.
> We can't do so while the CMM is suspended, so the DU has to suspend
> before the CMM, and resume after the CMM.
>
> On the other hand, as you state here, we need to make sure the CMM clock
> is disabled first. The CMM thus needs to suspend before the DU, and
> resume after the DU.
>
> Those are conflicting requirements.
>
> One option could be to use the .suspend_late() and .resume_early() PM
> operations for the DU, to turn the DU clock off late and turn it back on
> early. Integrating it with the DRM suspend/resume helpers will likely be
> complicated though. I wonder if we could find a more elegant solution.
>
> I the above sequence, you list "cmm1 ON" as a preparation for CMM
> register save. We don't need to save any register, the CMM driver has no
> .suspend() handler. The PM core should really skip waking up the device
> at that point (I recall complaining about the spurious wake ups at
> suspend time a while ago, but that neevr got addressed). Geert, any
> opinion on that ?

If there are issues with the PM core, please bring it up with the PM people.

If there's a (too) close integration of the CMM and the DU, perhaps the
CMM should list the DU module clock in its clocks property, too?
We have a similar construction for USB (module clocks 703 and 704).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
