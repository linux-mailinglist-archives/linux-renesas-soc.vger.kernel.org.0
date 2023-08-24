Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81076786A36
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 10:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233708AbjHXIf3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 04:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238923AbjHXIfZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 04:35:25 -0400
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A1B172D;
        Thu, 24 Aug 2023 01:35:19 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-791b8525b59so2340109241.1;
        Thu, 24 Aug 2023 01:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692866118; x=1693470918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jb8LjDvi/Qcm3z/5AbNAH4IZg3NTpZQTsjcctPQlWe8=;
        b=MYOShBStja40rp+1jfICTcReUseRl1S1Yf4zLix8qJqRHKw4VBhGDiFEnnt52jnIWB
         SoOsHpBTdPj2YZ2bigzcUsMY0qsnvZunuM8ewBXROWqG6nfFO1GvibNcgSgVK45HozuC
         EpgI8Q5X/NS66Br9qfuNPNZ0sAIDY56pOisNvEdSKNQiNq8APQpDXMGnFBYpTtBJPIEQ
         7/jrRDWMYOAM91uP9rb2PQil4sc+2bryBawZUzjpQNQ8fgGQOIlPadyBchc8Ec4PrgBY
         9RAhMK3HYcaAfWRfSxaM079iLI72FPyfYMZ++fptRaBnT88jGySyPgmDoDr8fj9H64wA
         MSaA==
X-Gm-Message-State: AOJu0YxHGHTuhPGKSeobcubXiKj92MAXRGWnnMMJ8L9R5YAN09xo6g+n
        1rK35/5GeNSERImlhljp40f29OROmpYO5Q==
X-Google-Smtp-Source: AGHT+IF+Vu+SGaAvSAkGZ6gjgaZUdFLK5KKhh1Yno8ikRhXwLwjACz/BySX/WQk1RD3lR/EjQwU5aA==
X-Received: by 2002:a1f:49c2:0:b0:48d:f41:ef7f with SMTP id w185-20020a1f49c2000000b0048d0f41ef7fmr11016781vka.6.1692866118281;
        Thu, 24 Aug 2023 01:35:18 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id t69-20020a25aacb000000b00d43697c429esm102139ybi.50.2023.08.24.01.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:35:17 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-58de42f9f05so66520837b3.2;
        Thu, 24 Aug 2023 01:35:17 -0700 (PDT)
X-Received: by 2002:a81:6055:0:b0:586:a216:a348 with SMTP id
 u82-20020a816055000000b00586a216a348mr15203492ywb.18.1692866117513; Thu, 24
 Aug 2023 01:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230824082501.87429-1-biju.das.jz@bp.renesas.com> <20230824082501.87429-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230824082501.87429-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Aug 2023 10:35:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyb0rt7T82h_wS1jCt=U-1o6tS+B0AgMTHgyBbkEi5eQ@mail.gmail.com>
Message-ID: <CAMuHMdUyb0rt7T82h_wS1jCt=U-1o6tS+B0AgMTHgyBbkEi5eQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] clk: vc3: Fix output clock mapping
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Aug 24, 2023 at 10:25 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> According to Table 3. ("Output Source") in the 5P35023 datasheet,
> the output clock mapping should be 0=REF, 1=SE1, 2=SE2, 3=SE3,
> 4=DIFF1, 5=DIFF2. But the code uses inverse. Fix this mapping issue.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/all/CAMuHMdUHD+bEco=WYTYWsTAyRt3dTQQt4Xpaejss0Y2ZpLCMNg@mail.gmail.com/
> Fixes: 6e9aff555db7 ("clk: Add support for versa3 clock driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

This order should be documented in the DT bindings, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
