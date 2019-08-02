Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E71F7F3F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 12:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405135AbfHBJnw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 05:43:52 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34172 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405129AbfHBJnw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 05:43:52 -0400
Received: by mail-oi1-f194.google.com with SMTP id l12so56385269oil.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Aug 2019 02:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A+FPU/vGw66DQH6ItIezOEVqjuBIxZcPX9USWgAb1jM=;
        b=SUOcFbPy5rxss1N6dYEveiIIOMKAwymDOUtmfTGkpGgQ/Xpr3UWjMsAcCCDkBnqdup
         1eq2a1R6v6DN0QkaPATZN5n0kE4ue5wnZyoBJTKNOqWawLO3d/A97+DsCdyNlpGcjyQZ
         XE6laiEawO4BJz5p9iAOjzFnHPln42mGtcH2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A+FPU/vGw66DQH6ItIezOEVqjuBIxZcPX9USWgAb1jM=;
        b=X2d3VLAV3d8579d3vcO02XakNSXF94s6kAJF2DtiX/JBYb/JkdJUr3ae6HUJayWEs+
         9qn5mBw+SgpvTnHdSqKEYM74qiad7PY4jFif0tdBKjJf2HykR4CE1EcgWksO60hn7bNA
         PrjxCHE3oWoF0UzN0n6UwiwitWMRK2p4X1M6idQqUuGmok1hQcMBzeEj5zulAPvv1deG
         tVrlkUiTva9Gp+nMTCKFWDrdHuSt3x6z3y3LVi9dALT+U75eq27QuL2AmJegKDsaDCVR
         ABIbxrxALzV2r2SREbKura3W2bqQxAj930hQ0dwCb+XzFk97NrL1dXJmIFJFupREH65v
         q8VA==
X-Gm-Message-State: APjAAAWlOoadW8B955Pqkl4O9JTmK7MJ4QK2kw+R/X4alXyRwMKi+hUZ
        QQQh4w0Th1xFQQpi8I18VScIeFeFvsIbDZwEYCOJJg==
X-Google-Smtp-Source: APXvYqwrE1bn5ct0WaJ9P1S7sbbbgAxT5gZWv30BGTYJ1sG1vdgqFLWcTAJ+BcSNC7gWOTWkKRRExPmjXgf4HAnSNP0=
X-Received: by 2002:aca:b104:: with SMTP id a4mr2199449oif.14.1564739031061;
 Fri, 02 Aug 2019 02:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com> <20190731132002.dut5mdsqgh7b75iv@DESKTOP-E1NTVVP.localdomain>
 <20190802092920.4la5cwrltv2m6dke@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20190802092920.4la5cwrltv2m6dke@DESKTOP-E1NTVVP.localdomain>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 2 Aug 2019 11:43:39 +0200
Message-ID: <CAKMK7uEZaFEcs90+U3vzgH69+95BD58Dt=J=gT6=n6oah5Nbyg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job signaled
To:     Brian Starkey <Brian.Starkey@arm.com>
Cc:     "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
        Liviu Dudau <Liviu.Dudau@arm.com>,
        "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
        "maarten.lankhorst@linux.intel.com" 
        <maarten.lankhorst@linux.intel.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
        "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
        "eric@anholt.net" <eric@anholt.net>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
        Ayan Halder <Ayan.Halder@arm.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 2, 2019 at 11:29 AM Brian Starkey <Brian.Starkey@arm.com> wrote:
>
> Hi Lowry,
>
> On Thu, Aug 01, 2019 at 06:34:08AM +0000, Lowry Li (Arm Technology China) wrote:
> > Hi Brian,
> >
> > On Wed, Jul 31, 2019 at 09:20:04PM +0800, Brian Starkey wrote:
> > > Hi Lowry,
> > >
> > > Thanks for this cleanup.
> > >
> > > On Wed, Jul 31, 2019 at 11:04:45AM +0000, Lowry Li (Arm Technology China) wrote:
> > > > During it signals the completion of a writeback job, after releasing
> > > > the out_fence, we'd clear the pointer.
> > > >
> > > > Check if fence left over in drm_writeback_cleanup_job(), release it.
> > > >
> > > > Signed-off-by: Lowry Li (Arm Technology China) <lowry.li@arm.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_writeback.c | 23 +++++++++++++++--------
> > > >  1 file changed, 15 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> > > > index ff138b6..43d9e3b 100644
> > > > --- a/drivers/gpu/drm/drm_writeback.c
> > > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > > @@ -324,6 +324,9 @@ void drm_writeback_cleanup_job(struct drm_writeback_job *job)
> > > >   if (job->fb)
> > > >           drm_framebuffer_put(job->fb);
> > > >
> > > > + if (job->out_fence)
> > >
> > > I'm thinking it might be a good idea to signal the fence with an error
> > > here, if it's not already signaled. Otherwise, if there's someone
> > > waiting (which there shouldn't be), they're going to be waiting a very
> > > long time :-)
> > >
> > > Thanks,
> > > -Brian
> > >
> > Here it happened at atomic_check failed and test only commit. For both
> > cases, the commit has been dropped and it's only a clean up. So here better
> > not be treated as an error case:)
>
> If anyone else has a reference on the fence, then IMO it absolutely is
> an error to reach this point without the fence being signaled -
> because it means that the fence will never be signaled.
>
> I don't think the API gives you a way to check if this is the last
> reference, so it's safest to just make sure the fence is signalled
> before dropping the reference.
>
> It just feels wrong to me to have the possibility of a dangling fence
> which is never going to get signalled; and it's an easy defensive step
> to make sure it can never happen.
>
> I know it _shouldn't_ happen, but we often put in handling for cases
> which shouldn't happen, because they frequently do happen :-)

We're not as paranoid with the vblank fences either, so not sure why
we need to be this paranoid with writeback fences. If your driver
grabs anything from the atomic state in ->atomic_check it's buggy
anyway.

If you want to fix this properly I think we need to move the call to
prepare_signalling() in between atomic_check and atomic_commit. Then I
think it makes sense to also force-complete the fence on error ...
-Daniel

> > Since for userspace, it should have been failed or a test only case, so
> > writebace fence should not be signaled.
>
> It's not only userspace that can wait on fences (and in fact this
> fence will never even reach userspace if the commit fails), the driver
> may have taken a copy to use for "something".
>
> Cheers,
> -Brian
>
> >
> > Best regards,
> > Lowry
> > > > +         dma_fence_put(job->out_fence);
> > > > +
> > > >   kfree(job);
> > > >  }
> >
> > --
> > Regards,
> > Lowry



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
