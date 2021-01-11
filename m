Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D88B92F0FBB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Jan 2021 11:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbhAKKJx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Jan 2021 05:09:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728719AbhAKKJw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 05:09:52 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660F1C061795
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jan 2021 02:09:12 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id j16so18235711edr.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jan 2021 02:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3K0MpZVfZ4qA+deXtIfoeZlGXrSGVuIknlVGq29zqxQ=;
        b=JlIVTeLfWTLcy1lOjF8lhG+U2nO45hk96tlPN2muNjc18yd9pXXvCcIvGZTA64u2S9
         hao2vyhCFvg+gQQUz7p7z1O7/SmuEsbv5iRLQwsGqXLUMUfyUTGuV6tL1aodjwHdxaBm
         5k6Y1kgy0aQ6bxyjK+FYPWltKXUWmVKaeds/xLfkhJ/C3dFor4hl7SAv2/PvLM4enQiX
         bllQyG/kW6kn93uKa43F08JSe6XqpEbM6VFAiituDHdbeozxgXW5L1vBijbTLDSHy8po
         J08Q7DxTg4ctb4qFUewoOTCb6sLbyjqTaaO0Gul1y0hGwKrGzmwsfasz0AnSWWdUQRKg
         mzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3K0MpZVfZ4qA+deXtIfoeZlGXrSGVuIknlVGq29zqxQ=;
        b=o0/9r01yiIrz8GnJIEIBZhR8DTWtON91k4+rjRIF22NiFnLJA15O8aDmbLQYYc7ff6
         4TeKLWn+P7G3P6/i8TvvCcKdR4XUQrJWXtenzZyC9S7zfrx/qDvHi0Xs7ugmxi3pLax3
         d3ZBcVTic3OSd7c1b9j1ULF1yvzkqJmY3f3mnOnhTwkQ4Ynt9nuSmfWTpsz7j6IPkpNa
         +5A7gkCguxiL3K0lvUppFQ7XZQ65HHcdslD/89gkynvu/GehFHzzxhGQzi6hmaLrBxgs
         yvcN81jpg5DPDyRJrAs8paALT4ByBaYWIuRQHDxnPl2H2zC5QbyK6cWHmIDnW5D8qJzS
         1/2Q==
X-Gm-Message-State: AOAM533dwm4P6g/5ewZIIVm7XMknXYdgNVv2wuC7WeK4ivn3QxgBdi5i
        /rUWT31wsrj9V5cDs1lrjYOcXdPoMHR6R9wOixas0w==
X-Google-Smtp-Source: ABdhPJwD7a4C5TCwgNuaYm1Y3CaAEaB74ZsK7DSwWR6bjHtbH4dP04JQh/VEKHHOxR3bV1VGcgOfJU9w8Y+Czx3SFTk=
X-Received: by 2002:a05:6402:307c:: with SMTP id bs28mr13630886edb.186.1610359751075;
 Mon, 11 Jan 2021 02:09:11 -0800 (PST)
MIME-Version: 1.0
References: <20210108102026.2024478-1-geert+renesas@glider.be>
In-Reply-To: <20210108102026.2024478-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 11 Jan 2021 11:09:00 +0100
Message-ID: <CAMpxmJXagq7X5_CdB3XfGzr7roSYDHPEzJNb7e4G2b9YFAFKDw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] gpio: rcar: Add R-Car V3U support
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 8, 2021 at 11:20 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi Linus, Bartosz, Rob,
>
> This patch series adds support for GPIOs on the R-Car V3U (r8a779a0)
> SoC, to both DT bindings and the gpio-rcar driver.
>
> Changes compared to v2:
>   - Add Reviewed-by, Tested-by,
>   - Fix SoC part number in oneline summary,
>   - Reformat comment block to match coding style,
>   - Rebase on top of commit 3a57026a83ba363e ("gpio: rcar: Remove
>     redundant compatible values"),
>
> Changes compared to v1:
>   - Optimize GPIO pin state read on R-Car Gen3,
>   - Enable input unconditionally in probe and resume, instead of during
>     GPIO line configuration and depending on GPIO line direction,
>   - Assumed authorship, as this patch is very different from v1, written
>     by Phong Hoang,
>   - Add Reviewed-by.
>
> Thanks!
>

All three applied, thanks!

Bartosz
