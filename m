Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 186251BF06
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 23:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbfEMVMX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 17:12:23 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:42330 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbfEMVMW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 17:12:22 -0400
Received: by mail-vk1-f193.google.com with SMTP id u131so3692589vke.9;
        Mon, 13 May 2019 14:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fwgxwzkPKpYer454wE1HmHZymSsd8lz9TRcTd3oW0lg=;
        b=fDh+bcgr8ANU8ngnJW/V7o+CXOWgGjoen/BS2MM8i5RnZN6DjAQXn7mhCZURADrA00
         HTivaSTAPsAVoz3TQpo4PxYKIAbLKQpoVvOa4l1LlqjmmwBgEHgXw72OBK6PLmhsBZ4h
         NJ0OMTbaStXKCJvn6gffdvd3Ibl9Gc0jfxloUHv9/lNfTllIPNn7eY5uIZGNBIzYvW+q
         FQLLaWrwSE/3sRFTf19TYkT1NyhHgq0/G1+8TQpX5uZTmKjKYkKDy7B6VoNSEL6bzD6m
         akAZGWkgLMc6g9Py00gyx36SF006/D2ev9It2dbSPMSg7UTxIe/ygQN+igPUiqvrs4SK
         gyzw==
X-Gm-Message-State: APjAAAVpPZWz5NpxDRXI4UjmuxOwmcWZrZka4IEXiuF8CluvZ6z5LZr4
        FPVMbREMwq6bbqvcQgGTVsYJeBCWtRfxkfIl+/s=
X-Google-Smtp-Source: APXvYqyP0rCQTfxCtmcCuNAjTKGz9jyDaM44zl+FM7Cg71IBHDYpWO8EK7OTfjifTS4CE5IP156+NEZ52GUrAjg+9CU=
X-Received: by 2002:a1f:2fd2:: with SMTP id v201mr2588876vkv.83.1557781941530;
 Mon, 13 May 2019 14:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-5-chris.brandt@renesas.com> <OSBPR01MB3174A8008FF1E216893398E8D80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
 <CAMuHMdVVoYak4FGEOYK_dGLCLEQ7avVCv5AcY43BPkDnt7OZ4w@mail.gmail.com> <TY1PR01MB15620F606FDE4AF0C446213E8A0F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB15620F606FDE4AF0C446213E8A0F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 May 2019 23:12:09 +0200
Message-ID: <CAMuHMdU5UaOXXkVVr88fCG2xO702RuYbbGeyNOPLFb01G6RU-w@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use of usb_x1
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Mon, May 13, 2019 at 11:07 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Fri, May 10, 2019, Geert Uytterhoeven wrote:
> > > I think we can reuse it like below:
> > >
> > > - clock-names: Name of the clocks. This property is model-dependent.
> > >   - R-Car Gen3 SoCs use a single functional clock. The clock doesn't
> > need to be
> > >     named.
> > >   - RZ/A2 uses a single functional clock as a separate dedicated 48MHz
> >
> > and a separate?
> >
> > >     USB_X1 input. So, the functional clock must be named "???" and
> > >     the USB_X1 input must be named as "usb_x1".
> > >
> > > What do you think? I'm not sure how to be named the functional clock so
> > that
> > > the sample is named as "???".
> >
> > We typically use "fclk" for the functional clock's name.
>
>
> Just to make sure I'm following this, here is what you are asking for:
>
> [r7s9210.dtsi]
>
>         usb2_phy1: usb-phy@e821a200 {
>                 compatible = "renesas,usb2-phy-r7s9210", "renesas,rcar-gen3-usb2-phy";
>                 reg = <0xe821a200 0x10>;
>                 interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&cpg CPG_MOD 60>, <&usb_x1_clk>;
> +               clock-names = "fclk", "usb_x1";
>                 power-domains = <&cpg>;
>                 #phy-cells = <0>;
>                 status = "disabled";
>
>
> [phy-rcar-gen3-usb2.c]
>         usb_x1_clk = devm_clk_get(dev, "usb_x1");
>         if (!IS_ERR(usb_x1_clk)))
>                 if (clk_get_rate(usb_x1_clk))

if (!IS_ERR(usb_x1_clk) && clk_get_rate(usb_x1_clk))

>                         channel->uses_usb_x1 = true;
>
>
> And then document this in the bindings, saying that clock-names is
> option if there is only 1 clock (to be backward compatible with existing

optional

> Device Trees.
>
> Is this correct?

Exactly!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
