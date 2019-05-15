Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34801F69B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 16:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbfEOOdQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 10:33:16 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:41475 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbfEOOdQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 10:33:16 -0400
Received: by mail-vk1-f194.google.com with SMTP id l73so62740vkl.8;
        Wed, 15 May 2019 07:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jdr5AlkyYTyX76jZhGX+zwCh2jGBkaaQqRMD1/60QEU=;
        b=ACVA6tFldYaJ8U5bwzVYcLCGo5zZrB857DnDFdiYcqlgmdtMKIVdMBN95D05vvn3Ue
         ZavD1rBc4w48xMvN1wzouKtqN2c3WMimQ0WtXLpLAVRHwQ9n+ewGoLSh8OtEWL74mdHe
         nKGAnEy01tkSrf7P1cQY52ZXgO6u0P0qYNG6sUkTRPCctYuHrAoUD2HuY6JFZPJGnPtK
         f0S7dJc09o/gDhJ8dCp+VvpybX9Yn1+wYb0UfY5FttXylcCfMbCW0h0Ns76CpilI2a/B
         gFIL2kzWNdMpvfvpeeZFu/U1bEV4wXFJnEt9kDoUy7kjR2ME41YDSV45dGWvy16OpFUX
         qFWA==
X-Gm-Message-State: APjAAAUD3QJIjm+Ui8oYtQXQakGbiX8B5D7Wxg67/jQYi37baS44A3y4
        y3yM5LfiVMWylnol0bkWyiEh9dANFeTsVwm9zek=
X-Google-Smtp-Source: APXvYqy6447nz448r8vyvplsmvGD3gCEygHbvqvb+gG5z4RfN8t9qZVEOIhVI0pFdWRBnbWOIlA0SDVtlSlHyxYUw1A=
X-Received: by 2002:a1f:2fd2:: with SMTP id v201mr8382789vkv.83.1557930795092;
 Wed, 15 May 2019 07:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-16-chris.brandt@renesas.com> <CAMuHMdXx=7v5v3tHwS-01eNnzz6NSfs=M02jU1tNJMdcRbGScg@mail.gmail.com>
 <TYXPR01MB15689E3664801057DFCA09EA8A090@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB15689E3664801057DFCA09EA8A090@TYXPR01MB1568.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 May 2019 16:33:03 +0200
Message-ID: <CAMuHMdWLB-JE=2f=Mq9np_b5Wuj6=nB2ywWquBFheoBVxPaAfQ@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] ARM: dts: rza2mevb: Add USB host support
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Wed, May 15, 2019 at 4:03 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wed, May 15, 2019, Geert Uytterhoeven wrote:
> > > +/* USB-0 as Host */
> > > +/* NOTE: Requires JP3 to be fitted */
> >
> > This not applies to the dr_mode property below, right?
> > So perhaps it should be moved there...
> >
> > > +&usb2_phy0 {
> > > +       pinctrl-names = "default";
> > > +       pinctrl-0 = <&usb0_pins>;
> > > +       dr_mode = "host";
> >
> > ... like:
> >
> >     dr_mode = "host";    /* Requires JP3 to be fitted */
>
> OK, if you think it makes more sense there.
>
> > Does resistor R78 need to be mounted, too?
>
> By default, R78 and R79 are not populated on these boards, and both Host
> and Function work fine without board modification, so I would say
> populating R78 is not a requirement as far as I can tell.

I asked because after reading Section 2.4 USB Interface in the RZ/A2M CPU
Board  User's Manual, it's not clear to me when one needs to
populate one of these resistors. Especially in relation to JP3, which
talks about 2 possible modes (host vs. function), while the resistor
paragraph talks about 3 possible modes (dual-role vs. host vs.
function).

Perhaps I just need to drink more USB Kool-Aid?
(no Kool-Aid sold in local shops, though; we live on Coke ;-)

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
