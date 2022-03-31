Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA3AC4ED89E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 13:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232053AbiCaLmC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 07:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235273AbiCaLmC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 07:42:02 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E3738788;
        Thu, 31 Mar 2022 04:40:14 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id bp39so21110778qtb.6;
        Thu, 31 Mar 2022 04:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tsmHwbJm2HnWmEEnGO1Kr5LLzGgAaLDEK9i1GDikghQ=;
        b=5kYBxWsdXryEclKhU1a076YQ803MVdYIHmhan0nyJfXeijYIpgUW/NNuMLRwzIp5t8
         sBosPe+VGOmazOalvDOnu3R67DohzjEDFqup0wsNfIhfBP5t6LHSVDUJ//0l3HVpc/sN
         ebyyGakAM15aTe9plvMimhQosZthYIy8/59Tv2r39JJ2qs8boDin0fHKJWhrO7eSj3Oz
         xTk1ies1lyLbedtChLgaC5VnXzF7mVrK626RcUWwHBzIUOV/4cQUFMXF3WipACfUnRFE
         GmVnv9nYfB7Xr+6eINCachM84CWsbZIhnnVD9FACCnmMsgCcLiRlkoAxhjQInj5GeiQH
         40aQ==
X-Gm-Message-State: AOAM53083vcKuqbcw9x01PIg+J3DfFcSyeIF2eUkUqed/lca2EGdbhL5
        C4prY/s7AjNSLB2vjhTSi17PTAfFmRi6tA==
X-Google-Smtp-Source: ABdhPJw9SF0CR7oGBSzShFE4nxbkjbZT38PfI5oYSK0PmHdvdw5SWGyeIctr/kSCkJqt3jmZoaE5sQ==
X-Received: by 2002:ac8:5809:0:b0:2e1:f0bc:2e88 with SMTP id g9-20020ac85809000000b002e1f0bc2e88mr3809752qtg.138.1648726813355;
        Thu, 31 Mar 2022 04:40:13 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id w1-20020ac857c1000000b002e1e899badesm19232314qta.72.2022.03.31.04.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 04:40:12 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id e81so12730430ybf.13;
        Thu, 31 Mar 2022 04:40:12 -0700 (PDT)
X-Received: by 2002:a5b:a8f:0:b0:633:fd57:f587 with SMTP id
 h15-20020a5b0a8f000000b00633fd57f587mr3658548ybq.506.1648726812358; Thu, 31
 Mar 2022 04:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220315154649.22343-1-biju.das.jz@bp.renesas.com> <20220315154649.22343-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315154649.22343-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 13:40:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoMxEYs+tS4QZ9rA+QLQG_Bp719oSMM3=6H5FnjfoGHA@mail.gmail.com>
Message-ID: <CAMuHMdVoMxEYs+tS4QZ9rA+QLQG_Bp719oSMM3=6H5FnjfoGHA@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: r9a07g043: Add GPIO clock and reset entries
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

On Tue, Mar 15, 2022 at 4:47 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add GPIO clock and reset entries in CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
