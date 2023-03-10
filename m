Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADB06B4199
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Mar 2023 14:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbjCJNyn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 08:54:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbjCJNym (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 08:54:42 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B13010FBA6;
        Fri, 10 Mar 2023 05:54:41 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id s12so5640846qtq.11;
        Fri, 10 Mar 2023 05:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678456480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnUNSiXGbQH0bP9V2LCwGnWViLXgG1OKk6n06yFH75A=;
        b=o2eGGOOigT3kz84lib5dIq54FZCdODSFHBtyDRJE0Zk6lmRAnd65dsPD4uJP8GV9BH
         pY8mZVoeKaOZO8z9difuU6TG63sqpwH6SUKw1elfQ/ezDY5Pm0Ofq9FXlK/OziRq8gvu
         klF8pOewZ3bvpMDBlEgcwIdDkCkHP3PrjQUk3HGVhgCTbzpBzSqHVeCD0nnoxRd+UrxV
         l4ol4fTKKg9E4vtHME2rn5oudRtq9O4OZQXp8dGVuqeHjJJGa9uzJWlXWFLkEcKkTCvn
         yLM1qSPj/lGmISN1QxtZeU+EZi+C8k/1LjCMKuhVrjSmmGcBSTzcbQE8bVJKmc+P3CL9
         U0sA==
X-Gm-Message-State: AO0yUKWkJzHqTOJ8FWke1CxlTZimLFmRb9rmODHaU4GEZ9yy2r4G/vKB
        b8SqG29UcXu2iOU+SgTxU05zKo3N9csIqA==
X-Google-Smtp-Source: AK7set/hUzmLDeP4F9eIvtFBvW90p1qfAqy16uWpJ1tElf3ULiOy1nbggUAXZjowP+qPsslTkQeTMg==
X-Received: by 2002:a05:622a:111:b0:3a7:e2df:e868 with SMTP id u17-20020a05622a011100b003a7e2dfe868mr40375642qtw.41.1678456480281;
        Fri, 10 Mar 2023 05:54:40 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id z2-20020a05622a028200b003a527d29a41sm1432671qtw.75.2023.03.10.05.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 05:54:39 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id e82so5290229ybh.9;
        Fri, 10 Mar 2023 05:54:38 -0800 (PST)
X-Received: by 2002:a25:e406:0:b0:8ed:3426:8a69 with SMTP id
 b6-20020a25e406000000b008ed34268a69mr1382028ybh.1.1678456478500; Fri, 10 Mar
 2023 05:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20230301215520.828455-1-ralph.siemsen@linaro.org> <20230301215520.828455-2-ralph.siemsen@linaro.org>
In-Reply-To: <20230301215520.828455-2-ralph.siemsen@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Mar 2023 14:54:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWyeg_s4BtMvhCnNDX0QxN3--mh8CALnQ4YX9RWNvn_5Q@mail.gmail.com>
Message-ID: <CAMuHMdWyeg_s4BtMvhCnNDX0QxN3--mh8CALnQ4YX9RWNvn_5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] clk: renesas: r9a06g032: improve readability
To:     Ralph Siemsen <ralph.siemsen@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 1, 2023 at 10:56 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
> Several small readability improvements:
> - Move enum gate_type definition up and add comments to each field.
> - Use this enum instead of generic uint32_t type in clock desc struct.
> - Tidy up bitfield syntax and comments in clock desc structure
> - Reformat macros for building clock desc to have one assignment per line
>
> There is no functional change.
>
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
