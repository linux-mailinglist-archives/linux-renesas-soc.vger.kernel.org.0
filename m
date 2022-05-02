Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA979517289
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 17:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385750AbiEBPd1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 11:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357710AbiEBPd1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 11:33:27 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918EF12AA4;
        Mon,  2 May 2022 08:29:58 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id x22so6217948qto.2;
        Mon, 02 May 2022 08:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ffBVbdbBUZkeviOchakYrdmd21fNqsHEcxydyvq9AJ8=;
        b=ccaGwA7zM7wHo5fIJaKGNn5KvtwqHJOd6r9V6MaTdDEx+v/IL9eXrQ+CIOovr3sp6G
         oGFdt4TddGnMYlsRp5yTRYdGG4ROQspiqIfLiDugjeHEFeoGzQnDdhsDj4Pf3pDmHVSX
         V6zJ3BOCe58rG2L66tXSElphplSsV0pNE/zr+YcWRNWMeEgs6p5fVT1ShiRPMgxWTVaw
         +cT/6dlg2fK3jbFxFwI20IKydUnu7KPWvCCb8n32z5KWEbxiTAEBb0tYgR3F+Z9+Kgcq
         OBxDOShPgz/EKBn19Wc0hzVhuLpwcyk7CKXlZUTJkJfJfk9CXzO1MmPyl5Nu7YpRpKCj
         gI9g==
X-Gm-Message-State: AOAM530PE9KTRLd4A7BbdzJHWxV7EY3pvMj75KSev9bhj2otIFzIyt5w
        7xuexTD1fsWq+U3FBqOF57ksB9WL+NJ0Sw==
X-Google-Smtp-Source: ABdhPJyERTgE1NzNJH6W8dF2AdjMtpuGlB8cR7q6IBy5PppRoQd27IL5qZclRVc0rWKxvBUcUbtTnA==
X-Received: by 2002:a05:622a:1316:b0:2f3:64cf:2b3d with SMTP id v22-20020a05622a131600b002f364cf2b3dmr10992655qtk.205.1651505397570;
        Mon, 02 May 2022 08:29:57 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id v17-20020a05620a123100b0069fc13ce216sm4356588qkj.71.2022.05.02.08.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 08:29:57 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id f38so26686536ybi.3;
        Mon, 02 May 2022 08:29:57 -0700 (PDT)
X-Received: by 2002:a5b:482:0:b0:646:b85:ad4a with SMTP id n2-20020a5b0482000000b006460b85ad4amr10099439ybp.89.1651505396942;
 Mon, 02 May 2022 08:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220501083450.26541-1-biju.das.jz@bp.renesas.com> <20220501083450.26541-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220501083450.26541-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 17:29:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4q_pWm3GPR4cKZ=+r756nt-As+yq0=t58xvs9cHEfXw@mail.gmail.com>
Message-ID: <CAMuHMdU4q_pWm3GPR4cKZ=+r756nt-As+yq0=t58xvs9cHEfXw@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: r9a07g043: Add TSU clock and reset entry
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

On Sun, May 1, 2022 at 10:35 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add TSU clock and reset entry to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
