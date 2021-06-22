Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE0D3B0D84
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 21:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232418AbhFVTPN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 15:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbhFVTPN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 15:15:13 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AEB0C06175F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 12:12:57 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id 14so500107oir.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 12:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w+PkCKWzFX6ch68xMO5vdAGxWd4TzqP1oTkPZJt/SU8=;
        b=ekUmPFB2M5VXXbkvlmuIKKlnSZHE29amdGhmgguDVqbcLNLaIs1QogG56KPe2c/vyH
         47uJ2q9OZDaYEG6CEUo7/rardPggTELJZvSoOfm61uUlH+6CfCG34FrFSWa9h55lCXn0
         VhP3FsAkxvxFYJIxZtygDVHH2mDIhjNb+GaYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w+PkCKWzFX6ch68xMO5vdAGxWd4TzqP1oTkPZJt/SU8=;
        b=qDZHZ9Th0d2koymymiVwV49EBLJiMbuz+HlHYqBU1UYSMJGm/4nR2ZqvrzLK0eFaEP
         XMp9WYHt7kvc0bDAP463XcYT0EogCMpPp/BA7jWFS3oDizRXD3T6GMPrlQrZBmMF5VvP
         QXTjC5C1VxNubf7tSd5EhoAxOlL3NEJoMhGs0ZR/f41vtWATIwFSOUMuHGERA1Onrg6B
         JlHH4XJhTxe9OWQF2heA6BNCk02GZYXOrMch/QGBuOWRM9Vqzkc0dkiUslkjJUNPdvjd
         8nrHtPOxYznWKPD7llxGdwN9JkIM4JTvqVkt0D7Pk4ipGUY+2kKccS6AJH04QvjZo2CR
         dQXA==
X-Gm-Message-State: AOAM533bjlGFqKgiG1Rnj99dlRcXqIKodj7wTin2JPTopAsPVaZgIRhX
        q6wl7BCui+tmeEwBIYsekgnkY+2jlneRTKcz7JBt2A==
X-Google-Smtp-Source: ABdhPJz/k3FiF0tgCVxa1om8nqMYiaOhW6/mWSjaPKKrNyT19R2NPRvfMrw2F8iAAUjfxj0wnpihMIckW3pT3vGMqhU=
X-Received: by 2002:aca:1a0c:: with SMTP id a12mr253218oia.14.1624389176394;
 Tue, 22 Jun 2021 12:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210621062742.26073-1-etom@igel.co.jp> <7cde82a9-c60c-e527-eeac-eaad0c5842a1@metux.net>
 <1cfab5f9-f275-aa53-00de-5da3fcea71c5@igel.co.jp> <20210622111239.73aa87aa@eldfell>
In-Reply-To: <20210622111239.73aa87aa@eldfell>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 22 Jun 2021 21:12:45 +0200
Message-ID: <CAKMK7uGhx0O4yFESWxoN1nDnEFH24cC6pRRDEBYDWHrnci_j+Q@mail.gmail.com>
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Esaki Tomohito <etom@igel.co.jp>,
        devicetree <devicetree@vger.kernel.org>,
        Takanari Hayama <taki@igel.co.jp>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Damian Hobson-Garcia <dhobsong@igel.co.jp>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 22, 2021 at 10:12 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Tue, 22 Jun 2021 13:03:39 +0900
> Esaki Tomohito <etom@igel.co.jp> wrote:
>
> > Hi, Enrico Weigelt
> > Thank you for reply.
> >
> > On 2021/06/22 1:05, Enrico Weigelt, metux IT consult wrote:
> > > On 21.06.21 08:27, Tomohito Esaki wrote:
> > >
> > > Hi,
> > >
> > >> Virtual DRM splits the overlay planes of a display controller into multiple
> > >> virtual devices to allow each plane to be accessed by each process.
> > >>
> > >> This makes it possible to overlay images output from multiple processes on a
> > >> display. For example, one process displays the camera image without compositor
> > >> while another process overlays the UI.
> > >
> > > Are you attempting to create an simple in-kernel compositor ?
> >
> > I think the basic idea is the same as DRMlease.
>
> Hi,
>
> indeed. Why not use DRM leases instead?
>
> > We want to separate the resources from the master in units of planes,
> > so we proposed virtual DRM.
> > I think the advantage of vDRM is that you can use general DRM APIs
> > in userland.
>
> You do that with DRM leases too.
>
> > > I don't think that's not the way to go, at least not by touching each
> > > single display driver, and not hardcoding the planes in DT.
> >
> > Thank you for comment. I will reconsider about DT.
> >
> > > What's the actual use case you're doing that for ? Why not using some
> > > userland compositor ?
> >
> > I think when latency is important (e.g., AR, VR, for displaying camera
> > images in IVI systems), there may be use cases where the compositor
> > cannot be used.
> > Normally, when the image is passed through the compositor, it is
> > displayed after 2 VSYNC at most, because the compositor combines the
> > image with VSYNC synchronization. On the other hand, if we use vDRM, the
> > image will be displayed at the next VSYNC, so it will be displayed after
> > 1 VSYNC at most.
>
> As I said in my other email, this is false in the general sense.
>
> > Also, since the compositor is a single point of failure, we may not want
> > to make it dependent on it.
>
> This... I'm not quite sure I buy it. If any of all the programs using
> virtual KMS crashes, you still lose some crucial components from your
> display. Maybe that program, while crashing, uploads such a bad state
> to its very own KMS plane, that it causes other KMS planes to
> malfunction. Then you need to detect this situation and still restart
> everything, not just the crashed program.

This, a hundred times. At least in general it's impossible to
guarantee resource isolation between different parts of a kms device -
everything is shared at least in some driver in funny ways.

The only thing we try to guarantee is that if you keep flipping the
same plane with same pixel format, stride, offset, absolutely
everything except the memory block unchanged, then that's guaranteed
to work. Everything else is off the table.

This is why the drm-lease design ended up with revoke support, because
if something goes wrong a superior instance (the compositor, the
kernel can't decide that for userspace) needs to decide whom to shoot
and revoke their access.

> I would think a userspace compositor approach is actually more
> reliable. You write the compositor to be extremely robust. Exactly
> because the compositor is in control of the complete display device and
> not just little pieces of it, it can see what is happening and it can
> mitigate problems. If you have more unreliable components needing
> access to display, make those clients to the compositor, so they can
> crash and malfunction on their own without potentially killing the
> whole display device. If you are as concerned about latency as XR
> people are, then use DRM leases.
>
> Also, what if your virtual KMS driver has a bug? Restarting the kernel
> is much harder that restarting a userspace compositor that hands out
> DRM leases.
>
> The userspace compositor could even be such that it does nothing more
> than handing out DRM leases. However, DRM leases have the problem that
> there is no single entity responsible for keeping the display device
> working, but that responsibility is split between several processes and
> none of them sees the whole picture.

Yeah I think a compositor for this use-case, written in Rust and
heavily audited/proofed is probably a lot more reliable than cobbling
ill-defined kernel driver code on top of barely-defined hw semantics
in resource-sharing cases.

> Btw. VKMS is an existing DRM driver, so your name choice is conflicting.

Yeah that too :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
