Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EABF4AC013
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 14:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233274AbiBGNwA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 08:52:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386897AbiBGNQn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 08:16:43 -0500
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B2FC0401E6;
        Mon,  7 Feb 2022 05:16:34 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id g15so8414459uap.11;
        Mon, 07 Feb 2022 05:16:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DNVoXvat1/oQDV0gxOtXkAL2AeofRM0ulhZnPcz1YuM=;
        b=oYIMguteDC/GuVDgXs5djH/X5kDFF7ejg95w1kUId+BEH7hJMsJ/pagjGfyskPMPbF
         /4A4ZUZfTTiVwOuMWOgN543rvoUE+D6s6nAZ++S20HMUVfpyZ7wp66FPbBYi5klUS7ZE
         itm8GmXWIOP2je8j1BLVSGqCzrhWrA5Q4xU/w0bOE3Ca7a41T+AZKs1AGRaszN3GY3ZI
         xRCJUPGw03REuaFcgpj6jiMMNJh14A85l5+fe3V81GCg8sRaTpTnDg7AvGtgkhfGL56/
         xTldOAaw+lZq5mZS/xa10fxJv/4IElBhjA+M6IC1a1/tJVkBXhiT7x2PhEGzLs5odH7W
         F/tQ==
X-Gm-Message-State: AOAM530IpawBibYlRWCS/lzeMiTbzCNZYrpXH4NnoCQi1228WxvxaZ5j
        kxeEgO0E9/OL/e+pxYsc91A3EoIQCV0HGA==
X-Google-Smtp-Source: ABdhPJw99oZ8ccbCYtQGJAY7JlaQcRlq7jxLnz+tULBHViQAYcR7Zb1v0n1uWQYgGviCf32MqMNZvg==
X-Received: by 2002:a05:6102:34cd:: with SMTP id a13mr4770358vst.64.1644239793469;
        Mon, 07 Feb 2022 05:16:33 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id h30sm2228612vsq.7.2022.02.07.05.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 05:16:33 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id 103so9105494uag.4;
        Mon, 07 Feb 2022 05:16:32 -0800 (PST)
X-Received: by 2002:a67:5f83:: with SMTP id t125mr4218270vsb.68.1644239792795;
 Mon, 07 Feb 2022 05:16:32 -0800 (PST)
MIME-Version: 1.0
References: <20220206184749.11532-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220206184749.11532-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Feb 2022 14:16:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHF+Cv7=YqwP8riNGQA8ZDm9-RVgS8fH0cMRUBf9=eWQ@mail.gmail.com>
Message-ID: <CAMuHMdVHF+Cv7=YqwP8riNGQA8ZDm9-RVgS8fH0cMRUBf9=eWQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: serial: renesas,scif: Remove redundant renesas,scif-r9a07g054
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Sun, Feb 6, 2022 at 7:48 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch removes redundant "renesas,scif-r9a07g054" from binding
> documentation as it uses renesas,scif-r9a07g044 fallback.
>
> Whilst remove the additional renesas,scif-r9a07g054 from Items.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
