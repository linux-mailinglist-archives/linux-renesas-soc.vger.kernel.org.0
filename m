Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7E8B4EDB8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 16:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237282AbiCaOS4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 10:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbiCaOSz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 10:18:55 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D1321C701;
        Thu, 31 Mar 2022 07:17:08 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id b18so21468981qtk.13;
        Thu, 31 Mar 2022 07:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sSc2A9kgOjk8SzzMIkeaXVjx0foxQv7onpYUgebGA9U=;
        b=NyL5C5EFriulUPTOVXiKD5QnDrjPgpo6g7B8H/PXtpQh+N02CnJQ/MCbAUvXMQYv4I
         Wnj2G81Mz3mua7gMqcaiMJamo4e0AKfXtGnAmJn2rm82PFst0Q6gbNhVpID2D4FVfiOG
         aX6+ArAD0G6l4ksYfmeboMS2c2edqSP5eW0SqP/gT8rM+PCAlHJ4Df7z/pQahn4kn1Zi
         bpX3ZXTItpfxogyzVUAZeE+sWRuVh01VsVuMGExLlwwz5ssSi1ASiRlfCUDQbkvozLy4
         H7TrT+dwIowrzhT5qV+CktF+P2jxfkV+5n+Xj7LpewgU1wwYSI6YqE1ULpcViuMFTFHo
         UFqA==
X-Gm-Message-State: AOAM532xPQ2pfIbCBGZjqCw15FgDv4persw89bHPXhgbDMxB7bfT4VPi
        V+A/zXjPWgUmwm87aO+Dwvg9DG6IhUh1mQ==
X-Google-Smtp-Source: ABdhPJwfY3i8u9RXB/De/gKg+u5VrXgQQ7EC88LC5cclGl/Ub1XzqmnbhMq3KlbjfpB2IWxEUMFsww==
X-Received: by 2002:a05:622a:46:b0:2e1:d837:e91d with SMTP id y6-20020a05622a004600b002e1d837e91dmr4433978qtw.633.1648736226830;
        Thu, 31 Mar 2022 07:17:06 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id p10-20020a05620a132a00b0067f926e36b2sm12116784qkj.91.2022.03.31.07.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 07:17:06 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id t11so42577301ybi.6;
        Thu, 31 Mar 2022 07:17:06 -0700 (PDT)
X-Received: by 2002:a05:6902:101:b0:633:ccde:cfca with SMTP id
 o1-20020a056902010100b00633ccdecfcamr4073555ybh.207.1648736225844; Thu, 31
 Mar 2022 07:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220315155919.23451-1-biju.das.jz@bp.renesas.com>
 <20220315155919.23451-3-biju.das.jz@bp.renesas.com> <CAMuHMdWWWBaVHaQ8AiBOSdmcBLcXS=5-Rocx_rn-Et=jCWkXdw@mail.gmail.com>
In-Reply-To: <CAMuHMdWWWBaVHaQ8AiBOSdmcBLcXS=5-Rocx_rn-Et=jCWkXdw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 16:16:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6Af9tbe1SwLv512udKgL8eyPvce91deYM7PXCi777vA@mail.gmail.com>
Message-ID: <CAMuHMdU6Af9tbe1SwLv512udKgL8eyPvce91deYM7PXCi777vA@mail.gmail.com>
Subject: Re: [PATCH 2/7] arm64: dts: renesas: rzg2ul-smarc: Add scif0 and
 audio clk pins
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 31, 2022 at 3:27 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Mar 15, 2022 at 4:59 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Add scif0 and audio clk pins to soc pinctrl dtsi and drop deleting
>
> Serial and audio: sounds (pun intended) like a strange combination? ;-)
>
> > the pinctrl-0 and pinctrl-names properties for scif0 node so that
> > we now actually make use of these properties for scif0.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> LGTM...
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
> > @@ -0,0 +1,24 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Source for the RZ/G2UL SMARC pincontrol parts
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> > +
> > +&pinctrl {
> > +       pinctrl-0 = <&sound_clk_pins>;
> > +       pinctrl-names = "default";
> > +
> > +       scif0_pins: scif0 {
> > +               pinmux = <RZG2L_PORT_PINMUX(6, 4, 6)>, /* TxD */
> > +                        <RZG2L_PORT_PINMUX(6, 3, 6)>; /* RxD */
>
> ... but I cannot review the pin muxing yet, due to lack of documentation
> (SOM schematics).

Fixed, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
