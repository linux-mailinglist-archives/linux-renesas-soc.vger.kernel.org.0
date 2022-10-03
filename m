Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9BC45F2B6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 10:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbiJCIGw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 04:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbiJCIGa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 04:06:30 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D9E29C8F;
        Mon,  3 Oct 2022 00:41:39 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id f14so2836634qvo.3;
        Mon, 03 Oct 2022 00:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PmPtBLaImy0M17k5GJ4a8BjzmR/ee8/kkmzPE3BQ0dk=;
        b=z5e2b00JAP5Zx8ViEgB5eyp/5sDaf/6nA0hYxSESWuP/NwfIycPbQUkEEtf7opn7NM
         7USraqldVdOdTE369rDTykHJ+7IpWJjJKrx7v7Tx5xQGWhx/tp0yitN4xF32fYnppARi
         28AwFhHwZdCzEolzuA6knQjQYMVPYhRHt0hP+hqwjx0bNvDtYdpchi2qyjBDUAm99Fbe
         22USNPvv2YxZcP0xaQh3MxYXhwvtssl0dOIK1gWeDPuqQsoWCM2GoDuzRebxz9rg0FQ1
         fNC/Jm80HyYGxPsq2Ox5h22GmFuWMmrrInSJtnHbQOluQq7pmdM/YgcWVDjLGryklTU0
         4lEQ==
X-Gm-Message-State: ACrzQf3Zf6G14KqrxJplZs5M4iQRSh8jQy/1M4ZFYnK+4w1QXNUka7eT
        EtG4U5WvWT1bfjyVEycjKRtbMsQ4ffotkA==
X-Google-Smtp-Source: AMsMyM5pNi4lyaT+9EzFxYBjN4ZVJV7V7tHgH4wNDrc3fABtzI/vG2U05cSEtgkrs2kc5wlg6hslpA==
X-Received: by 2002:ad4:5f0b:0:b0:4b1:7a60:399a with SMTP id fo11-20020ad45f0b000000b004b17a60399amr7343134qvb.101.1664782741002;
        Mon, 03 Oct 2022 00:39:01 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id b8-20020ac844c8000000b0035d57445127sm8923604qto.47.2022.10.03.00.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 00:39:00 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 207so8800173ybn.1;
        Mon, 03 Oct 2022 00:39:00 -0700 (PDT)
X-Received: by 2002:a5b:506:0:b0:6af:ffac:4459 with SMTP id
 o6-20020a5b0506000000b006afffac4459mr17041345ybp.365.1664782740393; Mon, 03
 Oct 2022 00:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220929103043.1228235-1-biju.das.jz@bp.renesas.com>
 <20220929103043.1228235-2-biju.das.jz@bp.renesas.com> <YzXbrZNI81f1ebBt@google.com>
 <20220930174707.GA567190-robh@kernel.org> <YzqQdUcsvu4AJPj2@google.com>
In-Reply-To: <YzqQdUcsvu4AJPj2@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 Oct 2022 09:38:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMy0cZEhT4R+19NgrEtF8a_TqN1hXM8LZ_HvYD+oYaag@mail.gmail.com>
Message-ID: <CAMuHMdXMy0cZEhT4R+19NgrEtF8a_TqN1hXM8LZ_HvYD+oYaag@mail.gmail.com>
Subject: Re: [PATCH RFC 1/7] dt-bindings: mfd: Document RZ/G2L MTU3a bindings
To:     Lee Jones <lee@kernel.org>
Cc:     Rob Herring <robh@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lee,

On Mon, Oct 3, 2022 at 9:34 AM Lee Jones <lee@kernel.org> wrote:
> On Fri, 30 Sep 2022, Rob Herring wrote:
> > On Thu, Sep 29, 2022 at 06:53:49PM +0100, Lee Jones wrote:
> > > On Thu, 29 Sep 2022, Biju Das wrote:
> > >
> > > > The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in
> > > > the Renesas RZ/G2L family SoC's. It consists of eight 16-bit timer
> > > > channels and one 32-bit timer channel. It supports the following
> > > > functions
> > > >  - Counter
> > > >  - Timer
> > > >  - PWM
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > Not sure you need to list all of the IRQs in the example.
> >
> > You do, because that's what the schema says is valid.
>
> You have to use the exhaustive list?

Yes, else "make dt_binding_check" fails to validate the example,
as the schema says all interrupts must be present.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
