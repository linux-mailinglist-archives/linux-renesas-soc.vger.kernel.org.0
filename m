Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDB35101C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 17:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347868AbiDZPY3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 11:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352448AbiDZPYT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 11:24:19 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ECCCBB3;
        Tue, 26 Apr 2022 08:21:11 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id b189so13448439qkf.11;
        Tue, 26 Apr 2022 08:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cPGJBJ0AiPoZkNeSDq9yGoCEaxqw/S2DWD3bykpa3sc=;
        b=T6zGm+l2YLrAtLroMpXk9BFdrTFAdMyHz3HsomJmjSXs0H5EVXHjYxYZ7HdyQXCjFi
         YqGHVwzzdhDCVIg/EU/MlJdTVI46Ulf8CW8Umk6xdMv2iZ5MtFTY4VoIgn4PFM6AAUgC
         8MBAmnSgxG9p/5g+c0kmyDslZfsBbH+vWs40KpA6ye00ArHQhvyGdcLvSdrsKyYcgZho
         x/AIhBAhJmw15BitrOwaLrnLkIMQWabEMDT2k7cLuN+0TeGXMWaWz4NGO3EvjzT1kIda
         r2cIfPSa8qo0Ydf86S+6Q8twWM0GIXqKfYGftkrtKR/BulMZzRV1n9dvpN+p1Pkclp8z
         +BKw==
X-Gm-Message-State: AOAM532G/l5zWPoRpyZERnpaw1MTFRZyoU+bvcrXCBMpwcDi53sECAVN
        XjExEqu4dkNVAGXlw+e6jFybVJYckZL5KA==
X-Google-Smtp-Source: ABdhPJzuljJjlNYiFoFql1QJn+uYrUwWNs+dvA9H5rEZLdSqIrVThd1qpBImRgwpJT5Kr9PYUdzMiw==
X-Received: by 2002:a05:620a:4012:b0:69e:714f:e783 with SMTP id h18-20020a05620a401200b0069e714fe783mr13210609qko.275.1650986470456;
        Tue, 26 Apr 2022 08:21:10 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id j62-20020a378741000000b0069ebd098171sm6781340qkd.8.2022.04.26.08.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 08:21:10 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2f7d621d1caso74572347b3.11;
        Tue, 26 Apr 2022 08:21:09 -0700 (PDT)
X-Received: by 2002:a81:4782:0:b0:2eb:1cb1:5441 with SMTP id
 u124-20020a814782000000b002eb1cb15441mr21194596ywa.479.1650986469718; Tue, 26
 Apr 2022 08:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com> <20220330154024.112270-8-phil.edworthy@renesas.com>
In-Reply-To: <20220330154024.112270-8-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Apr 2022 17:20:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyv6LV0tbVmnkyyCVtjmgZuyQn94trO7KmPM-m3OEU0A@mail.gmail.com>
Message-ID: <CAMuHMdUyv6LV0tbVmnkyyCVtjmgZuyQn94trO7KmPM-m3OEU0A@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] clk: renesas: rzg2l: Set HIWORD mask for all mux
 and dividers
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
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

On Wed, Mar 30, 2022 at 5:42 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> All of the muxes and dividers that can be modified require the HIWORD
> flags, so make the macros set them. It won't affect read only muxes and
> dividers.
> This will make the clock tables a little easier to read, particularly for
> new SoCs coming.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> ---
>  drivers/clk/renesas/r9a07g044-cpg.c | 16 +++++++---------
>  drivers/clk/renesas/rzg2l-cpg.h     |  5 +++--
>  2 files changed, 10 insertions(+), 11 deletions(-)

This needs an update for the new drivers/clk/renesas/r9a07g043-cpg.c.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
