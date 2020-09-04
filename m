Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1AEB25E0A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Sep 2020 19:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgIDRSS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Sep 2020 13:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgIDRSQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 13:18:16 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 253BEC061244;
        Fri,  4 Sep 2020 10:18:16 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id p6so4918667ybk.10;
        Fri, 04 Sep 2020 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zfc6VGSzm8zmMkjKMO2rWCvc30ekK+qXgo2rUCsAxuM=;
        b=a8tlbEttDX50qzj8qHjpXbYGBhjRJ9uvUqpEV2R8yLMtp1Gzg+iWlz06G8VZsSTszo
         MPD3j6hD8uyMYD+V5I6OM+ZcoXTGNDkBUn18h54CrVdRU7rrf0HiWFg+WMMwiaTD9uYT
         t4Ypr3EwyEux9hSP1xOowV4DiiPcVKuVX+eUC4ZSSe7E5lIbVGXpKL5zclIXutKJ5hF7
         2GAk3/L667DNbOlPt/Uper0E1rL/9MoxK5ptomEb31jkAbgwm9GFZDgQCqmrmV6VcmYz
         wA61GZTNyBu9fH2sAq2DjlsmQR15fzrJhzI/cYhZg60VktFXiwjYaOJE+2M0W2IPlH6l
         Rmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zfc6VGSzm8zmMkjKMO2rWCvc30ekK+qXgo2rUCsAxuM=;
        b=G56hpS+Q4tjgj4Tlb7iher8os7GSfl+r/hqmJNNRh7rH+0WtDbXnCLcBrzAzZFPCQW
         it6U/BMgBj+cNYnCBKCW2FxeX/WAjgL1DsUStAVeSTg36dQRAeYHL2jf8Q2s0JTTvtfu
         N7x6n5V5XT8XzNWpzjTWhfHSXzJCTXO1ayfZsfHX+0V7osoVOKvSzIMBvZDgkNfZOEa/
         UQAIGeIe7k4dhBXI4fWN1ifGyAyU19DjbYAztamNBS3rPCXCXjDH3B9EqDyu0bnmVmFJ
         MZqC1Z9BngHautegIulNgs72DxlQ1YBwBimDDJhje1BENS3sJcMnLv4zVT2RBnN2cmej
         CkXw==
X-Gm-Message-State: AOAM533hnISkeMEQwftVZI66+J95Ih/+PP3/zthVBW4Kbx6hrHIA9mNG
        cViTRlJxXA6g7DdygNeKd8Lfuf77LnQMOPgJaRY=
X-Google-Smtp-Source: ABdhPJzhf2gcGQW8Bfk3nZHbFBeNDENxJ0X5gjaUzunqO3RJTsGgO+ufYZWXr5gUYyTjAC2onvKsLAp3P54FO1+I9hk=
X-Received: by 2002:a25:bbcf:: with SMTP id c15mr11170341ybk.127.1599239895457;
 Fri, 04 Sep 2020 10:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200825162718.5838-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUbxtb+Yg=3dgRXWXn2k2tGYcmVzbS-n6rLM0QAJrfo-A@mail.gmail.com>
In-Reply-To: <CAMuHMdUbxtb+Yg=3dgRXWXn2k2tGYcmVzbS-n6rLM0QAJrfo-A@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 4 Sep 2020 18:17:49 +0100
Message-ID: <CA+V-a8vyrQjK-c6NYwn_zJcC2iRCL7sDm_-q2rcM7uicfEV7yQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: r8a7742-iwg21d-q7: Add can0 support to
 carrier board
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Thu, Sep 3, 2020 at 1:14 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Aug 25, 2020 at 6:28 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > This patch enables CAN0 interface exposed through connector J20 on the
> > carrier board.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
>
> According to my schematics, the CAN port on J20 has its signals named
> CAN0_[RT]XD on the carrier board, but connected to CAN1[RT]X (GP4_[67])
> on the SoM.
>
> Or am I looking at the wrong file?
>
You are correct, I misplaced the node from the carrier board, will post a v2.

Cheers,
Prabhakar

> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > @@ -198,6 +198,13 @@
> >         };
> >  };
> >
> > +&can0 {
>
> can1
>
> > +       pinctrl-0 = <&can0_pins>;
>
> can1_pins
>
> > +       pinctrl-names = "default";
> > +
> > +       status = "okay";
> > +};
> > +
> >  &cmt0 {
> >         status = "okay";
> >  };
>
> > @@ -287,6 +303,11 @@
> >                 function = "tpu0";
> >         };
> >
> > +       can0_pins: can0 {
> > +               groups = "can0_data_d";
>
> can1_data_b
>
> > +               function = "can0";
> > +       };
> > +
> >         i2c2_pins: i2c2 {
> >                 groups = "i2c2_b";
> >                 function = "i2c2";
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
