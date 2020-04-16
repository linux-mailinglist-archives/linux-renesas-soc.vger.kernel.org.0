Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 707E41AB8C3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 08:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436767AbgDPGva (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 02:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2408587AbgDPGv1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 02:51:27 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B21C0610D5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2020 23:51:26 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id r25so5917991oij.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2020 23:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pLZEHboHrVUvSiMzAU5mB2mWJMs+hZ8IHC8retFcrgk=;
        b=JHwymh36ehjFDNDrb8YuMyQ1MkWFaqFQka5rlpHvpOpNowJkEQBJjUJHh6tEn9ItJf
         44VDASM1Nm9+28OJ0BhPDfmpGS7h0JIyE4ei3cCTN1kvXMsSEqE7hJ6ugWHQLwwsjP4k
         SXfyV81W2EeHu0cLCfENisqsTzpcXqPmUQBbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pLZEHboHrVUvSiMzAU5mB2mWJMs+hZ8IHC8retFcrgk=;
        b=qcL0kafC9AltZMXVBFAEVsVuiv1d+w4aAtT4zIhfmxw9uae7Vha3zBHeMybzXV5qz2
         NwcZBbJd0eSoHgQj8vxqz/iE503Nr6jQ9Aowoc8Oja4lBb+F3NOPJYuEVbTIopA6tdeI
         bPbdy+m4VSR8nOTc9EkgszFcOwLoAySngoZeUzUuCe6HAWzpwDj/Fs08isP+Xbf4ZN/R
         yG6Mz0KdzgqIFbVWsUJ9ByCSgfZd+8lyj9WXkQw+0n5hTCZ6qRsYLqKmHpQBpl0knVIN
         umPlUB/A6obsL9NqTicw8DyBUcoET4mBa9JYEvueWLdZcqZZe2g7+brTHP3rRhoVCOX/
         FN5w==
X-Gm-Message-State: AGi0PuYVKs3YWa8zjNG1PG1Ozvx/gQ8jmAL7RQNsF6T9URdNZNFsCe2o
        59jj+rCUA5RGU9fSNsUUMa/8l6QjS1/NtFIEo57xQw==
X-Google-Smtp-Source: APiQypLyNc+eIs12WumzaBN5ipx1548wfPjx2IqBdj2oxsFx0exWa6GdqAAPbqs2svHCYqkW3eZbfQLmptUx4Q5ixiM=
X-Received: by 2002:aca:2113:: with SMTP id 19mr2018002oiz.128.1587019885629;
 Wed, 15 Apr 2020 23:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200408202711.1198966-1-arnd@arndb.de> <20200408202711.1198966-6-arnd@arndb.de>
 <20200414201739.GJ19819@pendragon.ideasonboard.com> <CAK8P3a0hd5bsezrJS3+GV2nRMui4P5yeD2Rk7wQpJsAZeOCOUg@mail.gmail.com>
 <20200414205158.GM19819@pendragon.ideasonboard.com> <CAK8P3a1PZbwdvdH_Gi9UQVUz2+_a8QDxKuWLqPtjhK1stxzMBQ@mail.gmail.com>
 <CAMuHMdUb=XXucGUbxt26tZ1xu9pdyVUB8RVsfB2SffURVVXwSg@mail.gmail.com>
 <CAK8P3a1uasBFg9dwvPEcokrRhYE2qh6iwOMW1fDTY+LBZMrTjg@mail.gmail.com>
 <CAK8P3a0CoPUTSJp6ddDnmabo59iE73pugGSYayoeB5N57az9_w@mail.gmail.com>
 <20200415211220.GQ4758@pendragon.ideasonboard.com> <CAK8P3a1rDZO4cuL6VAXgu9sOiedcHqOSL7ELhpvULz+YYRaGbA@mail.gmail.com>
In-Reply-To: <CAK8P3a1rDZO4cuL6VAXgu9sOiedcHqOSL7ELhpvULz+YYRaGbA@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 16 Apr 2020 08:51:14 +0200
Message-ID: <CAKMK7uEoZ1jC8c25tPVX20kcdC1=+TpUUNyf+-c=sg5iK2cTZA@mail.gmail.com>
Subject: Re: [RFC 5/6] drm/rcar-du: fix selection of CMM driver
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "David S. Miller" <davem@davemloft.net>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Leon Romanovsky <leon@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Networking <netdev@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 15, 2020 at 11:22 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Apr 15, 2020 at 11:12 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Wed, Apr 15, 2020 at 09:07:14PM +0200, Arnd Bergmann wrote:
> > > On Wed, Apr 15, 2020 at 5:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > On Wed, Apr 15, 2020 at 4:13 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Wed, Apr 15, 2020 at 3:47 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > On Tue, Apr 14, 2020 at 10:52 PM Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > > > > > > Doesn't "imply" mean it gets selected by default but can be manually
> > > > > > > disabled ?
> > > > > >
> > > > > > That may be what it means now (I still don't understand how it's defined
> > > > > > as of v5.7-rc1), but traditionally it was more like a 'select if all
> > > > > > dependencies are met'.
> > > > >
> > > > > That's still what it is supposed to mean right now ;-)
> > > > > Except that now it should correctly handle the modular case, too.
> > > >
> > > > Then there is a bug. If I run 'make menuconfig' now on a mainline kernel
> > > > and enable CONFIG_DRM_RCAR_DU, I can set
> > > > DRM_RCAR_CMM and DRM_RCAR_LVDS to 'y', 'n' or 'm' regardless
> > > > of whether CONFIG_DRM_RCAR_DU is 'm' or 'y'. The 'implies'
> > > > statement seems to be ignored entirely, except as reverse 'default'
> > > > setting.
> > >
> > > Here is another version that should do what we want and is only
> > > half-ugly. I can send that as a proper patch if it passes my testing
> > > and nobody hates it too much.
> >
> > This may be a stupid question, but doesn't this really call for fixing
> > Kconfig ? This seems to be such a common pattern that requiring
> > constructs similar to the ones below will be a never-ending chase of
> > offenders.
>
> Maybe, I suppose the hardest part here would be to come up with
> an appropriate name for the keyword ;-)
>
> Any suggestions?
>
> This specific issue is fairly rare though, in most cases the dependencies
> are in the right order so a Kconfig symbol 'depends on' a second one
> when the corresponding loadable module uses symbols from that second
> module. The problem here is that the two are mixed up.
>
> The much more common problem is the one where one needs to
> wrong
>
> config FOO
>        depends on BAR || !BAR
>
> To ensure the dependency is either met or BAR is disabled, but
> not FOO=y with BAR=m. If you have any suggestions for a keyword
> for that thing, we can clean up hundreds of such instances.

Some ideas:

config FOO
    can use  BAR
    maybe BAR
    optional BAR

We should probably double-check that this is only ever used for when
both FOO and BAR are tri-state, since without that it doesn't make
much sense.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
