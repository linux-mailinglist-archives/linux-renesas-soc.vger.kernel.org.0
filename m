Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 313D85A6879
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 18:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiH3QdL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 12:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiH3QdK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 12:33:10 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1A9A4047
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 09:33:09 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id z72so9670252iof.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ciXFSEs9r0N1LD91dtfpuJIFP0vahmRP9WDesA1Qhrw=;
        b=lgwfbgVg+azcvOZPzBts94TKWwBwKKtdinKOHcL+PKZYUqzkypjPZ48kCmvwv2Nw5l
         3ZlFmIetZFXi/KM2ARrCl1E8q+5dhDSK6khN5SktQvRQyq6Lk3+LNe4932E38304io8d
         Qgpv9b1tqmK0sUYUZtgvGmPiw6wktQuO06WXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ciXFSEs9r0N1LD91dtfpuJIFP0vahmRP9WDesA1Qhrw=;
        b=ChieQ8K3DWiNVD+2WxbHuflWybnDp/P4kile3Dy3k1WQ+u6T3SZJ97AGeQrS19ZFlJ
         nA8Pg2Ink7di6otX+sxv1dZjJNTi9V16IHRbZcwr2WCO1s1Cpt9p5gvbdPl3uIkguu6m
         lAS9ARWqL00NKHsJjINuHX22g9GrDIHE3OGvWERWTLXEm8E+p/ZtvVCw5GskDl5859EY
         uPTtb6SQQp2LHC52WbQZosm13FsZQma6hfT3V9h+letgAkJ4q9koskTI4mFsqbq17cBy
         4h2NWy4KDbvuu+drgo+/B/H81WaBbbvIl3xmAKTgkaRNXTE5ln35IMuX1po6bgjAQQz9
         0vYw==
X-Gm-Message-State: ACgBeo2txy6ztewnnvcU82gDz8FDnAsBXePNxKwcM3ckZCkYkUiUG9Up
        M1LWy37K/bxVVOkT6aBa8NIHLhpSG4dTjisK
X-Google-Smtp-Source: AA6agR6jgE5S1rPfoq9J4B4TeowAF9QykgstHsPndXnC3nPgcKAs+A5ruNZarqjZhzNVjK8p60y5kA==
X-Received: by 2002:a5d:8b47:0:b0:689:a436:81d2 with SMTP id c7-20020a5d8b47000000b00689a43681d2mr10964537iot.138.1661877188169;
        Tue, 30 Aug 2022 09:33:08 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id w184-20020a022ac1000000b00346b4b25252sm5805758jaw.13.2022.08.30.09.33.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 09:33:06 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id z72so9670151iof.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 09:33:06 -0700 (PDT)
X-Received: by 2002:a6b:5f0b:0:b0:688:c460:87ff with SMTP id
 t11-20020a6b5f0b000000b00688c46087ffmr11002214iob.56.1661877185716; Tue, 30
 Aug 2022 09:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
 <20220824130034.196041-5-tomi.valkeinen@ideasonboard.com> <CAD=FV=UzcmDx+yZ5YQ3gqA_8Bc36YvtK8EH3MGTKtdmekjs5ew@mail.gmail.com>
 <ed60ea8b-bcc4-4a99-5133-8cd4b010d09b@ideasonboard.com> <CAD=FV=VuJnFa+Egkw0_yckwRd_05rUi+Y-hzxzof0Ki=8BOdMg@mail.gmail.com>
 <61274dc0-1377-9330-67b6-0d8abff6e21b@ideasonboard.com>
