Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18167598251
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Aug 2022 13:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243942AbiHRLbT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Aug 2022 07:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239816AbiHRLbR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2022 07:31:17 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7131F9BB52;
        Thu, 18 Aug 2022 04:31:16 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id cb8so876287qtb.0;
        Thu, 18 Aug 2022 04:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=S1MVOLZVCOibZ6SFDrc8OcTGdI2LjhF+pwOc+VbnEZA=;
        b=y06KyalJrALoKXju6QtMPbMUr2ce+LdJtIFBBtvLFYBAoBLvJAdrgZAUfKXE4DZWvR
         ioKccrliOQpsE1KHBayXpORSfst09mg6onVY4gYyq2RCWxA3jMFEc31RStgwTxMke564
         NdsXnC9I74tvKEBGtdCaDEhb5H4NSvVf1LbGSJ1a9EDSbMCM3N93OrkIFtgbIS6W6gIf
         yBdZejgR3xnsqIvYpyYdSh12gyoRN9TFh9WEbnl7PgNBLYhdlozLAwD2WC9HglJyXSus
         fszibwCZmIG7UEy1xsRa9jGL5m92YsrAg+eEIUkif+VbwZ6VkuwYY99Qky5O9ZpZbvmr
         w12Q==
X-Gm-Message-State: ACgBeo3xM+h2iwOJE9EnrUFrBcwuu7Ge6COqz8UWRxHDMp8hhkMZ6riz
        l8H3bNjc+5XFea80BuqSzVC6qMTQ/ZjXFg==
X-Google-Smtp-Source: AA6agR6jrwZawUdyUUaYm5Wzz+ASEzk1n8oNtIrel183Jo/1VpZP3cw3K1bNQf+mU55Cx+fFxxMrVQ==
X-Received: by 2002:ac8:7d48:0:b0:344:55b4:1897 with SMTP id h8-20020ac87d48000000b0034455b41897mr2088162qtb.309.1660822275411;
        Thu, 18 Aug 2022 04:31:15 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id bs43-20020a05620a472b00b006b9b7879964sm1342129qkb.28.2022.08.18.04.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 04:31:15 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-333b049f231so33131377b3.1;
        Thu, 18 Aug 2022 04:31:14 -0700 (PDT)
X-Received: by 2002:a81:502:0:b0:32f:dcc4:146e with SMTP id
 2-20020a810502000000b0032fdcc4146emr2334417ywf.316.1660822274800; Thu, 18 Aug
 2022 04:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220729084527.388023-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220729084527.388023-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Aug 2022 13:31:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVOdNmeudWJpf2tYASdtgFZO=kbffSbDYMLJhqzUesVg@mail.gmail.com>
Message-ID: <CAMuHMdXVOdNmeudWJpf2tYASdtgFZO=kbffSbDYMLJhqzUesVg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g043: Fix audio clk node names
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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

On Fri, Jul 29, 2022 at 10:45 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Replace the clk node names audio-clk{1,2} with audio{1,2}-clk as per
> the device tree specification.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
