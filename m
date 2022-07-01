Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00B745635F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jul 2022 16:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbiGAOk5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jul 2022 10:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbiGAOk2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jul 2022 10:40:28 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E265E3EA94
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Jul 2022 07:39:27 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id l14so540429qtx.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Jul 2022 07:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ha9TruPnu9VTp7W0YzPmLsMck+Pf++8Zr5o1inQ9OsY=;
        b=t85uwXz0TU5oFnCb2MAoi7sejwZqtvzh2coCGjEhLhN2C3nsSYTuxyvnAdj8JcAwBM
         1+Vf509yf+PzcwR/KfuQMTr2f9RwP32gF+madXZrzJVKmagu/7SpK2FJqNeOjhoXQ3cl
         6cxZjF5dBIwrbh/mDuknNmOvqBneJLHkzUETyGUVJaxy4wi3sK7G0fmI23Iyu5+peVvM
         3A0vAt9QcwJRcWx+S4uMh20GA3rQP+phRDXFZGkIHmbkfHiJZMSP9wFAzH8DgpaXmOjm
         BK7cXnWO6INFSW8DgPN6Shr/UNXl+3fex66iPNBgZo4Kf7Tp3CitjNwkrGFu+pckGibt
         BhSA==
X-Gm-Message-State: AJIora/HZrMioMDJixMheVasLI6p3AVNGi5qT0JPIQSMqpMbfyMZL8xa
        CZAORCKN1F6UG8Esr4tqY6wvSBh2SWjQEQ==
X-Google-Smtp-Source: AGRyM1uROX2svkIywTAWSmivCEfSYnlkfTjtBKWMV7ltuy2EuJJASXRciUPigYWDpOTcgew3DTX/NQ==
X-Received: by 2002:ac8:5e4e:0:b0:31d:312d:3a33 with SMTP id i14-20020ac85e4e000000b0031d312d3a33mr7370082qtx.407.1656686366769;
        Fri, 01 Jul 2022 07:39:26 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id b20-20020ae9eb14000000b006aee8580a37sm17103029qkg.10.2022.07.01.07.39.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 07:39:26 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-3177f4ce3e2so25777947b3.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Jul 2022 07:39:26 -0700 (PDT)
X-Received: by 2002:a81:574c:0:b0:317:7c3a:45be with SMTP id
 l73-20020a81574c000000b003177c3a45bemr16632935ywb.316.1656686365964; Fri, 01
 Jul 2022 07:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220701121804.234223-1-windhl@126.com>
In-Reply-To: <20220701121804.234223-1-windhl@126.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Jul 2022 16:39:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=0ZnQQUfABkxf9ndjC4YmwYiS0++YNj_4UT66=_tz1Q@mail.gmail.com>
Message-ID: <CAMuHMdX=0ZnQQUfABkxf9ndjC4YmwYiS0++YNj_4UT66=_tz1Q@mail.gmail.com>
Subject: Re: [PATCH] arm: shmobile: Increase refcount for new reference
To:     Liang He <windhl@126.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Fri, Jul 1, 2022 at 2:18 PM Liang He <windhl@126.com> wrote:
> In rcar_gen2_regulator_quirk(), for_each_matching_node_and_match()
> will automatically increase and decrease the refcount. However, we
> should call of_node_get() for the new refernece created in 'quirk->np'.

reference

> Besides, we also should call of_node_put() before the 'quirk' being
> freed.
>
> Signed-off-by: Liang He <windhl@126.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
