Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319934595EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 21:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239407AbhKVULn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 15:11:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233234AbhKVULn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 15:11:43 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F44C061574;
        Mon, 22 Nov 2021 12:08:36 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id v7so53435490ybq.0;
        Mon, 22 Nov 2021 12:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a5jVOagTt0Kg5zCB4wpCaOvINomhqISo4S93iKwz7ac=;
        b=IbatkhZ7LjG0vTlUqb2C3Mj1rHLSIyXn/VDnDjWD5dpCYy4rrSQwUYvmZSUAOacAkc
         heVjwQbS0yuAA9Q4vVuX/re8nS/KLGznfr8bE3GqaMiCzRkUQS1Zr1dwULkWSlv2dEz6
         3dNCJsh1lgrOrCtOf9yKg3V/3Njug0Il1qrI0N+A8k8x790WAtUU4VldE07cDJYG5c2d
         qJKouhc58m9DAThyAyYKzRhtOiADDMA3kxqkySvy8uKtWyyqBRSHiPHL4Vdu5GAunqfe
         pJOkjJ+Bc0r0kOviWnWS8qTUr6PKn+gZz4W19DxxVAr68+hwo5Kn0Vv29jsajL53p2MU
         CECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a5jVOagTt0Kg5zCB4wpCaOvINomhqISo4S93iKwz7ac=;
        b=QYA9SZmeSKzPlGnv5iFLxAhe60j3O35bpwgf74u21DRtElzC2blL7FbR39V5Jd7dp3
         /E7XC3esrFM672cQw+el+jrknVkqrkY+Hjq4xdUrYRDsIERigZkQGf1Jia121kJRukI8
         Ra4hOc+nsqgi/cv2byYHhqRGehknpY6NDPcpKUbRP+eq69M0l8tYOyap78XbfbLPORrH
         J6/LmkX2oED0SZEvDH5dwMd04nfK2hGCBWtZlHkOOSGwIM2B8jVmLGYlbwThemWtHek0
         f3RbdmjqChsCB6Q8HcLsX2bOzjm41n9CJ9dvyntwT5KNyGNCNqVNtEpm4eJaCTE9BSev
         2Ykw==
X-Gm-Message-State: AOAM533EBVLMygpVj0CxqOLPep/1imoXcLM6Uo8iBJd2QnlL+889wgQE
        nUZ7SRHGwT0kzsZLJxdHIX/ws8DOen1M3zQ9LqA=
X-Google-Smtp-Source: ABdhPJwKvELa/ggMRKoyGlsc1ohyUEQCelrewlGse3v42ehXaQAjyTin1OBPCuV1IwSDpa+QliWp+tSClSy+SNz4SUo=
X-Received: by 2002:a25:56c3:: with SMTP id k186mr66811954ybb.543.1637611715665;
 Mon, 22 Nov 2021 12:08:35 -0800 (PST)
MIME-Version: 1.0
References: <20211121234906.9602-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <09b5b453-ed88-8359-4145-a5ec981069e6@omp.ru>
In-Reply-To: <09b5b453-ed88-8359-4145-a5ec981069e6@omp.ru>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 22 Nov 2021 20:08:09 +0000
Message-ID: <CA+V-a8sMEM5msvSNy1118dAN9jB-dUOeoOxRkbizmmEdXAJPjw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: rzg2l-smarc-som: Enable serial
 NOR flash
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergey,

Thank you for the review.

On Mon, Nov 22, 2021 at 8:06 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
>
> On 22.11.2021 2:49, Lad Prabhakar wrote:
>
> > Enable mt25qu512a flash connected to QSPI0.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2
> > -> Renamed qspi_pins0 to qspi0_pins
> > ---
> >   .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 40 +++++++++++++++++++
> >   1 file changed, 40 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> > index 7e84a29dddfa..aef1b8736732 100644
> > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> > @@ -178,6 +178,18 @@
> >               line-name = "gpio_sd0_pwr_en";
> >       };
> >
> > +     qspi0_pins: qspi0 {
> > +             qspi0-data {
> > +                     pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3";
> > +                     power-source  = <1800>;
>
>     Hrm, sorry for more nitpicking... Why 2 spaces before =?
>
Argh my bad...
> > +             };
> > +
> > +             qspi0-ctrl {
> > +                     pins = "QSPI0_SPCLK", "QSPI0_SSL", "QSPI_RESET#";
> > +                     power-source  = <1800>;
>
>     Here as well...
>
.. will fix that.

Cheers,
Prabhakar

> > +             };
> > +     };
> > +
> >       /*
> >        * SD0 device selection is XOR between GPIO_SD0_DEV_SEL and SW1[2]
> >        * The below switch logic can be used to select the device between
> [...]
>
> MBR, Sergey
>
