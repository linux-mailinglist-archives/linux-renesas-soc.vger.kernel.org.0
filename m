Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31F1811E47C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 14:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfLMNXJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 08:23:09 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34995 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfLMNXJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 08:23:09 -0500
Received: by mail-ot1-f66.google.com with SMTP id o9so6484185ote.2;
        Fri, 13 Dec 2019 05:23:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6q69/Xgu8tuO7IrrKkcAGU0iqeKU0BMAnJI3v2+Nv5U=;
        b=bq8ZZ8yGoyF/T7GPjiJ89eGYFkk+GTGF/1bty0fn/H+kVZSx7EL9TStOW6yqeeUA6R
         Z+EWfl87hD+qKRVvrvgbo5gYA/9gEWvAwn6MSk9UXw2Lx4NKskbuddroSCGACdkhWutb
         oeEhpl1H5Ob6UPRhn50nK2IsmkrUOk5cNo90lw6sx5X8Nbz6fxYALDjS7TdX62/RDisG
         HsVQDFni3cTYtM/cqeaQWP7Hce8e5/xZps3btRoZtUw3NnCLBjf5CjZ7/tHwwSBZVuLO
         qQGO1+NwM74eJUFN9i7w3ldgNesEXZi30DSd8Tbgz+vkAt3/zpZuq4+zG0Ke0y7DMDUy
         /ibg==
X-Gm-Message-State: APjAAAX4pHilUmoA8cKgA9+D95/lde4mdjUGJljPtDOqf3Ue1+ZggaJL
        PQGIudGKhRF0lN83kgkDfmvEfUaZ7eW5rKccVMappjEZ
X-Google-Smtp-Source: APXvYqxreboSy5xLZrarYnky/v3vggGGl09F70YCvaS5jKJQWA3gxHgM5vr/dniBGLUseFoukOrV6zHPi2nsNkXU+Kw=
X-Received: by 2002:a9d:6c81:: with SMTP id c1mr14881844otr.39.1576243387716;
 Fri, 13 Dec 2019 05:23:07 -0800 (PST)
MIME-Version: 1.0
References: <redmine.issue-245033.20191211005426@dm.renesas.com>
 <redmine.issue-245033.20191211005426.161918957b73008d@dm.renesas.com>
 <87k173bp76.wl-kuninori.morimoto.gx@renesas.com> <fb1648d4-3949-01c1-7d13-679b9b8540dd@ideasonboard.com>
 <20191211175811.GC4863@pendragon.ideasonboard.com> <b8891c8c-fefe-5728-f792-a56da08bd7aa@ideasonboard.com>
 <20191212073306.GB1364286@kroah.com> <6808431b-a5d0-0720-b276-ed8333fb26d5@ideasonboard.com>
In-Reply-To: <6808431b-a5d0-0720-b276-ed8333fb26d5@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 13 Dec 2019 14:22:56 +0100
Message-ID: <CAMuHMdVEaPQ1r2v=f9RV8roO7T0+z86k18Ka6LYNqR0xwnyrpQ@mail.gmail.com>
Subject: Re: [PATCH] media: vsp1: tidyup VI6_HGT_LBn_H() macro
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sasha Levin <sashal@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Hien Dang <hien.dang.eb@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Fri, Dec 13, 2019 at 12:55 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 12/12/2019 07:33, Greg Kroah-Hartman wrote:
> > On Wed, Dec 11, 2019 at 09:58:11PM +0000, Kieran Bingham wrote:
> >> +Greg, +Sasha to opine on the merit of whether this should go to stable
> >> trees (for my future learning and understanding more so than this
> >> specific case)
> >>
> >> On 11/12/2019 17:58, Laurent Pinchart wrote:
> >>> On Wed, Dec 11, 2019 at 12:59:57PM +0000, Kieran Bingham wrote:
> >>>> On 11/12/2019 01:55, Kuninori Morimoto wrote:
> >>>>>
> >>>>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >>>>>
> >>>>> The address of VSP2_VI6_HGT_LBx_H are
> >>>>>   VSP2_VI6_HGT_LB0_H : 0x3428
> >>>>>   VSP2_VI6_HGT_LB1_H : 0x3430
> >>>>>   VSP2_VI6_HGT_LB2_H : 0x3438
> >>>>>   VSP2_VI6_HGT_LB3_H : 0x3440
> >>>>>
> >>>>> Thus, VI6_HGT_LBn_H() macro should start from 0x3420 instead of 0x3430.
> >>>>> This patch fixup it.
> >>
> >> s/fixup/fixes/
> >>
> >>
> >>>> I think this deserves a fixes tag:
> >>>>
> >>>> Fixes: 26e0ca22c3b8 ("[media] v4l: Renesas R-Car VSP1 driver")
> >>>
> >>> Given that this macro is not used, we could argue that it doesn't fix
> >>> anything yet :-) I'd rather avoid having this backported to stable
> >>> kernels as it's not useful to have it there, and thus not add a Fixes
> >>
> >> I'm sorry - I'm not sure I can agree here, Do you know that no one will
> >> use this macro when they back port the HGT functionality to an LTSI kernel?
> >>
> >> We know the Renesas BSP uses LTSI kernels, and the very nature of the
> >> fact that this typo has been spotted by the Renesas BSP team suggests
> >> that they are indeed looking at/using this functionality ...
> >>
> >> (Ok, so maybe they will thus apply the fix themselves, but that's not my
> >> point, and if they 'have' to apply the fix - it should be in stable?)
> >>
> >> It feels a bit presumptuous to state that we shouldn't fix this because
> >> /we/ don't utilise it yet, when this issue is in mainline regardless ...
> >
> > Nothing should be in the kernel tree that is not already used by
> > something in that specific kernel tree.  We don't care about out-of-tree
> > code, and especially for stable kernel patches, it does not matter in
> > the least.
>
> So perhaps this patch should actually remove this macro rather than fix it?

IMHO removing all unused register and register bit definitions from drivers
would not improve them. On the contrary.
These also serve as a kind of documentation, as low-level documentation
about the hardware is not always available publicly.

> > If you have out-of-tree code, you are on your own here, sorry.
> >
> > So no, no backporting of stuff that no one actually uses in the codebase
> > itself.
>
> Ok understood, It was really the 'the macro exists in the kernel, but is
> wrong' part that got me.

There is a difference between code that is not used, and register definitions.

> Along with the fact that we now have various automated machinery that
> would likely pick this patch up and backport it anyway?
>
> (Sasha, is that assumption accurate? Or would you/your system have
> identified that this macro is not used?)

IMHO the real danger lies in not backporting this, and forgetting to
backport this fix when future code that does use this definition is
backported.
This may happen +5 years from now, and the feature may be backported to
a 10-year old LTS(i) kernel, causing subtle issues in your 8 year old car...

Basically we can do 4 things:
  1. Fix the buggy definition, and not backport the fix,
      => may trigger the issue above.
  2. idem, but backport the fix,
  3. Remove the buggy definition, and not backport the removal,
      => may trigger the issue above, if people miss-backport the re-addition.
      => people may just revert the removal when they need the definition.
  4. idem, but backport the removal.
      => same as 3.

So I am in favor of fixing the buggy definition, with a Fixes tag, so
stable will pick it up, and anyone else (if any not using LTS) can look
for Fixes tags and know what fixes to backport.

Of course, all of this can be avoided by using the One Way Of Linux ;-)
https://society.oftrolls.com/@geert/102984898449908163

Just my 2€c.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
