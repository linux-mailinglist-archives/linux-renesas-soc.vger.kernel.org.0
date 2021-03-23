Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB81346D82
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 23:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbhCWWq0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 18:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234007AbhCWWqN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 18:46:13 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D3D2C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 15:46:11 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id j7so16240779qtx.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 15:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qQSTgxcnf1zrFoFiqLMjc/7MKHfQmsaChwO0zJJ4J9I=;
        b=M4ujlSG8CB6M2INhiLKC8aEp67I4lukpqFbMB8oxOvwsmG5tei3oCFUhjcvP4iEVI1
         ggsHpmk+s5wy1NNhU3WvQVEEtWY1uwdc31QmZwCV3EupGf8Rzg36PJ8n6as/KuPKlu9R
         8XxUwFGJnANiCZUeMt2w2+j57o+Yo6uwG8fV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qQSTgxcnf1zrFoFiqLMjc/7MKHfQmsaChwO0zJJ4J9I=;
        b=I/GIX0NIO3E8B/A0EBCNKtYNt5pu5w4S/4Kj5V7K6Cl/VdkvQV48kdAjJPwsyDNcoB
         qHGYWmfNRIOGD8hMo6H/eePdXVdyo2x5McBWxAN38A29x/PlaKr60hYgQbJwOjb8Mvix
         sfjUK0MAXONfKlf7h1IUscNt/3r62+jMz54+yNjtGP+QCNTa8EPNi9P9jJB3IHoaZUMQ
         nujJC+Zai9UsziSRM6/2cTA3eeA7H17Esl4b3WbM9rB7kJIAAcgZalLm6nIxFMhWpa1/
         CfPflK+18eycWhbcasADX371H9lJ1cgVyzbCeCUc0bDEmqu7Tkw+gkDEsMC14g7OHLY2
         PMGQ==
X-Gm-Message-State: AOAM531zEopXHkoYPWEQby6/sa4Sjy4GjzIs1ZwQVRQnzAJKTVmCEv2f
        2F6TskNkY8O0WwVcmWWIBrffMYzgr1V1aQ==
X-Google-Smtp-Source: ABdhPJxHVaKS8CjljCf5ozsQmA6N6r26rAwPZSRjN4rZK06ksUlJIgooLzUt2GW6EDTpqdGePfoBAg==
X-Received: by 2002:ac8:695a:: with SMTP id n26mr594943qtr.20.1616539570369;
        Tue, 23 Mar 2021 15:46:10 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id d24sm259266qkl.49.2021.03.23.15.46.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 15:46:10 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id i9so12072068ybp.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 15:46:09 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id u130mr712959ybb.257.1616539569454;
 Tue, 23 Mar 2021 15:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=UDd9LC-sMEk0hn10roeM+Cz6VNekcZomkQXLhfw0-4wA@mail.gmail.com> <YFphd/KA2Z5p5d4k@pendragon.ideasonboard.com>
In-Reply-To: <YFphd/KA2Z5p5d4k@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 23 Mar 2021 15:45:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VsF2CQD3pNoyOXqdcJop3L7Y-0qK8fVkqZOgW4eqVNhw@mail.gmail.com>
Message-ID: <CAD=FV=VsF2CQD3pNoyOXqdcJop3L7Y-0qK8fVkqZOgW4eqVNhw@mail.gmail.com>
Subject: Re: [RFC PATCH 04/11] drm/bridge: ti-sn65dsi86: Use bitmask to store
 valid rates
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Tue, Mar 23, 2021 at 2:46 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> On Tue, Mar 23, 2021 at 02:08:55PM -0700, Doug Anderson wrote:
> > On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart wrote:
> > >
> > > The valid rates are stored in an array of 8 booleans. Replace it with a
> > > bitmask to save space.
> >
> > I'm curious: do you have evidence that this does anything useful? I
> > guess you're expecting it to save .text space, right? Stack usage and
> > execution time differences should be irrelevant--it's not in a
> > critical section and the difference should be tiny anyway. As far as
> > .text segment goes, it's not obvious to me that the compiler will use
> > fewer instructions to manipulate bits compared to booleans.
> >
> > Doing a super simple "ls -ah" on vmlinux (unstripped):
> >
> > Before: 224820232 bytes
> > After: 224820376 bytes
> >
> > ...so your change made it _bigger_.   OK, so running "strip
> > --strip-debug" on those:
> >
> > Before: 26599464 bytes
> > After: 26599464 bytes
> >
> > ...so exactly the same. I tried finding some evidence using "readelf -ah":
> >
> > Before:
> >   [ 2] .text             PROGBITS         ffffffc010010000  00020000
> >        0000000000b03508  0000000000000000 WAX       0     0     65536
> >   [ 3] .rodata           PROGBITS         ffffffc010b20000  00b30000
> >        00000000002e84b3  0000000000000000 WAMS       0     0     4096
> >
> > After:
> >   [ 2] .text             PROGBITS         ffffffc010010000  00020000
> >        0000000000b03508  0000000000000000 WAX       0     0     65536
> >   [ 3] .rodata           PROGBITS         ffffffc010b20000  00b30000
> >        00000000002e84b3  0000000000000000 WAMS       0     0     4096
> >
> > Maybe you have some evidence showing an improvement? Ah, OK. I
> > disassembled ti_sn_bridge_enable() and your patch saves 12 bytes, but
> > I guess maybe alignment washes it out in reality...
> >
> >
> > In terms of readability / conventions, I personally find this change a
> > bit of a wash. I mean, I guess I originally implemented it as an array
> > and I thought that was the most readable, but I like bitfields fine
> > too. If everyone loves it then I won't object, but to me it feels like
> > touching lines of code for something that's personal preference. ;-)
>
> You're right that the .text and CPU time improvements were not my
> target. I was focussed on stack usage, as that's a limited resource in
> the kernel. I don't have any evidence that we would be close to any
> limit, so it's tiny, and if you or anyone else have a strong opinion
> that an array of booleans is better due to readability concerns, I can
> drop this change. I only thought about those poor 7 bits in every bool
> that sat there unused, feeling useless :-)

LOL. Thinking about it a bit more, I guess I feel a bit lame saying
that the array of booleans is more readable. I guess I'd call them
equivalently readable. So I guess the downside of this patch is just
churn. If someone is maintaining a downstream kernel, it's an extra
patch to take. If someone is running "git blame" it's an extra layer
to walk back to find the history of the code. That being said, it's
really not a big deal. I'll leave it up to you if you want to include
the patch in your next version or if my arguments have convinced you.
;-)

-Doug
