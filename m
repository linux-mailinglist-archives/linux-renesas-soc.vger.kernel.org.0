Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B962B5A434D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 08:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbiH2GdS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 02:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiH2GdS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 02:33:18 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C152DAB4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Aug 2022 23:33:17 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id m5so5387855qkk.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Aug 2022 23:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=1NseVIS7vrFmZ+q7eC4MHuGdzS4uY6dyOKWKJTRk7eE=;
        b=oaAxPdC4ZXOvWR+KE3f9ms0f2hWYJsUKZcaUmcKShaCMJLQy5i1+gBYfhX9VlJ7fMx
         VIMBgLAJ+woNc5W6k0InRUSEVtyO99C7iD4J+/ybmpHOnuCOBFT7WFb9dtjXuN26UEbv
         HJU1cvb21iDpJxrg3MLljS9oshS8MYZuMXTELW1IJfENQxSqCX/HzV/NoHi1WoMIt8ct
         QDV3VdLUlDReRiiwgJCQN4zBBpbm8eDqSVt9qufC++uqC/ie6xjjK/61oeJzGtHBdc6g
         627SiXUvu4875SA0jAZ++pErdR/agN91dSJrJJordZ4stvoyUvMB09Y+blUl5Sz3arJd
         +7Hg==
X-Gm-Message-State: ACgBeo3zJP4jurA/+V6Ql27PSjQfMVUAagX9VTEt4Ko9WUHmdKa2EGWZ
        myy2uI230ouGKHCRXeWNULG6BEjL/EWn/Q==
X-Google-Smtp-Source: AA6agR4Uq06aDHE3O+e7WmH3otFZDinMlXBOfaDSozBnqnJ1PtbNlm8M3QXeb0+sPU/lS22jjdF3Rw==
X-Received: by 2002:a05:620a:2988:b0:6bb:582e:8ac9 with SMTP id r8-20020a05620a298800b006bb582e8ac9mr7517223qkp.107.1661754796190;
        Sun, 28 Aug 2022 23:33:16 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id y8-20020a05620a25c800b006bb0e5ca4bbsm5326002qko.85.2022.08.28.23.33.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Aug 2022 23:33:15 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-3413ad0640dso16423787b3.13
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Aug 2022 23:33:15 -0700 (PDT)
X-Received: by 2002:a25:778d:0:b0:696:4bb6:9aaa with SMTP id
 s135-20020a25778d000000b006964bb69aaamr7263364ybc.380.1661754795508; Sun, 28
 Aug 2022 23:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com>
 <87v8qj92cu.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdV39bTp793CataarD8mu3q9=N00m+vZQ_7J+doaKz+5+w@mail.gmail.com>
 <87czcjeqpm.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87czcjeqpm.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Aug 2022 08:33:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEC3n_jzt78pvO48F5AOSYz77f5+zgetc2tG8PdcU-3g@mail.gmail.com>
Message-ID: <CAMuHMdWEC3n_jzt78pvO48F5AOSYz77f5+zgetc2tG8PdcU-3g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: add r8a77980a.dtsi
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
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

Hi Morimoto-san,

On Mon, Aug 29, 2022 at 4:19 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77980a.dtsi
> > > @@ -0,0 +1,7 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Device Tree Source for the R-Car V3H2 (R8A77980A) SoC
> > > + *
> > > + * Copyright (C) 2022 Renesas Electronics Corp.
> > > + */
> > > +#include "r8a77980.dtsi"
> >
> > Please override the root compatible value to
> > "renesas,r8a77980a", "renesas,r8a77980", to match the bindings.
>
> Sorry I don't understand about this comment.
> Is it for where/what or which patch ?

I mean to add the following to this patch:

    / {
            compatible = "renesas,r8a77980a", "renesas,r8a77980";
    };

(like we do in all other SoC-specific .dtsi files that include another
 SoC-specific .dtsi file, e.g. arch/arm64/boot/dts/renesas/r8a779m0.dtsi).

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
