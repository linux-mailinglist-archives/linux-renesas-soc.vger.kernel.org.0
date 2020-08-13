Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99D4243780
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Aug 2020 11:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgHMJT4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Aug 2020 05:19:56 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42071 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbgHMJTy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Aug 2020 05:19:54 -0400
Received: by mail-oi1-f196.google.com with SMTP id j7so4430999oij.9;
        Thu, 13 Aug 2020 02:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/v4uvvRnqKHcgJNYJduYoJSMkREgWkw0zIPc1FkXq2I=;
        b=oBWI/P9HTwKxVAgAc6q3FdZf1NvqcqnJIpUMcR3NZCrXllI2DqVOkdKwYyo+aVqmht
         AsqgU5ScWEyM38h+h6g69iFkGLVv5VUVt7fw/DwkooWTbIv+JAD9swjK33rJe2aX12mm
         EEA4JasQSIiuFkdcxtwFEreG82hDjTh3KC1RsouvEuEpi1JgAYuOSC+7flO9wT0nKrSY
         +cW0DiovotwJZAunn02fTaJhTfCoIuFXF7A7ALllGrwx6DSgdrwudeYEQvhxTAfWSZYj
         +rKvFM8qPXgFCoF0JyGgcoJ0qgLWT+deEtdTez32hHnR5FRZWZVWQoR1H4CiMEULSXlk
         +acw==
X-Gm-Message-State: AOAM533rYASwVGPIiVjRMtdamk0NCImxYkln5CuzcGwo35HYsK9bt1/h
        Ylp+I9FaBFqFlEs5cSz7DoRmcEs4n1nAewL3EB8=
X-Google-Smtp-Source: ABdhPJytJP0+Iv9qs3wU8glC01qaC30yEZb/cpAyOSHhM2vuO9fnrK/sIihtm4nDXrZAbYH3np5ihniLKTjWpXHLaH0=
X-Received: by 2002:aca:b742:: with SMTP id h63mr2470003oif.148.1597310393858;
 Thu, 13 Aug 2020 02:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200812140217.24251-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200812140217.24251-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Aug 2020 11:19:42 +0200
Message-ID: <CAMuHMdUGXa+uJPjoE=shXkiWvCvxmsYKiec7=LGdcAoQSwjNwQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: dts: renesas: r8a774e1-hihope-rzg2h: Setup DU clocks
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 12, 2020 at 4:03 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Setup up the required clocks for the DU to be functional.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10 (after resolving the port numbering).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
