Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B19A517534
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 18:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243446AbiEBRBH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 13:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242425AbiEBRBG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 13:01:06 -0400
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44BA91014;
        Mon,  2 May 2022 09:57:37 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id y6so9650071qke.10;
        Mon, 02 May 2022 09:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=63Xrflw2boHWM1lg5uiYEwglTJwV8WkWHlJEPLid5OQ=;
        b=O649onCq4Tu3xIBm0jGI7QK/hpDHfn47fzSte/pl7YZGbgI/0+t1kl3dtVy8igsRNm
         Ciu/D00BJEc9+0bit9UJYS66Y2zuCk2VyYNue3+XYpWO0812dk1injsjVAYFZeBvZ+j4
         v7OylM1orBJBXqzGUZJs60z7g1J7MDrbdly1FPxbyxtpX0nB0ouDzP0TdVwfENzd/lpU
         oNsyGDG/Ux9/UpDfpaxT4c9w5qUdpYXSFLSsslxJ2ITphUdWgpp1HSP84YmFHzYS/l2H
         cPHZIbujKsDM3y4Izad8d8wa5wK8Fkwjl7YNm4DX5RHJBKCJHTizT3q3UIO1hXNtjT9B
         UJpw==
X-Gm-Message-State: AOAM530AO0UvJBQx69980kmlpAc7/9vXe/1o0HznYigNuA7a9XteBHhw
        TDcEhlNjH84geabXfSXrUVduxRdm7Zwyvw==
X-Google-Smtp-Source: ABdhPJyo5xG/5jvwfPEPnrNICzz/rLwmCy+m9R+LWIs0PN53OxHtN8nI49ybJFmTp3cSRemuksrv4A==
X-Received: by 2002:a05:620a:ecb:b0:69f:b596:d9b8 with SMTP id x11-20020a05620a0ecb00b0069fb596d9b8mr9161691qkm.265.1651510656044;
        Mon, 02 May 2022 09:57:36 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id z4-20020ac84544000000b002f39b99f69esm4424098qtn.56.2022.05.02.09.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 09:57:35 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id s30so27044936ybi.8;
        Mon, 02 May 2022 09:57:35 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr11241407ybu.604.1651510655006; Mon, 02
 May 2022 09:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220501112926.47024-1-biju.das.jz@bp.renesas.com> <20220501112926.47024-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220501112926.47024-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 18:57:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvRzWhnnGUfV1UF667a3wTqqjPAenYEwWnDNJ6RdHHWA@mail.gmail.com>
Message-ID: <CAMuHMdVvRzWhnnGUfV1UF667a3wTqqjPAenYEwWnDNJ6RdHHWA@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: r9a07g043: Add OPP table
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, May 1, 2022 at 1:29 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add OPP table for RZ/G2UL SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
