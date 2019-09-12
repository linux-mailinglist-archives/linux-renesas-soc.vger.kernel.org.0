Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 143B7B0EAF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 14:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731540AbfILMOi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 08:14:38 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33685 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731474AbfILMOi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 08:14:38 -0400
Received: by mail-ot1-f67.google.com with SMTP id g25so24578329otl.0;
        Thu, 12 Sep 2019 05:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jsXA7GuX6giXSd+7V65Av2f3nKPUj444RDxOJlkR6ec=;
        b=tcPNnv/x+5kmaURXOlxDrbZvbes0pasRD5FuIi76wGIKBkrZSfwkRyt54PCuq5eZ2Z
         qsUxuvBq9pX2g8CtDF+WY43WZyqGMlPStditf4GDzUyJxIOhBorpa2QvTEZEPv8dv97D
         cjDAOCMC70/xEK+dYjr7rYTAlSw6yhE/3/T0D4xsVEPaZn/Prb9zbrdKKxzEJfkChkuN
         8d+/ZKz1yVTdWYrqmMi9AQSxAn7voDtNC7KRmew027KByzMqZmT0xRJ1nMxE1N8fSX05
         DLmUWW6BJqIEWx0pfqW667GqEJxsrHPGF6/oN8s9NUC517sw3fHdjxH/wrTfNEOXttAe
         1eIg==
X-Gm-Message-State: APjAAAWA4dsqRQUxT7lqsE3WrmOMvif+c70EC49mdv4ZFxWR08ufNPta
        jf8Bsv9dvT6NsoXeXKnTstXr9Gt34c33xZflSLs=
X-Google-Smtp-Source: APXvYqwLsCElxlqeyXh3zckue7y1cFgl0sLHouk/zoLDqS343gGBzNEuocSgSVVkbTfM4sgEkJgcab97NMF1W4994pI=
X-Received: by 2002:a9d:32a1:: with SMTP id u30mr30383161otb.107.1568290477363;
 Thu, 12 Sep 2019 05:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190912103143.985-1-kieran.bingham+renesas@ideasonboard.com> <db2f85e5-3ada-9deb-b62d-9f50d4176b5a@ideasonboard.com>
In-Reply-To: <db2f85e5-3ada-9deb-b62d-9f50d4176b5a@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Sep 2019 14:14:26 +0200
Message-ID: <CAMuHMdXg1PDMBEd3S_pdk3KMG00Dq+xV6pCm_y6sXVR4aX1Wig@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: Fix PWM3
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 12, 2019 at 12:47 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 12/09/2019 11:31, Kieran Bingham wrote:
> > The pwm3 was incorrectly added with a compatible reference to the
> > renesas,pwm-r8a7790 (H2) due to a single characther ommision.
>
> Ugh, my apologies :
>
>  s/characther/character/
>  s/ommision/omission/
>
> Please fix up when applying if there's no need to send a v2.
>
> --
> Kieran
>
>
> >
> > Fix the compatible string.
> >
> > Fixes: de625477c632 ("arm64: dts: renesas: r8a779{7|8}0: add PWM support")
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5, with the above fixed.

BTW, looks like PWM on R-Car Gen2 needs more love...

> > --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > @@ -652,7 +652,7 @@
> >               };
> >
> >               pwm3: pwm@e6e33000 {
> > -                     compatible = "renesas,pwm-r8a7790", "renesas,pwm-rcar";
> > +                     compatible = "renesas,pwm-r8a77970", "renesas,pwm-rcar";
> >                       reg = <0 0xe6e33000 0 8>;
> >                       #pwm-cells = <2>;
> >                       clocks = <&cpg CPG_MOD 523>;
> >

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
