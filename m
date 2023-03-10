Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 635296B41D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Mar 2023 14:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbjCJN5f convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 08:57:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbjCJN5e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 08:57:34 -0500
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE18115DE2;
        Fri, 10 Mar 2023 05:57:13 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id ks17so3629161qvb.6;
        Fri, 10 Mar 2023 05:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678456610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMiBlchoca/bQ8itqv1mwM/wqhgD5JDMVkrJoE0rrgg=;
        b=6A7g0IodaW29IjfOTk9Ph26ZFa40oafmjLAZaTE+JC/kNbz+OUeC5aIECIbnA6GRKx
         Qt6PnotidaAMW1MK4I/mozG1rdvh60Jr0jJEd7QWhkav40NryQK6y/zzR/jpqHpJMvxp
         qTignE3aQJRyWMSrXcrHSSfEhaM/OgkmxZtbG2CPPp7Zt0ntQfnikQVRbKcyPtEeHocr
         N4ZACJAbCHoqNQH1TJ9Gw/Zda6AvUaxwHBmoxecuEqLRs+M5HNLO1HsH1PeNqeM1SPk1
         mh6CGQg258VwP1ffnbfUVUv56em6K/fMUzG46n0ATLft16p9WpeJdwtpeei4yV21PDif
         z5QQ==
X-Gm-Message-State: AO0yUKWrfh8m6A6SoSxgz3ehhfVFUtz8pSA5r9jQSxAdk6FLJK3Uy7jo
        je2iLvHwOU/tVId7W6G/E7uVxMpwAJ8BWw==
X-Google-Smtp-Source: AK7set+nmW6Czi0hBBbtQdBaQrHDmnmseEQAxywQ1EH8e59UBge7V0utRlvl+DDKH94by8yUvXTrRw==
X-Received: by 2002:ad4:5fcd:0:b0:583:91b3:198a with SMTP id jq13-20020ad45fcd000000b0058391b3198amr11601071qvb.2.1678456609794;
        Fri, 10 Mar 2023 05:56:49 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id w7-20020a05620a444700b0073bb00eb0besm1396745qkp.22.2023.03.10.05.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 05:56:49 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id e82so5297468ybh.9;
        Fri, 10 Mar 2023 05:56:49 -0800 (PST)
X-Received: by 2002:a5b:dc5:0:b0:b2f:bdc9:2cdc with SMTP id
 t5-20020a5b0dc5000000b00b2fbdc92cdcmr1331556ybr.7.1678456609077; Fri, 10 Mar
 2023 05:56:49 -0800 (PST)
MIME-Version: 1.0
References: <20230301215520.828455-1-ralph.siemsen@linaro.org> <20230301215520.828455-5-ralph.siemsen@linaro.org>
In-Reply-To: <20230301215520.828455-5-ralph.siemsen@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Mar 2023 14:56:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVbF9MgqUtQp1htFoyTKTXbvv38b854qQPQ5O0+8O4MCw@mail.gmail.com>
Message-ID: <CAMuHMdVbF9MgqUtQp1htFoyTKTXbvv38b854qQPQ5O0+8O4MCw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: renesas: r9a06g032: improve clock tables
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
> Each entry in the clock table specifies a number of individual bits in
> registers, for contolling clock reset, gaiting, etc. These reg/bit were
> packed into a u16 to save space. The combined value is difficult to
> understand when reviewing the clock table entries.
>
> Introduce a "struct regbit" which still occupies only 16 bits, but
> allows the register and bit values to be specified explicitly. Convert
> all previous uses of u16 for reg/bit into "struct regbit".
>
> The bulk of this patch converts the clock table to use struct regbit,
> making use of the RB() helper macro. The conversion was automated by
> script, and as a further verification, the compiled binary of the table
> was compared before/after the change (with objdump -D).
>
> The clk_rdesc_set() function now checks for zero reg/bit internally.
> This allows callers of that function to remove those checks.
>
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> ---
>
> Changes in v2:
> - Replace register shifts with multiply/divide
> - Unify the reg access in clk_rdesc_{get,set}
> - Restore the WARN_ON() check for clock gate
> - Swap field order in struct regbit, to exactly match the u16 values

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
