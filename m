Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACD4C57CAD0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 14:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbiGUMnF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jul 2022 08:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233729AbiGUMnE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 08:43:04 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55A07AC00;
        Thu, 21 Jul 2022 05:43:03 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id mh14so1067209qvb.1;
        Thu, 21 Jul 2022 05:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nSQFNyggrgqfr6g1W8HcJNANHcvLUNjVJrR4s4mUm3s=;
        b=QugdAZ6vThX8GOEE9hlpvO2tIqBajOpJmImovjPZRB6b0hO0q2wvTxFv+R39B4F3IG
         p7FzlYWLtF5gzjiEHfOgAatYKjCeEZZMZktc3IX5GqSPVcZkHEQZlUDvPSeV/zbbwc0+
         s6H49cYCHAfD7u3d7k9kCQrXSV6EXJnMXKv/f8zB/8nFT+F4HuO810fN7vMrs2////P9
         UUCAvgbG7xNFAWz6ZjRx5SGlVxlptavRkG+Cox/jy8mtXoz9BsWxdGRpGg3JeSV5bXvY
         rAKkqShfXBm7F4gYoAiu8Z4A+bdHhTqYdkRm8oe/jG1//lcYduk18lUT4Nj6FNt4D1Qz
         6lbw==
X-Gm-Message-State: AJIora+UOEziXQ/R/ICFlfvimJ1KbQg3q+DMWgFqxOQDcxCdDfZnFnPP
        IWtFYop6ID6+d1ibP9XL2tGF64PpAK95EQ==
X-Google-Smtp-Source: AGRyM1shziXhG2i7HRb6hw9/rkqbEPYUJPBB/66rumDJC7iNZtq7jRzCGNW0OwYyCVD3fC80HkU/3g==
X-Received: by 2002:ad4:5bcb:0:b0:473:1d9b:5d25 with SMTP id t11-20020ad45bcb000000b004731d9b5d25mr34632071qvt.94.1658407382682;
        Thu, 21 Jul 2022 05:43:02 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id m12-20020a05620a290c00b006b5d9a1d326sm1451194qkp.83.2022.07.21.05.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 05:43:02 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-31e623a4ff4so15740137b3.4;
        Thu, 21 Jul 2022 05:43:02 -0700 (PDT)
X-Received: by 2002:a81:168f:0:b0:31e:6128:247d with SMTP id
 137-20020a81168f000000b0031e6128247dmr12033273yww.383.1658407381875; Thu, 21
 Jul 2022 05:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220718134458.19137-1-phil.edworthy@renesas.com>
 <20220718134458.19137-3-phil.edworthy@renesas.com> <CAMuHMdXuY_HOphyDtw4edZWu_D4QCi2hi-GWLF5R2jPNMHGcpg@mail.gmail.com>
 <TYYPR01MB7086F7C2A25D70EABB9BD338F5919@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB7086F7C2A25D70EABB9BD338F5919@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Jul 2022 14:42:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVaHXfyW27G7ZdRvg-VG1Gw4F2zJ1v8K4JuS1W_u5T4ng@mail.gmail.com>
Message-ID: <CAMuHMdVaHXfyW27G7ZdRvg-VG1Gw4F2zJ1v8K4JuS1W_u5T4ng@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: udc: renesas_usb3: Add support for RZ/V2M
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Adam Ford <aford173@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Thu, Jul 21, 2022 at 2:25 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 21 July 2022 13:10 Geert Uytterhoeven wrote:
> > On Mon, Jul 18, 2022 at 3:45 PM Phil Edworthy wrote:
> > > RZ/V2M (r9a09g011) has a few differences:
> > >  - The USB3_DRD_CON register has moved, its called USB_PERI_DRD_CON in
> > >    the RZ/V2M hardware manual.
> > >    It has additional bits for host and peripheral reset that need to
> > >    cleared to use usb host and peripheral respectively.
> > >  - The USB3_OTG_STA, USB3_OTG_INT_STA and USB3_OTG_INT_ENA registers
> > >    have been moved and renamed to USB_PERI_DRD_STA, USB_PERI_DRD_INT_STA
> > >    and USB_PERI_DRD_INT_E.
> > >  - The IDMON bit used in the above regs for role detection have moved
> > >    from bit 4 to bit 0.
> > >  - RZ/V2M has an separate interrupt for DRD, i.e. for changes to IDMON.
> > >  - There are reset lines for DRD and USBP
> > >  - There is another clock, managed by runtime PM.
> > >
> > > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/usb/gadget/udc/renesas_usb3.c
> > > +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> >
> > > @@ -363,6 +368,7 @@ struct renesas_usb3 {
> > >         bool forced_b_device;
> > >         bool start_to_connect;
> > >         bool role_sw_by_connector;
> > > +       bool r9a09g011;
> >
> > Any better name for this feature flag?
> Nothing springs to mind. We could use separate flags for has_resets,
> has_drd_irq, max_nr_pipes but I am struggling to come up with names
> for the offset registers and moved bits. Any suggestions?

OK, so "is_rzv2m"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
