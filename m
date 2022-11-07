Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5917D61F88A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Nov 2022 17:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbiKGQLe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Nov 2022 11:11:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232574AbiKGQLc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 11:11:32 -0500
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD75F2019D
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Nov 2022 08:11:31 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id j6so8381452qvn.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Nov 2022 08:11:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3qeKKX8/1SP5hO8plPxrx+ufL2uDqReCD6BAcJfEpA=;
        b=Vz9dqfT/h9ZiBrV40J9zx+3kTpmyyWl3r9LPHfoFO6+PncypNlxCrvaX+d2YNS/5PP
         +rja0YY12qGWzTzukTJGh8DYyQEhW3hHUqgqW2uCDBet6v/wYdtZ9Up3gVjBNMZh4eTw
         NB7AXNHZYjb4qJ+5VXkiw46E+S6Tw5eySyS96OuteJb8htV7/kIZd2f5z5JrBHeV9PtQ
         ylvd/WIBrVbqpX1jQcqM2YOcEpW7VfTbZqn82VsF4yEhb/2OuIs+Ya7S/YUJL4I09rh5
         ZgzLJOZT/g1SSunumITwpR4lK3d2tD9GKSUBajPWnmd0GY7xj7db40E7zwv3afQdZm9f
         gb6A==
X-Gm-Message-State: ACrzQf1Iuq89tXocEOGRwl6Lni+AGw9DknmpZjZiIBU7UNl+jEIlFW62
        xF6VeCHLfulYQAD9k6US6srhSeoTxs/Y8w==
X-Google-Smtp-Source: AMsMyM7Q2IJfhlFj0gZqRR9Fbifmz5C2Ak1/v4PNtcRS/DBJoHoEuv0b4umkPmdM6PbMPx1tGpIpfQ==
X-Received: by 2002:ad4:5f8d:0:b0:4bb:6d57:cfea with SMTP id jp13-20020ad45f8d000000b004bb6d57cfeamr45275213qvb.98.1667837490864;
        Mon, 07 Nov 2022 08:11:30 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id w27-20020a05620a0e9b00b006ee949b8051sm6950243qkm.51.2022.11.07.08.11.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 08:11:30 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-367cd2807f2so109154537b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Nov 2022 08:11:30 -0800 (PST)
X-Received: by 2002:a0d:e301:0:b0:374:a8ba:99b0 with SMTP id
 m1-20020a0de301000000b00374a8ba99b0mr2612154ywe.358.1667837490296; Mon, 07
 Nov 2022 08:11:30 -0800 (PST)
MIME-Version: 1.0
References: <20221103143440.46449-1-wsa+renesas@sang-engineering.com> <20221103143440.46449-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20221103143440.46449-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Nov 2022 17:11:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHFqhqunJROdTUW5EeYTBu85GGcTFVaxS9w35tcR3kVQ@mail.gmail.com>
Message-ID: <CAMuHMdVHFqhqunJROdTUW5EeYTBu85GGcTFVaxS9w35tcR3kVQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r8a779f0: Fix SCIF parent clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org
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

On Thu, Nov 3, 2022 at 3:34 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> As serial communication requires a clean clock signal, the Serial
> Communication Interfaces with FIFO (SCIF) is clocked by a clock that is
> not affected by Spread Spectrum or Fractional Multiplication.
>
> Hence change the parent clocks for the SCIF modules from the S0D12_PER
> clock to the SASYNCPERD4 clock (which has the same clock rate), cfr.
> R-Car S4-8 Hardware User's Manual rev. 0.81.
>
> Fixes: 24aaff6a6ce4 ("clk: renesas: cpg-mssr: Add support for R-Car S4-8")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
