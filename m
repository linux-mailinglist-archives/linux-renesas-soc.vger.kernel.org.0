Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7BDD455C27
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 14:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232144AbhKRNH4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 08:07:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233181AbhKRNGK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 08:06:10 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E77AC0611FE
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Nov 2021 05:02:23 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id u60so17699813ybi.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Nov 2021 05:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QWeksAMBCWoslOUok88MbaHvaRoKflV2Jmdi8dFOMK8=;
        b=RebX1zzPGWk1d6oHz0bRgF3+LtcJs22vlw7JAD5QwP4Ak/hkhG9wfUi49WGDVmiQx8
         k1lF0dG4MAidqeC1Uwx+4EDDQZVYmQ3MYSZ2zDUldRKKpI/UCIiDkKtn78xjCFzvtFCl
         TF/NjhhRmjfj+7Eoq3WnTT0VdfagJqi6V+qgHygbfSRexVPm/DPLfizzVCl57psB3sVS
         0jLQzgNhnrecbCD187mt3nl2GfW2J+aF/lFHQ3y6zHEV39S+0MSVKBkVm90zHkp6ozlw
         ll5xall6s6prmnQHrvRloCH5iarwO7Z/lzZFBQc2pqJGleUQKRhCF15Cs8HCeIR1+ZQu
         JKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QWeksAMBCWoslOUok88MbaHvaRoKflV2Jmdi8dFOMK8=;
        b=cs336OuqOdVjz1UsouKmNWDrvKQxZuRkUdcjZS1niPJdJwS9iHQmioquPWgwGhBN9Q
         u31q1PZFluCdW2fqrOYfWXfHyFmduD9qf1OCvSXnXJ7SW7oUChp+gLRc1T3igx2+Vsma
         t58Yb3IR2coHcBuU17nr5QXYGWfvWkU0F0OOd+KI/ygRESHGSKFXJ0xAQmlS0rQNkFh9
         a6qznjlKnnsUz+i8mFMvPTmtfGPJ98LnZwxUloFL+8QB3OsUIQnLAHR7lxlmDt5EuNqy
         gLWgus0GCB7fFAd95hNEYWkkSdZ+WGS8+DSasdr2latvRbvqg4qJfxfacqjDQzH8zS1b
         ORww==
X-Gm-Message-State: AOAM532jUSvgNlQdWi8L82LHTowsg/I8yBs7w1eZ2gby6duf/pWBwxkm
        obiGgH/pWkRcdZuzrS75CiD6b+/gjOXm6Z4BQlB1SQ==
X-Google-Smtp-Source: ABdhPJxycHP2qGozp9KXuKrapYT5FW5GnLpl9qPYBad15wXVY/w8F8MuvYPJwwZY1Lnv9EstVJrCeBwm1w8NSFw6Hhg=
X-Received: by 2002:a25:300a:: with SMTP id w10mr26918243ybw.506.1637240542658;
 Thu, 18 Nov 2021 05:02:22 -0800 (PST)
MIME-Version: 1.0
References: <20190509054518.10781-1-etom@igel.co.jp> <20190509071429.GA4773@pendragon.ideasonboard.com>
 <20217791-f912-0864-48a9-dfacadfb3650@igel.co.jp> <20190511181027.GC13043@pendragon.ideasonboard.com>
 <YZZHuNgGr0kZXzyl@pendragon.ideasonboard.com>
In-Reply-To: <YZZHuNgGr0kZXzyl@pendragon.ideasonboard.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Thu, 18 Nov 2021 13:02:11 +0000
Message-ID: <CAPj87rNPiLve14H85ZBbn-oozqgeS26DGUCg2oJ8LupAdYcEqA@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: add modifiers support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Esaki Tomohito <etom@igel.co.jp>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi all,
Thanks for this Laurent. Esaki-san, could you please CC dri-devel@ on
discussions like this?

