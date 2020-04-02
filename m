Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19B8119BFF6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2020 13:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388075AbgDBLNw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Apr 2020 07:13:52 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42539 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728803AbgDBLNw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Apr 2020 07:13:52 -0400
Received: by mail-ot1-f68.google.com with SMTP id z5so2954009oth.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Apr 2020 04:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6mN1vxpAIxPcq3zgtKOyz6GPK03ELmAvkA669+9LCHY=;
        b=bbzsRmXABvf5+YUGKiMzeDxp0CLBxwFYEVeogxYVqPs8TLZV1jDIRHjwwPlMn+xmmc
         urTSh+iwKWh+4FatPBZAEtWlLdtIs2cpFI7xcQZaAaw/rDxOHl3f0Z+dGYKvUSbywNuk
         B+Fhh/PSsL9cQSF1dmX04K6WHXbb17FtHRfCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6mN1vxpAIxPcq3zgtKOyz6GPK03ELmAvkA669+9LCHY=;
        b=Zm2ulrw3mRIKxDudJowa574vgzebI4kuhU1o9i7gX9550WokgXYLYZ5hS8SKsRn0iC
         y0Vch0/97jgI4A7374zeEU2l8R8Hhdhjqg/EgJOhxfQH2Up7GGHDvHPWtpK0TY5KuNNO
         oAVwdDLOTD0y0AgS41dxvEX2a+SOUpPCyjUQowYQLPMVkjgLQh7Ojf31p2GcUrhZ5Wyq
         jz3XMX7vFKGOiF9iUi63OMZpiVK2MIVoPU+ySmwDfEll3oTa8X3sK9Or5vOwC4jpPzX6
         xpG2aDikQ3j+opG4tm3NRPWPlI/xsTFPcWXgmNlOZIpJEXAfUWGnktFfv3sYU2JU6Uaz
         jVrg==
X-Gm-Message-State: AGi0PuYWvh2/4xqDgOXALQGvoDhCLh0Jf5PHZNUWZ8RfUSi74RcXt1yp
        Cu+Ry0rTC+onK77rAa6/y+n7NRgifUKQU7POO41/Pw==
X-Google-Smtp-Source: APiQypKoVuG+6C3mRSZs/TjgjoWbK7bRS5UTbOTYH3v7jaG1WKLL4stRe37NcNu382/UUb3g0Bo+t7OhCyk7BfPwSwo=
X-Received: by 2002:a05:6830:15d4:: with SMTP id j20mr1878145otr.303.1585826029986;
 Thu, 02 Apr 2020 04:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200402104035.13497-1-laurent.pinchart+renesas@ideasonboard.com> <CAPj87rMCf0qv0mQxKRZZLzhJ3HBG92MdABKM5JJx8KarG_M3DQ@mail.gmail.com>
In-Reply-To: <CAPj87rMCf0qv0mQxKRZZLzhJ3HBG92MdABKM5JJx8KarG_M3DQ@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 2 Apr 2020 13:13:37 +0200
Message-ID: <CAKMK7uGFJoWEk31RQ8cU5ub5opKb13obz_MWO7BtzmS6yZjW-w@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Create immutable zpos property for primary planes
To:     Daniel Stone <daniel@fooishbar.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 2, 2020 at 12:57 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> On Thu, 2 Apr 2020 at 11:40, Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > The R-Car DU driver creates a zpos property, ranging from 1 to 7, for
> > all the overlay planes, but leaves the primary plane without a zpos
> > property. The DRM/KMS API doesn't clearly specify if this is acceptable,
> > of it the property is mandatory for all planes when exposed for some of
> > the planes. Nonetheless, weston v8.0 has been reported to have trouble
> > handling this situation.
>
> Yeah. It didn't even occur to me/us that someone would do that, to be
> honest. We need to have zpos information for all planes that we're
> using in order for zpos to be at all meaningful, and we can't exactly
> avoid using the primary plane. Without knowing the primary plane's
> zpos, we can't know if the overlays are actually overlays or in fact
> underlays.

Maybe we need to clarify docs that if you expose zpos, then you should
expose it on all planes (opting for immutable zpos where it can't be
adjusted)? Care to type up that quick doc patch please?
-Daniel

>
> > The DRM core offers support for immutable zpos properties. Creating an
> > immutable zpos property set to 0 for the primary planes seems to be a
> > good way forward, as it shouldn't introduce any regression, and can fix
> > the issue. Do so.
>
> Perfect. We support immutable properties entirely well, we just need
> to know about them.
>
> > Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
>
> Cheers,
> Daniel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
