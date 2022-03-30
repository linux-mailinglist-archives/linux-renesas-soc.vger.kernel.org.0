Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A92444EC561
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 15:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245044AbiC3NTT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 09:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242605AbiC3NTT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 09:19:19 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740D42FFF8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Mar 2022 06:17:34 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id h196so16518856qke.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Mar 2022 06:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mx5AmwyP8ywr8XYDEm9sWZDnfe3WRcisbwPqfmSVpTs=;
        b=K0XGRvKCfSs5RRaNtRcMRXvka7zG73lPHBb4EPzoutl++c6jY1B6vFzogSBwCcBF1X
         12IBFHFs7FZUZ0o1+UWWwTetlbZUQ5CLoK/gu7gZCMullJ6dryJk1PZkDf66iozD58rM
         KoA3UOkvTfSLQVGoUrMCKkwlDHXD2aSx4wzHAcFV9o9rWlpYVg930ApNUW5jOs4Hu+cJ
         XqE2+gUTFdtqMAtHlBTw33oayvlU+HU5uNdG7p7Udcwq0x87NbNVQyeHhRfIyv6T226l
         Kdm/GYcpQyUqXhbjO0VNVyqA0MGEM89WM9G2YzlZq9clBL0evO1fFsGDxCMvoHQMPUm/
         Y1AA==
X-Gm-Message-State: AOAM533f8iy/YRB0WWbeb/4yNDIa3bpY76HePISp/JqG4+2zuTOHfiNa
        2tb7IRDORW+y272eSnFYRsDS+OncQOF/yA==
X-Google-Smtp-Source: ABdhPJwxT6xnEnQ67Ad+5mn9peyFnxe3Hc+GSyi8BgIvuYMRJibo67FwzLH2qHd4mTn7sFtXUklYpw==
X-Received: by 2002:a37:9ecb:0:b0:67b:73e7:2c05 with SMTP id h194-20020a379ecb000000b0067b73e72c05mr23595672qke.381.1648646253158;
        Wed, 30 Mar 2022 06:17:33 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id h6-20020a379e06000000b0067b30874b90sm10867137qke.41.2022.03.30.06.17.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 06:17:32 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2e5827a76f4so218842397b3.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Mar 2022 06:17:32 -0700 (PDT)
X-Received: by 2002:a81:59c4:0:b0:2e5:c7c3:5d29 with SMTP id
 n187-20020a8159c4000000b002e5c7c35d29mr36726841ywb.512.1648646252464; Wed, 30
 Mar 2022 06:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com> <20220315142644.17660-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315142644.17660-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 30 Mar 2022 15:17:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXh15Fy+xw6y=oYDf3JbB8ZsUymOLG1QbUhQ6H43hy7Ag@mail.gmail.com>
Message-ID: <CAMuHMdXh15Fy+xw6y=oYDf3JbB8ZsUymOLG1QbUhQ6H43hy7Ag@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] soc: renesas: Identify RZ/G2UL SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
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

On Tue, Mar 15, 2022 at 3:26 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for identifying the RZ/G2UL SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Changed compatible from r9a07g043u11->r9a07g043.
>  * Changed the config from ARCH_R9A07G043U->ARCH_R9A07G043
>  * Changed sysc compatible from r9a07g043u-sysc->r9a07g043-sysc

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
