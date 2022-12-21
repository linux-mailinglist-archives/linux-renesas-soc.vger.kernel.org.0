Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54E616532A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Dec 2022 15:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbiLUOsA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Dec 2022 09:48:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiLUOr7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Dec 2022 09:47:59 -0500
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472DBAE49;
        Wed, 21 Dec 2022 06:47:55 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id c124so12441891ybb.13;
        Wed, 21 Dec 2022 06:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgkmWiorp8w63YWLUVLTMIB+rBFZNY+cC3lzhrzZJp4=;
        b=jMx78nbbThkssRQsnhWoorIMo5+QwzlNZXKLzsTFnB5yWYM98C8uPFVS5K7H3YGxrv
         zbHAxnp+7VEtLczwIuyz4An1bQvCz7SDH0NxDqR0D6cWmBV7GFmQXQ0qZlzrryyRg39O
         mVqkYAPJps1irT6qYqfI0tEQfbb4IAUfn2fkz/gagv4bgAMibTGSmlcZRyL5lQCxu/UG
         9l1uqmlUy4SGzXC7C5hgQJkajMHTMfsgk9fwyNeGiUAkFbPKNw/lcFOpc357R3lykB3o
         E1nBTrMm3DvsL+5yZsjEdhf/dC+/xphbuPLl96xVrFqwbEvSOZM40HW6kC8daRt0Q0Xj
         Fldw==
X-Gm-Message-State: AFqh2krp3tk5k6Elh+a75MvTUxGgPGT8rkx8ggHPBhToruUsyj3nvk+n
        fvLem9y+4xCYYwbw2ND8nY1QnvrxZGItvA==
X-Google-Smtp-Source: AMrXdXu6FVZK3xifLU1xTYl+f50Y7PXzmbnF+TkGoqgPwztFSd8JvQUKi3wKwD47c6eMJrJdWVyKhw==
X-Received: by 2002:a25:fc25:0:b0:716:10cb:dc42 with SMTP id v37-20020a25fc25000000b0071610cbdc42mr17290497ybd.37.1671634074157;
        Wed, 21 Dec 2022 06:47:54 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id w8-20020a05620a444800b006fc92cf4703sm10948941qkp.132.2022.12.21.06.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 06:47:53 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id t15so4624592ybq.4;
        Wed, 21 Dec 2022 06:47:53 -0800 (PST)
X-Received: by 2002:a25:aae1:0:b0:6fc:1c96:c9fe with SMTP id
 t88-20020a25aae1000000b006fc1c96c9femr285471ybi.36.1671634073520; Wed, 21 Dec
 2022 06:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20221205145955.391526-1-biju.das.jz@bp.renesas.com> <20221205145955.391526-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221205145955.391526-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Dec 2022 15:47:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXa=pdSQeet1gFO3YrerXmw41Xi=qE0_xW_h+uFAgBrnQ@mail.gmail.com>
Message-ID: <CAMuHMdXa=pdSQeet1gFO3YrerXmw41Xi=qE0_xW_h+uFAgBrnQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: renesas: r9a09g011: Add TIM clock and reset entries
To:     biju.das.jz@bp.renesas.com
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
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

On Mon, Dec 5, 2022 at 4:00 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add Compare-Match Timer (TIM) clock and reset entries to CPG
> driver.
>
> The TIM IP on the RZ/V2M comes with 32 channels, but the ISP has
> full control of channels 0 to 7, and channels 24 to 31. Therefore
> Linux is only allowed to use channels 8 to 23.
>
> The TIM has shared peripheral clock with other modules, so mark it
> as critical clock.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
