Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 915D0797890
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Sep 2023 18:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243221AbjIGQtJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Sep 2023 12:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242173AbjIGQtI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Sep 2023 12:49:08 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FC619A8;
        Thu,  7 Sep 2023 09:48:45 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c337aeefbdso10701505ad.0;
        Thu, 07 Sep 2023 09:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694104967; x=1694709767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pf2oxSRPZhz/AZHjL9AC/jK960s0nroX7VUButcMjso=;
        b=HMGRXlvp6JyAFfoX6qIJgycKTl4Hr55O9/leRIvRIoqWFs7YZWEuoyZfoO6wd2lhhi
         BSCw1Q++e38s779Jm2gPYz/i4nwUySK18YL9rx5dxpCyx8NO3134g/M9JK7cKtmpsJUm
         ZCMrs1OdXrXqN1o4iSpWRKeHTi0pHfYrc+bsJKcY2nsMsfnk3Q4xqIqnazp4dxMjawEP
         yEUndCJ9EZjxkp4T3GUD7qaKYPhFjDPTpcQX9Sz34NPIVYxFzvMS49yQaU04Ub1rf/3v
         n+Av9j/zXFeIdqMq6MBWlDFCiDfHjkBcFYn/2dH473jvOz4/XiysdkrnB1s02sfL7Bj3
         7+/g==
X-Gm-Message-State: AOJu0YwwFWKZ+UtRMoCB5KRGRXH+h89eX7dfdD+QYL/HAwJjKg4Nfbb5
        wcu4b1MBBiJXHGb72yyTC2l054WBE6/AYg==
X-Google-Smtp-Source: AGHT+IGhSeJsKPmCZlwVxFlhK0h5wEsbolsd6opcGgFqLNycap9VT7o/clIDkV8xJd3gE5dRnlcQ2g==
X-Received: by 2002:a0d:d551:0:b0:589:e7c1:96f2 with SMTP id x78-20020a0dd551000000b00589e7c196f2mr19393104ywd.46.1694071235646;
        Thu, 07 Sep 2023 00:20:35 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id d193-20020a0ddbca000000b0058c8b1ddcc1sm4183249ywe.15.2023.09.07.00.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 00:20:34 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d7ecdb99b7aso598419276.3;
        Thu, 07 Sep 2023 00:20:34 -0700 (PDT)
X-Received: by 2002:a25:84d0:0:b0:d78:40da:3b25 with SMTP id
 x16-20020a2584d0000000b00d7840da3b25mr16747647ybm.47.1694071234530; Thu, 07
 Sep 2023 00:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230824104812.147775-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB59222FB9C553696FA8C2321086EFA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <991ce762a3a8fec7ecc832f95f023193.sboyd@kernel.org>
In-Reply-To: <991ce762a3a8fec7ecc832f95f023193.sboyd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Sep 2023 09:20:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfQRBqgHkhoh5nou=kBtocKNNNzDYZHTfG9cLXPD4T9A@mail.gmail.com>
Message-ID: <CAMuHMdUfQRBqgHkhoh5nou=kBtocKNNNzDYZHTfG9cLXPD4T9A@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] Fix Versa3 clock mapping
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen,

On Wed, Sep 6, 2023 at 11:09 PM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Biju Das (2023-09-06 03:05:18)
> > Gentle ping.
>
> I'm waiting for Geert to review. I think we need to merge this soon to
> fix problems introduced this merge window?

Sorry, I didn't know you were waiting on my reviews (FWIW, I'm not
the maintainer... Oh, scripts/get_maintainer.pl disagrees, due to
the overzealous "renesas," wildcard, now matching all non-SoC devices
produced by companies acquired by Renesas recently :-(

I did review "[PATCH v5 3/4] clk: vc3: Fix output clock mapping" before,
which is the one I care about the most, as it is a hard dependency for
DT changes to be queued...

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
