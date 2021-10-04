Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A0142140A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Oct 2021 18:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236966AbhJDQ2K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Oct 2021 12:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235724AbhJDQ2K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 12:28:10 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06480C061745
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Oct 2021 09:26:21 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id y15so18839347ilu.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Oct 2021 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zwhqowoXzJuFipJCtXxoOJgFbLCEZ6oYYj5nkHsrECU=;
        b=MjEdSbK7Tf/fjpwb7Yk8F5uzjjTjzIGJNCAM0AEiXbPEAqmsbThEErq1rFhLkU0Pta
         d5vOOgij05XSR2qDWiwkwKR3oszOUa03sJ7u/knuZOTnSnBXzQwUSxHHz65obtXMIARC
         64mx8oYDuueywYKk07LC4kFvOT9gQI7XVr05I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zwhqowoXzJuFipJCtXxoOJgFbLCEZ6oYYj5nkHsrECU=;
        b=J+0UZ1IcXOH9iNexruMvsco7WwDYnzrJ1KPvk4//BJDvt6JHibwcGn8frvIncNH/OR
         EMnH8TiGYsldl/CMs37TteDQb84okFCVUSofc8EqveDRS665eSh7J7GOfoAoBGPMNFOL
         LkrI4NuCSQsql9z2+OAcrKjrRC9HoXV60GMidy80kivTQqQoV1S2S2HwLDFMaYmSwcju
         +IakfRXbnc1rG+apXtgFtoGM+psBbJIV46gPIfSJsxVVDnv6Q48s0b51TW0MWT4Om9jW
         7Nb6qi5lVw1kq4nmO8fu06CHKNzULHiDmCZHgQkvTU64KTk42Q5zxxHtSFhfA9ciN3V1
         iUHg==
X-Gm-Message-State: AOAM530n/j2IxU+RfxGe8rFK5tSw4BMCdsPPwijP/7lM8IBppQTrlmsD
        avoSN4GPX4yxVyvvyfjNm4QYNLxQCFYKoA==
X-Google-Smtp-Source: ABdhPJzIXLpXCmTBhGmaLs5MUCwLtfN10mQLra1wigmf/LCooDYhI6WwE1KN8YI4lGCrhEDvyhh7dA==
X-Received: by 2002:a05:6e02:1708:: with SMTP id u8mr11092054ill.8.1633364779946;
        Mon, 04 Oct 2021 09:26:19 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id l3sm1529540ilg.54.2021.10.04.09.26.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 09:26:19 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id b78so21020676iof.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Oct 2021 09:26:19 -0700 (PDT)
X-Received: by 2002:a6b:6a0c:: with SMTP id x12mr9867780iog.177.1633364778729;
 Mon, 04 Oct 2021 09:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210914202202.1702601-1-dianders@chromium.org>
 <20210914132020.v5.2.I62e76a034ac78c994d40a23cd4ec5aeee56fa77c@changeid> <CAMuHMdWy+aASNevg8nc9LTvR9QNrGYZQnB3sYYLDRfEU1w_idg@mail.gmail.com>
In-Reply-To: <CAMuHMdWy+aASNevg8nc9LTvR9QNrGYZQnB3sYYLDRfEU1w_idg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 4 Oct 2021 09:26:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W07iZigvNaxv1WodhQZVm8hD-1NxTuBuapJYifi6ROng@mail.gmail.com>
Message-ID: <CAD=FV=W07iZigvNaxv1WodhQZVm8hD-1NxTuBuapJYifi6ROng@mail.gmail.com>
Subject: Re: [PATCH v5 02/15] drm/edid: Break out reading block 0 of the EDID
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Mon, Oct 4, 2021 at 8:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > -       if ((edid = kmalloc(EDID_LENGTH, GFP_KERNEL)) == NULL)
> > +       edid = (u8 *)drm_do_get_edid_base_block(get_edid_block, data,
> > +                                               &connector->edid_corrupt,
> > +                                               &connector->null_edid_counter);
> > +       if (IS_ERR_OR_NULL(edid)) {
> > +               if (IS_ERR(edid))
>
> So edid is an error code, not a valid pointer...
>
> > +                       connector_bad_edid(connector, edid, 1);
>
> ... while connector_bad_edid() expects edid to be a valid pointer,
> causing a crash:
>
> Unable to handle kernel NULL pointer dereference at virtual address

Sigh. Thanks for the report and analysis. I guess I don't have any
displays reporting invalid EDIDs to test with. Hopefully this will
help:

https://lore.kernel.org/r/20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid/

-Doug
