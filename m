Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7B6519A41
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 10:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237088AbiEDIsQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 04:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346562AbiEDIsN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:48:13 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9289A24BD1;
        Wed,  4 May 2022 01:44:38 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id kd11so447981qvb.2;
        Wed, 04 May 2022 01:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JMiIrpEaYjavHYKSJXFZZpbprJQJN1+4jCvhEElvDJo=;
        b=5I3OjQSHS26aWvGEdmCV9LdAuGCqswLpj1aFbOYAph2JAYEmLddqeDNv0O+E8gKy45
         cSryZO6bvrSpGfcRhYekp7h8QKZYc7Xwztubum8icAuHlBE4JmFFpUEecykaA1ZEn3QP
         cyhBVpKLUudjoGCQczrTWKmF9Dxvdq52UAj1lnLCyP8KDVAUVYVdK3urdXL2SO6F6v9J
         he8w6JIRbRo3xXxfp8k4f6Zk4jmVydaQ0k3QGOH3R+Um+0iz40izZFt6pRae02cL1fwz
         DLQ6u1TQ3OgMTcORHdmk58nMXcXEmyiYM9+wy/5LKZeRG67QK+jDzg79E+3pyG9SlzQU
         o/kw==
X-Gm-Message-State: AOAM531kthYe/m93DGXI4qGGQJOVr4NoZsqOeff6gzvRBH0HfzR1wbe3
        c0PXrw2VnHUKPSH9pK3NDpclOyb1Jwiarg==
X-Google-Smtp-Source: ABdhPJyUjgJoFbg+/y/6H8hEjO/AABuNT9GKL3p06iXmn+s0m3wodpO9tPnZ76gete9WMDjllKFgog==
X-Received: by 2002:a05:6214:23c6:b0:433:8a2:c244 with SMTP id hr6-20020a05621423c600b0043308a2c244mr16935739qvb.88.1651653877659;
        Wed, 04 May 2022 01:44:37 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id x20-20020a376314000000b0069fc13ce226sm7502209qkb.87.2022.05.04.01.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 01:44:37 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id j2so1284448ybu.0;
        Wed, 04 May 2022 01:44:37 -0700 (PDT)
X-Received: by 2002:a5b:482:0:b0:646:b85:ad4a with SMTP id n2-20020a5b0482000000b006460b85ad4amr15769336ybp.89.1651653877065;
 Wed, 04 May 2022 01:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220503115557.53370-1-phil.edworthy@renesas.com> <20220503115557.53370-7-phil.edworthy@renesas.com>
In-Reply-To: <20220503115557.53370-7-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 May 2022 10:44:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXvf2PzgjnAvKX4S9E0VYA9spYJy46JC6Dgz12oc2Vt3A@mail.gmail.com>
Message-ID: <CAMuHMdXvf2PzgjnAvKX4S9E0VYA9spYJy46JC6Dgz12oc2Vt3A@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] clk: renesas: rzg2l: Add read only versions of
 the clk macros
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
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

On Tue, May 3, 2022 at 2:01 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> This just makes the clk tables easier to read.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
> v3:
>  - New patch inserted

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
