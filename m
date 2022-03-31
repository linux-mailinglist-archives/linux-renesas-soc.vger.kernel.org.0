Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBD704ED790
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 12:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234501AbiCaKKK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 06:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233909AbiCaKKK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 06:10:10 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A029202172;
        Thu, 31 Mar 2022 03:08:23 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id j21so20987399qta.0;
        Thu, 31 Mar 2022 03:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qReDg0txsD6WldX0J6Ylu+w+ahL52yVCKgJRzjDfjl0=;
        b=ykA40e4AkULLOtMJsDACfiGhIGjNODjA8VBfytPKBhE18sIxYOJmBCdFbBG67csmHD
         9s46iq/7Nil0DNeWh3BGgiEoQFpRNHqcSTFpQVZoeAfKYjRkVqbhN9h832p8CWuB8BI2
         1wNsqxpnpFrVoKWbOn/5et9S/K5sIsPZALGfK3WtrzDrPaqjksy2N+Fu4hc9p2Yy88nF
         SBLx67dasHLqsV4SqxFsDSn7757Zb+PZepBB8lzo+8IT3/vYswnykhAhb57MiWPDCN66
         bllbo3obvOOZ6VE5MmbcVe+WUlx3U4JbMeBQSQ7ymnobTQsqecEhYxi4PAk+Fl9sb/vZ
         Q/3Q==
X-Gm-Message-State: AOAM5332igp4CsqzADuW8W2Dm5MsrtbDBJQj8ex3k23JKNDxT2hdED4N
        u8gbPucJ51j4ND5vnk2+uIFQUNYIBrqQuw==
X-Google-Smtp-Source: ABdhPJxTlNHACSApXZ3kbPz7kG2OU2zuU9IxQl9XAppmmhUXyC79+RUiqrD4/STXtCbxMIbFoooMyA==
X-Received: by 2002:a05:622a:15c7:b0:2eb:9af4:cdf4 with SMTP id d7-20020a05622a15c700b002eb9af4cdf4mr4574qty.241.1648721301876;
        Thu, 31 Mar 2022 03:08:21 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id w17-20020ac857d1000000b002e19feda592sm19244877qta.85.2022.03.31.03.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 03:08:21 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-2e68c95e0f9so249000147b3.0;
        Thu, 31 Mar 2022 03:08:21 -0700 (PDT)
X-Received: by 2002:a81:b663:0:b0:2ea:da8c:d133 with SMTP id
 h35-20020a81b663000000b002eada8cd133mr4174370ywk.256.1648721300870; Thu, 31
 Mar 2022 03:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com> <20220315142644.17660-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315142644.17660-8-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 12:08:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+dKrkOUPuemOx5yG=V_g0oqnoNHg7cdAMOcCu6C1CuQ@mail.gmail.com>
Message-ID: <CAMuHMdU+dKrkOUPuemOx5yG=V_g0oqnoNHg7cdAMOcCu6C1CuQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] arm64: dts: renesas: Add initial device tree for
 RZ/G2UL Type-1 SMARC EVK
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Tue, Mar 15, 2022 at 3:27 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add basic support for RZ/G2UL SMARC EVK (based on R9A07G043U11):
> - memory
> - External input clock
> - CPG
> - DMA
> - SCIF
>
> It shares the same carrier board with RZ/G2L, but the pin mapping is
> different. Disable the device nodes which are not tested and delete the
> corresponding pinctrl definitions.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Replaced CONFIG_ARCH_R9A07G043U->CONFIG_ARCH_R9A07G043
>  * Renamed SoC file r9a07g043u.dtsi->r9a07g043.dtsi

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
