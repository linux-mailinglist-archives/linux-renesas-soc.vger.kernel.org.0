Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCB054DC28
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jun 2022 09:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359241AbiFPHxK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jun 2022 03:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiFPHxK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jun 2022 03:53:10 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4AC15812;
        Thu, 16 Jun 2022 00:53:06 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id g15so472357qke.4;
        Thu, 16 Jun 2022 00:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qoDONOlMnc9LStw1JRWOE6LutyWOeAc3QbYws5EB78g=;
        b=53p04d+shJmdQcNI+REjU03Dg/W9kT7KcHCHiRQ+o0xU6IdY6rdEbR/SVwqFdUxxrA
         H2sv/77Nk+OP9xmd3JRIe57JmL+l19UJggMkEj33/yZKNxWWLw/v7A0GOkY95Nx1m+a4
         Ex6wvKOHODBc+rwCjrw1lK3gDMTHhanZUr9rIJbr+IhPXjPud0g6Yz3CxSDHuwk8IeIl
         Kd4ZkXHa/p2iKmUVnNkWIfXChFQmlWvjzyOUZ5TD+wXgNY9Bkx+Mj0XJtW41OcZwlyRx
         jfNt63gb/ryHPjmrJ99FtIywLk0LHyRvLAGj4Fx3TIOZSBrG8YUAP3qEg78p/hSiPdoV
         eRjw==
X-Gm-Message-State: AJIora9jwQC3bALRGV8V0c3F9/cFY2+TYj4Di9kDyTsXgqyqlGyi9zPL
        3XMKkKnIE90jmW80RzeHMIkscDJpP8ZLuw==
X-Google-Smtp-Source: AGRyM1u1CHz+y3fX6LvDSDVaJqgaEwOBOOlQpVHvzVZZvpkxa0NUHC+fvTOQ/Yt477nQxfjIVgFb3A==
X-Received: by 2002:a37:ab02:0:b0:6a6:b111:61a8 with SMTP id u2-20020a37ab02000000b006a6b11161a8mr2629851qke.260.1655365985748;
        Thu, 16 Jun 2022 00:53:05 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id t3-20020a05622a01c300b003026a08257fsm1483260qtw.21.2022.06.16.00.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 00:53:05 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id w2so839787ybi.7;
        Thu, 16 Jun 2022 00:53:05 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr3997226ybh.36.1655365985159; Thu, 16
 Jun 2022 00:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <c5d19e2f9714f43effd90208798fc1936098078f.1655301043.git.geert+renesas@glider.be>
 <CAL_JsqJbmdJd6+D9zog6NwF_LPO5QC_HsODg4FHLJOnMmPP-mg@mail.gmail.com>
In-Reply-To: <CAL_JsqJbmdJd6+D9zog6NwF_LPO5QC_HsODg4FHLJOnMmPP-mg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Jun 2022 09:52:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3PnY6yZf70kB9wme7_WTjcPJwmzo--Ua3vJ45w7mD8w@mail.gmail.com>
Message-ID: <CAMuHMdU3PnY6yZf70kB9wme7_WTjcPJwmzo--Ua3vJ45w7mD8w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: ehci: Increase the number of PHYs
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Wed, Jun 15, 2022 at 7:24 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Wed, Jun 15, 2022 at 7:53 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > "make dtbs_check":
> >
> >     arch/arm/boot/dts/r8a77470-iwg23s-sbc.dtb: usb@ee080100: phys: [[17, 0], [31]] is too long
> >             From schema: Documentation/devicetree/bindings/usb/generic-ehci.yaml
> >     arch/arm/boot/dts/r8a77470-iwg23s-sbc.dtb: usb@ee0c0100: phys: [[17, 1], [33], [21, 0]] is too long
> >             From schema: Documentation/devicetree/bindings/usb/generic-ehci.yaml
> >
> > Some USB EHCI controllers (e.g. on the Renesas RZ/G1C SoC) have multiple
> > PHYs.  Increase the maximum number of PHYs to 3, which is sufficient for
> > now.
>
> Maybe not so 'generic'. Why are there 3? I understand USB3 HCI having
> 2 for SS and HS. Is it for multiple ports? There's a thread about that
> currently (Mediatek IIRC) and how to handle multiple phys.

TBH, I don't know for sure. I've never been much into USB, and the
RZ/G1C USB architecture differs from other Renesas SoCs in the
same family.

This is USB2, not USB3.  There are two channels of OHCI/EHCI, and
two channels of USB OTG, all with corresponding PHYs (4 in total).
The first OHCI/EHCI combo is linked to one of the host PHYs, and one
of the OTG PHYs, so that makes 2 PHYs.
The second OHCI/EHCI combo is linked to the other host PHY, and to
both OTG PHYs, so that makes 3 PHYs. IIRC the third link was due to
some dependency between the 2 OTG PHYs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
