Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7B85A5CFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 09:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiH3Hdu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 03:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiH3Hdu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 03:33:50 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7682B1A0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 00:33:49 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id kh8so8111089qvb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 00:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=wBh9Cy7QADACR9DMQ2sVGrlfJGwsMGv1MChOD07hBds=;
        b=jtIcK6ffJUU/hSff4xFQuauJ0oKRxuy95QvMwp02LnQFT2OTILmk1qH5QaBBMgkHJO
         yi/CFkbWALnM5d57TF5/TNiqgydUrNkJJY9UFuc20PEoW6zRFbC5UdzxtPze1icYezw9
         S+d4Wyi9MXk3dO7q3eAkNGGkkWmSG9CDZAiYY+aDVHIQaonHDs9Zjlki7wCNUd1c4d3Q
         N1FvkjsGDMaywdjJ857Nw+3gugLP0UBgPBimTgXKXJOT2vrQ8OZAkhVtCNlF0/6vgyC8
         vnPI88PDAYAmfCH0vE1m0eA3FrXSX1OVj+2H+F9qHj7YB4F+udTFfLY6MZ/8pkqIyzB9
         eG9A==
X-Gm-Message-State: ACgBeo0dUhJu1sBPisil3Zv7y/7YmkumRK+R9uvLwljY2+DPADnU7+9o
        3x2YXT08EyFuCrCcpvkkvP1kOfKfYoFAow==
X-Google-Smtp-Source: AA6agR6iyH/aDOY5SfC6KKPu6W6QWoVJqRi/WgB643/n8jZd/R35fV9H/VaBvRE5BKbFH4H2TkMsGg==
X-Received: by 2002:a05:6214:2301:b0:498:9f6f:28d with SMTP id gc1-20020a056214230100b004989f6f028dmr14113765qvb.5.1661844828162;
        Tue, 30 Aug 2022 00:33:48 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id bp17-20020a05620a459100b006b9a24dc9d7sm7628865qkb.7.2022.08.30.00.33.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 00:33:47 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-3376851fe13so252604087b3.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 00:33:47 -0700 (PDT)
X-Received: by 2002:a05:6902:4c7:b0:69a:9e36:debe with SMTP id
 v7-20020a05690204c700b0069a9e36debemr7952654ybs.543.1661844827543; Tue, 30
 Aug 2022 00:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <8735de626c.wl-kuninori.morimoto.gx@renesas.com> <87y1v64nko.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y1v64nko.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Aug 2022 09:33:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdwUSv0zsZvYhQqA1ZDdvfK2DMCmKtvA=UuBJKTYJMQw@mail.gmail.com>
Message-ID: <CAMuHMdWdwUSv0zsZvYhQqA1ZDdvfK2DMCmKtvA=UuBJKTYJMQw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: renesas: Add V3H2 Condor-I board support
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
> This patch adds r8a77980A V3H2 (= r8a77980 ES2) Condor-I board
> basic support.
>
> Signed-off-by: Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>
> Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
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
