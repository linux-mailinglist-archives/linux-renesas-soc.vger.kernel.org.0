Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C62BB4E5441
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 15:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237232AbiCWObH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 10:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235642AbiCWObG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 10:31:06 -0400
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366A620F7B;
        Wed, 23 Mar 2022 07:29:37 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id f3so1297140qvz.10;
        Wed, 23 Mar 2022 07:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tlpmkSfgXVfoxMwJeIm4aL1qE+oyk0bbD2VRYa7nEVU=;
        b=ScO7If8ts/JcGq37J6EueqF1FDXf1l1REpM0+27N8IlEjw01+JoOc3gHCmDumLcy4R
         KnRdfCvGHx+hh5Q3V0qUFYxl3gwQGAoLGFv0BYkLT4Y6UFm+j0Pjw/1v/N7xqb/xSP0a
         aNvFMHN3X3Wtf7jdqRHx3MGqYA/q6vKnk7zv8bqvXa2NEJuqO7QciK3vYUMFPSIgmdg1
         9tGeCcVWM+L1oTa1I0FUGEDbhtIYL3r+zOHBvr0T2J3JarxYezmxf27v+tYazVUggf/a
         hWRccmBW0chQ/WBaBqCuKYFyDK8mkis3yo7N95KaB79OxKpfe2w47nxnXm14TWlKGNy2
         TJrQ==
X-Gm-Message-State: AOAM530A3CAgLA0Wc6Da/G/ADbPPxZolRMul0cl7125STmvK3JBRExmO
        J1F6AClbAZ94RWOqKTZoyk2cvosO9Qizuw==
X-Google-Smtp-Source: ABdhPJwxFbDGhkyoZUQD3xpBDKCPG2vUmtrMsZBZEchLdDcnR6Q+sAEC7mBH+OFjexfcaILyIDyqFQ==
X-Received: by 2002:a0c:c38d:0:b0:42c:1a57:24d2 with SMTP id o13-20020a0cc38d000000b0042c1a5724d2mr23350342qvi.1.1648045775927;
        Wed, 23 Mar 2022 07:29:35 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 145-20020a370897000000b0067b30c65415sm69272qki.75.2022.03.23.07.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 07:29:35 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id g9so574364ybf.1;
        Wed, 23 Mar 2022 07:29:35 -0700 (PDT)
X-Received: by 2002:a25:c049:0:b0:634:6751:e8d2 with SMTP id
 c70-20020a25c049000000b006346751e8d2mr235361ybf.6.1648045775243; Wed, 23 Mar
 2022 07:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
 <20220321154232.56315-5-phil.edworthy@renesas.com> <b00a4cc8-c8b8-60ab-9891-e6cb44c8bf75@kernel.org>
In-Reply-To: <b00a4cc8-c8b8-60ab-9891-e6cb44c8bf75@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Mar 2022 15:29:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXFOjuvWiORs_CNt+xgm4QWgDaHvzb0Q0OPibmKP7uhRA@mail.gmail.com>
Message-ID: <CAMuHMdXFOjuvWiORs_CNt+xgm4QWgDaHvzb0Q0OPibmKP7uhRA@mail.gmail.com>
Subject: Re: [PATCH 04/14] dt-bindings: clock: Add r9a09g011 CPG Clock Definitions
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
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

On Wed, Mar 23, 2022 at 11:44 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21/03/2022 16:42, Phil Edworthy wrote:
> > Define RZ/V2M (R9A09G011) Clock Pulse Generator core clocks, module clock
> > outputs (CPG_CLK_ON* registers), and reset definitions (CPG_RST_*
> > registers) in Section 48.5 ("Register Description") of the RZ/V2M Hardware
> > User's Manual (Rev. 1.10, Sep. 2021).
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

> > --- /dev/null
> > +++ b/include/dt-bindings/clock/r9a09g011-cpg.h
> > @@ -0,0 +1,337 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corp.
> > + */
> > +#ifndef __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__
> > +#define __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__
> > +
> > +#include <dt-bindings/clock/renesas-cpg-mssr.h>
>
> Include only headers which you use here. Do you use it directly here?

Technically, it is part of the clock bindings for the SoC.
That's why it's included here, and in several other *-cpg-mssr.h files.

So I prefer to keep it that way.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
