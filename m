Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E25E04EDA5F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 15:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235045AbiCaNTu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 09:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236721AbiCaNTt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 09:19:49 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0352F20E975;
        Thu, 31 Mar 2022 06:18:03 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id hu11so19676289qvb.7;
        Thu, 31 Mar 2022 06:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u6QL31SHcWO1IoHLeD+X2LuDEMzJ8GNHoReP63O++Lc=;
        b=CsPpGGhwKu+cXovOvVVdAQO7cu683+23U9/SYZJugE41ojLvAndlISuTnmaqVrR6hq
         R4+Xgh+xWnusXB1Ph0vuGAwo5ysOuwWPqJW+3zG1Y1Bg2T/XNonLOB8GUg8coZgB+Ret
         VhD/ZsQmVGe0m4ACVOhwf8RrUR6qZvaBWwdmEpiFUsF80NEhcxsEHMNMVzXP3NLFQEAS
         ADwGIM2egFwcgMksA7b3b2Y5fgGWBMvdUgrqO6byCCdgrc1S4DgXUQEe4e2DLAtw0FRz
         fZIygpOLAomqlTAa0haSAUMu5V+O8ZCmdoqydvPO2na9OA4rQI7CIWQW5WmODKygwFjZ
         k0Lw==
X-Gm-Message-State: AOAM530f9t5L5RrfSfiUIfX04iMcw3Q/fV2g9kl76jkfK+aKNeNwBkpw
        mwLTy9Tp/K6ivEiYEikn7//1mWC/K9hdfw==
X-Google-Smtp-Source: ABdhPJym/s5DOpMRJLk2z8WgwJEdYWLEeOJ7BQ8VNmK3m4cITPu+Yyr7T9gvLrmchVEyOi9qrqJxew==
X-Received: by 2002:a05:6214:21a6:b0:443:35df:b7be with SMTP id t6-20020a05621421a600b0044335dfb7bemr3977691qvc.46.1648732681596;
        Thu, 31 Mar 2022 06:18:01 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id g21-20020ac85815000000b002e06e2623a7sm19699010qtg.0.2022.03.31.06.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 06:18:01 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2e5e31c34bfso253762477b3.10;
        Thu, 31 Mar 2022 06:18:00 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr4645775ywi.449.1648732680615; Thu, 31
 Mar 2022 06:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220315155919.23451-1-biju.das.jz@bp.renesas.com> <20220315155919.23451-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315155919.23451-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 15:17:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKvP07whu_NbMi6zxTJShCAkf3vX62o5FZv8-mXe=3qQ@mail.gmail.com>
Message-ID: <CAMuHMdUKvP07whu_NbMi6zxTJShCAkf3vX62o5FZv8-mXe=3qQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] arm64: dts: renesas: r9a07g043: Add GbEthernet nodes
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Tue, Mar 15, 2022 at 4:59 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add Gigabit Ethernet{0,1} nodes to SoC DTSI.
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
