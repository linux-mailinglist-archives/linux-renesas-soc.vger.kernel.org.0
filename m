Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B01F65A23B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Aug 2022 11:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245227AbiHZJHQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 05:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245058AbiHZJHP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 05:07:15 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA6CD5994
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 02:07:15 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id m5so667220qkk.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 02:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=PPD4SalAj3fscQurspIZb3N/65nZi22iVBYvZvkbYTU=;
        b=PIY7ziSNvvGg8wytE1Sgn9FUFIeUc3JswhpCkhFGqg3kx9xVP3sLwSfSwq+WlSw/fF
         cfut9SFtboanLBf3DZ2tZ09HE2pYZk05/40kM0njuXUzCf01z4w7qD+iPblLjSzvrMMt
         yNpl2bkuviLlq5w2K4+LSL7eoUTeF3F2yA7N3HRuxcjkqsQgndyobPaeUgPOmLmGmYkz
         ZfMR9GGQ5DLP0H/AXekf0Mo1nPXkzRNw0XV5DNLKuRKK38g+f7VCBmJeyb/VaHLnnDn4
         3SB+FKf/xJ9ACuBf9KgO4AOGwIxBPJBjKuOlASEVXKfJ/zSwYLBZ/6CN9/Bj2pdF/Kah
         zAAQ==
X-Gm-Message-State: ACgBeo3/nj0T9yHdrymICGr8OQhlhIzK4Vkqbg/s0ZuCdE+0Z9OjsH/C
        +tM2KQObYARyp11bbXVA7xI+87Kv5rFMLQ==
X-Google-Smtp-Source: AA6agR6KCCQ9Y/3FX/98ukdalPvY2z3kLiShfSQZ8GPxFEPk4bqRUYW0T1/YGTkW/JAg7l1SHSu+Og==
X-Received: by 2002:a05:620a:4042:b0:6bb:cdb:eef9 with SMTP id i2-20020a05620a404200b006bb0cdbeef9mr6033668qko.498.1661504834031;
        Fri, 26 Aug 2022 02:07:14 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id fu27-20020a05622a5d9b00b0031ee918e9f9sm935064qtb.39.2022.08.26.02.07.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 02:07:13 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-32a09b909f6so21442697b3.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 02:07:13 -0700 (PDT)
X-Received: by 2002:a05:690c:830:b0:33d:794b:e66c with SMTP id
 by16-20020a05690c083000b0033d794be66cmr7584668ywb.502.1661504833229; Fri, 26
 Aug 2022 02:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220824103515.54931-1-wsa+renesas@sang-engineering.com> <20220824103515.54931-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220824103515.54931-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 11:07:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU1GUwCEXZ_Hf=550BRC7GGRBt8786urg=vUMsqmbcdzQ@mail.gmail.com>
Message-ID: <CAMuHMdU1GUwCEXZ_Hf=550BRC7GGRBt8786urg=vUMsqmbcdzQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r8a779f0: Add MSIOF nodes
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Thanh Quan <thanh.quan.xn@renesas.com>
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

Hi Wolfram,

On Wed, Aug 24, 2022 at 12:36 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Duc Nguyen <duc.nguyen.ub@renesas.com>
>
> Add MSIOF nodes for R-Car S4-8.
>
> Signed-off-by: Duc Nguyen <duc.nguyen.ub@renesas.com>
> [thanh: added DMA and assigned-clock-rates]
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> [wsa: removed mso clock from clocks-property]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> Do we want the "assigned-clocks" here?

No we do not, as these are board-specific.

With these removed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
