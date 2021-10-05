Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7618F42282D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 15:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235015AbhJENrO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Oct 2021 09:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234814AbhJENrN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 09:47:13 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE80C06174E
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Oct 2021 06:45:23 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id y15so21838387ilu.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Oct 2021 06:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DgOIE96eS9LCwM8xrp/VmKNjdKCV3OUl2f/h98/P2uA=;
        b=Ik3VtettYsKq8tCKrQwpYih9V4scwM/ap7YHv9s4H1bIAmcl44e9EYxcyile1eNDjn
         BA60YaZR+yP6XLpREe7X48XFqf2HQLVL/VgOaJfgs5/OE7V9Vp2DkS5EhbtvrYQNGIaV
         XqjjaHpSRqrz7gvM4MQOiNmfkXBcFX89TDXl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DgOIE96eS9LCwM8xrp/VmKNjdKCV3OUl2f/h98/P2uA=;
        b=ehE0cULwcpDtThQvEN1IOMNK7TnRu3XnziaRTPYc6UbJhByfHJD9ZrQ097rqWpHAXt
         +gxIV8G1AJbeWVS67rY6ZfXjGtDFMXAgONQ9dCvpRTf6VYBaYd12DIkz1g6I/NbSSFq8
         IdpcMdzutQN/TIvnpZiq97ImAc8PWPqdZFuQuM0XtttE2WJtjpxnFsms/23H2ynqjVYE
         EL4dYirqLxO3EBAqfeKyKKcTPzd0xhuzIlxLFVB8a0BvINd5SfTcgfgHS7G+NKuVo/2z
         UbdKx8+KZz5njQtTqOMc610e0LSy3SPni146RdJ/1qlc/iPr0jjgKWg8V75aV8FNHbMB
         ojCA==
X-Gm-Message-State: AOAM532yOga0KChZ+H/CooOveukoLT0JX6is5rLdwEWeaSUdf1XIHmzl
        GX11X1vg2uMmqSZB0aJUY7njnmK82LLWZg==
X-Google-Smtp-Source: ABdhPJzEOwE+jtn7AKpks+o0XgLJHI8aVUP9SmSS9bRrpDvNVC7BOuhI0D7A7om07qLSo7AiVQdxgQ==
X-Received: by 2002:a05:6e02:158c:: with SMTP id m12mr2927134ilu.132.1633441522532;
        Tue, 05 Oct 2021 06:45:22 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id w9sm2755410ilq.73.2021.10.05.06.45.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 06:45:21 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id h129so24405411iof.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Oct 2021 06:45:21 -0700 (PDT)
X-Received: by 2002:a02:c7d2:: with SMTP id s18mr2725618jao.68.1633441521325;
 Tue, 05 Oct 2021 06:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid>
 <CAMuHMdUsoBO2hjd0tAecAjnwCUbp=d8i8vaUFDT6Yn3emw2s9Q@mail.gmail.com> <CAD=FV=V8MoYX2deqD_YE6ii9+VFbwqX0bre=5xaYe8ZwwExziQ@mail.gmail.com>
In-Reply-To: <CAD=FV=V8MoYX2deqD_YE6ii9+VFbwqX0bre=5xaYe8ZwwExziQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 5 Oct 2021 06:45:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VEdnszvbRR3dPijbzvwENUnQi2Ai+Erg6e1L9fb24R9Q@mail.gmail.com>
Message-ID: <CAD=FV=VEdnszvbRR3dPijbzvwENUnQi2Ai+Erg6e1L9fb24R9Q@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: Fix crash with zero/invalid EDID
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        kernel test robot <oliver.sang@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Mon, Oct 4, 2021 at 5:40 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Oct 4, 2021 at 10:14 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Douglas,
> >
> > On Mon, Oct 4, 2021 at 6:22 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > In the commit bac9c2948224 ("drm/edid: Break out reading block 0 of
> > > the EDID") I broke out reading the base block of the EDID to its own
> > > function. Unfortunately, when I did that I messed up the handling when
> > > drm_edid_is_zero() indicated that we had an EDID that was all 0x00 or
> > > when we went through 4 loops and didn't get a valid EDID. Specifically
> > > I needed to pass the broken EDID to connector_bad_edid() but now I was
> > > passing an error-pointer.
> > >
> > > Let's re-jigger things so we can pass the bad EDID in properly.
> > >
> > > Fixes: bac9c2948224 ("drm/edid: Break out reading block 0 of the EDID")
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > The crash is was seeing is gone, so
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks for testing! I'll plan to apply tomorrow morning (California
> time) to balance between giving folks a chance to yell at me for my
> patch and the urgency of fixing the breakage.

Ah, doh! I can't push until I can get a review tag from someone. As
soon as I see one then I'll give it a push.

-Doug
