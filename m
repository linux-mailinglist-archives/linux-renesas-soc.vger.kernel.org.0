Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F32F758FDBA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Aug 2022 15:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234976AbiHKNvV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Aug 2022 09:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234706AbiHKNvT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Aug 2022 09:51:19 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F8218D
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 06:51:18 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id c20so3655497qtw.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 06:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=b6AdDuCfaUtTIvkUtG4KFpz4/ve6HWdzpfNuLg1G0lk=;
        b=bDixxR7CKRkiw92sipfJ5kJWYOh72DBAZ6zHnk0Gki9VXoJSkLKaAUiZx7+jZMZ2d5
         Nx7M/1TTEU57t5KyhiEFR1PetiXLvkcMHMgJmWmfLrJDeTr9jVuwivDCXS1K4K71YN/7
         S0z4My/fYxaiLYRKz3WwgMjJky5Kzhfty9d5JusJxCa7KZKpLkjkfonldhrflnLRGoi5
         iwshTnJdAKQJeyiTQwD2fsERg5JLPknka+aG4l6ytqMY95WlqG7lR3xE0HOAEZTQ4AL+
         jp0yzOVbT/mFxre0DhGAcD4aoiLeYI7V3h5bMxhEUJbpj3o1V+eF/NitZIKptXqNIGHN
         f6+Q==
X-Gm-Message-State: ACgBeo1waygudfzbcnLV9XsVlXh9tjZ/p2APsmtSqu+vhWnb6AztfAzz
        c978ZPlofd9pFF5PAF8dIEGfB3P+6eFUVf2O
X-Google-Smtp-Source: AA6agR6PjPLsIXwrJqbtDGsVHHmsaBmlO8O0iBU1EcTITNR/vSSZHmdcUKCMcCf+VpZbAXNsfHdCgg==
X-Received: by 2002:ac8:5c05:0:b0:341:769a:808 with SMTP id i5-20020ac85c05000000b00341769a0808mr29664185qti.237.1660225877433;
        Thu, 11 Aug 2022 06:51:17 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id y15-20020a37f60f000000b006af0ce13499sm1919180qkj.115.2022.08.11.06.51.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 06:51:17 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 199so28299724ybl.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 06:51:17 -0700 (PDT)
X-Received: by 2002:a25:880f:0:b0:67c:2727:7e3c with SMTP id
 c15-20020a25880f000000b0067c27277e3cmr11441905ybl.36.1660225876820; Thu, 11
 Aug 2022 06:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <TYYPR01MB70863A585C9F2B2B4ECE85D3F59E9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <TYBPR01MB534150654E57593E823F0C2DD8609@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <TYYPR01MB7086B4D90C7BCA36E6EF156AF5639@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <TYBPR01MB53413344F30C38AAE3E7848DD8639@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <TYYPR01MB7086CAF683F47E888C09B514F5629@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB7086CAF683F47E888C09B514F5629@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 11 Aug 2022 15:51:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMjLfUz-6j3xwT=pDE39ShcUpdrBUQCS_JidaZo33ACw@mail.gmail.com>
Message-ID: <CAMuHMdWMjLfUz-6j3xwT=pDE39ShcUpdrBUQCS_JidaZo33ACw@mail.gmail.com>
Subject: Re: RZ/V2M USB
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Tue, Aug 9, 2022 at 12:10 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 08 August 2022 12:30 Yoshihiro Shimoda wrote:
> > > From: Phil Edworthy, Sent: Monday, August 8, 2022 4:27 PM
> > > > Hi Shimoda-san,
> > > On 08 August 2022 00:47 Yoshihiro Shimoda wrote:
> > > > > From: Phil Edworthy, Sent: Friday, August 5, 2022 10:10 PM
> > > > >
> > > > > Hi Geert, Yoshihiro,
> > > > >
> > > > > I'm a bit stuck with the usb3 drivers for RZ/V2M.
> > > > >
> > > > > The RZ/V2M USB3 is very similar to R-Car Gen3, the main difference
> > > > > being where the DRD registers are located and additional clocks,
> > > > > interrupts and resets exposed. The DRD registers are still part of
> > > > > the USBP address space, though they have been moved above the other
> > USBP regs.
> > > > >
> > > > > There is however, one big difference. On RZ/V2M, you can only
> > > > > access the corresponding registers for whatever DRD mode has been
> > > > > set in the DRD_CON register, PERI_CON bit. That is to say, when
> > > > > PERI_CON=1 (periph mode), reading from a USBH register will cause
> > > > > an abort, and when
> > > > > PERI_CON=0 (host mode), reading from a USBP register will cause an
> > > > > abort.
> > > >
> > > > Thank you for asking me about this topic. I have a question:
> > > > Can the DRD register be accessed from both PERI_CON=1 and 0?
> > > Yes, that is correct.
> > >
> > >
> > > > > This makes role switching rather difficult in Linux as the usb
> > > > > host hub code does some work in a delayed work queue, after role
> > switch.
> > > > >
> > > > > I am therefore advocating that users can only enable host or
> > > > > peripheral in DT, and role switching is not allowed. Is that
> > reasonable?
> > > > > How can I ensure only one driver is enabled?
> > > > >
> > > > > This unfortunately opens up another problem... So that the USBH
> > > > > driver can set the DRD mode, it needs access to the USBP address
> > > > > space. Could that be just be additional reg entry in DT for this?
> > > > >
> > > > > I'm not sure how to go about this, any advice appreciated!
> > > >
> > > > If the DRD register can be accessed from both PERI_CON=1 and 0, I
> > > > have an idea how to handle this.
> > > > # However, I'm not sure whether this is a correct way or not though...
> > > >
> > > > My idea:
> > > >  - Make a new role switch driver on drivers/usb/roles/ or
> > drivers/mfd/.
> > > >  - No describe any xHCI and USB3 UDC nodes in DT.
> > > >  - Describe whole USB3 registers for the role device in DT.
> > > >    (Or add sub nodes of xHCI and USB3 UDC into the role device.)
> > > >  - The role switch driver handles the DRD register at first.
> > > Ok
> > >
> > > >    And then, the driver adds xHCI or USB3 UDC device somehow.
> > > The role switch must shut down the USBH driver so that it no longer
> > > has the hub event work queue running.
> > > How can we do this?
> >
> > I'm sorry for lacking my explanation. My idea is:
> > - To enable host mode, add the USBH driver somehow.
> > -- JFYI. renesas_usb3.c calls device_attach() for it now.
> > - To disable host mode, remove the USBH driver somehow.
> > -- JFYI. renesas_usb3.c calls device_release_driver() for it now.
> >
> > So, I assume readding device_attach() for host can run the hub event work
> > queue again.
> Ok, this sounds reasonable.
> Let's see if Geert has any additional comments.

I think Shimoda-san is the actual USB expert here ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
