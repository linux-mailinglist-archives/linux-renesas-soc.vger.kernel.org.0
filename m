Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE39D39EEEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 08:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhFHGsO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 02:48:14 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:41870 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhFHGsO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 02:48:14 -0400
Received: by mail-vs1-f44.google.com with SMTP id c1so3879611vsh.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jun 2021 23:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=194Z4NaR/ns5K+rlIqR8ZI/k5ncWC3uOdMl+47ZNB1Y=;
        b=WrfvzyQbHyyp0U8BnN/Gcr1ckWI+5pUzBt93j98G6vdDkirnpkhQ/CxDBrhW0zE4jJ
         XymVX5X8hIAVp1+sRMYeYWkiLLESZlgStkYayDXk878WvZ5DRhCQZsoKps9iGEtsHnN6
         wl8mOxgP9RssNIO3j5dUSqKCrIlnfeF1u0irie8+ZWPjNq7b5KHeZRshyzJXkvVuVHQ7
         L9JDcYlYy4qqWxQvXp4pUguk3hsh0hHcqRb6x/qSBctW9q1SsMwbfE8ih2DJjhLTi+sJ
         M1APC5suVo/I8lBgGJ7T++MXlEsDTfzDI2tyF+iIh1VbOT+YOyIIrY+kbozZlgCONiZn
         vWvw==
X-Gm-Message-State: AOAM533xP7hWX0buaFX/QHZC3NYOs8vcUFrvSQEg0GuRRBqGHHz0K+Z5
        u4XyM4+elVad6d8nDOyO6xsagi2iLQkIhxJYjBUDOsdz7bM=
X-Google-Smtp-Source: ABdhPJw7FSjBGhOQUomRSdC2EAHT8GcJFG6Okc5fhcdi401AhaXeTWJHfpuuHV6jkbzMLL4ldN/60k7LHcUbN5q4ILo=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr7366844vss.18.1623134769281;
 Mon, 07 Jun 2021 23:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <2cb7113d307b1bfdb33cd96245202b2d5d867818.1623087738.git.geert+renesas@glider.be>
 <YL6JaF8GEiuqnh4M@oden.dyn.berto.se>
In-Reply-To: <YL6JaF8GEiuqnh4M@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Jun 2021 08:45:57 +0200
Message-ID: <CAMuHMdU455tAZdb3vG6Hk25BUvFqfjdmatJVECt7i+eJGxMH5g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rcar-gen3: Add SoC model to comment headers
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Mon, Jun 7, 2021 at 11:02 PM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2021-06-07 19:42:38 +0200, Geert Uytterhoeven wrote:
> > Make sure the R-Car Gen3 SoC model present is documented in the comment
> > header of each board DTS.  This makes it easier to identify boards that
> > are available with different SoC or SiP options.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> nit: Would it make sens to break the line length limit for this to make
> it easier for grep to be more useful? In either case,

Good suggestion!

Might make sense for the top compatible value in .dts files, too,
but then we're crossing the new 100 character upper limit...

> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
