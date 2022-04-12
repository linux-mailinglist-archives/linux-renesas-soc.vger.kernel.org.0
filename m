Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2811E4FE4A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 17:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357046AbiDLPYA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 11:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357056AbiDLPXz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 11:23:55 -0400
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D425D660;
        Tue, 12 Apr 2022 08:21:34 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id kl29so16382503qvb.2;
        Tue, 12 Apr 2022 08:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VFJK5OIwXkaTtaTorFVplBIeKXoxiNuwUFLzBzwfNJc=;
        b=1PBOLvaGtqGjsJHyxRcikr9Lj05lvKOXWT5UGGnnH+tKXdBueOnlIw7Z6DkGd7+vDE
         4ki77a07wE3HeQifP5ARulEeHQ8yUdNRef7ATGgB39YfQYBq7p0pJM7P5SIaU9gYeBjK
         wQEh8JiX+XkhzeVCQs0s6s8jwmHP8aeVhVYXOP3a5Vv4t+EtPcDFjBWVl6bNQIBhFnoe
         FtMUpj3QHZgUcAI9v9C8VlLbiFtMuUar0CHMGcdZkPTGFUM0TeWp/3e3ohOo6kHOd6pX
         KOoDJK6AzEb8Rmna1LdTfXX/IP6mpXAFppndDXz48QtLYZoHTziqnml9rnlPZ0j/QOat
         dPtQ==
X-Gm-Message-State: AOAM533mBmvtklZn0uija9yNhM36k8rTy5UAS/SQuzdZLXdeLwtJyVf3
        gmULapmENUZb1yqdUdGAv0w9cehO24Vw/w==
X-Google-Smtp-Source: ABdhPJxeT8WKR3wZzs6BRq7hzh+2Hf3Puu+kGfkfxVZaTqDlOirPqbcV6lKC6LwG42YTtUHznWkJ6Q==
X-Received: by 2002:a05:6214:5198:b0:444:36cc:469a with SMTP id kl24-20020a056214519800b0044436cc469amr4226197qvb.39.1649776893662;
        Tue, 12 Apr 2022 08:21:33 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 140-20020a370892000000b0069c1c277c58sm4306782qki.109.2022.04.12.08.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 08:21:33 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-2ec0bb4b715so76549147b3.5;
        Tue, 12 Apr 2022 08:21:33 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr30817768ywb.132.1649776893018; Tue, 12
 Apr 2022 08:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220402073037.23947-1-biju.das.jz@bp.renesas.com> <20220402073037.23947-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220402073037.23947-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Apr 2022 17:21:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOoN+s63A4FQWitH_CvNqVw0dFAquOGxFjrdLJSz=KdQ@mail.gmail.com>
Message-ID: <CAMuHMdXOoN+s63A4FQWitH_CvNqVw0dFAquOGxFjrdLJSz=KdQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: clock: Add R9A07G043 CPG Clock and
 Reset Definitions
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
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

On Sat, Apr 2, 2022 at 9:30 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Define RZ/G2UL (R9A07G043U) Clock Pulse Generator Core Clock and module
> clock outputs, as listed in Table 7.1.4.2 ("Clock List r0.51") and also
> add Reset definitions referring to registers CPG_RST_* in Section 7.2.3
> ("Register configuration") of the RZ/G2UL Hardware User's Manual (Rev.
> 0.51, Nov. 2021).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v3->v4:
>  * Added Ab tag from Rob
>  * Removed LAST_COMMON macro from clock and reset indices.
>  * Added comment for RZ/G2UL specific clocks
>  * Listed all clocks and reset in the same order as RZ/G2L.

Thanks for the update!

> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a07g043-cpg.h

> +/* R9A07G044 Resets */

Oh well...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-clk-for-v5.19 and
renesas-arm-dt-for-v5.19, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
