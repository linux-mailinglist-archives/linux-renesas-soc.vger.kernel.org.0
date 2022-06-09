Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C23A544C53
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 14:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343489AbiFIMmv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 08:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245758AbiFIMmu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 08:42:50 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D1A2F00F;
        Thu,  9 Jun 2022 05:42:48 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id d128so9745720qkg.8;
        Thu, 09 Jun 2022 05:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OwkCUGiaBE5pGkYM38twOtTXunQNzCIQYE/XvxVgKnc=;
        b=H67cvOqYdxWUFCcbqZa1WgSWVAEqlN0dwrrp8t0q8e4HeL1vDZ2lK51LM8qnlKFE/2
         9WTEy69bUYGevXnkGCULDwIhvKnlULQseg33FBjY2rWn2ZDYh30K41FT4/7iDhte5x5X
         lY4MO3IhlLFOheA/hbmsLvBsAsyItb5dL948MAHfqHk/ZEml9Y0EX8U8JS/wxnbCa+yW
         XfyPrmsGIxlqQetMVd7Im1i1zRlSh8FBVlpQs+M2hj6z4n44IHUXVrdx3KyCjdxYtN4z
         qtx2jfDdIpe4eco6CE/9HkrksVrMEvlqv8LJ1A7zEvTDEPYlsOz5c6xInqJ85h1ObrVm
         ni/A==
X-Gm-Message-State: AOAM532abzDYVIsr8YupmNQhCF0iQ2CkTbOgoAOLzNb58Z2rMLiD5BfF
        gD3ZUuDWr2fgmQDSwYGlPhdFJJpXIQ3zBg==
X-Google-Smtp-Source: ABdhPJzzJ+2LjYVp7HlI6FrSY4qO51kDcZvbRV70ivkBCnboGVmkx9hz9Bvdt3ih4OfhMYhmXSnSnA==
X-Received: by 2002:a05:620a:370e:b0:6a7:2471:b3eb with SMTP id de14-20020a05620a370e00b006a72471b3ebmr2575170qkb.631.1654778567663;
        Thu, 09 Jun 2022 05:42:47 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id v7-20020ac873c7000000b002f93be3ccfdsm11822987qtp.18.2022.06.09.05.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 05:42:47 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-3137c877092so39539017b3.13;
        Thu, 09 Jun 2022 05:42:46 -0700 (PDT)
X-Received: by 2002:a0d:f801:0:b0:30f:f716:2950 with SMTP id
 i1-20020a0df801000000b0030ff7162950mr38956789ywf.358.1654778566374; Thu, 09
 Jun 2022 05:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220608173025.22792-1-biju.das.jz@bp.renesas.com> <20220608173025.22792-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220608173025.22792-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Jun 2022 14:42:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSQ_y2XQSM3RU4xUUn5H5q83DrWUc+gTqgN8kNxPc2UQ@mail.gmail.com>
Message-ID: <CAMuHMdXSQ_y2XQSM3RU4xUUn5H5q83DrWUc+gTqgN8kNxPc2UQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: rzg2ul-smarc: Enable RSPI1 on
 carrier board
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 8, 2022 at 7:31 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RSPI1 (SPI1) interface is available on PMOD0 connector (J1) on the
> carrier board.  This patch adds pinmux and spi1 nodes to the carrier
> board dtsi file and drops deleting pinctl* properties from board
> DTS file.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
