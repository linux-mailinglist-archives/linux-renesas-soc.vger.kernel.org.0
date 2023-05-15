Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0FAD702608
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 May 2023 09:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233762AbjEOH2Z convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 May 2023 03:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbjEOH2Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2023 03:28:24 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8476AD9;
        Mon, 15 May 2023 00:28:23 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-559e2051d05so177208057b3.3;
        Mon, 15 May 2023 00:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684135702; x=1686727702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SoDPB/byKQ6HPKAt04qB+4IS3tH9nAH2dkJKJtq8Ig=;
        b=GoFSq4gODp913KrBSxsCwgVBECIMBddhuRhDujQoDyrjWBThNk9PUuC90kXVanZng7
         7n6gVpkMpVhK2x/s0LW2g+P9CZD25RaHenAP0zZT9x90o1ilu2Gq12JOQ9I/fQz69Gjo
         3Bl5vwZCmnluKhyyjYMyuyE8rW3/wJkOIaqghyKo29CBSXWAFcP7hh+8srFMdSwZrqh0
         GgIDCIRRGc5h5vAeY8F3+c2YwSFcch9MEbDuD3Z3fIRdQwtnAG+BY4YiA5gy33YzOv4e
         VFCnqmMEDkf91Q7ppupsf2vvBZkfyFCPsmmh+M+Vbjldb8nfORiamsodzYxDTFKJSuC5
         hzwA==
X-Gm-Message-State: AC+VfDyTAoUYzNP013eGsMjz7dv6YuW1gg2FiVoaKFW8kcjgxJ6BBs8T
        htZAbfTrZQaqFLLpH3MqEvYlayOf3j3r7A==
X-Google-Smtp-Source: ACHHUZ4Hrm7hwJWNPaOMaZd8lwF5JDaU4aoGymJrMv6MEMAEEc1OMgc2BoBlLwgkTJ14R2YJGLF/Yg==
X-Received: by 2002:a81:6cce:0:b0:55a:52e3:8dbf with SMTP id h197-20020a816cce000000b0055a52e38dbfmr35824528ywc.40.1684135702489;
        Mon, 15 May 2023 00:28:22 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id c68-20020a0df347000000b0054f83731ad2sm7606689ywf.0.2023.05.15.00.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 00:28:21 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-ba6e90e9199so5106255276.0;
        Mon, 15 May 2023 00:28:21 -0700 (PDT)
X-Received: by 2002:a25:cc48:0:b0:ba7:73c1:d38e with SMTP id
 l69-20020a25cc48000000b00ba773c1d38emr6057035ybf.3.1684135701405; Mon, 15 May
 2023 00:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230514191959.706269-1-marek.vasut+renesas@mailbox.org> <20230514191959.706269-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20230514191959.706269-2-marek.vasut+renesas@mailbox.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 May 2023 09:28:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoMZqG+wz9jDcDNjYiLXDm_X4+SabxBfE_etgVYUt0fA@mail.gmail.com>
Message-ID: <CAMuHMdUoMZqG+wz9jDcDNjYiLXDm_X4+SabxBfE_etgVYUt0fA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: vc7: Use device_get_match_data() instead of of_device_get_match_data()
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

On Sun, May 14, 2023 at 9:20 PM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use device_get_match_data() which, unlike of_device_get_match_data(),
> is compatible with other firmware interfaces than just OF.
>
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
> V2: Explicitly include linux/property.h

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
