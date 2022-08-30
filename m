Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8BA85A5D05
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 09:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbiH3HeT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 03:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbiH3HeR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 03:34:17 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C16BB7EDF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 00:34:16 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id h21so7923814qta.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 00:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mM02m2yyLGfbR/z8kem7pY1vOQ5zI//Ss+5eCdKqQgs=;
        b=XXq7wms0yVYcq8h091GVCMUFz9sgFApOMc+x3JBjj4EXPbjJ32yIM6Wf81MaRGWugb
         9oWRy9UjO52E795MKl/5hrBoRJBf8MYQYUWeVgAnzXtyitKLImwVQpMpHAOohkbPLZuH
         K8wlm2SGiCGrU9wp27nnQqf38KDykZwXSi8I+dZ9BPEDbuOxw9C6SQ5DfBlYYtL8MegU
         NhAbu1QRZFM7EBeaf7+ALfD78XECjTtVGUlID0o153TOw2cOuWCT73UaqfY3nS/UTa6p
         ZlG9wbTlhysxiub0eiDWeUAebVepcKU3MgS7phQV9AtKq5sSc+ArgOtsK1vj1RxkI723
         j3Zg==
X-Gm-Message-State: ACgBeo26GyRX6MwzB+ggPYqaM7cuSB6xzChDZoOZsZh8zia5Do7ANVzj
        C75r+2bR/HyYPbmDMG09lo0RcQGrC5Q7tA==
X-Google-Smtp-Source: AA6agR40lvYRY+LQBqUqph/H4Z5BHnipP8g7OhwMtDEKDX/QLfDnuTQ/mc5ytbHrCBJg2wzhEQBJcw==
X-Received: by 2002:a05:622a:24a:b0:343:75d6:ad0a with SMTP id c10-20020a05622a024a00b0034375d6ad0amr13549034qtx.564.1661844855340;
        Tue, 30 Aug 2022 00:34:15 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id he7-20020a05622a600700b00344f7cf05b4sm6518011qtb.14.2022.08.30.00.34.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 00:34:15 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-324ec5a9e97so252284767b3.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 00:34:15 -0700 (PDT)
X-Received: by 2002:a25:415:0:b0:696:814:7c77 with SMTP id 21-20020a250415000000b0069608147c77mr10956425ybe.36.1661844854960;
 Tue, 30 Aug 2022 00:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <8735de626c.wl-kuninori.morimoto.gx@renesas.com> <87wnaq4nkh.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wnaq4nkh.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Aug 2022 09:34:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUj2+q8_C7Z+P4OjkCm98PajFVSUU8WvHMGuP8_qa325g@mail.gmail.com>
Message-ID: <CAMuHMdUj2+q8_C7Z+P4OjkCm98PajFVSUU8WvHMGuP8_qa325g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: arm: renesas: Document Renesas R-Car
 Gen3 V3H2 Condor-I board
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

On Tue, Aug 30, 2022 at 1:50 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds new R-Car Gen3 V3H2 Condor-I board.
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
