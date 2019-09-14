Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A02D5B2C3E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2019 18:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727587AbfINQdT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Sep 2019 12:33:19 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37882 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727410AbfINQdT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Sep 2019 12:33:19 -0400
Received: by mail-ot1-f68.google.com with SMTP id s28so32156309otd.4;
        Sat, 14 Sep 2019 09:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=csicSOBwWD/lt5ReCElPr09wFUUWT0UUzG9jH7lsEiQ=;
        b=UIcxswiUICSjPVQzhM2TUfZ3WBWfDolKmjtfY72twMJMxsjg0bx74LexjsZPLXuz4Q
         YdmPvhTBol5wLZLn4vK7D8W8AM8tpJX1miJOm5t/CGNJn8rStDOsXkkO04ApjofeEKjC
         AHd1Carq3klwnewsaBPjRhTX4c8xQtIdAj8lQzZEW1kuPzMXFdZ5+N18elKUlhaNKwyC
         irFrfNq+66IXR7oJAPjc/Q3yaBcFbMecYDT3RmTfmNU49hBJohCq3bUKoPyzS9bghHo0
         u+sBeLMze1K1gGAOfRlgBmoF69wt2RNwufrJ56yls03rtVNITFdwOAqnH1hw0DBAdsSu
         wbQA==
X-Gm-Message-State: APjAAAW5zYDlhqBJfzcUYFzXp7VB2pwwN1c3iRzF5qAstIL7wIUtOoxP
        qU6MDQAY06EDjoFvVQUzJf9+LvZMS41OpkeheGY=
X-Google-Smtp-Source: APXvYqzqaFkja7ayWpzSZEkWjvf6csJlFNV2h8+vCyYc6c99t0iqIt5iDltGyVJzRNoNA7Mv4YGdOpuXEmKZJfZSLaQ=
X-Received: by 2002:a9d:5784:: with SMTP id q4mr6095107oth.107.1568478798715;
 Sat, 14 Sep 2019 09:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190907161634.27378-1-marek.vasut@gmail.com> <CAMuHMdXVhtE5Jmpu8QYv+P8pGtegr4MGhNGRwy4Y1wRQYmL2_Q@mail.gmail.com>
 <f1b11b42-99ee-0484-550e-8758ec6fa559@gmail.com>
In-Reply-To: <f1b11b42-99ee-0484-550e-8758ec6fa559@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 14 Sep 2019 18:33:06 +0200
Message-ID: <CAMuHMdWz05ALM745tpw=AT2Q30nXvQV39JXTATYTEoTmH1TSRQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Sat, Sep 14, 2019 at 6:06 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 9/9/19 1:18 PM, Geert Uytterhoeven wrote:
> > On Sat, Sep 7, 2019 at 6:16 PM Marek Vasut wrote:
> >> Add dma-ranges property into /soc node to describe the DMA capabilities
> >> of the bus. This is currently needed to translate PCI DMA ranges, which
> >> are limited to 32bit addresses.
> >
> >> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> >> @@ -330,6 +330,7 @@
> >>                 #address-cells = <2>;
> >>                 #size-cells = <2>;
> >>                 ranges;
> >> +               dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;
> >
> > Shouldn't the length be 0x80000000 (for all SoCs)?
>
> Or should that match the amount of DRAM below 32bit boundary ?

Which is 0x80000000, according to the memory area section for the
various R-Car Gen3 SoCs.

> > Or should we allow DMA to internal System RAM, too?
>
> I think we should include SRAM, yes.

So that needs a separate range.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
