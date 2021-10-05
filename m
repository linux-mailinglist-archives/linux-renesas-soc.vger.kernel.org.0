Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3C3421B45
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 02:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbhJEAnA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Oct 2021 20:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbhJEAmy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 20:42:54 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25753C061765
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Oct 2021 17:41:05 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id w10so3911395ilc.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Oct 2021 17:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S8/bkKiby+7EkwB2wz+nIC2A5KBIG95pAQLX24jqAYI=;
        b=M4ztBx95ziwV0D+GbQdUtLp28pZJUKwn8h37ftcAcvY9Q+EomhOOR8ELG6jdaRGj3a
         QVUY+CqmNTnFHSoiLipf+EsQQkWXzpd3KFueYcdENLdMuAKkkHMaY/0f7xI77fy+JeFB
         EaXeVy1tYdpZoF8k/8oUKSLYtCLcaRmwShGnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S8/bkKiby+7EkwB2wz+nIC2A5KBIG95pAQLX24jqAYI=;
        b=7jTi1fbbbsiOAlC1GOklfKswh8WdGGLBNux4NRvc7a6sIkLrdBhRJoQPbp6m7fHDkn
         cHZ3S/6jmDtleybH1t5Sx02YCAEG2lJU4VNW14ZT1THpfKEEwX3+6JUOQEUqlTTiJaEz
         qc6hUcnQTHapdgAj2P7BxU21KwKcdj8NX0pdZFDEbaQQLAa2C7O2eo6k2QfExVw2DWNi
         owbfMCNXTFP8g3bhF6GJOLJr/sfXSuvZa+COkbnpCrGR61injt5pNJtS+dlMCQioWo4w
         4+y37ZfRlbYEA29kD8x8RrZqLJVuASNjHAQkZhsSJFN3ltMh15LqV+s5ZbIkfgPKdNHE
         ucKA==
X-Gm-Message-State: AOAM531qMC4Q84WRil3KFqAuY45uGhwmMmPc6Zdw9Kzt+fA50eLwLfMC
        d2IUa72bpD8Lpb+aGeDJxIORRcu2UwlDUg==
X-Google-Smtp-Source: ABdhPJyK1F/OIMyKyKh5JnprFpk4UAU4VtAojedMQm9sUtAwDs3hjKAjRo1GlTJmBUrhOMCQFdVtMQ==
X-Received: by 2002:a05:6e02:1c4d:: with SMTP id d13mr755527ilg.49.1633394464351;
        Mon, 04 Oct 2021 17:41:04 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id o2sm9611927ioo.46.2021.10.04.17.41.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 17:41:03 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id 134so22367405iou.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Oct 2021 17:41:02 -0700 (PDT)
X-Received: by 2002:a6b:2ccb:: with SMTP id s194mr153772ios.128.1633394462524;
 Mon, 04 Oct 2021 17:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid>
 <CAMuHMdUsoBO2hjd0tAecAjnwCUbp=d8i8vaUFDT6Yn3emw2s9Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUsoBO2hjd0tAecAjnwCUbp=d8i8vaUFDT6Yn3emw2s9Q@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 4 Oct 2021 17:40:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V8MoYX2deqD_YE6ii9+VFbwqX0bre=5xaYe8ZwwExziQ@mail.gmail.com>
Message-ID: <CAD=FV=V8MoYX2deqD_YE6ii9+VFbwqX0bre=5xaYe8ZwwExziQ@mail.gmail.com>
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

On Mon, Oct 4, 2021 at 10:14 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Douglas,
>
> On Mon, Oct 4, 2021 at 6:22 PM Douglas Anderson <dianders@chromium.org> wrote:
> > In the commit bac9c2948224 ("drm/edid: Break out reading block 0 of
> > the EDID") I broke out reading the base block of the EDID to its own
> > function. Unfortunately, when I did that I messed up the handling when
> > drm_edid_is_zero() indicated that we had an EDID that was all 0x00 or
> > when we went through 4 loops and didn't get a valid EDID. Specifically
> > I needed to pass the broken EDID to connector_bad_edid() but now I was
> > passing an error-pointer.
> >
> > Let's re-jigger things so we can pass the bad EDID in properly.
> >
> > Fixes: bac9c2948224 ("drm/edid: Break out reading block 0 of the EDID")
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> The crash is was seeing is gone, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for testing! I'll plan to apply tomorrow morning (California
time) to balance between giving folks a chance to yell at me for my
patch and the urgency of fixing the breakage.

-Doug
