Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E69EF598267
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Aug 2022 13:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244417AbiHRLmM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Aug 2022 07:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233816AbiHRLmL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2022 07:42:11 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022F77C748;
        Thu, 18 Aug 2022 04:42:11 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id y18so869022qtv.5;
        Thu, 18 Aug 2022 04:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=wYelvxNaUscVzn7LLGvMldYwEni7W52QM/kA6KUN1hE=;
        b=Pj91e/ictcz4DUfUSauByARbv6OmBlM5YwhGa8Evub5GYEF4AaJd6AxrXUEaEbKxs8
         Vnu28P+sNIDwrt7s9Jxy9a4XOSQD2cikwhlzJ51FmudoP5MkX7N/cmbYkci75vMaTq0V
         BwaXyQkeX+H6t3TfUP+wQqF84T1gYRbgY08M3dbb+06SkRiaDLHl+1bJJb/em3HS8Rhh
         SkzNIWuRNQGm5sxg5BHiK9yUYP5SBMV5an4rXc+SUk0pU1f5mxexGgtXfBFBoG3RkGxj
         gxJcA0jdWjVwR2lcdh24DddIzn6SVEI8q0wYnNVQ7k264xMRh9ii4LmfPzvTsc+hUtvO
         HEVQ==
X-Gm-Message-State: ACgBeo1LNh5ehb9lXbJSPzYayMR2+ZV7RBp/U3h0PrB35b1slra3DSCd
        yhvGf2SCKE84uUQG2KPbevP0P/dcFFurmA==
X-Google-Smtp-Source: AA6agR6rCDl8+dMhzjnWHH9yYgnptpmCMfbe+Y8p9An+L2SgG0vET5hPOAiO4P+fQEcFJzBBT7guuw==
X-Received: by 2002:a05:622a:205:b0:343:282:3d0e with SMTP id b5-20020a05622a020500b0034302823d0emr2140711qtx.436.1660822930033;
        Thu, 18 Aug 2022 04:42:10 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id f9-20020a05620a280900b006b5fc79427fsm1291280qkp.77.2022.08.18.04.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 04:42:09 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-33365a01f29so33707677b3.2;
        Thu, 18 Aug 2022 04:42:09 -0700 (PDT)
X-Received: by 2002:a81:f47:0:b0:31f:434b:5ee with SMTP id 68-20020a810f47000000b0031f434b05eemr2404344ywp.383.1660822929393;
 Thu, 18 Aug 2022 04:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220802101534.1401342-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220802101534.1401342-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Aug 2022 13:41:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3_7b_3P1b9EX16Mawf80J7J4KhtW3SYURmj+Ur52xBg@mail.gmail.com>
Message-ID: <CAMuHMdX3_7b_3P1b9EX16Mawf80J7J4KhtW3SYURmj+Ur52xBg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a07g044: Fix SCI{Rx,Tx}
 interrupt type
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

On Tue, Aug 2, 2022 at 12:15 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per the latest RZ/G2L Hardware User's Manual (Rev.1.10 Apr, 2022),
> the interrupt type of SCI{Rx,TX} is edge triggered.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Fixes: f9a2adcc9e908907 ("arm64: dts: renesas: r9a07g044: Add SCI[0-1] nodes")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
