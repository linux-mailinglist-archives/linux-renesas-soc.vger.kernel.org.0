Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8F3F66BCAC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 12:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjAPLSZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 06:18:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjAPLSY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 06:18:24 -0500
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925741DBB4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:18:23 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id r15so1105242qtx.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvB1pfi2vqcB8X1LARbJJAATRSe3g0kUgEkuuHyaSiE=;
        b=qsP3bVR0S9C2mRON4A04qfOTpaVOSjowoZghzpZkzXOueIlo/C4BIRWaLdlXBeFWQj
         eADqPaAMlidff5UpkBrQQcUrMlCCtQrg4Cl7DUF7KqSJSJg1yg4qf3MTrv1OCOa1LEOx
         7EwnYCHsYWcM/+CueLbkjpV6xuuaNNO1rF2Wz4Yv8HdaqS6wE5LyBS1CsW+kwszx1WFA
         J8ALJfe+KIkH03YrKY632nCDbHXiiTpzlfGNeg72hyMZaoM4fcszglHbbn3LvDmKnPry
         296RRs1FboDOmBOMyzW2XYHt5GVz7LlXwBSfrIai3oNozW1Ouda/L7rHGS+G7J4Zddwz
         s8Eg==
X-Gm-Message-State: AFqh2kqwZj4C5lrj9KwyhpIJ/Rbv3vrGYvkonvfqjJYCqTSJOdTq0Piv
        rR4nAD4v16cJPPlRA5YpAfXqMFlsqOXVRg==
X-Google-Smtp-Source: AMrXdXv3VPl1rULsvboV3Lkp1ilGyxNFaenZLcgZDfVDcjsNXV+bJLWFPgoYomPVDg7JVnZAYZmL8g==
X-Received: by 2002:ac8:60da:0:b0:3b6:2dbd:7610 with SMTP id i26-20020ac860da000000b003b62dbd7610mr7726912qtm.45.1673867902554;
        Mon, 16 Jan 2023 03:18:22 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id m5-20020ac86885000000b0039cba52974fsm14481106qtq.94.2023.01.16.03.18.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 03:18:22 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id e202so6492643ybh.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:18:22 -0800 (PST)
X-Received: by 2002:a25:244f:0:b0:7d5:b884:3617 with SMTP id
 k76-20020a25244f000000b007d5b8843617mr588748ybk.380.1673867902014; Mon, 16
 Jan 2023 03:18:22 -0800 (PST)
MIME-Version: 1.0
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com> <87cz7ji418.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cz7ji418.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 12:18:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNO7MgZGCd5VR43=RG-Z7oMVE3LrqyE5dktdL93HdSxA@mail.gmail.com>
Message-ID: <CAMuHMdUNO7MgZGCd5VR43=RG-Z7oMVE3LrqyE5dktdL93HdSxA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] arm64: dts: renesas: #sound-dai-cells is used when simple-card
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 13, 2023 at 3:04 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current sound comment is indicating that #sound-dai-cells is
> required, but it is needed if board is using "simple-card".
> This patch tidyup the comment.
> Because it is already using "audio-graph", this patch removes
> unneeded #sound-dai-cells from ulcb.dtsi / salvator-common.dtsi.
>
> Link: https://lore.kernel.org/r/87bko6pxgl.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
