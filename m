Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDC56FB0E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 15:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbjEHNFs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 May 2023 09:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbjEHNFr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2023 09:05:47 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE6FF3;
        Mon,  8 May 2023 06:05:46 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-559e53d1195so64468297b3.2;
        Mon, 08 May 2023 06:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683551146; x=1686143146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uSJGYV9GFIdCZLe/s3OwzCYwqA6eu909gh54b0Td/s=;
        b=HHmFr0ds6jFoptLSRp+TwXZiDFJckdveSQ4q8XgME3i3gU7FUKkMUZgqdLqpzk3Czf
         DV9X/Xf1nxU/oiB1jXbRik2uL5EXC5H6fnnCesBzU2qkag43hjiMYYnO1fqe/i9eqDZ6
         tr/ZaR2J4woonIe852g+wzpku2tW+nNFJ+dvAt2VTNy5WxWHiuVT2199tN/JNklW38HS
         1b/LeVWJx9hKI1DcODeLBfgBVPaVSFj95Mh1NlqAo+XS0A8wXpyFBdQ6stb5OHN4nxsN
         iWC8Wv/OOBit0H7PgOlyn8iGJn0USjtwO+OqbhFdknblp6ndk4P99SH0DcQUremiO7Jx
         YiOg==
X-Gm-Message-State: AC+VfDzpDOY7tUMYl1jiNWg9B6uhsufSSK4Icxv92QV5WwrxySzCjiNA
        naGe+4oYmWA/qZ8G9SbE+hULZp7Wf1GEJA==
X-Google-Smtp-Source: ACHHUZ608sMjklnVZunVOnXY0fj1ThMwXbc2mXpRlETsU+NTN+TY/5iLJR43X4jZlZT+fiVUHUMF9w==
X-Received: by 2002:a81:b409:0:b0:541:694a:4c69 with SMTP id h9-20020a81b409000000b00541694a4c69mr11775896ywi.52.1683551145714;
        Mon, 08 May 2023 06:05:45 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id k66-20020a0dc845000000b00545a081847fsm2500901ywd.15.2023.05.08.06.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 06:05:45 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-b983027d0faso5969623276.0;
        Mon, 08 May 2023 06:05:45 -0700 (PDT)
X-Received: by 2002:a05:6902:1204:b0:b9d:da66:e689 with SMTP id
 s4-20020a056902120400b00b9dda66e689mr14410112ybu.39.1683551144273; Mon, 08
 May 2023 06:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230507133906.15061-1-marek.vasut+renesas@mailbox.org> <20230507133906.15061-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20230507133906.15061-2-marek.vasut+renesas@mailbox.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 May 2023 15:05:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtaOMK_PDhmh3LvpOSpdqePhrDi18z6hJdyQBSSg8CXQ@mail.gmail.com>
Message-ID: <CAMuHMdWtaOMK_PDhmh3LvpOSpdqePhrDi18z6hJdyQBSSg8CXQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: vc7: Fix .driver_data content in i2c_device_id
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc:     linux-clk@vger.kernel.org,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, May 7, 2023 at 3:39 PM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The .driver_data content in i2c_device_id table must match the
> .data content in of_device_id table, else device_get_match_data()
> would return bogus value on i2c_device_id match. Align the two
> tables.
>
> The i2c_device_id table is now converted from of_device_id using
> 's@.compatible = "renesas,\([^"]\+"\), .data = \(.*\)@"\1, .driver_data = (kernel_ulong_t)\2@'
>
> Fixes: 48c5e98fedd9 ("clk: Renesas versaclock7 ccf device driver")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
