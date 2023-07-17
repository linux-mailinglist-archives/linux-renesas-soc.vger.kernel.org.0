Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7EA756285
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 14:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbjGQMMH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 08:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjGQMMF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 08:12:05 -0400
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6BA8F;
        Mon, 17 Jul 2023 05:12:00 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6b886456f66so2358012a34.0;
        Mon, 17 Jul 2023 05:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689595920; x=1692187920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcpdNg9luYJKU2PES3Pp5gp+6cPB7H6tvdN5PYzz7zI=;
        b=Wn14qG207tdbmXT3shJMNPOkSiQJRSdJgHreHWvlk663bT6B2yKAUB7EopUO4gOGzm
         FY7t+CgjGarFwUTorK61SXoJ5hVONoheEuNdIu7qu/vhW6X/SUaPtN2FLAWszg0gzsI5
         XE2XQ6GDL1IcyMHvih9gPjEqoVitshT0KOBNPdbq9ejek45IBXLGIIO4kJtDMjw0Gfny
         da4tSGCEfrJbRPua08Dna9WfsFQHg2vekMUWfCOs1vF3vspMkLmynCNjM+/fdtzp/j3P
         toO1uo10UU0u8+0yKscjTgLLyzZ+ee/hGyorGzx7Jdcq4TjLTEPdRwCg9+nGXLX0+w3U
         MphA==
X-Gm-Message-State: ABy/qLZiHmZ9SAmULDFUPBG+tBW+nDIPLWN7Lbvu/Ixr6D2XOafvZg2m
        UIjCYwPS9Hqeuwho7FwwS2/Is436ZqJd6g==
X-Google-Smtp-Source: APBJJlFdL6c2GYS/NgQVQRaCOsFl1AP4rOWfXwvJ1cOjyjxAl1Cv5C7yWZkUEycw0R7V+1PHSx5ufA==
X-Received: by 2002:a05:6358:3412:b0:133:dd0:cae0 with SMTP id h18-20020a056358341200b001330dd0cae0mr2966135rwd.27.1689595919965;
        Mon, 17 Jul 2023 05:11:59 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id o11-20020a25730b000000b00cad44e2417esm2034964ybc.64.2023.07.17.05.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 05:11:59 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-cc4f4351ac7so2693002276.2;
        Mon, 17 Jul 2023 05:11:59 -0700 (PDT)
X-Received: by 2002:a25:361a:0:b0:cd2:c72e:ef30 with SMTP id
 d26-20020a25361a000000b00cd2c72eef30mr3675714yba.37.1689595919473; Mon, 17
 Jul 2023 05:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230714075649.146978-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230714075649.146978-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Jul 2023 14:11:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCqYn4PpJ0nGEXBPJfuSU1FfE9Yh7oFqPZhgJ068VcTA@mail.gmail.com>
Message-ID: <CAMuHMdXCqYn4PpJ0nGEXBPJfuSU1FfE9Yh7oFqPZhgJ068VcTA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a07g043: Add MTU3a clock and reset entry
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 14, 2023 at 9:57 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add MTU3a clock and reset entry to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
