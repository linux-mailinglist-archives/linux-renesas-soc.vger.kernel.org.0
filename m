Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC86F76504C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 11:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbjG0JvR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 05:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233571AbjG0Jug (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 05:50:36 -0400
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 626872D57;
        Thu, 27 Jul 2023 02:50:19 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-583a8596e2aso8209077b3.1;
        Thu, 27 Jul 2023 02:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690451379; x=1691056179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSOkOoKHfhkcM2bnkAGy8Q/iSlVgZMGyGgIwpENE1tg=;
        b=fqLH3zGBN5QfjoxNT82ayX5kRx+79mzDkp7jUXoQ9bUMLTaby8WryAh5w7YwEqMPgj
         McjvH67bA493mq3dMaWXJuT1+iVlXv65tqrKoHiwwMVNA2NMszSD68+tkzDk5UErl+bU
         uBavSwameac2kfAy/94ZyR1K1Dq4dklK0tXmF6/6Xo81ZLdr6se1YN1y/kXL8mjQqG3G
         reO2W3ujeMiIzeskojBv2qLE3nLVcGb/4zlkIma7u909dzPgJNnSOuirjmAKYM3A3IpW
         EU4j80ITkuKu8UHwlFHZEwd9w4ESHmAR+XNBOpKW2iYb2NVXKmKZ4bF/HK8fkjWvXzPP
         gOjw==
X-Gm-Message-State: ABy/qLZJgRNgwaAd0xUnq6VqiJggsDhfTOq7luLNEKerCU4zCS4lZtqF
        22dDwQ1dplwJBNChDwLh92wr11AJlGyAdw==
X-Google-Smtp-Source: APBJJlHAIBG0CKhG09enKj/u9keV2HN4Hicv5z42jzLUBAMXYWRqgcjNumSaCSQPRNWIIj2E8wDgdw==
X-Received: by 2002:a0d:d082:0:b0:583:b4fe:f9c7 with SMTP id s124-20020a0dd082000000b00583b4fef9c7mr4596821ywd.39.1690451378866;
        Thu, 27 Jul 2023 02:49:38 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id p1-20020a0de601000000b005612fc707bfsm304947ywe.120.2023.07.27.02.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 02:49:38 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-bff89873d34so645450276.2;
        Thu, 27 Jul 2023 02:49:38 -0700 (PDT)
X-Received: by 2002:a25:da4a:0:b0:c5d:1407:f2bc with SMTP id
 n71-20020a25da4a000000b00c5d1407f2bcmr4476933ybf.17.1690451378182; Thu, 27
 Jul 2023 02:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230705171000.85786-1-biju.das.jz@bp.renesas.com> <20230705171000.85786-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230705171000.85786-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Jul 2023 11:49:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHD+bEco=WYTYWsTAyRt3dTQQt4Xpaejss0Y2ZpLCMNg@mail.gmail.com>
Message-ID: <CAMuHMdUHD+bEco=WYTYWsTAyRt3dTQQt4Xpaejss0Y2ZpLCMNg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] drivers: clk: Add support for versa3 clock driver
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Biju,

On Wed, Jul 5, 2023 at 7:10 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for Renesas versa3 clock driver(5p35023).
> The clock generator provides 6 output clocks.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch, which is now commit 6e9aff555db7b681 ("clk: Add
support for versa3 clock driver") in clk/clk-next.

> --- /dev/null
> +++ b/drivers/clk/clk-versaclock3.c

> +enum vc3_clk {
> +       VC3_DIFF2,
> +       VC3_DIFF1,
> +       VC3_SE3,
> +       VC3_SE2,
> +       VC3_SE1,
> +       VC3_REF,
> +};

The bindings do not mention the mapping from clock indices to actual
outputs.  According to Table 3. ("Output Source") in the 5P35023
datasheet, I would expect the mapping to be 0=REF, 1=SE1, 2=SE2, 3=SE3,
4=DIFF1, 5=DIFF2.  But the above uses the order in the Block Diagram,
which is the inverse...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
