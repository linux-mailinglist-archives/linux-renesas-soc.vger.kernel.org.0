Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1517F0264
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2019 17:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390007AbfKEQOd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Nov 2019 11:14:33 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45714 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389760AbfKEQOd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 11:14:33 -0500
Received: by mail-oi1-f194.google.com with SMTP id k2so17996382oij.12;
        Tue, 05 Nov 2019 08:14:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ds6VYusfCqeI+CxBbQC5l0BjKnCAgOPSpeG/INpDB7s=;
        b=FBlrFgPecd6Nu8kPxi/cwjUB24zhVlI59+tBHHEmwpLDCU5HCKwaOSeozM3vhUsSJH
         ujZXUTPGTlstysbtmTN3y+Mqmh1M0qIMQ//gJNdrGe8uLKwDa4DFZTi7qlNZIUPp05L3
         GQU5oKbH+08397LWNkAOVq9QpjKjU7dP3uJJ9eWCdb4qdigdnS3nPJXcu+Wav7gPw+rn
         y/XO+0r422gid4bep8TXoUrA7xAllLoSsIJH4NUa82moG60LIhZboq44NarhTy3NcYhB
         pKWbFYLA5w59p+ygsdFFKHk+5KY2FJPCVb8eM9reFDDny7tIrrHMfzg+N/8yBpXyurgR
         9xLQ==
X-Gm-Message-State: APjAAAUF6Sv+6anaWx1mkGiJF5EytPmnOLJrShbsQIvfyTSOunVZWtX0
        BcwVUMXEikQ40sE37VrAcVuSehHN4YEuYoG87Yw=
X-Google-Smtp-Source: APXvYqweOH2gctOiMkOfsylw9IuOXcy7+Rtobt+PETLBgPWqINBQvTUx4ZjcibUTN+3TaAgCY5UmWMrEgoOR73cwrbA=
X-Received: by 2002:aca:fc92:: with SMTP id a140mr4437471oii.153.1572970472082;
 Tue, 05 Nov 2019 08:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20191016085548.105703-1-jacopo+renesas@jmondi.org> <20191017191400.GH4901@pendragon.ideasonboard.com>
In-Reply-To: <20191017191400.GH4901@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Nov 2019 17:14:20 +0100
Message-ID: <CAMuHMdWTCF30+JpztF-p-5JqHS5ALiAs5E0Jo82DCgpu99NZ7w@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] drm: rcar-du: Add Color Management Module (CMM)
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, Oct 17, 2019 at 9:14 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Oct 16, 2019 at 10:55:40AM +0200, Jacopo Mondi wrote:
> > Minimal increment to the CMM series, this time should really be the last one.
> >
> > Just missing Rob's ack on [1/8] and Laurent's one on [5/8].
> >
> > Changelog is minimal:
> > CMM
> > - Remove the cmm_config.enable flag. The cmm_config.table field validity is
> >   used to enable/disable the LUT operations
> > - Expand comments as suggested by Laurent
> >
> > CRTC
> > - use drm_color_lut_size() to check the LUT table size
> > - Inline calls to rcar_cmm_enable()/disable()
> > - Add TODO entries as suggested by Laurent
> >
> > For the record, the full series changelog is available at:
> > https://paste.debian.net/1107427/
> >
> > v5 from yesterday with informations on testing is available at:
> > https://lkml.org/lkml/2019/10/15/337
> >
> > Geert will you collect for DTS patches for the next release?
> > I assume the DU changes go through Laurent instead ?
>
> I've taken patch 1/8 to 6/8 and 8/8 in my tree. I expected Geert to take
> 7/8.

And so I did. 7/8 is now in arm-soc/for-next.

However, your drm/du/next branch seems to contain 7/8 instead of 8/8?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
