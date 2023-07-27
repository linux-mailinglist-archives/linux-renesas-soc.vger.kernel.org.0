Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC2B97649DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 10:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233733AbjG0IEA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 04:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233848AbjG0IDL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 04:03:11 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ACDD30E8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 01:01:00 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-583b0637c04so8817227b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 01:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690444859; x=1691049659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKI/0muyQ68eiYvRFSQFrbKff4BpnpTfrENBxrIEOLA=;
        b=aHhA9YPgWRKxbylwPMALx7IB8s38z3OEcqlkUiQWzu8xO0973jbyeeBgaAZ2Vb8DZY
         srsCSo613Trz7XLPPl/9uhWrc5U3IDQcAbmENnoB2hh0AKtCV1jFZfYe65VLQvXRWp1/
         WutACNnxhhsguPEYimDNrY4SQLOjvnxnpav5wlK4j7mCGxd2RBZ0hdZd17v17tBL5Ibw
         jRe05CEJFiyTFUenIcezyn29Zxy2uSHHI5+NgJ10ADLK3UT63Tb67r7pTfpEq1AQsZzQ
         RJaX0V0Zqs/q46H6vUrTnkQyxBSymTQ0LwlZOZw+9WYY9toFLKhQymFyC3kSFjUFPktS
         fThA==
X-Gm-Message-State: ABy/qLaZfGj7xUKruTVh+Hmr09j/QATTVE5rybwaMQ71Au25oaCNK7PS
        EzwS3J8JO9eVOoF6MEfGKq7kgB4atsrB2g==
X-Google-Smtp-Source: APBJJlHIx6/f0ib7rwqPbbBqiT9zOX25L5OHBD3pOWL8dtG0lH5jvLvWt4I2ENfrTMwPJuaikGw4Uw==
X-Received: by 2002:a81:a088:0:b0:580:83fe:25cc with SMTP id x130-20020a81a088000000b0058083fe25ccmr2135281ywg.5.1690444859605;
        Thu, 27 Jul 2023 01:00:59 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id f7-20020a0dc307000000b005772fc5912dsm277553ywd.91.2023.07.27.01.00.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 01:00:59 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5768a7e3adbso27314107b3.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 01:00:59 -0700 (PDT)
X-Received: by 2002:a0d:cccb:0:b0:583:7564:49de with SMTP id
 o194-20020a0dcccb000000b00583756449demr2321537ywd.3.1690444859017; Thu, 27
 Jul 2023 01:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690382328.git.geert+renesas@glider.be> <d6ccbb7b7a73eb35f1e1a8d85adcf9f1f980b2c1.1690382328.git.geert+renesas@glider.be>
 <TYBPR01MB53412530BDC2567E23EDDF00D801A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB53412530BDC2567E23EDDF00D801A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Jul 2023 10:00:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNzY3bF5abQUqcUKSNxNsTnwQFqnczfRQ8tsqmDjVwPg@mail.gmail.com>
Message-ID: <CAMuHMdWNzY3bF5abQUqcUKSNxNsTnwQFqnczfRQ8tsqmDjVwPg@mail.gmail.com>
Subject: Re: [PATCH/RFT 3/3] arm64: dts: renesas: spider: Add keyboard to test IRQ[0145]
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
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

Hi Shimoda-san,

On Thu, Jul 27, 2023 at 7:48 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, July 26, 2023 11:45 PM
> >
> > Add an interrupt-controlled keyboard to test operation of the Interrupt
> > Controller for External Devices (INTC-EX) on the Spider development
> > board.
> >
> > Test procedure:
> >   - Run "evtest" (select device event number "0"),
> >   - Pull one of the following signals on the Spider Breakout Board low
> >     to trigger the corresponding interrupt and keypress (key release is
> >     automatic):
> >       - Test point CP18 -> IRQ0 (KEY_0),
> >       - Test point CP17 -> IRQ1 (KEY_1),
> >       - CN37 pin 4 -> IRQ4 (KEY_4),
> >       - CN37 pin 2 -> IRQ5 (KEY_5).
> >
> > GND is available on e.g. pin 8 of CN37 (MSIOF0 PIN HEADER).
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Not intended for upstream merge.
>
> Thank you for the patch! I got it.
>
> > I do not have physical access to a Spider development board.
> > Thanks for testing!
> >
> > Note that this IRQ conflicts with operation of LED7, so do not apply the
> > LED patch while testing.
>
> I also tested on my Spider board about IRQ4 and IRQ5.
>
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> # For the record. My environment is Spider ES1.2 board which has a switch board.
> # Since the SW3 pin 7 of the switch board is low, we cannot use CN37.
> # However, we can use the SW3 pin 7 instead.

Thanks for testing!
I will convert this to a DTS overlay, and will add it to my
topic/renesas-overlays
branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
