Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84238702606
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 May 2023 09:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbjEOH1u convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 May 2023 03:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233762AbjEOH1t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2023 03:27:49 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE2BA136;
        Mon, 15 May 2023 00:27:48 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-559e53d1195so177422287b3.2;
        Mon, 15 May 2023 00:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684135667; x=1686727667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/6AVCgaClZFIG6Sl6YBe+IqE4k4AYRkLLIyRiwqfwA=;
        b=XdEIGgRwlC1J6hL7C72Wwiom3mqB8SDR2Eb4l4wvamoW0r7p+1uW17Ek1bjA7USXmA
         RAeqmhbV9TN/neikCj7o93SKwt5kAYOshXpPbdnRiNfyJUmrnuef+KLm5iNbpcF62d50
         dKiLJ0t0ZX7zrqUR5H0ZtoAIzS/2BuPUHbqcp86ab1BOF8AIoNRGQE5CrsfyNERoXITq
         Jfd19Es/7Bji2G7EJlNoOGhEQqK5nTpPZ2keFB53kkWGzDn1bhKnZlNzWq8je7KSYsXi
         ntOKzey4XZFWab0eKchVHLXLrAtGXyuzmbTLfCxZcqeQtwb+cGvKw6/15v9X+qI80RlC
         GSuQ==
X-Gm-Message-State: AC+VfDyJs9IgfgnzL/7ZKaY1neOq+BJy8E7rvu5O0k36hdY1gr/ktqc9
        6vIfNcoaq/wMw6B2TGUuVRXa6Ih9N/pJEQ==
X-Google-Smtp-Source: ACHHUZ4sgc6g5if5q7TFT3/6TpXpmPnENWF+rNubDihVmrNe262gKtRF8aKX2qByRQzmG5NSS5YYNg==
X-Received: by 2002:a81:8443:0:b0:54f:179:cef2 with SMTP id u64-20020a818443000000b0054f0179cef2mr33551880ywf.19.1684135667396;
        Mon, 15 May 2023 00:27:47 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id p75-20020a0de64e000000b0055a9c2c8faasm7529855ywe.60.2023.05.15.00.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 00:27:46 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-559e53d1195so177421967b3.2;
        Mon, 15 May 2023 00:27:46 -0700 (PDT)
X-Received: by 2002:a0d:c205:0:b0:561:508b:b8f8 with SMTP id
 e5-20020a0dc205000000b00561508bb8f8mr3135287ywd.50.1684135666571; Mon, 15 May
 2023 00:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230514191959.706269-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20230514191959.706269-1-marek.vasut+renesas@mailbox.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 May 2023 09:27:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5xSJMBh6F69WM+sgg0wFy3x3zE_B_8JxnQMwG20NPiA@mail.gmail.com>
Message-ID: <CAMuHMdU5xSJMBh6F69WM+sgg0wFy3x3zE_B_8JxnQMwG20NPiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: vc5: Use device_get_match_data() instead of of_device_get_match_data()
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc:     linux-clk@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Boyd <sboyd@kernel.org>, Tom Rix <trix@redhat.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, May 14, 2023 at 9:20 PM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use device_get_match_data() which, unlike of_device_get_match_data(),
> is compatible with other firmware interfaces than just OF.
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Alex Helms <alexander.helms.jy@renesas.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Tom Rix <trix@redhat.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Explicitly include linux/property.h
>     - Add RB from Luca

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
