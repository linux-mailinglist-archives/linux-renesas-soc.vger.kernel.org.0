Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEA774DE66
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jul 2023 21:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjGJToW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jul 2023 15:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjGJToV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2023 15:44:21 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4CF187
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2023 12:44:20 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-576a9507a9bso88019597b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2023 12:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689018259; x=1691610259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uZ5W02ueWG+IUYzmbFoBLu4snW950fkRHW1ma7wlOE=;
        b=JxIcb9N7l3RTO5nZCFyS9Z3DKvYuZXaGLOGmMTHpJVp4yBDXxHCIZjNd9dHnvvJAUU
         g/cYY10uG8m9P47ojX9S3UupA/Lqq54aNH9A2XhsKKC1UUrSK+88NnDGuHPEkP8PX2IR
         KdCSl+c3VT2JnW82BkCqf43lpC4589d3b+VylWODzo2K897E+kZH7+NMlaDYGCvv0BIy
         honhCbqiIelq+8/38vDos1yljRVowyA4jVs0Metp0zZbtbP1w0R1m3nQSXduS+RhAJOF
         ECEJLK/uf8tE7uzXj3wzhgLKRGErbWSPFD+9H1mDZ2lN4raj3qPl8YR45iyg+OdwtcXj
         4rzw==
X-Gm-Message-State: ABy/qLYnyJECVUp4B+zNLb4xpMEgqbbURCDJOF5RNuvmERdFuXRtXQYY
        UXOgV61hImcjwhWIKX7h2xVgWi9EL/YAlw==
X-Google-Smtp-Source: APBJJlFkjzA2rEQkh5rO7KchfnzAkN8ny5synZg1YpJzq8Urd6jL0wE4byy2x9+XL/t2O4hEAhh9NA==
X-Received: by 2002:a81:9182:0:b0:569:e92f:72a with SMTP id i124-20020a819182000000b00569e92f072amr12879325ywg.16.1689018259183;
        Mon, 10 Jul 2023 12:44:19 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id e1-20020a0df501000000b0057085b18cddsm146509ywf.54.2023.07.10.12.44.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 12:44:19 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-c6e4d4c59bcso4959895276.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2023 12:44:18 -0700 (PDT)
X-Received: by 2002:a25:2387:0:b0:c12:29ac:1d35 with SMTP id
 j129-20020a252387000000b00c1229ac1d35mr12631904ybj.13.1689018258797; Mon, 10
 Jul 2023 12:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230703132343.353878-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWj1PTx3Fp=Wn0h+0hHRFRaTKCre=VMvCFCq=BE+HBE5Q@mail.gmail.com> <OS0PR01MB5922850408798D653B1ABE938630A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922850408798D653B1ABE938630A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jul 2023 21:44:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZ_R1G4L-Sd-KnsPsHCWJ5b+nFpV8ygPjD432281jVBw@mail.gmail.com>
Message-ID: <CAMuHMdUZ_R1G4L-Sd-KnsPsHCWJ5b+nFpV8ygPjD432281jVBw@mail.gmail.com>
Subject: Re: [PATCH] mfd: Add module build support for RZ/G2L MTU3a
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Jul 10, 2023 at 7:04 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Wednesday, July 5, 2023 12:44 PM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Lee Jones <lee@kernel.org>; Prabhakar Mahadev Lad
> > <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-renesas-
> > soc@vger.kernel.org
> > Subject: Re: [PATCH] mfd: Add module build support for RZ/G2L MTU3a
> >
> > On Mon, Jul 3, 2023 at 3:23 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Modified Kconfig to enable module build support for RZ/G2L MTU3a
> > driver.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > As drivers/mfd/rz-mtu3.c already has the needed MODULE_*() lines:
> >
> > drivers/mfd/rz-mtu3.c:MODULE_DEVICE_TABLE(of, rz_mtu3_of_match);
> > drivers/mfd/rz-mtu3.c:MODULE_AUTHOR("Biju Das
> > <biju.das.jz@bp.renesas.com>"); drivers/mfd/rz-
> > mtu3.c:MODULE_DESCRIPTION("Renesas RZ/G2L MTU3a Core Driver");
> > drivers/mfd/rz-mtu3.c:MODULE_LICENSE("GPL");
>
> You mean, I missed adding linux/module.h as I got compilation error
> While backporting to 5.10 cip kernel?

No, I didn't mean that.  I just clarified that the MODULE_*() machinery
was already there, so it's fine to make the driver modular.
I hadn't noticed the include was forgotten. Doh...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
