Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5425951719C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 16:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238542AbiEBOgD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 10:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236543AbiEBOgB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 10:36:01 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E8CFE7;
        Mon,  2 May 2022 07:32:32 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id t11so11168139qto.11;
        Mon, 02 May 2022 07:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EE2i233vdQfSqBDZ5PxwBzq/5+fsfGTCjKO+MqVEgAU=;
        b=RR2PpS4RdLwKwXIbIrfOHp8BZN7Wcb05gHtzUcVEWSKJ1keJ4a5q8dd9WtfirsaYfu
         pG0+8HnFp54tOUNkbf9Gp3Z06nwJ+uMrtfsdpr+wXiX6m4qM7oAI2lz1er8mSqT8i43s
         oxviKM4V3ljtOism6YoRozmSkrkAVUBjJw0TYI4ibYbq0gzOnLM28FymCKrCdvoP2Agi
         IMWBjOLy6s3W2om2CXrHd1Opijg3jcw1br/4GuAR216NpxE6tjQJc5Maw5GFAPFJ9s8A
         SOHWL9LwnLsUJ8Ozje17l239aLfKYO48RkZRdEuJfDYpNNSoy/0WOphk7m+jg4DZ9K2U
         UaHg==
X-Gm-Message-State: AOAM530fhYFLqxBQjvwRjsCcAD5uoLPJUsqQhD0QbVoEXNNAiqAu6p4d
        T4GtSjEsCA24n9jDyi4gzkZXzFAnrYeCfg==
X-Google-Smtp-Source: ABdhPJyt3z7Fc7r3HemDEAqS4SNGhdx3IZOg/KDzC5WsPlNBAtdP+K/GUlDhaaXtAHSLiyYK0J91Pg==
X-Received: by 2002:ac8:5ac8:0:b0:2f3:ac86:f275 with SMTP id d8-20020ac85ac8000000b002f3ac86f275mr858565qtd.234.1651501934330;
        Mon, 02 May 2022 07:32:14 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id u16-20020ac87510000000b002f39b99f689sm4220540qtq.35.2022.05.02.07.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 07:32:14 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id s30so26337204ybi.8;
        Mon, 02 May 2022 07:32:13 -0700 (PDT)
X-Received: by 2002:a05:6902:352:b0:63e:94c:883c with SMTP id
 e18-20020a056902035200b0063e094c883cmr9973171ybs.365.1651501933763; Mon, 02
 May 2022 07:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220428133156.18080-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220428133156.18080-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 16:32:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUeD1KpkFs1CkQjTyNVjLJ1FjKZW_93_R5N-fBqbrOw5A@mail.gmail.com>
Message-ID: <CAMuHMdUeD1KpkFs1CkQjTyNVjLJ1FjKZW_93_R5N-fBqbrOw5A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: renesas: r9a07g044: Fix external clk
 node names
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 28, 2022 at 3:32 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add suffix '-clk' for can and extal clk node names and replace the
> clk node names audio_clk{1,2} with audio{1,2}-clk as per the device
> tree specification.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Replaced clk node names audio_clk{1,2} with audio{1,2}-clk.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
