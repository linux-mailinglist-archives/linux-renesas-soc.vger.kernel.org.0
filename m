Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1FBF4C457B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Feb 2022 14:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbiBYNKH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Feb 2022 08:10:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238394AbiBYNKG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Feb 2022 08:10:06 -0500
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8218D1EDA22
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 05:09:24 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id k15so1511079vkn.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 05:09:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oeq2ONLGG3h3lj8t5+SMf+zJrPhy6U1u2BSsBLm1qmA=;
        b=TaJxXuQnm6MHq26KC4bUib1AuYNtVRo6T05VBp6N9KUHYDi8QWvETJgSdunD/fMm2X
         085nDTeFrH4iFsnQuU/9omQo3hswMpzHIwcwzy+1YUB8tRir8QhjPYnPrHYLc3Zv8ZAE
         kOfp5GYb6QeKgIYSRBRjSCEerii87yVvv9aTEmRPfTI+vMVWroR+6Hqvmj1OVA975/cH
         5NVwOQhEU1ZMMeeRCd2HaLoauRs2xFBdh1zkPwjybp9jhVTNywzGuL2iBFLXsiyAcQyS
         Iw94l0IoX6I4eXlHZAa33Um6IvNOJelRH2V8GUeQP0eqVbqhYSuxP9QCCJds0k/st4FM
         UO6w==
X-Gm-Message-State: AOAM533mfkQfOP/gWSys5SE9w56+XWVI5l3i00Nxh8eW1AzcokSM6eFJ
        clBnXsVmYSzMjFr1kxiRx/qzjuX0JIDz5Q==
X-Google-Smtp-Source: ABdhPJwEtCbkqsbw35bE2tt5Hpofi970hz13KrpSc8ytA06wUGSNlr3dWe0CjU4Va7p545woNpEOYg==
X-Received: by 2002:a05:6122:506:b0:331:135d:6120 with SMTP id x6-20020a056122050600b00331135d6120mr3428513vko.12.1645794563436;
        Fri, 25 Feb 2022 05:09:23 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id e20-20020ab02b14000000b00345f0381ddcsm428575uar.0.2022.02.25.05.09.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 05:09:23 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id g15so2418431ual.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 05:09:22 -0800 (PST)
X-Received: by 2002:a9f:360f:0:b0:341:8a12:8218 with SMTP id
 r15-20020a9f360f000000b003418a128218mr3152585uad.14.1645794562770; Fri, 25
 Feb 2022 05:09:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645458249.git.geert+renesas@glider.be> <TYBPR01MB5341FE6A3F2204112B05B3E4D83E9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341FE6A3F2204112B05B3E4D83E9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Feb 2022 14:09:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUp1sAB6sgYrwj0CR4CP5g+FKvnxt4iC9c=iKUckQhqpA@mail.gmail.com>
Message-ID: <CAMuHMdUp1sAB6sgYrwj0CR4CP5g+FKvnxt4iC9c=iKUckQhqpA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: renesas: Add R-Car S4-8 Pin control support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
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

Hi Shimoda-san,

On Fri, Feb 25, 2022 at 1:49 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, February 22, 2022 12:49 AM

> > This patch series adds pin control support for the Renesas R-Car S4-8
> > Soc on the Spider board, and enables pin control for the serial console.
> >
> > Changes compared to v1[1]:
> >   - Drop register banks 4-7, as they can only be accessed from the
> >     Control Domain.
> >
> > Serial console and I2C[2] have been tested on the Renesas Spider
> > development board.
> >
> > Thanks for your comments!
>
> Thank you for the patch! All patches look good to me. So,
>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thank you, queuing in renesas-devel for v5.18.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
