Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C17BA45B0C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 01:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbhKXAi4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 19:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbhKXAiz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 19:38:55 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2CCC06173E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Nov 2021 16:35:46 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id s139so1569496oie.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Nov 2021 16:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kNh0jt8tv4maN2YkF0cmeBfMTgSPYwcWwHTrIEj8PD4=;
        b=RaJX8F1zRhXuDy80KZTcn+dQG5gDuyJcbR9Truhvisst9naZx2GPRqhKCfPSGA7bH9
         S4ey/ByihGFenVcwBSdlZOoytstPoEDO3jcbQaHZtCFB659a4vMl6TDNasJnhob3sdPe
         aZLjIOt8VGWOTaeoFiRoZCXBOiig0A60Z8z8jBpa8IniwasBhYcZKKI+c+m6Xp9SY+FU
         AoTN/BHReBRXjpUdt562mH0OPwsBNAXATEEKi6HNKKQ77EmeolMy74FoUMlsP1NdVzLP
         Y/Rxmk8nc15M3CDmwAJZ+vzWptXyXguBqsfmoilurxOTOpLua1Tw66SEDf0e4T27hoq7
         sygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kNh0jt8tv4maN2YkF0cmeBfMTgSPYwcWwHTrIEj8PD4=;
        b=phiYzjgk7jEWkSVwDrPmNjH/MCnSTeR5IA/A6R6T2VbZO9PsHhmO0DOXPVbKTILRnh
         5t3dOoNkJGOu44tU1WNxRS1jGaNrWfrTtle+b2jlB3jJxFzGNO3GEq0T3TArkN0SYMVL
         EtD9PKdMlHMBc344BspqJtxGHE1MOmUjeTrziJ+hff4Bcj0Lc1bm7NYPAgcHH0JDrQku
         jgaqIGKpze4goja4d7+haxto62S9288eyI7ikYiHnT9yD8ovrZxFGwCTxeLTjcKezZqr
         nHJP3KkGjkQho63ZaY/fKJmK/viAoSP+ZpWvRPIQV6zPreldFzbXCLqkpg7/UPziBnTs
         jMRA==
X-Gm-Message-State: AOAM532P874ERluMXYUIFpUEp2H43NHGKzpW6aBRXu1x5+QP+AuDENaD
        2IP8QvjtINhWEvAIu02N31WTTB84QTESkGKzZvTlkaLCawY=
X-Google-Smtp-Source: ABdhPJyNEmGOeKXUl3TxFGzLSZSdD+IztDjr0BhBBI2kJMnGgmHs2eAnjCm1/YARFHCchP1O0uJLUFFPcXuqbc1B5T8=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr1453521oih.162.1637714146248;
 Tue, 23 Nov 2021 16:35:46 -0800 (PST)
MIME-Version: 1.0
References: <20211123164902.35370-1-wsa+renesas@sang-engineering.com> <20211123164902.35370-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211123164902.35370-2-wsa+renesas@sang-engineering.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 24 Nov 2021 01:35:34 +0100
Message-ID: <CACRpkdYJqP7WJuhS9G65abCZHK1_LX9hkXU6o+k10t2LXw100w@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] gpio: add sloppy logic analyzer using polling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram!

I like this patch.

On Tue, Nov 23, 2021 at 5:49 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> +Introduction
> +============
> +
> +This document briefly describes how to run the GPIO based in-kernel sloppy
> +logic analyzer running on an isolated CPU.
> +
> +Note that this is a last resort analyzer which can be affected by latencies,
> +non-deterministic code paths and non-maskable interrupts. It is called 'sloppy'
> +for a reason. However, for e.g. remote development, it may be useful to get a
> +first view and aid further debugging.

Maybe a small paragraph first saying what this is, the usecase (feel
free to steal,
rewrite etc):

The sloppy logic analyzer will utilize a few GPIO lines in input mode on a
system to rapidly sample these digital lines, which will, if the
Nyquist criteria
is met, result in a time series log with approximate waveforms as they appeared
on these lines.

One way to use it is to analyze external traffic connected to these GPIO
lines with wires (i.e. digital probes), acting as a common logic analyzer.

Another thing it can do is to snoop on on-chip peripherals if the I/O cells of
these peripherals can be used in GPIO input mode at the same time as they
are being used as inputs or outputs for the peripheral, for example it would be
possible to scale down the speed of a certain MMC controller and snoop
the traffic between the MMC controller and the SD card by the sloppy
logic analyzer. In the pin control subsystem such pin controllers are
called "non-strict": a certain pin can be used with a certain peripheral and
as a GPIO input line at the same time.

Yours,
Linus Walleij
