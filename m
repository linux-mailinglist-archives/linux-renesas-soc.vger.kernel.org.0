Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79ACB52EB58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 May 2022 13:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348883AbiETL6U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 May 2022 07:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348933AbiETL6J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 May 2022 07:58:09 -0400
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E8804B1EE;
        Fri, 20 May 2022 04:57:57 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id c9so5814580qvx.8;
        Fri, 20 May 2022 04:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2IAxyNFiX31GZAM0PzOF2DeAruq3MmtBLyN0dST9sLA=;
        b=v5SVO2w2/nI44PwnGncpBcsI8Qurg/oh3Afl2jT1t39Aol0qivXpQWZ+8hF9Ci0eK3
         s2ndRfxm4taiN2smaGfMGiwH+6+mkfHnkKvj95h1qWeRu68arYxQuV2hHHtu1zoZs9KA
         rfZtUoVWOJ6DSv+s49fXQdZa2Do81uEO3EVBSicW14YAf/x6KFlk1guxG6oFIJZEQtaD
         YHiSsX0xXGhySrhbp4rGup5099e+qSayl4jwDnAnKQ15M33SDTUQOIcOds7jxKDgyeqb
         fcKf+ouSUxZFkmEc6P+TmdydSW14jHtVXWelTadmKebTGzP8PpYZcl3e3yP+jJpeno6y
         F4fw==
X-Gm-Message-State: AOAM531NtLeFrGpA17BtTK3VRQb7/J6HOrOmcus4P15JCP6VDKE9VXj5
        djMcvcr2EidPOho4dPU00bySLVbLhGDFag==
X-Google-Smtp-Source: ABdhPJxNI6flLrfs/o+0ihyC9YZnomXAsxAxTTPT8vSb3WbA0GWUBE5oVkyzQGQnBBn/EY4AhuVSwQ==
X-Received: by 2002:a05:6214:1c43:b0:45b:b4:3e18 with SMTP id if3-20020a0562141c4300b0045b00b43e18mr7725390qvb.56.1653047875970;
        Fri, 20 May 2022 04:57:55 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id x26-20020ac84d5a000000b002f918680d80sm1761940qtv.78.2022.05.20.04.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 04:57:55 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id x2so13464642ybi.8;
        Fri, 20 May 2022 04:57:55 -0700 (PDT)
X-Received: by 2002:a25:e04d:0:b0:64d:6f23:b906 with SMTP id
 x74-20020a25e04d000000b0064d6f23b906mr9073964ybg.380.1653047875122; Fri, 20
 May 2022 04:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220520100736.15182-1-phil.edworthy@renesas.com>
In-Reply-To: <20220520100736.15182-1-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 May 2022 13:57:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNCHeYdJANh6LMMhRrjhsJCB0dvffjrgHYooHiCxXEZA@mail.gmail.com>
Message-ID: <CAMuHMdVNCHeYdJANh6LMMhRrjhsJCB0dvffjrgHYooHiCxXEZA@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: rzv2m evk: Enable ethernet
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
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

On Fri, May 20, 2022 at 12:07 PM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> Enable Ethernet interface on RZ/V2M EVK.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  - Fix PHY id

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
