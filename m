Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3B32F4C65
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jan 2021 14:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbhAMNoh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jan 2021 08:44:37 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:42687 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbhAMNoh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 08:44:37 -0500
Received: by mail-ot1-f51.google.com with SMTP id x5so1881470otp.9;
        Wed, 13 Jan 2021 05:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SACJsSKjqYWAtLLUs0ilL3ZiYl9WFR82ZVYWNkt2Cg0=;
        b=P7NZEM4qu9Uh+ieP9Eu5sjSyHl+/J2YggiMDXrlbK/06EIm4zFyf9fdhvn6QS6TCPi
         3WVvwVUNXXT3ZYYIA9L2/P5wl1N4LZvgWVhaUduG9/9epjjg4Hr0BsOGYA5JIioHJ2Mt
         JxZGmWbcGmKJG8FJeaYHOBqOeakboT7VLNNXI+h9Arr6chxHB2kcoGAyQZP3wnTjfulW
         wLJ/pGdE5gZQN5hlaiQePaqRLaSivXVJ/CHDepjahiufV43Pt47WQPunGwL+4TOZRm+l
         vSqAjgORzTYSZ3Zz1jJOlJkawI5B62AxzMDO8RfeuADNWRprXywqcV5moO6Zrmn9qbi6
         IIJg==
X-Gm-Message-State: AOAM532gb9yYX/6HGpjHeTcGMHYfvhS7XC71cAnjZGwYOM/tbF6l/93a
        k2+BraBsHgMi9NO4HPgUhzE1mV7GTRCEfGByy4mIGxwJxVk=
X-Google-Smtp-Source: ABdhPJxM6zJQZSqv5L2S5ynP1m0A8NlnSOmKK7VPUFh0QRBSiMc9mxwofYg4HBjkDB9yEZHYmZzulwNjrkY8W/YQj+Y=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr1266591oth.250.1610545436760;
 Wed, 13 Jan 2021 05:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20210112165912.30876-1-uli+renesas@fpond.eu> <20210112165912.30876-7-uli+renesas@fpond.eu>
In-Reply-To: <20210112165912.30876-7-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Jan 2021 14:43:45 +0100
Message-ID: <CAMuHMdXzKNQfuY+3dzvViATZkn0TKVB8cO26GO_iDjOCXP=Ywg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] dt-bindings: pinctrl: sh-pfc: Document r8a779a0
 PFC support
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

CC Robh+DT

On Tue, Jan 12, 2021 at 5:59 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Document PFC support for the V3U (R8A779A0) SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> @@ -43,6 +43,7 @@ properties:
>        - renesas,pfc-r8a77980    # R-Car V3H
>        - renesas,pfc-r8a77990    # R-Car E3
>        - renesas,pfc-r8a77995    # R-Car D3
> +      - renesas,pfc-r8a779a0   # R-Car V3U
>        - renesas,pfc-sh73a0      # SH-Mobile AG5
>
>    reg:

maxItems needs to be increased from 2 to 10, else
"make dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml"
fails with

    arch/arm64/boot/dts/renesas/r8a779a0-falcon.dt.yaml:
pin-controller@e6050000: reg: [[0, 3859087360, 0, 364], [0,
3859089408, 0, 364], [0, 3859120128, 0, 364], [0, 3859122176, 0, 364],
[0, 3859152896, 0, 364], [0, 3859154944, 0, 364], [0, 3859185664, 0,
364], [0, 3859187712, 0, 364], [0, 3859189760, 0, 364], [0,
3859191808, 0, 364]] is too long

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.12, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
