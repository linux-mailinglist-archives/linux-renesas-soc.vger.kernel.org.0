Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F032751A1B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jul 2023 09:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbjGMHme convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jul 2023 03:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbjGMHmd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2023 03:42:33 -0400
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7E6210B;
        Thu, 13 Jul 2023 00:42:32 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-cada5e4e3f6so350328276.3;
        Thu, 13 Jul 2023 00:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689234151; x=1691826151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8krer+8j95T/aDRBj7B54mUFVi5tYtXPjB0AgqOLDoA=;
        b=BHkpxyXbpBnfSEO0dPSdjorGO/UBxOhyXeW8+UCguWlPvUeq9XhqgnNGmYKkzpMX15
         vwVGaIr4AxCDa/K7v/o996JfnEnkk2HyRxpkVOBpfgW6IMc8LbjkaUPqAlmLxuEIV898
         NQxBBsb7oWoaGaDoBgxRrUsXgD7BOTKGWT8f7KD32dHTLvYzNDvubJg//DQra3jFVqFP
         2uRLMnvCZRA6oRrFjDoFTd4zPHLaN+TNbbhoLrB0RVtRnLszYPk4nLVlsbSaXgEEbInD
         9JVQ0CTgZ66BbNpRYqLHO0t02uJwpWxhqj3wGS6eVSArvey0xYKexssTCWCGy0GCXwEH
         XKOg==
X-Gm-Message-State: ABy/qLYiABgRELMUAoTy4Fb5LBcZX9uOyr3Sr/zp9hinDh9A7fdky6/i
        bXq4navuCU/wmC2elGWg/6L7Yr9GDQnCMN1D
X-Google-Smtp-Source: APBJJlEzROJ6a3dqpypYWUpA72pdAG7euvIAe/0SCN4XYpVpqEP+ilSmoQmUPi41+gL8JMLxRTPIkQ==
X-Received: by 2002:a25:4e88:0:b0:cad:8d36:2a34 with SMTP id c130-20020a254e88000000b00cad8d362a34mr614372ybb.49.1689234151347;
        Thu, 13 Jul 2023 00:42:31 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id b8-20020a252e48000000b00c61af359b15sm1260798ybn.43.2023.07.13.00.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 00:42:31 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-cada5e4e3f6so350314276.3;
        Thu, 13 Jul 2023 00:42:31 -0700 (PDT)
X-Received: by 2002:a25:ad91:0:b0:c75:fcf8:7a22 with SMTP id
 z17-20020a25ad91000000b00c75fcf87a22mr693581ybi.25.1689234150976; Thu, 13 Jul
 2023 00:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230712151153.81965-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230712151153.81965-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Jul 2023 09:42:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJP0hjiPwuo=7v6jO38Vv0BgmdScyHRCkmGga38O2o=w@mail.gmail.com>
Message-ID: <CAMuHMdXJP0hjiPwuo=7v6jO38Vv0BgmdScyHRCkmGga38O2o=w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2lc-smarc-som: Add PHY interrupt
 support for ETH0
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 12, 2023 at 5:12 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The PHY interrupt (INT_N) pin is connected to IRQ0 for ETH0.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
