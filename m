Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2DBD51BBC6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 11:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352461AbiEEJW4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 05:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbiEEJWz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 05:22:55 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83F34D63D;
        Thu,  5 May 2022 02:19:16 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id x22so2713462qto.2;
        Thu, 05 May 2022 02:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VQnLrjECL0m8CJj4eN9goeQ8uWW/YMO8A7rg8uiA2WI=;
        b=wHnzT8AvmUMPXvhp87w6Eiah0ndbRbwhqan7F+IECwDBS0Vfh9s1cMi7sKuU00GHul
         GJWVFEqu/CucWSI3wlFh+HvFaon/YfJvr+SK2ksCag/5SS/nqepD8xDda8jExjzB6gyr
         jyNteKe/VAkKkfRwYM3Cg0gPvoqhr4jK6fAddMrDzfoFk4NRWsCuORtBA88joijaWIFi
         /VgBHN8/Mkp//HVmOVNXPL1BlSJwMZ0bD0w5b5GyvLHJ5Qgrj4Soq0RKuvCz42LdhxAa
         1w5iDpw195/Izc+WRNVEAxRpUGRy7ZkUtnRa3bIjW7igy6oe0I5kOsqovgcegB16a7U4
         S6CQ==
X-Gm-Message-State: AOAM531F+lWxePsSBnw2jFP9fE7ZdkJjAxg2EWsuM4j3eQORTFzEV0rg
        8l9PCBthXQe3xZeUPCT+2yjAUb3U8AUQMA==
X-Google-Smtp-Source: ABdhPJzdbCnlwMLhfLc0S/73GTbc3B5/ZQ+jHt6+sCa5rbcvHUfIGi9+cRQOkEJED8GCFqJSzkssXw==
X-Received: by 2002:ac8:59c8:0:b0:2f3:44dc:cf18 with SMTP id f8-20020ac859c8000000b002f344dccf18mr22697358qtf.332.1651742355888;
        Thu, 05 May 2022 02:19:15 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id l128-20020a37a286000000b0069fc13ce24csm496045qke.125.2022.05.05.02.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 02:19:15 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id y2so6573563ybi.7;
        Thu, 05 May 2022 02:19:15 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr4376613ybb.202.1651742355064; Thu, 05
 May 2022 02:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220504145454.71287-1-phil.edworthy@renesas.com> <20220504145454.71287-2-phil.edworthy@renesas.com>
In-Reply-To: <20220504145454.71287-2-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 5 May 2022 11:19:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBLmXVKeEAa1mDvk44XEZ3XbDdai=eqW4byzprPfp4rQ@mail.gmail.com>
Message-ID: <CAMuHMdVBLmXVKeEAa1mDvk44XEZ3XbDdai=eqW4byzprPfp4rQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] clk: renesas: r9a09g011: Add eth clock and reset entries
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
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

On Wed, May 4, 2022 at 4:55 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Add ethernet clock/reset entries to CPG driver.
>
> Note that the AXI and CHI clocks are both enabled and disabled using
> the same register bit.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
