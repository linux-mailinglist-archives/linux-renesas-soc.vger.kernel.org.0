Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7857E5A5CFC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 09:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbiH3HdG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 03:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiH3HdF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 03:33:05 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C3F2A709
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 00:33:01 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id h21so7922351qta.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 00:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=HcwJk2UyCPmZe5/JMubdeM9AuvDIvTjcoVUupCiSsh4=;
        b=0aEf1GzGruD34FLTazClK8B6DKrB256+oa5lFwI7BsNaJNppEvq7VI7pzK/Lp5Q0cz
         fLDbjGA4mZ1W4Dp7V1cxGyvfXijQ45hT2lq8/MAOBdsiV8DGafYfj1yfyZbGzGNK7hfY
         QMt2/8A8hWVQBMNsUQQpD4II2/sfH8NfRFfmG/V/uRmcuyYlwOSSuL/ZdA/FW2LzeNeW
         1HbJh6EccHj1cdZBx5X/lgvaweBJvgd0zsFA7e0fN6tFyPd3J5JZkqSDvX9R9UvfuNPZ
         LoVAsNDkgYCqCQybXhsvGZ+g/kGswyfpu3KYQli3UqDypBu1i3j0zAsjPHkvitq+Y1x+
         qXEw==
X-Gm-Message-State: ACgBeo3HuOzrthd3+k/EZ7KqdhkSSgkuePlAFJa/bR2nU3tBdm4wZ27I
        gGesbIM1Gm1BOnrF1U6FOjR8Ig9S+q7YEg==
X-Google-Smtp-Source: AA6agR5y6T9UQeQLWBniX7cIdhtafX/59FXgkOECLDVdy94McQjIjXY7NZPK7SOX7DIfEmdQ6Ctgxw==
X-Received: by 2002:ac8:4e41:0:b0:343:5c49:951a with SMTP id e1-20020ac84e41000000b003435c49951amr13354259qtw.25.1661844779474;
        Tue, 30 Aug 2022 00:32:59 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id y2-20020ac85242000000b00339163a06fcsm6604877qtn.6.2022.08.30.00.32.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 00:32:59 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-334dc616f86so252251567b3.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 00:32:58 -0700 (PDT)
X-Received: by 2002:a25:8e84:0:b0:696:466c:baa with SMTP id
 q4-20020a258e84000000b00696466c0baamr9735210ybl.604.1661844778412; Tue, 30
 Aug 2022 00:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <8735de626c.wl-kuninori.morimoto.gx@renesas.com> <87zgfm4nkw.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zgfm4nkw.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Aug 2022 09:32:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYJnphnwWiDGXhwGTzV8sPzzyDBgPHiDbdp1gL0-RQHA@mail.gmail.com>
Message-ID: <CAMuHMdVYJnphnwWiDGXhwGTzV8sPzzyDBgPHiDbdp1gL0-RQHA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: renesas: add r8a77980a.dtsi
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
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

On Tue, Aug 30, 2022 at 1:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds r8a77980A V3H2 (= r8a77980 ES2) basic SoC
> support. It is using r8a77980 (= V3H) setting as-is for now.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
