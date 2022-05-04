Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD553519A46
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 10:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346575AbiEDIs3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 04:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiEDIs1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:48:27 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4635E24599;
        Wed,  4 May 2022 01:44:52 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id x9so376285qts.6;
        Wed, 04 May 2022 01:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JpFpnoUv+1TZuq/F4Ej2GJGRcmP3Hur4hTCppd+4pJc=;
        b=TnfoSPzt7+9EsEtKijF8BMX0Fiw/E9X/QfXRPAPVrElnwGTPosh6xaFnRWK3vQD5mm
         /ka3ab1RGw3RLScLYq97zITK6rwwb1kK94Il6ElA1MyYQhhHCiRQlS1bMKaIJD9y5ZhD
         O4DIgCJy36OOgzxSgazoySfrCk75TY1tHq7tKktWo9afwUaD8/ysJ3WLRR0Nr+45Nbyp
         J81OTVXL3VAr2lY6Bz9WBB0596jFR0DFF1S5e0Q71zO0dXXTJHiVeykhX815ktn9x65z
         XWbEeU4ifQCAVdqKtMMJ8ZrnubsfFdp8zP4V8bark4a/8AHAzFE6edpUTrAyBdQy4fAB
         SgEw==
X-Gm-Message-State: AOAM531+3sHocpvShUDnWClOj9SCWFPwAso1pl2vby/KLEZtCReunIxF
        QtOuJsxv/8i97MTI3M7SdDML+94LWBMbfQ==
X-Google-Smtp-Source: ABdhPJyC+kWEgWTsS+Zu19CFjZDt2M04m65CPhrOVyaVj/1hobuzhjr5+UqkRSy7BivHFLxtyRH5zw==
X-Received: by 2002:ac8:5791:0:b0:2f3:b5a7:9388 with SMTP id v17-20020ac85791000000b002f3b5a79388mr2413492qta.565.1651653891272;
        Wed, 04 May 2022 01:44:51 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id k13-20020a05620a138d00b0069fc13ce1dasm7175609qki.11.2022.05.04.01.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 01:44:51 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id w17so1218881ybh.9;
        Wed, 04 May 2022 01:44:50 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr17219842ybu.604.1651653890612; Wed, 04
 May 2022 01:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220503115557.53370-1-phil.edworthy@renesas.com> <20220503115557.53370-9-phil.edworthy@renesas.com>
In-Reply-To: <20220503115557.53370-9-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 May 2022 10:44:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqcPt0JKSqdqaLRApxOF5HCKsPN4gPxQm1xo2KmBoOiQ@mail.gmail.com>
Message-ID: <CAMuHMdVqcPt0JKSqdqaLRApxOF5HCKsPN4gPxQm1xo2KmBoOiQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] clk: renesas: rzg2l: Make use of CLK_MON
 registers optional
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 3, 2022 at 2:02 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The RZ/V2M SoC doesn't use CLK_MON registers, so make them optional.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  - Add has_clk_mon_regs to r9a07g043-cpg.c
>  - Improve commit msg.
>  - Return early if no clk mon regs to simply the code

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
