Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E35576402DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 10:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232942AbiLBJDz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 04:03:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232947AbiLBJDY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 04:03:24 -0500
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392E8B957C;
        Fri,  2 Dec 2022 01:03:07 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id y15so4273410qtv.5;
        Fri, 02 Dec 2022 01:03:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/jvQZtuaRcNCWtkvTjvW0UIU10aVqyWgN6WKJnGLAQ=;
        b=ZnLMVbwRgmh3rZbCtrYjrYe2fgZyC/VHK58MlqIijSiw7tz5zq2JU+uplQeepkaaNS
         QpEss9/6AyAOap7AnaQc7KwwSg/Yl37bBhKVdoOFWRNj+lyM7Rj226E+AYkXA65mzIr5
         UFOFA0zcEdnb4z6k5QgrXfXRFoEOQ8FmSNCh8V5LCYROzUyPHGpldn7MaJH0WHHO+aE/
         nvzxI56wduBbRaA/fL02qEzbVUGvRukSn+jwE18E2wE0RPFN0EqVxvFLSGWZW3ZrLH3x
         ryOX4vwfuLIrf0fPpd1DrtjR6xDmOs139UVhqIoOoLZvpakaybKTiWvw646fut5Pb3+k
         i0rQ==
X-Gm-Message-State: ANoB5plAe2FIZj7+6dVXutGaV0L0mNZamBGrL+2HOiIVdUaPDgCYUUZ2
        EXn+khHCQwG20FR64JGyrmW2Eb4uJpGM6g==
X-Google-Smtp-Source: AA0mqf4vbOCpzXmtSpdWGOoGKyxvevEviQNG5xJOad+o8giOI88NSY/eCVGvYBRNV59lDmRdrTvXjQ==
X-Received: by 2002:a05:622a:6114:b0:3a5:350b:b6d6 with SMTP id hg20-20020a05622a611400b003a5350bb6d6mr8983994qtb.130.1669971786260;
        Fri, 02 Dec 2022 01:03:06 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 10-20020ac8564a000000b003a66cd05c51sm3848082qtt.72.2022.12.02.01.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 01:03:05 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id i131so5246094ybc.9;
        Fri, 02 Dec 2022 01:03:05 -0800 (PST)
X-Received: by 2002:a25:7204:0:b0:6f0:9ff5:1151 with SMTP id
 n4-20020a257204000000b006f09ff51151mr40914794ybc.543.1669971784980; Fri, 02
 Dec 2022 01:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20221122213529.2103849-1-biju.das.jz@bp.renesas.com> <20221122213529.2103849-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221122213529.2103849-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Dec 2022 10:02:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2sEanhwdxWHtboLcvH4Gg90Wciq7s4OphJuTL9CMusg@mail.gmail.com>
Message-ID: <CAMuHMdV2sEanhwdxWHtboLcvH4Gg90Wciq7s4OphJuTL9CMusg@mail.gmail.com>
Subject: Re: [PATCH 4/7] arm64: dts: renesas: r9a07g054: Add DSI node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 22, 2022 at 10:35 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add DSI node to RZ/V2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch depend upon bingings [1]
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221122195413.1882486-1-biju.das.jz@bp.renesas.com/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
