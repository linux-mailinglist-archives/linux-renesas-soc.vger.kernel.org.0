Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 758E3513382
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 14:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346141AbiD1MYc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 08:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346140AbiD1MYa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 08:24:30 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96FD42127E;
        Thu, 28 Apr 2022 05:21:16 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id jt15so3039016qvb.13;
        Thu, 28 Apr 2022 05:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JPo/j53czVHvpaSLqy/KSjQZEpG/eA0gZPVjyhefq+A=;
        b=PAK5D2Se2oSw9k0ScKuF2D7+hukWa7PEcS+yUOnexR09UJ7hEy8+InYOCmlMmNl6ap
         oVkuNgWAg6hPOiMptKMGNKoZ9kXp+OQVftCvEA9lzKPd+9FVwJpgmbMxR7gUQnGIwH/9
         BAZk1UFgFXW0CrHdLeFspe+VtIjSGkM8e0YfdyIr3E9B8dhWAMDNFANp4fvyQkEMyo94
         TVlNiUgjRYdpaFeCBFvSWIbRRuWotkWTzfeNnHV/DkVpTjywGaEzZgCfh2KUoxYHayLv
         3JGQd4EnCiHVD31wVADyp57ifvM4KsQC2TSGmc0l85HVpvbLW9qkY8YgDtqUT88QUN9d
         Qu0A==
X-Gm-Message-State: AOAM531yRhlF1wGkNB3L4jKLadDqMyzNA8rK8qX2Qh7wRzydivlE9I4Z
        gsZp0yU3cJvUhhNH6tsCJsky4s6+FNnEeg==
X-Google-Smtp-Source: ABdhPJxpyZFwfG9nYf4H4TlAbkM35CBOmtvsYWMVUHQBqMHPIO6qTrlHva74OZxBCKcxEC6E1Yg7MQ==
X-Received: by 2002:ad4:5964:0:b0:453:b24a:e410 with SMTP id eq4-20020ad45964000000b00453b24ae410mr21772813qvb.8.1651148475459;
        Thu, 28 Apr 2022 05:21:15 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 2-20020ac84e82000000b002f1f95ce5fbsm11954174qtp.3.2022.04.28.05.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 05:21:15 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id d12so8684012ybc.4;
        Thu, 28 Apr 2022 05:21:14 -0700 (PDT)
X-Received: by 2002:a25:d84c:0:b0:648:7d5e:e2d4 with SMTP id
 p73-20020a25d84c000000b006487d5ee2d4mr17386814ybg.6.1651148474653; Thu, 28
 Apr 2022 05:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220425095244.156720-1-biju.das.jz@bp.renesas.com> <20220425095244.156720-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425095244.156720-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 14:21:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUChLnnp8ja7y0K8d19nGsvgD60am=amJSJSswrLbQETw@mail.gmail.com>
Message-ID: <CAMuHMdUChLnnp8ja7y0K8d19nGsvgD60am=amJSJSswrLbQETw@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: renesas: r9a07g043: Add USB clocks/resets
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 25, 2022 at 11:53 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add clock/reset entries for USB PHY control, USB2.0 host and device.
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
