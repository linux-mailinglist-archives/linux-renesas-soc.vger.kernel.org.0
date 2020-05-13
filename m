Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB9F41D15B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2020 15:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387843AbgEMNhX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 May 2020 09:37:23 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42585 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgEMNhW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 May 2020 09:37:22 -0400
Received: by mail-oi1-f195.google.com with SMTP id i13so21417765oie.9;
        Wed, 13 May 2020 06:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=flC28VEmzcLHIWCG84LHrOxcpu2xfAtYlxFbQDCrZ4Y=;
        b=l7BnDTwWsSzrscW6KBx4EfegGcEBd7hRXKRCIEf1hFToVjonmLrnPjzb8CaR82OBDR
         u3GUNmVT5Yo3lDztpZRowsYgE7uYoL0X23+9f6l6g0iEHp1tZqfEjPzokR2JSLeG6mwn
         Tsrs6N6L3D7fE3yL9PTJTMZHZkFFfIc9E/iKMyASWMI3tQ/D21KJJfd3RC48+bv7JLXa
         bTj81TcJWyeZVCth/6C8tVseJL/iatVSVU0afCa0OAZSgdOIgykg0BpdbuT+iMICrI54
         hRtGdWmk09hgaYn1CpN/MT+v0CMxu0jEf6dwMmI5FIVjBgvZ8jBtx8kDhq7zQ7eSXQko
         HrYQ==
X-Gm-Message-State: AGi0PuYkPpmPCqD0QDfWk/TUAZmhIeXAivoMjJ3SB5T7w5C28TsbB/Dc
        9jtT+spsFdR6vfi0lOGun+RTIMA2pZp3ei/NkirIDQ==
X-Google-Smtp-Source: APiQypJ/7jZWojdyVGEwGQBhACnaZea0Aw4UDYa/vAQCLXlR44i0X8oFoQ2i4yfDkK1keNqTqy3ODJDgK5iBdx+g8iY=
X-Received: by 2002:aca:d50f:: with SMTP id m15mr27258950oig.54.1589377041636;
 Wed, 13 May 2020 06:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200505154944.4598-1-geert+renesas@glider.be>
In-Reply-To: <20200505154944.4598-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 May 2020 15:37:10 +0200
Message-ID: <CAMuHMdXuD8+5Lc5vEN2rqyBtvzb-i0gS7qcUWPtip1BGEh1VXQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: timer: renesas: tmu: Convert to json-schema
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 5, 2020 at 5:50 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Convert the Renesas R-Mobile/R-Car Timer Unit (TMU) Device Tree binding
> documentation to json-schema.
>
> Document missing properties.
> Update the example to match reality.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml

> +  '#renesas,channels':
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 2, 3 ]
> +      - default: 3

The "allOf" is no longer needed.  Will remove for v3.

> +    description:
> +      Number of channels implemented by the timer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
