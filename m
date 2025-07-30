Return-Path: <linux-renesas-soc+bounces-19770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 989F3B15E2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 12:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB2343BBC5A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 10:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF32328150F;
	Wed, 30 Jul 2025 10:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBzaE8mt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F023726E6E2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jul 2025 10:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753871394; cv=none; b=Dj5av8fqzcYjhh7N8dA5M/HJxdxtEAfUx6aWpHiB9GEllUVyJ04jJQ2kZTn2GLH7Wieza5WjmRy7VX1NN6ssKaOOoZUXFb+u8BK6wadu+joBlqy563VK4JAGvmz6tRT2YuJfdpkU3UrdxxmS0PfYD9wBNrqbYgwFxcq6EKeEvr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753871394; c=relaxed/simple;
	bh=g32rR9qU4kIiq4ZDdhalVntuHNQUFPPPoLfAdLm96tM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKoAV7l+plAlAgvh70eLLZtSBasscoWJtx6BTdfLi7xcj8R//2TH23AHwhMnaHBkJRBdXS0P6Unc1GawZIXEC5B8VevmjW5f0othSqNJkLU2hZNUCGWSxRCErB5yBsWf03v2cti4E/s2TSgfM8rdi6aS1BYRXsS4LnALLLcAu4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBzaE8mt; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-71a206ec3a0so9666477b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jul 2025 03:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753871392; x=1754476192; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8DfRGBX3mcpytWgeuQOoQcWlLUxxXP7ehgwEP8S8+jQ=;
        b=JBzaE8mtJ3Ny2bHKAB30lPQDy6AaMbEqiAEki77two5pZm+C3NT/o1khfRr8Hr5hpB
         iTecnffx+lLkLzO7BadFmMgBJcxYzmKYq/UsTJ4jBS6C08L4ynvd9xH/FjZiBN6kPen9
         4NThFlbcG5c/EV5Eqtkc3I+wyV7R64ghPBPMKYRZaeYDj5kf155ocwhLrbhKXGeCxK/p
         ukV3m2kivRp754NLy7GFzIbh1VQ8F/vIJpNUNsdQ3eLJSJCXj3mYMtjB8V8bZyjlskLb
         RPQpbHGraTLpy5zN/r3LlpyAzgfsA+xpjcvJsbi2WSpWrF9MQjBdO2dgcukFbf1SXFDW
         8buQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753871392; x=1754476192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DfRGBX3mcpytWgeuQOoQcWlLUxxXP7ehgwEP8S8+jQ=;
        b=khs60vV9wizXq8rn4mhf5WYChvCUmcgbXDKwM7DSE2fPjeDom6ABNsEVDMEfUEGHsu
         djNJ5ABIPiGwbm+K3d/vT1WnqZvI/PHIwpr6bTe6D3ehu4hYjNmwqkUHSvl+iehCC+rk
         OOOXDOb4RUOt2crsxrCDBGpHaJ/CU0ZDGGxSM0RSakahnn1c28hY/KOifp5lBe+0yqxs
         +Io1xCxXZ1ZvuXkk58zyyPSYYdvVuy4CusRbV9aPmVhJDI8S4Mt4S5STW+Xvp6/DoZ9U
         SfmDasuY+gvKUAW70Dtqp1lBH3cI+/rbMxkMF6Z3Arg61/Y9pZVTWYQAXLQMHoV9M5Vs
         Fn1g==
X-Forwarded-Encrypted: i=1; AJvYcCUfmCXB9npv9c97SKQ2AB+KAwZy7IV0Fm323SoPwm16TrW5UFseNzVPLfKQVlLr0C2UYsIC0d34rVaxOM24v3uFQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkzHs6eMoXhAzYQk/Ok+F/hwzdpdAGuFFJB6OqwQMagwTA/Xny
	hZ8x1Mwe0p8A3bgX7mxPdmRrQhVT75CkON+mzfxCAfT59ApE/glRO8CnmsAf6aSbxSFwtxTRgsh
	0dKDYL/8aCn/vlGkTGc2cHdd/nKlx1GB8YsonJmIN0A==
X-Gm-Gg: ASbGncto0ZQ5i6R+9ZY/PWjMtYOdfMr9KBzWckTUbeGRZ0ezrP+/Ud3sMG3QfBmpIwu
	Sxu8k5lTM0o/bDHuCR+qvujJwwfXzcD/Bup6T6Z8gMBI8PPoYoQuGK29jbbRBm/jUiwc3GYhum6
	XdDS8A0US3SBq8G4cckqtRmgVG4AGJY9hlplCa8sFFOLs92vv56Cf8ckdF5nqULTbqGf342aYYL
	Yx/d5cuZlHAdaOOVhk=
X-Google-Smtp-Source: AGHT+IGFQjbmfwQ2KygX5zLfPtAfVRDoKZEoCDWpl15Tj6cbjvtyN/moXAbjn/fUqackhgtTl9hi4qXu0QdfTHnMzRw=
X-Received: by 2002:a05:690c:3686:b0:71a:2178:3e70 with SMTP id
 00721157ae682-71a4745d2abmr37909517b3.8.1753871391946; Wed, 30 Jul 2025
 03:29:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com> <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
In-Reply-To: <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 30 Jul 2025 12:29:13 +0200
X-Gm-Features: Ac12FXyYhnc-5Yj1CQN0T9Q5i6IKPQAs_4KsBvKN_tu1xC2bA9MW4FBogdA1snU
Message-ID: <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Wed, 9 Jul 2025 at 13:31, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Tue, 1 Jul 2025 at 13:47, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > Changes in v3:
> > >         - Added a couple of patches to adress problems on some Renesas
> > >         platforms. Thanks Geert and Tomi for helping out!
> > >         - Adressed a few comments from Saravanna and Konrad.
> > >         - Added some tested-by tags.
> >
> > I decided it was time to give this a try, so I have queued this up for
> > v6.17 via the next branch at my pmdomain tree.
> >
> > If you encounter any issues, please let me know so I can help to fix them.
>
> Thanks for your series!  Due to holidays, I only managed to test
> this very recently.
>
> Unfortunately I have an issue with unused PM Domains no longer being
> disabled on R-Car:
>   - On R-Car Gen1/2/3, using rcar-sysc.c, unused PM Domains are never
>     disabled.
>   - On R-Car Gen4, using rcar-gen4-sysc.c, unused PM Domains are
>     sometimes not disabled.
>     At first, I noticed the IOMMU driver was not enabled in my config,
>     and enabling it did fix the issue.  However, after that I still
>     encountered the issue in a different config that does have the
>     IOMMU driver enabled...
>
> FTR, unused PM Domains are still disabled correctly on R/SH-Mobile
> (using rmobile-sysc.c) and on BeagleBone Black. Note that these use
> of_genpd_add_provider_simple(), while all R-Car drivers use
> of_genpd_add_provider_onecell().  Perhaps there is an issue with
> the latter?  If you don't have a clue, I plan to do some more
> investigation later...

Geert, thanks for reporting!

>
> BTW, the "pending due to"-messages look weird to me.
> On R-Car M2-W (r8a7791.dtsi) I see e.g.:
>
>     genpd_provider ca15-cpu0: sync_state() pending due to e6020000.watchdog
>     renesas-cpg-mssr e6150000.clock-controller: sync_state() pending
> due to e6020000.watchdog
>
> ca15-cpu0 is the PM Domain holding the first CPU core, while
> the watchdog resides in the always-on Clock Domain, and uses the
> clock-controller for PM_CLK handling.

I will have a closer look as soon as I can  to see if I can find some
potential problems.

Kind regards
Uffe

