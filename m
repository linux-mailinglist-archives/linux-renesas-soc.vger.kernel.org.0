Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 901E650BB1C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 17:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1449215AbiDVPGH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 11:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449204AbiDVPFa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 11:05:30 -0400
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41AD5D5C2;
        Fri, 22 Apr 2022 08:02:34 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id jt15so222997qvb.13;
        Fri, 22 Apr 2022 08:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nl7wQaLVnrUxRifrIlCw6eSjmlS3kXxae69A9xpqkSw=;
        b=I4lmG3HiTR46fbSA3AwAE1RKgSL8I0kc5KJXZJa+ubLfjK0th6YuFI4a4tPiXme9iF
         VEgJSfr6VHRQdnuGcIf9Qzjy4yMoAZmAW3mkmi6P2aVpff3OMnKn7Cf8XKKWgrwWyKI/
         m2av1wcnwj7xZw//g3rQCmErr6ZIBXNHu2fNwEfhf6FzFMBSP/pEj4x2fJNeN5Vm2VYP
         nQ0bg9dAP1z7haqLRu1jw68x8g4lmEqEIa/AOereVGWWsVMIywZnHiRxGvgkE24DQWq0
         aLP0OAfCC3IctJ1M7uQCKCgPAA8CMbe69kB/vP/cBuMp7Jc6W0ic0jirDHHy0AJzk2bf
         +fHw==
X-Gm-Message-State: AOAM532v9wvb+RiaX1iNU63os4Y3x9el3kWDiJqTjxnNuPozIaL2MQ8B
        fRXN0CIdLYLE79VSYNJR04SbrpO6qSoORQ==
X-Google-Smtp-Source: ABdhPJwPmTYnQqkYaq7o3h0uiBTxF7i8t4PkT4X9qQ+xrtWOBg9b3Hk0Ukn8vDYj8Tq+aJrkYZHmXg==
X-Received: by 2002:a05:6214:f07:b0:446:693d:196c with SMTP id gw7-20020a0562140f0700b00446693d196cmr3727725qvb.23.1650639753246;
        Fri, 22 Apr 2022 08:02:33 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id t10-20020a05622a180a00b002f202b7806esm1318698qtc.81.2022.04.22.08.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 08:02:33 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2f18982c255so88284947b3.1;
        Fri, 22 Apr 2022 08:02:32 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr5231596ywb.132.1650639752748; Fri, 22
 Apr 2022 08:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
 <20220330154024.112270-4-phil.edworthy@renesas.com> <CAMuHMdXy7XPcAmBLuCeXwZcPxNrfBs2yBN+tLicjHLQxQO=B2Q@mail.gmail.com>
 <TYYPR01MB70867EDF52038CBA6FD42383F5F79@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB70867EDF52038CBA6FD42383F5F79@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Apr 2022 17:02:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBf1RANzoTK_TKh73_5vYqTrYaA3eTKo+joNrFaNoDeg@mail.gmail.com>
Message-ID: <CAMuHMdXBf1RANzoTK_TKh73_5vYqTrYaA3eTKo+joNrFaNoDeg@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] dt-bindings: clock: Add r9a09g011 CPG Clock Definitions
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Fri, Apr 22, 2022 at 1:29 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 20 April 2022 22:13 Geert Uytterhoeven wrote:
> > On Wed, Mar 30, 2022 at 5:41 PM Phil Edworthy wrote:
> > > Define RZ/V2M (R9A09G011) Clock Pulse Generator core clocks, module
> > clock
> >
> > The definitions contain no core clocks, only module clocks and resets?
> > Perhaps you will need a core clock for the Ethernet reference clock,
> > like on RZ/G2L?
> It looks like rz/v2m has a gate for every clock, so no need for any core
> clocks.

OK. Then please remove "core clock," from the patch description.

> > > outputs (CPG_CLK_ON* registers), and reset definitions (CPG_RST_*
> > > registers) in Section 48.5 ("Register Description") of the RZ/V2M
> > Hardware
> > > User's Manual (Rev. 1.10, Sep. 2021).
> > >
> > > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

> > > --- /dev/null
> > > +++ b/include/dt-bindings/clock/r9a09g011-cpg.h

> > > +#define R9A09G011_IIC01_PCLK           79
> >
> > IIC0_PCLK?
> There are four IIC peripherals, this pclk if for iic0 and iic1.

I know.

> Would IIC0_1_PCLK be a better name for this?
>
> > > +#define R9A09G011_IIC23_PCLK           89
> > IIC1_PCLK?
> and IIC2_3_PCLK?

Well, IIC0_PCLK andIIC1_PCLK match the Hardware Manual.

BTW, for resets, they avoided the confusion by naming the groups
A and B, instead of 0 and 1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
