Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71CBF513380
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 14:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346139AbiD1MYH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 08:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346188AbiD1MYG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 08:24:06 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D75420F64;
        Thu, 28 Apr 2022 05:20:52 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id fu47so3259948qtb.5;
        Thu, 28 Apr 2022 05:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yTc43B27Ew/IElysoJfpi9vdoJeMZYp82YT1S5/ErAo=;
        b=ktSK9B+EGN5/K7lhFIXfOT6SqP00zExZ5gHb39PUy5gVD/Dx68dTfAn2GidOze7v/9
         09zQBwEO73IaFAO619V71U00wG+2xct/DYDKJab6MrU7kSJ4wgK5I7F14S5cPYrFvlHt
         SUrddRvcLGd0XoBIRQvNmer1Jxow2nQAxkRceN59s3v3LhQw18ELGsajPPhiOzzJBBhi
         MlhtdEL830vGxwmZwKdNXkaoU0LTc5l/eBaE5J/uazY/2Zv+Vnv/3KI7dJ0zJgecwOuW
         pWslANzyo8VNp4QSa0alRH97VJVZ5K++iJUwYFB2lafTSVnxTAys3vqSDibR2QGXB2gQ
         mLrw==
X-Gm-Message-State: AOAM533n6SZr0vSkIjHcDtIwv4vIQyg08tZVLdmlnJNnvfu0FNBwIeRh
        lWVYfb9Oh3EGsXBlyT8/NDwou8djo8WVpg==
X-Google-Smtp-Source: ABdhPJzXw6x7pzY2YmFKc/Joa0HqH82uGf4HL523FqaJNN1OMeyUAgOK+/amGJgfCVoGD0OARQhpDQ==
X-Received: by 2002:ac8:5794:0:b0:2f3:87cb:5267 with SMTP id v20-20020ac85794000000b002f387cb5267mr2967101qta.672.1651148451001;
        Thu, 28 Apr 2022 05:20:51 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id o134-20020a37a58c000000b0069f8e381167sm2126103qke.76.2022.04.28.05.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 05:20:50 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2f7d19cac0bso50532957b3.13;
        Thu, 28 Apr 2022 05:20:50 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr32261792ywb.132.1651148450039; Thu, 28
 Apr 2022 05:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220425095244.156720-1-biju.das.jz@bp.renesas.com> <20220425095244.156720-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425095244.156720-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 14:20:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZA4VV2gR27mpq7Hdiz20pGJGHRhd+WRUx2GaAOd6oZw@mail.gmail.com>
Message-ID: <CAMuHMdVZA4VV2gR27mpq7Hdiz20pGJGHRhd+WRUx2GaAOd6oZw@mail.gmail.com>
Subject: Re: [PATCH 4/6] clk: renesas: r9a07g043: Add clock and reset entries
 for CANFD
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Mon, Apr 25, 2022 at 11:53 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add clock and reset entries for CANFD in CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
