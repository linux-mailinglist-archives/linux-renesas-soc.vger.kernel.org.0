Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF5E7514373
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 09:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349299AbiD2H5Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 03:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238543AbiD2H5P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 03:57:15 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F297D7B566;
        Fri, 29 Apr 2022 00:53:56 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id kc16so3941753qvb.7;
        Fri, 29 Apr 2022 00:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eS9SH4DaDaqKKlS4Xiocx67AnptXIrzXYYyPih/cyQs=;
        b=uMtZuT4fwkh7DCUm2tfsLA9rgcLYrwad6vErvqqRXgz8YikyrLKVGvbEF7RsJdCNuh
         VkSWbIKooRiU31jyiABUrQX1tuwMQfOssVTEDceHF/VwQsJaaZRNhgnVDogzghTeLBp4
         zpDS8uSAgeFUzCqf/jPTdSKBNF6l9+p5QbFpRuI8tpnQk0C5dLFWPosjLtFGmJAngz6i
         S0kxpDJJi5nQxFr5coE/7B0T2o4sNg0oNF96iBHpIrdcmMmRVKZIDulk3AstsUYXuhJC
         q0VJC/KpfcMrgfTCMr5LLOzrQ7Kt+80PqG/81tgr3DEKGUEq88yxTLy2eqtC8zaElppg
         YBIw==
X-Gm-Message-State: AOAM5329QnmgBcCa8w2ROFQ2IaUtY+Kx9ZPu5APPtiJmsJEarxigoogY
        PaSJ+MOF16v40kdcRAEcYxcmTU1luntjZhNG
X-Google-Smtp-Source: ABdhPJz8Ik6UwYxb5oRmDSj/WDY/MRJR32bYGC56WeefrLfHy3B/KC9ayHRMrXWJ83V1dN9POt6PnA==
X-Received: by 2002:a05:6214:528b:b0:456:46bc:7dd8 with SMTP id kj11-20020a056214528b00b0045646bc7dd8mr12177621qvb.44.1651218835851;
        Fri, 29 Apr 2022 00:53:55 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id f25-20020a05620a15b900b0069f78e60ee9sm1052576qkk.105.2022.04.29.00.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 00:53:55 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-2f16645872fso77125857b3.4;
        Fri, 29 Apr 2022 00:53:55 -0700 (PDT)
X-Received: by 2002:a81:8489:0:b0:2f7:edff:239f with SMTP id
 u131-20020a818489000000b002f7edff239fmr24436582ywf.256.1651218835165; Fri, 29
 Apr 2022 00:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220429072400.23729-1-biju.das.jz@bp.renesas.com> <20220429072400.23729-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220429072400.23729-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Apr 2022 09:53:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV83Dk_9DYRx5hOea6nKJceDnOa0s7sOcXjzat3e0BusQ@mail.gmail.com>
Message-ID: <CAMuHMdV83Dk_9DYRx5hOea6nKJceDnOa0s7sOcXjzat3e0BusQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: renesas: rzg2l-smarc: Move ssi0 and
 cpu sound_dai nodes from common dtsi
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 29, 2022 at 9:24 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> On RZ/G2{L,LC} SoM module, the wm8978 audio codec is connected to ssi0,
> whereas on RZ/G2UL it is connected to ssi1. So move ssi0 and cpu
> sound_dai nodes from common dtsi to board specific dtsi.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change.
> v1->v2:
>  * Fixed commit description
>  * started using cpu_dai node instead of snd_rzg2l in board dtsi.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
