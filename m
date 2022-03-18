Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF83D4DDA45
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 14:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236570AbiCRNPg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 09:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236576AbiCRNPf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 09:15:35 -0400
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C822C204ABC;
        Fri, 18 Mar 2022 06:14:14 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id v15so6680828qkg.8;
        Fri, 18 Mar 2022 06:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eu4PPeVrj7ip1pAYS174BYH69LkOPbKrT06DG/rxONU=;
        b=jeuB2Blrh04cN5Vko/MaREsGY/7kStwhqDcU97H5BZlvMNi6cWBnB6F6rMKZ6Pk9bE
         YwmDts04XWWPJWK8iOmAgq8eLwaTuCQgfzaDQYIHjiausMR76uV/hZwIxo8sTBiW1KsD
         NZ949/E/IS1E0HOBgh0u28D3cye7I5CNMbx/V19OVz/VtZofdKUVht5FRUXCNgl1UeZ2
         1813efBOia7IR9BHpQm6dgOEleWFWNQM9VfRaNRAr8gdy1nxj+OpNGmmZo2SO+N6tqi/
         9B6SYlfE1Vv9g34f1GSD9TGrRqyp8xWc5bePmyW0QYPlkx/fV6vT/lLlPQKFnHIGlYN+
         bqOA==
X-Gm-Message-State: AOAM530B9eAzvRVCKdP9HzF3yc+yfEkkiYHjfV1AA7B7ZO3ATJI2oxFl
        jB1kfkC/hhJ8RNRIM1ggIxEd/wgE3KlGLzcV
X-Google-Smtp-Source: ABdhPJzYi7EFY2Kl2S0x6w2Sd2nlwGPTOhX9+hHdCY6a0PvmAasaXwVPg9dfRYbTKfB1erfOlniJtw==
X-Received: by 2002:a37:acb:0:b0:67b:15f9:55b8 with SMTP id 194-20020a370acb000000b0067b15f955b8mr5673518qkk.694.1647609253047;
        Fri, 18 Mar 2022 06:14:13 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id d6-20020ac85d86000000b002e1e20444b6sm5671008qtx.57.2022.03.18.06.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 06:14:12 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2e592e700acso90529127b3.5;
        Fri, 18 Mar 2022 06:14:11 -0700 (PDT)
X-Received: by 2002:a81:24d6:0:b0:2e5:b253:f9fc with SMTP id
 k205-20020a8124d6000000b002e5b253f9fcmr11244696ywk.438.1647609251646; Fri, 18
 Mar 2022 06:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220307192436.13237-1-biju.das.jz@bp.renesas.com> <20220307192436.13237-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220307192436.13237-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Mar 2022 14:13:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXFyaefXmgsQpbQtXjr4X8NRvzik_5FwHN9goGJ-81ssg@mail.gmail.com>
Message-ID: <CAMuHMdXFyaefXmgsQpbQtXjr4X8NRvzik_5FwHN9goGJ-81ssg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: rzg2lc-smarc-som: Enable serial
 NOR flash
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 7, 2022 at 8:24 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable mt25qu512a flash connected to QSPI0.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
