Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2076255EB0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Aug 2020 18:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgH1QT6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Aug 2020 12:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgH1QTy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 12:19:54 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2627C061232
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2020 09:19:53 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id q21so1674378edv.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2020 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y9miOxm+aIgmI4U/EZeLaBrPMImCENn/aVpH1jwVAMM=;
        b=mXoKTmtBEQaBLnbOaGgnDqEY21MoTjb4zLDwbfSPeu9T0RfXPnHTskn/ZTaGUKOzOo
         cXbunuKwGz0pe1Ri4Su4Y/IV8L9Baeh8v70y8Q+HJmXP1ZQvHfPM4Lw/iw23jATefjMR
         HpQJM6shS/3snq/Q+XjQW0FIv7i3HEtR0unH+YHsDHsQ2s6+0AgEfdPfy9fgnd0S1lQe
         sj9+VBQxXHQwF4AXPh3pB6Byf6weRnbzqc/O83O/pKBzAFMzmgrPlL8u/Pk0WyJ7a7jv
         d4noUTHi3Z7iKCDKLP4kF4mNg4XMukhWKLGw7u+T76YijHmnCk0b4upjuhigrDhzIsWm
         HuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y9miOxm+aIgmI4U/EZeLaBrPMImCENn/aVpH1jwVAMM=;
        b=f2lUtI+1rStecf2IN8f0Xdck+JfvIfiAjqZd2S+JyzvpRdIQPP+2d5WOi4WgqS93X1
         E2zVRFOE+6raBRMgX5mk+opBHfO7NxwrMH7B+WRokCKLhhKvb+CFYQP9nWvehw2jyFaa
         46/6EhTysS4JU7Y77bAeAZXN11Sn8ARBB1bRvTBZD/siuMSLKttecdHOI5xpVHVZ/KzU
         pd63Nj8mDAz2yziZBR7pZkwwhUifUc5Mg9eJvzos6VVrwj17eTTvF57nO1XjmkJy8SXt
         g+VLLX8wP3x50EeSqYMv1ptEyQyPKAw+rWHa1pqw9c5O3bmdvIYiMf5xwio66sCA9dc7
         Q4aQ==
X-Gm-Message-State: AOAM5331JM4drmmXWz3IFCr6Jb9SUVJ4qUrZsdwgqZRCQKWLlA9o0zjn
        /ZbxJvfZvu6pIWfLMYUHsmZnUn2YupHPxj5PLbG7kg==
X-Google-Smtp-Source: ABdhPJx3CC1M5iADxDSXg8vc1XdLze/rbzJvK5cKSC231pYOCXnpX4r3v9HiYpmN/HeAzqJPCVyqZVKgfCUhOi8Y3cQ=
X-Received: by 2002:a05:6402:342:: with SMTP id r2mr2734843edw.353.1598631592180;
 Fri, 28 Aug 2020 09:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200828073024.32585-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200828073024.32585-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 28 Aug 2020 18:19:41 +0200
Message-ID: <CAMpxmJXVU2hsaH_WpLKoUR==MuNObbBJ1zT+HPaJN8iOoQ0JXQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: gpio: renesas,rcar-gpio: Add r8a774e1 support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 28, 2020 at 9:30 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Document Renesas RZ/G2H (R8A774E1) GPIO blocks compatibility within the
> relevant dt-bindings. R8A774E1 GPIO module is identical to R-Car Gen3
> family.
>
> No driver change is needed due to the fallback compatible value
> "renesas,rcar-gen3-gpio".
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Hi All,
>
> This patch is part of series [1] (patch 6/9), rest of the patches have
> been acked/queued.
>
> [1] https://lkml.org/lkml/2020/7/13/1275
>
> Cheers,
> Prabhakar
>
> v1->v2
> * Rebased the patch on 5.9-rc1 (YAML conversion)
> * Updated commit description
> * Restored acks from Geert and Rob
> ---
>  Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> index 3ad229307bd5..5026662e4508 100644
> --- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> @@ -37,6 +37,7 @@ properties:
>                - renesas,gpio-r8a774a1     # RZ/G2M
>                - renesas,gpio-r8a774b1     # RZ/G2N
>                - renesas,gpio-r8a774c0     # RZ/G2E
> +              - renesas,gpio-r8a774e1     # RZ/G2H
>                - renesas,gpio-r8a7795      # R-Car H3
>                - renesas,gpio-r8a7796      # R-Car M3-W
>                - renesas,gpio-r8a77961     # R-Car M3-W+
> --
> 2.17.1
>

Queued for v5.10, thanks!

Bartosz
