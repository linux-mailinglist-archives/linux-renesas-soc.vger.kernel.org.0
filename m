Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD8D44CD5CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Mar 2022 15:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234471AbiCDOBp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Mar 2022 09:01:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbiCDOBn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 09:01:43 -0500
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 169641B8FD8;
        Fri,  4 Mar 2022 06:00:56 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id j12so4449314vkr.0;
        Fri, 04 Mar 2022 06:00:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LUy291ithvfmHHHsINiVWDfNb4NgmoqzskwJ7fCIxzo=;
        b=BsddnZ/eX7gMZaA/+EJ4VFzCgLgTapSCjz21Xxlr5yVeo1CL/EfCBEnTe55hAZFTUl
         Zdip5i57+tAkLmZwVzo7hwxj8p9/zotVeVWt8Gy0R6s7xB8t55lPNnnm/kcTYrJMd3ha
         wAT4HNtrb7ClnTkZvUu/Msx6cpXxbHP0HgVSDSgysysHWsCkV3JG8FFELdgMdTsiJR7Y
         A+CK5BFcmxkIDw4gSecu4ZptjigkljmKkcTWQ/gjLZNj0+VmY0PA7B66tfOIczqqfmVQ
         g3Uzp8jypLebE2sYGVL+XBuqPBdnlRMphakkYCd35dONUWOQSyjtfnIaMhwLeGu5Ex/h
         Q+HQ==
X-Gm-Message-State: AOAM532gobp0akb2kGP4dG9RSSjPaDj/biQ/O9x/u+9SYZyarp5OOUto
        pKn3MUFbag3e8AJthFyGBUlJ4s0ZenZuTg==
X-Google-Smtp-Source: ABdhPJwESOdSna1Hzeh0HLfW0Qf2hcH/37M1ZoGVO/TZHEijnIsRt+tYkHlrWc+PfkHnObDA4o2QnQ==
X-Received: by 2002:a05:6122:788:b0:331:2063:3645 with SMTP id k8-20020a056122078800b0033120633645mr18010882vkr.10.1646402455008;
        Fri, 04 Mar 2022 06:00:55 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 108-20020a9f24f5000000b0034a4433fe83sm773518uar.37.2022.03.04.06.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 06:00:54 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id g21so9126166vsp.6;
        Fri, 04 Mar 2022 06:00:54 -0800 (PST)
X-Received: by 2002:a67:af08:0:b0:31b:9451:bc39 with SMTP id
 v8-20020a67af08000000b0031b9451bc39mr17032843vsl.68.1646402454206; Fri, 04
 Mar 2022 06:00:54 -0800 (PST)
MIME-Version: 1.0
References: <20220303162634.6572-1-biju.das.jz@bp.renesas.com> <20220303162634.6572-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220303162634.6572-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Mar 2022 15:00:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUzziRk1UHLyCHBpD6abpHP2dBBZQqnOY-C5H8TZreoOg@mail.gmail.com>
Message-ID: <CAMuHMdUzziRk1UHLyCHBpD6abpHP2dBBZQqnOY-C5H8TZreoOg@mail.gmail.com>
Subject: Re: [PATCH V2 3/7] dt-bindings: clock: Add R9A07G043U CPG Clock and
 Reset Definitions
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Biju,

On Thu, Mar 3, 2022 at 5:26 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Define RZ/G2UL (R9A07G043U) Clock Pulse Generator Core Clock and module
> clock outputs, as listed in Table 7.1.4.2 ("Clock List r0.51") and also
> add Reset definitions referring to registers CPG_RST_* in Section 7.2.3
> ("Register configuration") of the RZ/G2UL Hardware User's Manual (Rev.
> 0.51, Nov. 2021).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a07g043u-cpg.h
> @@ -0,0 +1,186 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A07G043U_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A07G043U_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* R9A07G043U CPG Core Clocks */
> +#define R9A07G043U_CLK_I               0

Likewise, please drop the trailing (upper/lower case) "u".

Unfortunately I cannot comment on the list of clocks, as I don't have
access to that part of the documentation yet.

I think it would be good to compare the RZ/G2UL and RZ/Five clock
lists, so we know if we can handle them in a common driver, possibly
even sharing binding definitions, or need to differentiate.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
