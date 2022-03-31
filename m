Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BAC74ED8A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 13:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233505AbiCaLoH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 07:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232698AbiCaLoH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 07:44:07 -0400
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA49176D16;
        Thu, 31 Mar 2022 04:42:20 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id hu11so19487205qvb.7;
        Thu, 31 Mar 2022 04:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c3n61HQ+xEte81CP3nGsl1CXpodpRC/g/hQPsb3UTkU=;
        b=eO3epNCaCHqnhesaEp6NUwFa/RZCHuLQnXB/kRJf1/XeXCXgkf8+8QlipXV6kiUiw1
         9YdCcwAW9imZ6yOdkgNiBgRTY21wP3rfGsoWA7vUBBoBCkG51ivFPtIiD74s8mFS0L/V
         ZIAlVEvV1FhxV7xcX/qxI73a+wgC3BMaqjHbS6lG6vQbSSkv3DFfUQyec1GnJuuvHpFD
         uuMTv+XS6H1GVpLBHN8Ib1JAK+GJzp269rSW6DMT5ybzYzuNwARGom5nCpJEeXPV3h9v
         +Y5KNNPDepkI7P8D4NvWjPiptI2DB+uYVflViXD8sXi3Damy2cbRric7tjFT4N/4ScDe
         0EYg==
X-Gm-Message-State: AOAM533azGSX7DPSQ9lZqWXxWsQ8eOogFbJBBk76KWFR/qgas8dWax0g
        QlzObdmhrdDfynus08xT8bEQwWgBMpPtqg==
X-Google-Smtp-Source: ABdhPJzwBhZr7YayLPwH2qzBOtLqO6wDs8uxAqOGQxTKn8wb3Y77EEugRnCoRkIZQmaHm4ZpxSzv9A==
X-Received: by 2002:a0c:d7cd:0:b0:432:8df8:94e2 with SMTP id g13-20020a0cd7cd000000b004328df894e2mr3612978qvj.90.1648726938882;
        Thu, 31 Mar 2022 04:42:18 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id t13-20020a05622a148d00b002e22f105099sm20295228qtx.21.2022.03.31.04.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 04:42:18 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id u103so41788131ybi.9;
        Thu, 31 Mar 2022 04:42:18 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id 66-20020a250045000000b0063396e22179mr3815484yba.393.1648726937922;
 Thu, 31 Mar 2022 04:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220315154649.22343-1-biju.das.jz@bp.renesas.com> <20220315154649.22343-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315154649.22343-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 13:42:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtZ3EiJ-9ZSxe8aeTv22FpOM4RDrPmvLHWWBJv1D9NMw@mail.gmail.com>
Message-ID: <CAMuHMdXtZ3EiJ-9ZSxe8aeTv22FpOM4RDrPmvLHWWBJv1D9NMw@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r9a07g043: Add SDHI clock and reset entries
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 15, 2022 at 4:47 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SDHI{0,1} mux, clock and reset entries to CPG driver
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