In-Reply-To: <61274dc0-1377-9330-67b6-0d8abff6e21b@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 30 Aug 2022 09:32:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UW34fvZ0kOMtvt0nDk4AhnUbJjxdV+Avd8BjHwdBU85g@mail.gmail.com>
Message-ID: <CAD=FV=UW34fvZ0kOMtvt0nDk4AhnUbJjxdV+Avd8BjHwdBU85g@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Tue, Aug 30, 2022 at 9:11 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> >>> eDP the _correct_ implementation for detect is to always return true.
> >>> Yes, there is a line called HPD for eDP and yes that line is used for
> >>> full DisplayPort for detecting a display. For eDP, though, HPD does
> >>> not detect the presence of a display. A display is always there.
> >>
> >> But for eDP it still signals the actual availability of the display,
> >> similarly to DP, doesn't it? You can't communicate with the monitor or
> >> read the EDID until you get the HPD.
> >
> > It signals that the display has finished booting, _not_ whether the
> > display is there. The display is always there.
> >
> > There are simply two concepts:
> > 1. Is a display there?
> > 2. Can I talk to the display?
> >
> > I assert that the way that "detect" is used in the DRM core is for #1.
>
> Why is that? Can you point to any specific piece of code?
>
> I didn't look it closely, but I believe in my testing I saw that the
> framework expects to be able to read EDID after detect() reports that
> the display is connected. And if EDID read fails, then you get only the
> default modes, even if the display was ready very soon afterwards. If so
> that hints more towards 2.

I guess it's mostly the chicken and egg problem. In your model, how
does the panel get turned on? Let's say that the eDP panel is off at
bootup, right? So "HPD" will not be high. detect() will say that
nothing is there. Since nothing is there, nobody will ever try to call
get_edid() nor will they ever try turning on the panel. ...and since
nobody turns on the panel HPD will never be high.

Now let's imagine that there is some rule to turn the panel on once at
bootup. Great, you'll see the panel at bootup. ...but then what
happens when you go through a modeset or suspend/resume or similar?
We'll turn the panel off as part of the modeset, HPD will go low, and
it will look like the panel is gone forever.

This is why detect() has to always say that an eDP panel is present.
If this isn't true the panel will never be turned on because we'll
never know it's there.


> > In theory one could try to conflate the two. Everyone keeps trying
>
> I agree here, they are not the same.
>
> > until they think about it more. Probably because the signal is named
> > HPD and everyone reads that as "hot plug detect". Worst. Name. Ever.
> > In any case, here lies dragons. Specifically if you conflate these two
> > concepts then when do you know to provide power to the display?
> > Remember, you can't detect the display until it's powered. ...but why
> > would you power it if you thought it wasn't there? You could power it
> > once at bootup, but then if someone turns the display off how will you
> > ever know that you can power it back on? It'll look like the display
> > was removed...
>
> But here's my question: if detect() tells whether the display is
> physically there, why do we need it?
>
> If the display is not hot-pluggable, then, as you say, it's always
> there, and detect() is unnecessary. The panel driver always assumes the
> panel is there and will power it up. So detect is not really needed.

Right. I conflated these two, sorry. Having detect() unimplemented and
having it always return true are the same thing and the DRM core
treats them the same as far as I'm aware.


> > It gets down to making sure things are powered. If the eDP controller
> > implements get_edid() then the eDP controller needs to know how to
> > power on the panel in response to that get_edid(). Remember, this is
> > eDP and we have to _always_ say the panel is there even when HPD
> > hasn't been asserted. See the above rant^H^H^H^H explanation. While
> > it's possible to have the eDP controller call down the bridge chain to
> > power the panel temporarily for get_edid() (early patches of mine did
> > that), in the end we decided it made more sense to have this driven by
> > the panel driver.
>
> I agree here, the panel driver has to drive the process. That's actually
> how I designed the old omapfb display subsystem (well, DP didn't exist
> then), everything originated from the display driver, not the crtc side.
>
> However, my argument is that someone, be it the display or the source
> driver, should offer detect() and get_edid(),

If you implement get_edid() I believe it won't be the end of the world
because the panel's version will be picked first. However, it feels
clearer to me to not implement it if it's not going to be used / won't
work for eDP.


> and afaics it makes sense
> for detect() to report whether the display is ready or not (usually HPD
> if it is connected, but could be via some other means).

I think detect() is actually harmful for eDP, as per my argument
above. If we detect the panel is "gone" then we'll turn off the power
to the panel. We'll never detect the panel again and we'll never again
have a reason to power the panel on.


> However, I have to say this is perhaps sidetracking this patch =). I can
> drop the comment in question from the description as it's somewhat
> irrelevant wrt. this patch.

Sounds good!

-Doug
