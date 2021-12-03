Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 904C6467B16
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 17:13:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbhLCQQ4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 11:16:56 -0500
Received: from mail-vk1-f176.google.com ([209.85.221.176]:35561 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbhLCQQ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 11:16:56 -0500
Received: by mail-vk1-f176.google.com with SMTP id q21so2174800vkn.2;
        Fri, 03 Dec 2021 08:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=39T2rU0HxZ6gllucr8MX3fBGtYwp/6Fvgqc86vSz9Pg=;
        b=EI9VJRdBqlYe6S/JrjMzoqztpbUn6bHWDhVzC5Z6BDuLVoHFR/UJFdedmTzXYnsU8W
         80Z+GCkApJ97qZ1tLRvOt4d5DO7h2KNo3nj/u99AuUHe7HrSfpZgdPYQqRhMT3RwLpex
         CNhhNrBrh5uo1g+JQqqKmMukNOtbn2WKjePHJP80VBX1EKwLFvw8n2pCp2oEqSgE0H6m
         np5fGzKatoYVmX8ZAyYLv9qs7A0n5AKFvNrK/n98qzteDNlaeLB6JJEaZhXHpQ+jXRKc
         cDlq1PM1iPtMPNDijvqCiksxVnP1zP6m4nhprwh4VFQzl5sDPEp2pV3HVH/HL5zjVrx+
         udJw==
X-Gm-Message-State: AOAM530Pb+8gz77wrtBMq+1nDVvTK3Vb4fVlkzdvMSghheFL3gk0wIdC
        UDlx4phJuEoBWdrdyizYarg51q0AK7BFP1EL
X-Google-Smtp-Source: ABdhPJwQaOK4kg7uOaIgXKhyGXj3YcKf5bZ3b8TXmpfcglDb8cG7sc/FbQHVDNbj2sxXdJ3bo9iI5g==
X-Received: by 2002:a1f:ee07:: with SMTP id m7mr23474944vkh.27.1638548011182;
        Fri, 03 Dec 2021 08:13:31 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id f132sm525922vkf.18.2021.12.03.08.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 08:13:30 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 188so2160514vku.8;
        Fri, 03 Dec 2021 08:13:30 -0800 (PST)
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr22876526vke.33.1638548010501;
 Fri, 03 Dec 2021 08:13:30 -0800 (PST)
MIME-Version: 1.0
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com> <20211201073308.1003945-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211201073308.1003945-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 Dec 2021 17:13:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV1Ri-yCeJSp6Gdw5ocAgXj4Yyc57ucN2DY=muj+dQV9A@mail.gmail.com>
Message-ID: <CAMuHMdV1Ri-yCeJSp6Gdw5ocAgXj4Yyc57ucN2DY=muj+dQV9A@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] dt-bindings: arm: renesas: Document Renesas
 Spider boards
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Dec 1, 2021 at 8:33 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add device tree bindings documentation for Renesas R-Car S4-8
> Spider CPU and BreakOut boards.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -317,6 +317,14 @@ properties:
>
>        - description: R-Car S4-8 (R8A779F0)
>          items:
> +          - enum:
> +              - renesas,spider-cpu # Spider CPU board (RTP8A779FASKB0SC2S)

In your reply to v1, you said that the part number should be
RTP8A779F0ASKB0SC2S?

> +          - const: renesas,r8a779f0
> +
> +      - items:
> +          - enum:
> +              - renesas,spider-breakout # Spider BreakOut board (RTP8A779F0ASKB0SB0S)
> +          - const: renesas,spider-cpu
>            - const: renesas,r8a779f0
>
>        - description: R-Car H3e (R8A779M0)

I can fixup the above while applying, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
