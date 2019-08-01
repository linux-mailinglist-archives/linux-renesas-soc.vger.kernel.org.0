Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D205D7D640
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 09:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730796AbfHAH0l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 03:26:41 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44553 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727490AbfHAH0k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 03:26:40 -0400
Received: by mail-wr1-f68.google.com with SMTP id p17so72372749wrf.11;
        Thu, 01 Aug 2019 00:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yg/wPUdcMV4pWhJlrkg7o37KpvgJ1aZ5oGNgYOtYNQo=;
        b=NS1cPh84gg4Md6DK+eggvIayMgmmNO0KF79SqtNpQRoP9Kt1ZgAqMMmM2oQQ92J1RJ
         aq4THLN8THMfi8v2drWL3UDzFIiY1RAJW6nmYndKu8sEzkYmg28hIChzfE2WnCZziYkM
         gCKKBqJc7SsH6RfKv6zX5utHe0iLvsaSwiSJC+4z1H7PM9zGZzkLKXmhApbmD8/1g0GZ
         ShF+VhOTgN411cq3cAHwuD/unPzNE7CqB1jIQNFq06v4EPuyRPy0Q7MoXAGISm02Z1Ey
         LhyybZDi+EoyhlOl4W6Zy2PYfEubQv9UhwstKdqikMFPQvqHbiVlEOfQXOdiLcYd89/q
         BJ9A==
X-Gm-Message-State: APjAAAX7WaxFfWalv6wZoLJGxHxOpDuI7nTsBtXIbsslFLIgyO9iTiS7
        XI2PKuX63/Nvoabbji/bw/0o+qCcLWOlJmqXXTCPKA==
X-Google-Smtp-Source: APXvYqzmyW2nqKbB7Lr+BzOVoWVBrSCXzim3Q8p2v96Kfk5YFnq0czm1O0MUOL84EuppqokPItNxceDG5M5+WTB8Pls=
X-Received: by 2002:a5d:4b91:: with SMTP id b17mr18155859wrt.57.1564644398308;
 Thu, 01 Aug 2019 00:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190729175658.13672-1-geert+renesas@glider.be>
 <CAMuHMdV1zXCq6dbcg6=YmHgYqE5tfc1e7DbB3UgTVPm-5rU2Bw@mail.gmail.com> <20190731221550.5be0a103@canb.auug.org.au>
In-Reply-To: <20190731221550.5be0a103@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Aug 2019 09:26:26 +0200
Message-ID: <CAMuHMdVjdzt35QEp2V44WEgbeMA=bi+LRk0mybWFLX6OVDPNsQ@mail.gmail.com>
Subject: Re: New Renesas SoC tree for linux-next (was: [PATCH] MAINTAINERS:
 Add Geert as Renesas SoC Co-Maintainer)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux-Next <linux-next@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen,

On Wed, Jul 31, 2019 at 2:16 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Wed, 31 Jul 2019 09:33:19 +0200 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Apparently Gmail marked my previous email as spam, so probably that's
> > why I don't see my branch in linux-next.
>
> Nothing to do with Gmail, just me not reading well enough. Sorry about
> that.
>
> > Can you please add it?
>
> Will do.
>
> > Stephen: Can you please add my branch to linux-next, after Simon's
> >          branch, which may still receive fixes for v5.3?
> >
> >  ARM/RENESAS ARM64 ARCHITECTURE
> >  M:     Simon Horman <horms@verge.net.au>
> > +M:     Geert Uytterhoeven <geert+renesas@glider.be>
> >  M:     Magnus Damm <magnus.damm@gmail.com>
> >  L:     linux-renesas-soc@vger.kernel.org
> >  Q:     http://patchwork.kernel.org/project/linux-renesas-soc/list/
> >  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
> > +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
> > next
> >
> >  ARM/SHMOBILE ARM ARCHITECTURE
> >  M:     Simon Horman <horms@verge.net.au>
> > +M:     Geert Uytterhoeven <geert+renesas@glider.be>
> >  M:     Magnus Damm <magnus.damm@gmail.com>
> >  L:     linux-renesas-soc@vger.kernel.org
> >  Q:     http://patchwork.kernel.org/project/linux-renesas-soc/list/
> >  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
> > +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
> > next
>
> Added from tomorrow.

Thank you, I see it's part of next-20190801.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