On Thu, 18 Nov 2021 at 12:32, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Sat, May 11, 2019 at 09:10:27PM +0300, Laurent Pinchart wrote:
> > On Thu, May 09, 2019 at 06:25:19PM +0900, Esaki Tomohito wrote:
> > > Weston compositor (v5.0.0 or later) uses the DRM API to get the
> > > supported modifiers and determines if the sprite plane can be used by
> > > comparing the modifiers with the client specified modifier.
> > > In currently driver, since the weston doesn't know supported modifiers,
> > > that cannot determine if the received dmabuf can be passed through to
> > > sprite plane.
> > > Since there are R-Car GPU which support linear modifier, the sprite
> > > plane cannot be used in a compositor similar to the weston if client
> > > specify linear modifier.
> >
> > I don't think the right solution is to expose the linear modifier from
> > all drivers that don't otherwise support modifiers. We should instead
> > fix it either in Weston, and treat drivers that don't support the
> > modifiers API as supporting the linear modifier only, or in the DRM/KMS
> > core by reporting the linear modifier for drivers that don't explicitly
> > support modifiers.
>
> I've been pointed to
> https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/3350#note_1161827,
> and we had a discussion on the #dri-devel IRC channel today on this
> topic. It turns out I was wrong, not specifying modifiers in userspace
> is different than specifying a linear modifier. This is true for some
> legacy drivers only (e.g. radeon) that pre-date the modifiers API, and
> which select a tiling format internally based on some heuristics.
>
> I still don't like this patch though, as it would need to be replicated
> in most drivers. It would be better if we could handle this in the DRM
> core. Daniel kindly offered to summarize the IRC discussion in a reply
> to this e-mail.

Just quickly, I believe the check for the linear modifier in fb_create
is unnecessary, as this should already be checked in the core through
format_mod_supported().

There is indeed a difference between LINEAR and INVALID. Linear is an
explicit declaration of the layout; INVALID (i.e. no modifier) means
'I don't know what this is, so you should guess'. Guessing is
obviously not reliable, so Weston only passes buffers with no modifier
to KMS in two cases. The first case is when we allocate a dumb buffer
and the driver does not support modifiers; this is safe since it's the
same driver. The second case is when either the GPU driver or KMS
driver do not support modifiers and we allocate a buffer via GBM with
USE_SCANOUT; in this case, it is GBM's responsibility to select the
'right' layout.

We will never create a DRM framebuffer with no modifiers when the
original buffer comes from a client. If the client does not support
modifiers but the KMS driver does, then we do not know that the client
has allocated a suitable layout, so this is not safe. If the client
does explicitly declare a modifier but the KMS driver does not support
modifiers, then we also do not know that this is safe to use. So
unless both sides (client/GPU and KMS) support modifiers, we do not do
direct scanout from client buffers.

This patch would enable this usecase by declaring support for the
linear modifier from KMS; when used with a PVR driver which explicitly
declares the linear modifier, we know it is safe to pass that client
buffer to KMS.

Laurent's concern is that the DRM core should handle this rather than
open-coding in every driver, which I agree with. Some drivers (e.g.
radeon, maybe legacy NV?) do not support modifiers, and _also_ do
magic inference of the actual layout of the underlying buffer.
However, these drivers are legacy and we do not accept any new
addition of inferring layout without modifiers.

I think the best way forward here is:
  - add a new mode_config.cannot_support_modifiers flag, and enable
this in radeon (plus any other drivers in the same boat)
  - change drm_universal_plane_init() to advertise the LINEAR modifier
when NULL is passed as the modifier list (including installing a
default .format_mod_supported hook)
  - remove the mode_config.allow_fb_modifiers hook and always
advertise modifier support, unless
mode_config.cannot_support_modifiers is set

FWIW, the effective modifier API and also valid usage is documented
here, which should be finished and merged shortly:
    https://lore.kernel.org/dri-devel/20210905122742.86029-1-daniels@collabora.com/

Cheers,
Daniel
