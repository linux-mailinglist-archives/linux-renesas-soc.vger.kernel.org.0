Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECF954DDA37
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 14:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236373AbiCRNPE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 09:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233947AbiCRNPD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 09:15:03 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B969199E3D;
        Fri, 18 Mar 2022 06:13:41 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id q194so6683880qke.5;
        Fri, 18 Mar 2022 06:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v8RRMSIMCB7ACnceCKW+fSZ41KmpTaVDwyYFyj9lTe0=;
        b=JGa62uzVIWv203qqu4kkMImdNpH+z1+EazVpXK1AkIWRabBG4QxeL7gcZmmfHgJBPy
         hWnpPCjhu1WHom73zwSSYkxz8LyatUHPlACDuxpqLwpVA7aWdW2twcrc6RZ7PUqD3l+w
         RBMveOAWx1kW2IKSlE1QXjbNRTWVwEaQl1IiB6SAHYI1+g/l1FqgLZ3SnTyvVc4YQ3XN
         +6fp/TAyNf4YaEv9zd3MgC7jHBe/vgi0WxNgQjr2ydp2otNkW/SDQAj2gp1jZIeAS+xS
         c2IbZTPD1Lu7xuWTi/sCVV5fENP7p5H59X7P1rOYagBgohTazTUj36ZzXDGYPqTtWMvl
         RMcw==
X-Gm-Message-State: AOAM5314Pj3NQXdktmvPe8mUsrqm3wKTSp2bnP5G8lOVCx9Nq8ZIcgU+
        yJmggKU38ADpmKLKtiDX9NUN06h0+TGCdEWu
X-Google-Smtp-Source: ABdhPJx+p19uRRcIJMuYwBKh2MPxx7pGFP6RtJIPYD19w8GVQaJlKetcno/v6JEeqvK9/qCaJHZhdw==
X-Received: by 2002:a05:620a:29c3:b0:67b:315b:d94 with SMTP id s3-20020a05620a29c300b0067b315b0d94mr5801101qkp.252.1647609219486;
        Fri, 18 Mar 2022 06:13:39 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id c20-20020a05622a059400b002e1d59e68f3sm5778207qtb.48.2022.03.18.06.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 06:13:38 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id h126so15808965ybc.1;
        Fri, 18 Mar 2022 06:13:38 -0700 (PDT)
X-Received: by 2002:a25:8111:0:b0:633:4716:ccac with SMTP id
 o17-20020a258111000000b006334716ccacmr9973756ybk.342.1647609218184; Fri, 18
 Mar 2022 06:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220302074043.21525-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220302074043.21525-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Mar 2022 14:13:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXvRcPO4gqJBUNTL-uNNu8+ktd5b+GVrC+NjbZKsUyqig@mail.gmail.com>
Message-ID: <CAMuHMdXvRcPO4gqJBUNTL-uNNu8+ktd5b+GVrC+NjbZKsUyqig@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g044c2-smarc: Enable usb2.0
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

On Wed, Mar 2, 2022 at 8:40 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable usb2.0 host/device functionality on RZ/G2LC SMARC EVK
> by deleting phyrst, usb2_phy{0,1}, ehci/ohci{0,1} and hsusb
> entries from board DT, so that entries from common dtsi kick
> in and make USB2.0 functionality operational.
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
