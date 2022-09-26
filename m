Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C12A85EA81A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 16:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbiIZOOF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 10:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234635AbiIZONc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 10:13:32 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1DA181CEE;
        Mon, 26 Sep 2022 05:24:11 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id g12so3952274qts.1;
        Mon, 26 Sep 2022 05:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jYPkJ4iF6JhjqcodfY82xzxpTsL+ak9+Yo7XYg3OT1k=;
        b=Xpe5hArihewP7hnxf2z03OsA5iTzcZk72slCoeFnL1s4Po7HAD/2RQU4/bOVQYpKq+
         A4ofcyO83N0y3gaN3NYYWqYNMkdsiVUkiizc54N3wLzSJRc1rqtuTMYVjNWEWLRkebgH
         YMs5wFmRUZ+omRo1XQKkfx0BX8d2mR1tkdbzSSg42zS+M42cX5Mc7WN/rPu9qLtV1H+F
         n63SZzORqaQkuMW3ycyLr5PdAvzsz2mtjiFka27lXmPOaESShc0ZwJDcPPzSD2W2HGjx
         kDwbjRlzx8sqbeoy41JFmYvoMGAPajIcLjTfUQMfv5iSpDeL2qQg8gV+FnmBRsXiNd2S
         hPgA==
X-Gm-Message-State: ACrzQf0aFtKELrWOAm0YjIxCgcppQ5BBmVH8Q+oV9XdKNdTx3Nopp9tm
        hDvqdG2ggnYjDGQ7GPGzkBUR37REhcBtOg==
X-Google-Smtp-Source: AMsMyM44/3L4lyhZa6NJe7jD5yXx0QT8acT1mveMijlZOVDyjdtQ7cjh+3YCztFitmHdURMmLR8UHw==
X-Received: by 2002:a05:622a:50:b0:35d:4967:d761 with SMTP id y16-20020a05622a005000b0035d4967d761mr69161qtw.155.1664195049483;
        Mon, 26 Sep 2022 05:24:09 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id r1-20020ae9d601000000b006cbbc3daaacsm11503552qkk.113.2022.09.26.05.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 05:24:09 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id e187so8094984ybh.10;
        Mon, 26 Sep 2022 05:24:08 -0700 (PDT)
X-Received: by 2002:a5b:104:0:b0:6b0:429:3fe9 with SMTP id 4-20020a5b0104000000b006b004293fe9mr20333528ybx.543.1664195048750;
 Mon, 26 Sep 2022 05:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220919084110.3065156-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220919084110.3065156-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Sep 2022 14:23:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaMxAT12b2XLnM_uiJ++rsVHiRBr+9utRP3oWNUJE1ug@mail.gmail.com>
Message-ID: <CAMuHMdXaMxAT12b2XLnM_uiJ++rsVHiRBr+9utRP3oWNUJE1ug@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l: Support sd clk mux round operation
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CC wsa

On Mon, Sep 19, 2022 at 10:41 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Currently, determine_rate() is not doing any round operation
> and due to this it always selects a lower clock source compared
> to the closest higher one.
>
> Support sd clk mux round operation by passing
> CLK_MUX_ROUND_CLOSEST flag to clk_mux_determine_rate_flags().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.2.

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -182,7 +182,7 @@ rzg2l_cpg_mux_clk_register(const struct cpg_core_clk *core,
>  static int rzg2l_cpg_sd_clk_mux_determine_rate(struct clk_hw *hw,
>                                                struct clk_rate_request *req)
>  {
> -       return clk_mux_determine_rate_flags(hw, req, 0);
> +       return clk_mux_determine_rate_flags(hw, req, CLK_MUX_ROUND_CLOSEST);
>  }
>
>  static int rzg2l_cpg_sd_clk_mux_set_parent(struct clk_hw *hw, u8 index)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
