Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA135797710
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Sep 2023 18:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbjIGQVC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Sep 2023 12:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239343AbjIGQUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Sep 2023 12:20:40 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1203B4ED2;
        Thu,  7 Sep 2023 09:16:56 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-68a3e943762so1050759b3a.1;
        Thu, 07 Sep 2023 09:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103303; x=1694708103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bm3Pmr9P0h91Fq080SIB3HpfHrouG3fGksLn8OJ16Uw=;
        b=UpbkQVJ4A9arFNmMrdDwFXouwdicz9sP58cUtb2ZbiBl1QdngJUkoh3BIOkPwsnzcM
         sIcMlSqxKVWjGKVarqSpIVZM8kNu6up7ABEcEMevWziQYDpyKQ/qFseVpl0eKBBcsoPZ
         8hI0MCvwsUbU1cZK9IsqL2eNYyHnxTb891/Ux3VF2LMb3C9woSDskfKQ/s0p+qcYF3DW
         zTgXo2rB1i6Etzmcowas90+WgBgW0bFLFT1bUeOQMzXMrwVMTlxFyxr2v9zSDosA1pS7
         me5Cd3Q+2j/e93suKtnTcQFYNYtQjbNSTltkI8jmld4V2c6GF5qWNwJY3X9Iy9TLS+qd
         ThAw==
X-Gm-Message-State: AOJu0Yyaf0DdzdkpgwdWQgA6BJsHDdogdOQcX+/666paBpDrBvmJ6tmr
        tGIx9KosJuU/xSlxQPNG6z58OzUn/AaCxg==
X-Google-Smtp-Source: AGHT+IFqYZGX4bKZMxlmtbfnIbHqnTv5PBpeh/lnaBf/E7f8W9zM59Ayn2GUvxGdGpBqEIWeX5m1Zg==
X-Received: by 2002:a05:6358:2822:b0:133:ac7:c84b with SMTP id k34-20020a056358282200b001330ac7c84bmr4901523rwb.12.1694070944428;
        Thu, 07 Sep 2023 00:15:44 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id o140-20020a0dcc92000000b0058390181d16sm4221929ywd.30.2023.09.07.00.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 00:15:43 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d7225259f52so616567276.0;
        Thu, 07 Sep 2023 00:15:43 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:d78:134:9477 with SMTP id
 s14-20020a056902120e00b00d7801349477mr21940790ybu.58.1694070943694; Thu, 07
 Sep 2023 00:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230824104812.147775-1-biju.das.jz@bp.renesas.com> <20230824104812.147775-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230824104812.147775-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Sep 2023 09:15:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVs0oUv4mL34P_i18jtzUPHrj_7+mc58=rOYTX2xBEeMw@mail.gmail.com>
Message-ID: <CAMuHMdVs0oUv4mL34P_i18jtzUPHrj_7+mc58=rOYTX2xBEeMw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] clk: vc3: Make vc3_clk_mux enum values based on
 vc3_clk enum values
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
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 24, 2023 at 12:48 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Make vc3_clk_mux enum values depend upon vc3_clk enum valuesÂ to avoid
> any accidental breakage in the future.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
