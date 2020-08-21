Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A86724D5CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Aug 2020 15:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgHUNHr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Aug 2020 09:07:47 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36227 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbgHUNHq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Aug 2020 09:07:46 -0400
Received: by mail-oi1-f194.google.com with SMTP id l204so1448802oib.3;
        Fri, 21 Aug 2020 06:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YzKd0UZ9F2/mk3D23hrvAicDaWPFtbfK/0mNbmP9U+0=;
        b=E5277tRuoX9hAf8pob3VeHPWiQvgWnxCXdJL5AIYNESqHc4dkJccx7AgAdPD4ocXzW
         RN5uGHABMbvG2u+VwzUM4eJKjWadYEpkmNqAGUWKp99YGevj5XlHuogdKU72ddqwqmlE
         dazav9/hDsvZT9EgN/j14DaImW71mYSJtbvzey6yC/+mBMNp0Ye5efsWILgVEB1LaSMo
         UUzPK455QwmuV9X8UQAE69hLC1VitR9nSOBvl2IugRDdfE+QrK8CbvOj7Je2bBO90qOO
         m/q7TYZFcWGrEPHnT32sRNnVJDy9K6AvNNh73nb73EfwreqKb3UqdqCclh6PETArJJRh
         jjbw==
X-Gm-Message-State: AOAM533LCyeBQY8WkYJT28adqur5txUSi5BUk7HBjciiUV7pqKR7TloR
        lFqGp7nescdG+B/uYyG2celUBdusjFmx78FlgNQ=
X-Google-Smtp-Source: ABdhPJxlsf7XMYNRt7xfUACTd/ytge4ufWIvywA38RNX061Tl56msuHCXbpd+mz/3Yi0/VlhtU8eWctC6R/t7S/R+/8=
X-Received: by 2002:aca:4b54:: with SMTP id y81mr1667023oia.54.1598015265301;
 Fri, 21 Aug 2020 06:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200816193316.7641-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200816193316.7641-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200816193316.7641-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Aug 2020 15:07:34 +0200
Message-ID: <CAMuHMdVT_rO=83SB7c4BP8-VoFwryTUj8Y7MEJv3iQrjsbYa8Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: r8a7742-iwg21m: Add RTC support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
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

On Sun, Aug 16, 2020 at 9:33 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Enable BQ32000 RTC which is connected to I2C0 on the iWave RainboW-G21M-q7
> SOM.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
