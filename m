Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF5E62EF33
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 09:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241399AbiKRIZ7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 03:25:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241456AbiKRIZj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 03:25:39 -0500
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6FB993CFE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 00:25:29 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id n18so2889616qvt.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 00:25:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JiZFo7bukUg7aoOLcUFBgZ1ko81Z9dv116Su8cpJq18=;
        b=sJ0ZiaXBxHFmwzMOEqwkB215PQeTDczKCbf7QrI2npQG2cajKudeyt2uWRvawCKFfT
         ybiDgxe0Vg18KzUVqGKEKKOWKl4t5hQjdWcvCnD71ztpF8Mknzrf37KoTl+LmbiAGU//
         qgP0ikOZl4qcwHsAam4hFtdoXshbRCiJhtfyNhy6xSp/j041/lR4RkOAFk5iuJeiaLbI
         Iuf5V+eITHrV6PzcvIiO7UDNDsma8ZTg5lvBcPvCGYXFRuSnpCaY+fN4yEsuoZFeZYjb
         fQSFq58lEiot0Rfv8eJQ1IYCCI60ff4Kqxdc4cHUcq4CZMUtwyoKRv1Y32KffmEpZYuS
         6zwg==
X-Gm-Message-State: ANoB5pkfCDEsl+BC3EEwBtzL+Eg9kLJZo16BqtcHERCFsVQl2mKSuxZA
        bG2a7TZpTSKZ60844WTIcIoNTdXd+GRwjQ==
X-Google-Smtp-Source: AA0mqf7HrWAjYAd3rqf1TGeUltJZwdc7CAxBROh2El4k7rddB21717wBPgvgZeByLMWC3tfRUhKnXA==
X-Received: by 2002:a05:6214:301:b0:4bb:59f1:b6f9 with SMTP id i1-20020a056214030100b004bb59f1b6f9mr5856074qvu.17.1668759928607;
        Fri, 18 Nov 2022 00:25:28 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id r2-20020ae9d602000000b006cebda00630sm2012543qkk.60.2022.11.18.00.25.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 00:25:28 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id k84so4837948ybk.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 00:25:28 -0800 (PST)
X-Received: by 2002:a5b:24b:0:b0:6ca:3b11:8d76 with SMTP id
 g11-20020a5b024b000000b006ca3b118d76mr5627471ybp.202.1668759927925; Fri, 18
 Nov 2022 00:25:27 -0800 (PST)
MIME-Version: 1.0
References: <20221116202110.1770-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUVmapwN_OHpn4RtQebZCbEi3avka+2MuWpCk59g5UyLA@mail.gmail.com> <Y3c0lpl8zzKMnRPO@ninjato>
In-Reply-To: <Y3c0lpl8zzKMnRPO@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Nov 2022 09:25:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUynqKtPF4fBP-Wo6K2++1cStDzgTQ6gBmcKsTHmKbhZw@mail.gmail.com>
Message-ID: <CAMuHMdUynqKtPF4fBP-Wo6K2++1cStDzgTQ6gBmcKsTHmKbhZw@mail.gmail.com>
Subject: Re: [RFC PATCH] clocksource/drivers/sh_cmt: access registers
 according to spec
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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

Hi Wolfram,

On Fri, Nov 18, 2022 at 8:30 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +       /* Tests showed that we need to wait 3 clocks here */
> > > +       unsigned long cmcnt_delay = ch->cmt->reg_delay * 3 / 2;
> >
> > DIV_ROUND_UP()
>
> Really here? reg_delay is ensured to be a multiple of two...

"2000000UL / rate + 1" is not guaranteed to be a multiple of two?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
