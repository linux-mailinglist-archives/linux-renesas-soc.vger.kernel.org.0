Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA449EE3F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2019 16:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbfKDPhA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Nov 2019 10:37:00 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43984 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbfKDPhA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Nov 2019 10:37:00 -0500
Received: by mail-lj1-f195.google.com with SMTP id y23so7210836ljh.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Nov 2019 07:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mdxeFfhQgznpfAiSWIisxt5zYno5MrBI+bRv45ilKfM=;
        b=LtF+hy7+QduhX4D1sBo/t8cAdWbvTGDJSrswP3Au2jV9SJPsCup7keYfG3iuhkS1no
         zzgayqbcnC8bGkqgp0wE0bCP4jkgpZBf9Sf339HmjjAVG0Y/D//d7GMtj8t7iyRMuM4/
         uHaovGQiqn3yZyFTU+XQ/ZBBq8/nGYvOJ/LAPqo+QqlYX+f0QZuXUzEY7Un7PFIDfQuT
         ZyoNS4OAbhVscOP8Ujkxz3CCOb50T5wQ3YKtnK8ZowT4NT/Ngr7HSoTWF+/7V0rbXlU/
         UcmGh14P/a4YUh6DZg5+a5FtVaaHU2pgGYdnzyRgkY3C025yOsklAjhWi4IuZVRsSxIJ
         Pn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mdxeFfhQgznpfAiSWIisxt5zYno5MrBI+bRv45ilKfM=;
        b=Fe0pY1ElAcBcCYYswpef3qWVEiDhNR2BfpVTABCbUulY2E4oBEG1K8amWNQB+5imih
         N4CzCcsynSDbEBIeiMNzBNBobc+Qavx8qwoeCP/DSX4EmjylXGlYdfqijPvSQoxE7yWi
         GptnZ5bai+FRb9Zz2mfr1AZ4zm/GuTeFFle/jTGRGggGrCCjo7GVyep7Ef/XKyQTkWLd
         GVvgS3D/grxFUME2QufhUrFunYv7dAdWIwj9kwgiIOwo/bT78AgJnMEHIT881ekS8L/T
         vUKyTvL7PIR4lBdcQPeWZQg0ub8+X54x8t8BFz/L9KHy1mG08hBGr+KQymN1bFMFwq+8
         TnZQ==
X-Gm-Message-State: APjAAAUrCqLuWBqZaa0eNrxWbLW7RpoqtP/6QF9Jj5v1RapppMnPewbd
        NytCWR/tyzMz9GsVSI2ZPTT6Os2rYyi/3ULhwgXDWw==
X-Google-Smtp-Source: APXvYqyD/PWAgwBFdTE576nF/DEWwR43uXjHxOXVUrs2eN44diLVHtAsTMDUcHc9UItK6bxTkRj5qhwvR2CtIw2DfHQ=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr11827632lji.191.1572881816784;
 Mon, 04 Nov 2019 07:36:56 -0800 (PST)
MIME-Version: 1.0
References: <20191024122224.11776-1-geert+renesas@glider.be> <CAMRc=Me9Cc=O6t_3cLW5Ow=-XgurQ1x_RpfHe4Lxhb2QB6_WgA@mail.gmail.com>
In-Reply-To: <CAMRc=Me9Cc=O6t_3cLW5Ow=-XgurQ1x_RpfHe4Lxhb2QB6_WgA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:36:45 +0100
Message-ID: <CACRpkdbbLWfp2Nb7=83VrQ4LHgF8eR8z5y7fgKYGO6Qg2LkAuA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: renesas: Use proper irq_chip name
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Oct 26, 2019 at 2:08 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

> Both applied, thanks!

Ooops missed this, I pull them out of my tree.

Yours,
Linus Walleij
