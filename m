Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1CA78F1F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 19:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242378AbjHaRcL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 13:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjHaRcK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 13:32:10 -0400
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DC6E5F;
        Thu, 31 Aug 2023 10:32:08 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-58fc4d319d2so12866277b3.1;
        Thu, 31 Aug 2023 10:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693503127; x=1694107927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOKwlYH7i1heNTXclgxSw4cfzqUBiYhvQ+nxifYOcyg=;
        b=hAvqpvG45pm8Tet5NdEJBUld0jd92v3KviS5I1H1H7tdimP86umjhQ+5oILFIazHhV
         IKUlKAkHObHzyUgN8kBaLUOcqZLFm8ymqRGSTqkvzgnvyQ+ik1QIkDZ+sQl/1uSrX+Ob
         iN50LY8AQ1BTbHo4Mwg7OxfbssQv3gFrGVp4nneYAcmzfD2sRJug59h900MyHx+SayR+
         SCdbT3wB+TKsC3xdI/4A4vEg+2puG/OYOVMN5Mz+zt/PFMFBNuqq5ZprfungsgCLxtiF
         J94e0uNC7uIEX82VgvfM8sCeYX2BSJZHyHZxUa7NPi4NklVSMtjtf8oEKWB+9on2hKfL
         UkZQ==
X-Gm-Message-State: AOJu0YzbqoTJ3k3APKR0ePRpGQSdLMO69KOR4us6Q2l8WOQ+vM+ZvHWF
        rfBZWp7a0HKgWOabeOhwqLN+A50oX+ctCA==
X-Google-Smtp-Source: AGHT+IGao9JxKyvpzuSgT9R115Sk7mt8fCJgxJ6+pgnpbA9R5/kgcuWInkbqRs6GT9VV0MlvyoifmA==
X-Received: by 2002:a25:3621:0:b0:d7a:d018:5a37 with SMTP id d33-20020a253621000000b00d7ad0185a37mr365822yba.39.1693503125741;
        Thu, 31 Aug 2023 10:32:05 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id j143-20020a252395000000b00d7badcab84esm438447ybj.9.2023.08.31.10.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 10:32:05 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d7b79a4899bso791714276.2;
        Thu, 31 Aug 2023 10:32:05 -0700 (PDT)
X-Received: by 2002:a25:cc01:0:b0:d7b:8d0c:43ef with SMTP id
 l1-20020a25cc01000000b00d7b8d0c43efmr380934ybf.37.1693503125177; Thu, 31 Aug
 2023 10:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230831063635.2816-1-biju.das.jz@bp.renesas.com> <20230831063635.2816-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230831063635.2816-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Aug 2023 19:31:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXS6o5n9vg7ctd-69X2B5ZuKqcT1t3b1gUbEk2UuT0Ug@mail.gmail.com>
Message-ID: <CAMuHMdUXS6o5n9vg7ctd-69X2B5ZuKqcT1t3b1gUbEk2UuT0Ug@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: renesas: rzg2ul-smarc-som: Enable
 serial NOR flash
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Thu, Aug 31, 2023 at 8:36 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable Renesas at25ql128a flash connected to QSPI0. Also disable
> the node from rzfive-smarc-som as it is untested.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Enabled 4-bit tx support

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> @@ -179,6 +179,18 @@ eth1_pins: eth1 {
>                          <RZG2L_PORT_PINMUX(18, 5, 1)>; /* IRQ7 */
>         };
>
> +       qspi0_pins: qspi0 {
> +               qspi0-data {
> +                       pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3";
> +                       power-source = <1800>;
> +               };
> +
> +               qspi0-ctrl {
> +                       pins = "QSPI0_SPCLK", "QSPI0_SSL";
> +                       power-source = <1800>;
> +               };
> +       };

From the v1 review comments:

> > I guess there is no need for the subnodes, as all pins use the same power-
> > source value?
>
> OK, will remove subnode.

Oops...

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
