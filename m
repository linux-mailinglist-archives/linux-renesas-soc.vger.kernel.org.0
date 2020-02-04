Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C96F215214C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2020 20:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbgBDTot (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Feb 2020 14:44:49 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46736 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727385AbgBDTot (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Feb 2020 14:44:49 -0500
Received: by mail-oi1-f193.google.com with SMTP id a22so19651047oid.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Feb 2020 11:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IW3M1Cka8ciVZTD0T5CJKNc8jjQGbnHljxg1W356uBw=;
        b=dbub7852drKFk/WGA3jFVH1R6Dd05YV2fh9jhITmq9DKGGbWFf+0ADtd48w5aw2ooa
         ePlHRxs4iRHMCg4JVBAyIpKyv38yZp4ysVJU+MCca7yPdFhtFaTN0iJWUp+6qjNQddLs
         /rljiIHRW9aWH0zchh958d35i5f/Css7rMqS5+b01EbEkuNDEnPS9G3FnFuZU7btznrj
         FlYY9j9J3H6xJSSIjBu0ihabkXpUeBixnLhHZ2MmkUrJnxpXiYDex0c0BD1FTws1wh1z
         l3XMLY+9xMV28B3gYhbgNXvipFRM44VEFwhye2Uo9Wpa/HHCQz8RAJBXoazvQVKnId+V
         STlQ==
X-Gm-Message-State: APjAAAVrJuFFGWOREevga1wkChg/YvvxEersjXCXeLuGlaR6L4RqcrF8
        /WIRexgq2a1hzsEZPKRbncwN4lvV20FTBkejXVo=
X-Google-Smtp-Source: APXvYqyJ/xykRpxJDrg7SDaAQvv3LO4d6/rgXOEqii3/yaDiH9EiibdNZrVlXqtKbJopxzO/iJLnsdbovxEAw7LQFKk=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr412666oia.148.1580845488096;
 Tue, 04 Feb 2020 11:44:48 -0800 (PST)
MIME-Version: 1.0
References: <20200204161916.28744-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW8kgnw4k9-jpronxDMmeZ7NJkc4Anwmc5G247QyX80GQ@mail.gmail.com>
 <20200204182621.GE20396@pendragon.ideasonboard.com> <20200204193050.GN10400@smile.fi.intel.com>
In-Reply-To: <20200204193050.GN10400@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Feb 2020 20:44:36 +0100
Message-ID: <CAMuHMdW7SX2W5LXvBMgTMXcjsM8bz5nhBBD=DzwLaiA4Xq3e7A@mail.gmail.com>
Subject: Re: [PATCH v1] drm: shmobile: Platform data shan't include kernel.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

On Tue, Feb 4, 2020 at 8:30 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Feb 04, 2020 at 08:26:21PM +0200, Laurent Pinchart wrote:
> > On Tue, Feb 04, 2020 at 06:39:34PM +0100, Geert Uytterhoeven wrote:
> > > On Tue, Feb 4, 2020 at 5:20 PM Andy Shevchenko wrote:
> > > > Replace with appropriate types.h.
> > >
> > > Thanks for your patch!
> > >
> > > I have only one very short question: why?
> >
> > Likewise :-) The patch itself looks fine, but the commit message is a
> > bit terse.
>
> The kernel.h for a long time being a dump of a lot of things. I started
> cleaning it up a bit. During this I notice that developers too far too lazy to
> use appropriate headers. For platform data kernel.h by definition is not
> appropriate.

Thanks, that makes perfect sense.

> Any suggestion what should I put to commit message?

I became intrigued by the one-line summary, which seemed to suggest
(according to my interpretation) that including kernel.h is a Real Bad
Thing.

But basically all you wanted to say was:

    drm: shmobile: Reduce include dependencies

and:

    This file doesn't need everything provided by <linux/kernel.h>.
    All it needs are some types, which are provided by <linux/types.h>.

Right?

BTW, <drm/drm_mode.h> already includes <linux/types.h>, but not relying
on implicit includes is indeed a good thing.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
