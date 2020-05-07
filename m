Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C0F1C85C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2020 11:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgEGJ3w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 May 2020 05:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbgEGJ3v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 May 2020 05:29:51 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA414C0610D6
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2020 02:29:50 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id w188so1460836vkf.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2020 02:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XDi3h98mQHCtREHS90wezcyoS3twXkQG1OpaJtTR05E=;
        b=st0dcCb/GQYY2YzJ505z0YNbJa0O2n9TD/OBObEDwuO91e5Dqud7HBZ1Of4ZDhoV+0
         lIxgMlmG62LkJSvLmXNmoJHl1jA6vWNvMxRTftDCA3t8hwi462pIxtVJ0L1zbtoEUb+A
         gXcTn6kJSsXxoWcSV/SQW/z2/RcZKhq/7QopyXPV6grYDsiEhT3SMr5reMRIvx+sgc+n
         O7ihWY2o7HxZiiO1TJv/ZTWFLbN1RYBnNPxYsGtbuvh7VzKFiH4kXFtIxsmQidWImbfr
         5cxjx+JliMqvCpAd9cMFhphvVJdUAFr0BrM46Ux7UTROSQk62YrwoLkwwBfPupREPdMc
         sTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XDi3h98mQHCtREHS90wezcyoS3twXkQG1OpaJtTR05E=;
        b=e2+bk+JLd+F+u2+1dKSjUrgoxw5VHQZsVRqOu21fj+i+M14/8i/gvFH2PvlZ5+r0yb
         Z6cG56qL8GL5kQ+OY4d8g+HeASaRASPzBS64AMkRsLv8ZdBYcF0oy/bRdo0i7RkWjWlP
         Qjw2OosElxagyGNCJYo3bJ5dRBwjWmg0n/kEPRH0ZcS8ZcQ8e7jxHHTqcEw8h1zgDYQm
         2h/uy+ZdQQiEG3blCsfJ3/OeOOr8G26hkKHuYVtv5jcVqiMSPboYCYKl0vD0wVFHHXxc
         krKf896NnGN/usjbMYEILpFGh1WonnK3XkxC5j86qyJy165KM7yZqxRvo53VkmTgdvWz
         lQBQ==
X-Gm-Message-State: AGi0PubKNtjiFAP2IyRszrQFgBDyRH4RuihiRyPLNSmEjkjahWKPPpHt
        b4op3g0KZOzu7iqi04cYbfhyXKMmr3bKZWgd2+KPA1sd
X-Google-Smtp-Source: APiQypKzFsKczdnWmdHQPnQ/h/SiYxQvsKKkhjZlHf0YbkAdYsLFFbQCIl2a1NGtqXQJsnmCxojtIUrNwBPLgVGo12Q=
X-Received: by 2002:a1f:31cf:: with SMTP id x198mr10672278vkx.101.1588843789884;
 Thu, 07 May 2020 02:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <1588794695-27852-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1588794695-27852-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1588794695-27852-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 7 May 2020 11:29:13 +0200
Message-ID: <CAPDyKFrP_W0xAESF+pN9-=Jw8FWbRWEPnZwtMijbSvYjrTYxZg@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: mmc: renesas,mmcif: Document r8a7742
 DT bindings
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-serial@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 6 May 2020 at 21:51, Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Add support for r8a7742 SoC. Renesas RZ/G1H (R8A7742) MMCIF is identical
> to the R-Car Gen2 family.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v1->v2:
> * Updated interrupts table to include r8a7742
> ---
>  Documentation/devicetree/bindings/mmc/renesas,mmcif.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> index c064af5838aa..291532ac0446 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> +++ b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> @@ -11,6 +11,7 @@ Required properties:
>         - "renesas,mmcif-r7s72100" for the MMCIF found in r7s72100 SoCs
>         - "renesas,mmcif-r8a73a4" for the MMCIF found in r8a73a4 SoCs
>         - "renesas,mmcif-r8a7740" for the MMCIF found in r8a7740 SoCs
> +       - "renesas,mmcif-r8a7742" for the MMCIF found in r8a7742 SoCs
>         - "renesas,mmcif-r8a7743" for the MMCIF found in r8a7743 SoCs
>         - "renesas,mmcif-r8a7744" for the MMCIF found in r8a7744 SoCs
>         - "renesas,mmcif-r8a7745" for the MMCIF found in r8a7745 SoCs
> @@ -24,8 +25,8 @@ Required properties:
>  - interrupts: Some SoCs have only 1 shared interrupt, while others have either
>    2 or 3 individual interrupts (error, int, card detect). Below is the number
>    of interrupts for each SoC:
> -    1: r8a73a4, r8a7743, r8a7744, r8a7745, r8a7778, r8a7790, r8a7791, r8a7793,
> -       r8a7794
> +    1: r8a73a4, r8a7742, r8a7743, r8a7744, r8a7745, r8a7778, r8a7790, r8a7791,
> +       r8a7793, r8a7794
>      2: r8a7740, sh73a0
>      3: r7s72100
>
> --
> 2.17.1
>
