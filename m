Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3B72936B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Oct 2020 10:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgJTIW7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Oct 2020 04:22:59 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35224 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbgJTIW6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Oct 2020 04:22:58 -0400
Received: by mail-oi1-f196.google.com with SMTP id w141so1321436oia.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2020 01:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sAETfftP4JZZUHdG743O9+Ny0uV+u7ZXkp2ZhwES+Yk=;
        b=m4z6HVSro4j7PLv+7ED8oDbFCDzp3rqdQ02+V/lgA+ig+ynFbKUCiBiwQpcN3gEu+F
         lsKSbGYLAXo9ZQe6F6R3X/PI88s/XT+RRjdjirFkq0uPahbXE5EOhIxylFJ3fLJcSBEB
         g0+MKhR8ZGl4Kw6EgPo3C+GwYgTZuccwTOUPfTAGKr/KnlBAkG6i3Q0GWe5UetaDh81E
         5JYCtbwd7njvEQwRtNFSQZ4H53t2IomJkgNmNoTmNJKUoynu0FAvvr5rDRsgDi93FVpZ
         7s/1Z4K/GZWLCzXu3S/V5UwoVIoMckXpOL33Clfp5M4S7bo66lU+vnQmC4afaHIO2k8s
         YVkA==
X-Gm-Message-State: AOAM530LaYZFP7LeaONobtLB/ogp1o2qmA0oqWA/6vazjrS4QQKigD3J
        qV4tCTeb6mX0daGX0Mlt+OorG/iIct7lKLBAHgomX5nd
X-Google-Smtp-Source: ABdhPJwr8FRpQ+wCnlcvULARYCLMSHR2NWRJf7U05LaVOdC0HZtY8fqOQaS0SlRgjIN6LRKZgbq9lMxlKFwwFfxFGdU=
X-Received: by 2002:aca:f203:: with SMTP id q3mr1005519oih.148.1603182177520;
 Tue, 20 Oct 2020 01:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201019120614.22149-1-geert+renesas@glider.be> <20201019120614.22149-6-geert+renesas@glider.be>
In-Reply-To: <20201019120614.22149-6-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Oct 2020 10:22:46 +0200
Message-ID: <CAMuHMdWovS9TDK0twf97XzNWhTmUQLCJLCYirgWPtsB9C5_Viw@mail.gmail.com>
Subject: Re: [PATCH/RFC 5/6] gpio: rcar: Add support for R-Car V3U
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Oct 19, 2020 at 2:06 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> From: Phong Hoang <phong.hoang.wz@renesas.com>
>
> Add support for the R-Car V3U (r8a779a0) SoC.
> This includes support for the new "General Input Enable" register to
> control input enable.
>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Untested on actual hardware.
>
> Should input be enabled unconditionally, as recommended by the Hardware
> Manual for backwards compatibility with existing software?
> As per (errata?) commit ae9550f635533b1c ("gpio-rcar: Use OUTDT when
> reading GPIOs configured as output"), the gpio-rcar driver does not use
> the INDT register to read the status of a GPIO line when configured for
> output.

More investigation:
  1. On SH7734, R-Car Gen1, R-Car Gen2, and RZ/G1, INDT only reflects
     the state of the input pin if the GPIO is configured for input
     (documented, verified on R-Car M2-W),
  2. On R-Car Gen3 and RZ/G2, INDT always reflects the state of the
     input pin (documented, verified on R-Car H3/M3-W/M3-N),
  3. On R-Car V3U, input enable can be configured explicitly through the
      new INEN register (documented, unverified).

Given register accesses are slow, I think it makes sense to enable input
explicitly and unconditionally on R-Car V3U, and always use INDT to read
pin state on R-Car Gen3 and V3U.

Thanks for your comments!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
