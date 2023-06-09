Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C31172A1D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jun 2023 20:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjFISKq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Jun 2023 14:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjFISKq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2023 14:10:46 -0400
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA61A30FE
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 11:10:44 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-39caf0082f3so209105b6e.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jun 2023 11:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686334244; x=1688926244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhvAcSD0d6hOhw2rDBySaaLriuCoWoL4zI2eR720VyI=;
        b=UCPFTFuCdbGUE08Zhc4eyuGwAmJMOGAfiJS8Seu7g5RiietQaEQyGAF9NteDjbvzYu
         wQZmTHsCP4myg6CimjWN8at7lz2bOzaMs2WpqbJ3R+9DliA3+LIBfpqejoECNiFNiQmK
         LwgrS4f8DlgE7e3EvPCVNoVNYUd+3CqbNGFFqoIMsjHaolZarIWtNXD4Hljq1fW3X7Ag
         zKpm6y4HaYlqPptwCHW0XMRQo8Q8C98qsFgRcUYnLOT39Bfoa3PfWQUNJT9KMaAaR04v
         qYi7Ix7jqr9g2BMRjLzqiqN4jPfU2HOQv3259ZlhZuciXnpOvhhE9oDaD9De/JsMjOrJ
         9oSA==
X-Gm-Message-State: AC+VfDywnvrNO4oh+oNSUE8u3Hz5zaDA4YWVWKqAe6kSNLB6DlTo3uqA
        8WsgStYNcaf9D7rpkrUOcw8TbikIBOIJnw==
X-Google-Smtp-Source: ACHHUZ4NqSfqPFwK8KO+huhJK64OU3W1K+Yn8ePjjuyeNVhTzKTMlev4CQcUG7sgCVBAuN0r74lT+Q==
X-Received: by 2002:aca:240c:0:b0:398:1047:9e3a with SMTP id n12-20020aca240c000000b0039810479e3amr2249770oic.25.1686334243862;
        Fri, 09 Jun 2023 11:10:43 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id t131-20020a814689000000b0055a07e36659sm726953ywa.145.2023.06.09.11.10.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 11:10:43 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-568f9caff33so19129347b3.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jun 2023 11:10:43 -0700 (PDT)
X-Received: by 2002:a0d:e80c:0:b0:561:be2a:43f9 with SMTP id
 r12-20020a0de80c000000b00561be2a43f9mr1943410ywe.41.1686334243353; Fri, 09
 Jun 2023 11:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686325857.git.geert+renesas@glider.be> <f54a30d7a9e2aa075d462db701a60b0b59c6ad0b.1686325857.git.geert+renesas@glider.be>
In-Reply-To: <f54a30d7a9e2aa075d462db701a60b0b59c6ad0b.1686325857.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 9 Jun 2023 20:10:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyeRop=kAebpYoqkVT1_6zk3Cd_LePrwvF0U4qhfgPiw@mail.gmail.com>
Message-ID: <CAMuHMdXyeRop=kAebpYoqkVT1_6zk3Cd_LePrwvF0U4qhfgPiw@mail.gmail.com>
Subject: Re: [PATCH/RFC 3/3] clk: renesas: emev2: Remove obsolete clkdev registration
To:     Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 9, 2023 at 6:10 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> EMMA Mobile EV2 is a multi-platform/CCF-only platform, registering all
> devices from DT, so we can remove the registration of clkdevs.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that this patch does not have a dependency on the two other patches
in this series, as (unlike the SH-Mobile LCDC driver) the EMMA Mobile
USB Gadget driver does not use any clocks.
The calls to clk_register_clkdev() were not removed before[*], as
(in theory) new EMEV2 board staging drivers using clocks could be added...

[*] I did write this patch in 2015, oh well ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
