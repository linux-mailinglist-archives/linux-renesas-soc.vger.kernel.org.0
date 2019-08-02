Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA2A7FBB8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 16:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbfHBOGX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 10:06:23 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46187 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731484AbfHBOGW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 10:06:22 -0400
Received: by mail-ed1-f68.google.com with SMTP id d4so72539096edr.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Aug 2019 07:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=p1KbwWigVt4fPabp1PFOSuWAjFwg5XXZ5xw32khObXU=;
        b=abum6jWtI06IzQi92RY7wBkZcRWpAJN9L98U26jHEw7mz51UiJ10czXj1+jLNnKXXH
         ddW1pa0TIOvUAnwJ4pxNyD8wvPRfV/l8Hg5EWt2f6s1yrLHeFV4JOlesmdS1ik/vkJjJ
         5DFXSoH6+dVof4FN7sJiaFAIl787oeGMwqdAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=p1KbwWigVt4fPabp1PFOSuWAjFwg5XXZ5xw32khObXU=;
        b=Raa/AQv2q3AzLI/DcqaVPEvw8cDqz4hKWb7QdzxdgvhImfyy2X/feti7Emlr/SEZW8
         rVooU+yYriWmKROgkHiqN8dJctDw8r9LUzpBqYk0EzlbPm8geknPEsaRZuaKZauL+y9z
         nducqAaOzGjdylgYueZRR53vhwCX4N8VtbOlkSXgsXtN70tLUM3Nxu/fGfrXl9eDEeJV
         n6Iq6iE93+GPGvo8jRO7IScEVzxYXuShY2m4s8EVDBDWk2eNyfWwO4CHZ1Ykb5K+cR+x
         MtKZUVHyWpArjy3SCz6vRMQZwPZt9wXUpppuud6gm+aQ2UE48YYgihgXZvK3WgBeRP8z
         QC9w==
X-Gm-Message-State: APjAAAWADM0FBV7KYoPBy89wvX7sviaMysoGdF7wCKmkkdUqTAgr6Q+6
        aJJCqiC7kpYXv8oiW27CwDI=
X-Google-Smtp-Source: APXvYqxIKtpjCYsHchgchG2dJLleNo/WK0qX+MScSUhXnTDIghKPIHG/6otAtiBcYt4kc29kBRcuDA==
X-Received: by 2002:a17:906:1292:: with SMTP id k18mr106811258ejb.146.1564754779811;
        Fri, 02 Aug 2019 07:06:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id f24sm17778831edt.82.2019.08.02.07.06.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 02 Aug 2019 07:06:18 -0700 (PDT)
Date:   Fri, 2 Aug 2019 16:06:16 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Brian Starkey <Brian.Starkey@arm.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
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
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Message-ID: <20190802140616.GM7444@phenom.ffwll.local>
Mail-Followup-To: Brian Starkey <Brian.Starkey@arm.com>,
        "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
        Liviu Dudau <Liviu.Dudau@arm.com>,
        "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
        "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
        "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
        "eric@anholt.net" <eric@anholt.net>,
        "kieran.bingham+renesas@ideasonboard.com" <kieran.bingham+renesas@ideasonboard.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
        Ayan Halder <Ayan.Halder@arm.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        nd <nd@arm.com>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
 <20190731132002.dut5mdsqgh7b75iv@DESKTOP-E1NTVVP.localdomain>
 <20190802092920.4la5cwrltv2m6dke@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uEZaFEcs90+U3vzgH69+95BD58Dt=J=gT6=n6oah5Nbyg@mail.gmail.com>
 <CAKMK7uH38rxyTyuYRGJ6NBejyUxQ6Qvr1CdjH2kpXiq+3-=t8Q@mail.gmail.com>
 <20190802100904.blnusnieti3pxgxu@DESKTOP-E1NTVVP.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190802100904.blnusnieti3pxgxu@DESKTOP-E1NTVVP.localdomain>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 02, 2019 at 10:09:05AM +0000, Brian Starkey wrote:
