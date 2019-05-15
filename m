Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00F2A1EA99
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 11:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbfEOJEH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 05:04:07 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:44007 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbfEOJEH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 05:04:07 -0400
Received: by mail-vs1-f65.google.com with SMTP id d128so1181649vsc.10;
        Wed, 15 May 2019 02:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gkTbiQzGF1k2N99naRD8r5aIjsz3VLc+98eg7EfqOTI=;
        b=ucA96ZVdsOdVIsCNX+zdzEELNXcoreMVokEj8OVI1JTMXj4q2Af/NmGDrJmcxa4JRh
         H/FK07aA6JyaVchhfLb9m6naJ6PpCZP4UIJi+zNXT2BHWiRryBy3z0rxJ7ki2deWHGIW
         4LlvkKzaqL4v5kHn+TeP5hQCipd6qJ8T1yH7hvNEWwow/65zTiqsgukxyRoSdqHhTXNP
         DbLPAihpiDiYCvAXMeS9mSM/FNA/Yj8nXfscw11079kfY13cAS6njzJGSVATNcqnasN+
         jmn7/idcc42rZeUZ82VwP3inDSWft0U3Hosylar472wzq1uF0Z3zTOEpbzztouy+nVtf
         xbjg==
X-Gm-Message-State: APjAAAUusjfvWJqpUDR/HIIzRsCayuwJzYtDXHOGk1Gydnyc1+7QXzbO
        UKyP3+Wi7C0GAzQMIVEDJf2xpivY4cJ3TTy6UdM=
X-Google-Smtp-Source: APXvYqztnkymczgKnMVRe9ZCvVpmL+kBZMs2zWM/eCWYj13BUyDK4j+nFEPaMRWT1Ux/G56HvMqtlcdU69dOK5Yo7fs=
X-Received: by 2002:a67:8e03:: with SMTP id q3mr19981536vsd.152.1557911045761;
 Wed, 15 May 2019 02:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-5-chris.brandt@renesas.com> <CAMuHMdVVu23_8=8CLwM46QAJsxUbYyN1TYQaAzoE+d2uM3YshQ@mail.gmail.com>
 <f4ceaadb-62e1-9880-e8e3-4f5bf54ce91e@cogentembedded.com>
In-Reply-To: <f4ceaadb-62e1-9880-e8e3-4f5bf54ce91e@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 May 2019 11:03:54 +0200
Message-ID: <CAMuHMdWDr0KwrqukgMC=UiMqW4YLF76sag-Jr_fJFfhkggjeKw@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use of usb_x1
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
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

Hi Sergei,

On Wed, May 15, 2019 at 10:39 AM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 15.05.2019 10:35, Geert Uytterhoeven wrote:
> >> Document the USB_X1 input and add clock-names to identify
> >> functional and USB_X1 clocks.
> >>
> >> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> >> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> >> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> >> @@ -28,7 +28,11 @@ Required properties:
> >>                followed by the generic version.
> >>
> >>   - reg: offset and length of the partial USB 2.0 Host register block.
> >> -- clocks: clock phandle and specifier pair(s).
> >> +- clocks: clock phandle and specifier pair(s). For SoCs that have a separate
> >> +          dedicated USB_X1 input for the PLL, that is also listed.
> >> +- clock-names: Name of the clocks. The functional clock shall be called "fclk"
> >
> > Names?
>
>     And I think the module clock name was "fck", not "fclk"...

Indeed, sorry for missing that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
