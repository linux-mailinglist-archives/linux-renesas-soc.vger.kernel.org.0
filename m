Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F06567A5A3B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Sep 2023 08:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbjISG5Q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Sep 2023 02:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjISG5P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Sep 2023 02:57:15 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD613100;
        Mon, 18 Sep 2023 23:57:09 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-59bc956b029so50980577b3.2;
        Mon, 18 Sep 2023 23:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695106629; x=1695711429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvZ+mnBBrM40WLHgx0y0LsauUGpYm8dp6k3dXFf1X8g=;
        b=NQLcXHGlrqj/vHy8suoD+lEihvnHMNkgdXjGEof1FmynoiCihQT7uNkO6vOYpLSYYh
         jL1WbrBmabQ+056h1GbD8gzetXndKtt1lw1s7BDtNRgRlcjHMfi52XKE0nJdIFMsuO5z
         IQrltrh9RhY0fjHgTRPy9Iqa6JOCMal34OIF7nZv/DbCObUivkZZUj5bOxrkfbP8Xsbr
         6RIKXOWjWG15SyLtyKjebnennQs8KkIKIbOPea363Zp4qpvUS5+EY47bmepRuhjKQcdG
         4LiOvVT6v1L+tEEGGu8vlHglixSpayPgENrj1R7oEpyw66+iPb1hlO9UfVvMV41g5wP0
         f0LA==
X-Gm-Message-State: AOJu0YxBLuwu+7ZFO+SMMFzhvop/v3ym5QSA1tbMrA/WNAm4W6SFAJLB
        pjME5oMT6fZkc6UNPD+mm77eTxNplduHEA==
X-Google-Smtp-Source: AGHT+IE5jWSHMd+41ihEghMNTNIo3vtvJFtU0FBytYmb1qNwGJsGkZlBvFoIDcjMfKsWLcXWHB4T9g==
X-Received: by 2002:a81:4f15:0:b0:59b:ec8c:8658 with SMTP id d21-20020a814f15000000b0059bec8c8658mr10419603ywb.23.1695106628629;
        Mon, 18 Sep 2023 23:57:08 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id p10-20020a0de60a000000b0058390181d16sm3074592ywe.30.2023.09.18.23.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 23:57:08 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-59c0d329a8bso34990097b3.1;
        Mon, 18 Sep 2023 23:57:08 -0700 (PDT)
X-Received: by 2002:a81:a053:0:b0:58f:a19f:2b79 with SMTP id
 x80-20020a81a053000000b0058fa19f2b79mr11772842ywg.9.1695106628214; Mon, 18
 Sep 2023 23:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdW_d_juuo01gbD81aHJ=bs8k3jXeiP7kkOzQDVxHcbzoQ@mail.gmail.com>
 <87y1h36k35.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y1h36k35.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 08:56:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZYqfzVxockGmCjBW6dZNs-b2WyYMwLbGhAsL9iXK1ZQ@mail.gmail.com>
Message-ID: <CAMuHMdVZYqfzVxockGmCjBW6dZNs-b2WyYMwLbGhAsL9iXK1ZQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: use multi Component for ULCB/KF
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

CC DT

On Tue, Sep 19, 2023 at 3:13 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > >  &rcar_sound {
> > > -       ports {
> > > -               /* rsnd_port0-1 are defined in ulcb.dtsi */
> >
> > Don't you need to add
> >
> >     #address-cells = <1>;
> >     #size-cells = <0>;
> >
> > like in the other files?
>
> It is a little bit difficult to understand, but Audio Graph Card dtsi
> relationship is "for ULCB" + "for ULCB-KF".
>
> "for ULCB" side has "#address-cells" and "#size-cells",
> "for ULCB-KF" side adds extra part on it.

I think you misunderstood: ulcb-kf-audio-graph-card-mix+split.dtsi
is the only file that has "ports@1", but does not have the corresponding
"#address-cells = <1>;" and "#size-cells = <0>;" right before it.

You can see this in the output of
"git grep -A4 "&rcar_sound\s{" -- arch/arm64/boot/dts/renesas/ulcb*"

> > > +       ports@1 {
> >
> > So now you end up with a "ports" node without a unit address, and a
> > "ports@1" node with a unit address, which looks very strange to me...
>
> It is another part of a little bit difficult part...
> "for ULCB-KF" part needs "for ULCB" part,
> this means "for ULCB" part is used for both "ULCB only dts" and "ULCB-KF dts".
>
> If we uses "ports@1" on "for ULCB" part, dts check will indicates
> extra warning, because it is not needed for "ULCB only dts".
>
>         "ULCB    dts" needs "ports"
>         "ULCB-KF dts" needs "ports@1"
>
> To avoid extra warning, it is using "ports".

Can't you use "ports@0" instead of "ports" in the base DTS?
When there can be multiple subnodes, we usually use unit addresses
for all of them.

> > Same here: "rcar_sound,dai" node without a unit address, and
> > "rcar_sound,dai@1" node with a unit address.
>
> Same above

Full thread at
https://lore.kernel.org/all/87wmwxh4av.wl-kuninori.morimoto.gx@renesas.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
