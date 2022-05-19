Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6431D52CF9D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 May 2022 11:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236115AbiESJpJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 May 2022 05:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbiESJpJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 May 2022 05:45:09 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1B870904;
        Thu, 19 May 2022 02:45:08 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id v6so1389095qtx.12;
        Thu, 19 May 2022 02:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2+JVHSEY+D/dij6L2Cjx5+dSW/vZcYEkFubCxdEzOVs=;
        b=jbuYZJn220hYfkTmRihTT0x01mZHSn0T5FTIHlJ8dLZRVx/ujyzDY4MaYPq3YSmBKG
         BB23Oox6xuiFPf6+CpNIZaFeIHtjKTaeRCM1KHVReVca6mOCvjJJoZDwWLhxWoXRYAYR
         EjotSaCcfFWdS5+2nwbypQGu3o0L6d4xpz3ENcHJMXrSFqGVZduCsbKh1BKSwSLRolDQ
         t3yqkIB88zPwtt0ifErUEMktKHWSOw1VNfxBvP8d1/uITvpLgoNxkq6QMjBjouiPkn1D
         OAdRBR4E45zoEekqikidFLfBbNx0ZykMLdUFpHmPRCASSbakYa1XFAuqzOvpvB3xw00Z
         HwLw==
X-Gm-Message-State: AOAM533Rl8DgIMg1LPj5Q92q/Ph6Lyj6v37hjGNjkX1KJD6xVuE3aSN8
        QrbCYUtEbGqfMU8bsgu4VpSaIBSF2sqGog==
X-Google-Smtp-Source: ABdhPJyIujYPNz3HG5016g0+lGDcn321XHrtJn/1yYmaW2kZFD2dh+fgFPvUD/fMlCF/PV5jdjf4YQ==
X-Received: by 2002:a05:622a:114:b0:2f9:f7c:ef with SMTP id u20-20020a05622a011400b002f90f7c00efmr2191779qtw.177.1652953507467;
        Thu, 19 May 2022 02:45:07 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id u1-20020a379201000000b0069fc13ce1d7sm1047219qkd.8.2022.05.19.02.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 02:45:07 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id q135so8051713ybg.10;
        Thu, 19 May 2022 02:45:06 -0700 (PDT)
X-Received: by 2002:a25:4289:0:b0:64d:746f:5311 with SMTP id
 p131-20020a254289000000b0064d746f5311mr3252723yba.89.1652953506527; Thu, 19
 May 2022 02:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220510110653.7326-1-biju.das.jz@bp.renesas.com> <20220510110653.7326-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220510110653.7326-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 May 2022 11:44:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0jUb-HBqfEfRw3jAh4zkU8Aq8csELBRX880zkJRWZzg@mail.gmail.com>
Message-ID: <CAMuHMdV0jUb-HBqfEfRw3jAh4zkU8Aq8csELBRX880zkJRWZzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r9a07g044: Add GPT clock and reset entry
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Tue, May 10, 2022 at 1:07 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add GPT clock and reset entry to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
