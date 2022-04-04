Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB5564F14D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 14:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344817AbiDDMbd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 08:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344658AbiDDMbd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 08:31:33 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B6425281;
        Mon,  4 Apr 2022 05:29:37 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id kd21so7279468qvb.6;
        Mon, 04 Apr 2022 05:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4WurI6RSU9s0HQnxJ90HvS6/E2XVtO8AH2Zdu3hhPXs=;
        b=BijsgFp6zbblFd74EgOalvaZUaVJzo6jFEFSk/KMJ/qUeLVwNxqtx9VL8jGjQ049aL
         9lgoAvwTngMqruzfCVKL6pTF+4aoNwA6n7x+edFQ0X0cf3uUFa68SftXsjyt++rKHvoP
         bNdsP6rev9hZ3bDQ2sxulpHsOz8tzZ0lYC3XZjhxpzYgXS5nBKq71QbnDuQ+WtDC9g2t
         eyJ/D4ZymxGE3RLeYOceqp1Yjzq1Medg6rNfjzL/xvNlNJX5By+8gpPLYBEb71Ga8er0
         IF6sg+uFeMrRWlwq3v5Jk7E7RPx+kHcEdo3F0ch9aJ5JuTakMwAVWvz2/1WTAJO/dD72
         ymmQ==
X-Gm-Message-State: AOAM5334ZUSGWc218hNB8MBjG8YiiQVoPH3bCDv140vzzJeDkDD71vFD
        UJcuzbgjhZkYITvlUTX3pSK3wmsGEEYkUw==
X-Google-Smtp-Source: ABdhPJzKwBSTHoPYjNB/OL5/c9B2+qhJTu/ohSPqEjBpUxONprzXdsKPf61CfRnKXwz+mkrRgQZPOg==
X-Received: by 2002:a0c:f806:0:b0:440:f78f:1f67 with SMTP id r6-20020a0cf806000000b00440f78f1f67mr17579904qvn.95.1649075376221;
        Mon, 04 Apr 2022 05:29:36 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id g7-20020a376b07000000b006492f19ae76sm6170165qkc.27.2022.04.04.05.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 05:29:35 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2eb888cf7e7so9039837b3.13;
        Mon, 04 Apr 2022 05:29:35 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr21854469ywi.449.1649075375445; Mon, 04
 Apr 2022 05:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220402073234.24625-1-biju.das.jz@bp.renesas.com>
 <cf7728fd-b5c8-cd3d-6074-d27f38f86545@linaro.org> <OS0PR01MB5922B49ED5DADA5DD3DDA60786E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <d6989ea9-9e84-0022-aff0-c75b0e3203e2@linaro.org> <OS0PR01MB5922C1100BCF87341534FC6E86E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <e3ebc5d0-d2bc-b5a8-1b19-5e0c2f3d7c41@linaro.org>
In-Reply-To: <e3ebc5d0-d2bc-b5a8-1b19-5e0c2f3d7c41@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Apr 2022 14:29:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTjHx8St_LxvMy1UfkRqNxZ1Dz0YYNXKMAhqouUxiW0w@mail.gmail.com>
Message-ID: <CAMuHMdVTjHx8St_LxvMy1UfkRqNxZ1Dz0YYNXKMAhqouUxiW0w@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SMARC EVK
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Krzysztof,

On Sat, Apr 2, 2022 at 10:03 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 02/04/2022 21:54, Biju Das wrote:
> >> I understand that carrier board is the same, so the SoM differs.
> >
> > For R9A07G043 case, even SoM is same, only SOC differs.
>
> I assumed that you cannot have same SoMs with different SoCs...
>
> >
> >> In your
> >> model to figure out what type of hardware is it, your choice is to compare
> >> two compatibles:
> >> renesas,smarc-evk + renesas,r9a07g043u11
> >>
> >> If user-space compares only last compatible, it get's only SMARC, so it
> >> does not know on what hardware it runs.
> >
> > But Here user-space can easily identify the H/W with existing scheme. See the logs from user-space.
> >
> > / # for i in machine family soc_id revision; do echo -n "$i: "; cat /sys/devices/soc0/$i;done
> > machine: Renesas SMARC EVK based on r9a07g043u11
> > family: RZ/G2UL
> > soc_id: r9a07g043
> > revision: 0
>
> User-space is one example. We don't limit to this. Anyway, the
> compatible is the main way to check it. Machine is just test, not
> compatible, not part of ABI. soc_id and revision could help, but these
> are separate ABIs. They can be not compiled-in and then you have only
> compatible.
>
> Regardless whether there is another way for user-space to figure out
> hardware, it does not change the fact that such usage of compatibles
> does not look correct with Devicetree spec.
> "...They
>  allow a device to express its compatibility with a family of similar
> devices, potentially allowing a single
>  device driver to match against several devices."
>
> The "renesas,smarc-evk" compatible is not the most specific one, because
> different configurations have it.

From the letter of the spec, this is indeed not valid.
However, we started doing this several years ago, as the various
variants of the Salvator-X(S) and ULCB boards are identical, and just
differ in SoC (actually SiP) mounted.

E.g. arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts has
compatible = "renesas,salvator-xs", "renesas,r8a7795".

While we could add e.g. "renesas,salvator-xs-r8a7791", doing so
would inflate the bindings a lot.

> Again - you intend to use a pair or even a triple of compatibles to
> uniquely identify type of hardware. I don't think it is correct - the
> final, most specific compatible, uniquely identifies the hardware. All
> other compatibles are just for fallback.

And what to do when adding more DT overlays for expansion boards?
This would become unmanageable soon.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