> Hi Daniel,
> 
> On Fri, Aug 02, 2019 at 11:45:13AM +0200, Daniel Vetter wrote:
> > On Fri, Aug 2, 2019 at 11:43 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Fri, Aug 2, 2019 at 11:29 AM Brian Starkey <Brian.Starkey@arm.com> wrote:
> > > >
> > > > Hi Lowry,
> > > >
> > > > On Thu, Aug 01, 2019 at 06:34:08AM +0000, Lowry Li (Arm Technology China) wrote:
> > > > > Hi Brian,
> > > > >
> > > > > On Wed, Jul 31, 2019 at 09:20:04PM +0800, Brian Starkey wrote:
> > > > > > Hi Lowry,
> > > > > >
> > > > > > Thanks for this cleanup.
> > > > > >
> > > > > > On Wed, Jul 31, 2019 at 11:04:45AM +0000, Lowry Li (Arm Technology China) wrote:
> > > > > > > During it signals the completion of a writeback job, after releasing
> > > > > > > the out_fence, we'd clear the pointer.
> > > > > > >
> > > > > > > Check if fence left over in drm_writeback_cleanup_job(), release it.
> > > > > > >
> > > > > > > Signed-off-by: Lowry Li (Arm Technology China) <lowry.li@arm.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/drm_writeback.c | 23 +++++++++++++++--------
> > > > > > >  1 file changed, 15 insertions(+), 8 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> > > > > > > index ff138b6..43d9e3b 100644
> > > > > > > --- a/drivers/gpu/drm/drm_writeback.c
> > > > > > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > > > > > @@ -324,6 +324,9 @@ void drm_writeback_cleanup_job(struct drm_writeback_job *job)
> > > > > > >   if (job->fb)
> > > > > > >           drm_framebuffer_put(job->fb);
> > > > > > >
> > > > > > > + if (job->out_fence)
> > > > > >
> > > > > > I'm thinking it might be a good idea to signal the fence with an error
> > > > > > here, if it's not already signaled. Otherwise, if there's someone
> > > > > > waiting (which there shouldn't be), they're going to be waiting a very
> > > > > > long time :-)
> > > > > >
> > > > > > Thanks,
> > > > > > -Brian
> > > > > >
> > > > > Here it happened at atomic_check failed and test only commit. For both
> > > > > cases, the commit has been dropped and it's only a clean up. So here better
> > > > > not be treated as an error case:)
> > > >
> > > > If anyone else has a reference on the fence, then IMO it absolutely is
> > > > an error to reach this point without the fence being signaled -
> > > > because it means that the fence will never be signaled.
> > > >
> > > > I don't think the API gives you a way to check if this is the last
> > > > reference, so it's safest to just make sure the fence is signalled
> > > > before dropping the reference.
> > > >
> > > > It just feels wrong to me to have the possibility of a dangling fence
> > > > which is never going to get signalled; and it's an easy defensive step
> > > > to make sure it can never happen.
> > > >
> > > > I know it _shouldn't_ happen, but we often put in handling for cases
> > > > which shouldn't happen, because they frequently do happen :-)
> > >
> > > We're not as paranoid with the vblank fences either, so not sure why
> > > we need to be this paranoid with writeback fences. If your driver
> > > grabs anything from the atomic state in ->atomic_check it's buggy
> > > anyway.
> > >
> > > If you want to fix this properly I think we need to move the call to
> > > prepare_signalling() in between atomic_check and atomic_commit. Then I
> > > think it makes sense to also force-complete the fence on error ...
> 
> Well, fair enough. I'm struggling with "that's too paranoid" vs "fix
> it properly" though? Is it a "problem" worth fixing or not?

Up to you to decide that.

> It seems natural to me to do the fence cleanup in the cleanup function
> for the object which owns the fence.
> 
> > >
> > > > > Since for userspace, it should have been failed or a test only case, so
> > > > > writebace fence should not be signaled.
> > > >
> > > > It's not only userspace that can wait on fences (and in fact this
> > > > fence will never even reach userspace if the commit fails), the driver
> > > > may have taken a copy to use for "something".
> > 
> > I forgot to add: you can check this by looking at the fence reference
> > count. A WARN_ON if that's more than 1 on cleanup (but also for the
> > out fences) could be a nice addition.
> 
> Do we really want to be looking at the fence internals directly like
> that?

Wrap it up in a helper like dma_fence_release_private or whatever, which
combines the check and (hopefully final) _put(). Might need a better name.
-Daniel

> 
> Cheers,
> -Brian
> 
> > -Daniel
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > +41 (0) 79 365 57 48 - http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
