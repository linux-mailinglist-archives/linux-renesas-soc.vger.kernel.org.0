Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB9665450
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2019 12:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbfGKKGo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Jul 2019 06:06:44 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40823 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727636AbfGKKGo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jul 2019 06:06:44 -0400
Received: by mail-ot1-f68.google.com with SMTP id e8so5246487otl.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2019 03:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R0Zco3jRU0pMWlen9tIYYNH+25dWZEVwB3Q8Jugg90U=;
        b=PevlBHQY9Kb1txYLkRpNxO3VGr44EWboYhIZstDSOYADtypwOPR1islZIDpZP54Tj7
         IBGBJCk+Gz/YyfbVN2eMtmJclN8opGrnvZPbI9Q2QaTiQ1V1D0HIqgqbVmH7ERU5ZbTZ
         jD3Yk2Q328Dik4wh00QTi46pO2rODg7iMcx50S4xA8IjdArU/OdpO0ZTAPpEIxJ3nWt5
         OxZv7BiD0rrwhGw5bYUP5u0tnZeVh3zmgS6V2i7AaOfbswlPQrUtnyLy+yj+1ZxYIvPx
         csNyRvhO6gQ2n5CweY2APzjOqly2FZuY8IKyxYdjQDJImwrckPDKLfeRzAEogzgkp3dF
         3ffQ==
X-Gm-Message-State: APjAAAW1u3btU/NHfNb4sJAkuk4yecpw2uFvz3EnyX8TaQApVy3i34G8
        +NRM9AKb4k9jj48rJodUXY9s+6F8YXCo/JI31PI=
X-Google-Smtp-Source: APXvYqzk12rKeD9I2fNi3LtCyL8iW/TIaYE9VUurx2vSsfOQD9az9NBAkzDcon1HhfeaxMfg0Y4kLr90jIcPV0I+fFw=
X-Received: by 2002:a9d:5c11:: with SMTP id o17mr2535470otk.107.1562839603400;
 Thu, 11 Jul 2019 03:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190704153726.10507-1-geert+renesas@glider.be> <TY1PR01MB1562B65595974A21F6751D9C8AF00@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562B65595974A21F6751D9C8AF00@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 11 Jul 2019 12:06:31 +0200
Message-ID: <CAMuHMdWG0w6c7ZF6JHWJ-46U3nYn5i3kg9-AF0jwx+KfvfKd-w@mail.gmail.com>
Subject: Re: [PATCH rza_u-boot-2017.05 0/2] rza2mevb: Allow using Ethernet
 when SDRAM is enabled
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Wed, Jul 10, 2019 at 9:16 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Thu, Jul 04, 2019 1, Geert Uytterhoeven wrote:
> > While this allows me to use TFTP, I still cannot boot my own non-XIP
> > Linux kernel (uImage with LOADADDR=0x0c008000), as it seems to crash in
> > the "blcs cache_on" in linux/arch/arm/boot/compressed/head.S.  A similar
> > kernel boots fine on RSK+RZA1.
>
> Maybe it is because of the fact that for RZ/A1, both the RSK and GENMAI
> boards are using CS2 so the SDRAM was located at address 0x0800000.
> But the RZ/A2M EVB has SDRAM on CS3, so the address is 0x0C000000.
>
>
> Here was a patch that I had to do back in our linux-3.14 kernel for
> those that were using CS3.
> https://github.com/renesas-rz/rza_linux-3.14/commit/86ee3b7bc1f5
>
>
> It looks like the current kernel has the same mask, and will need the
> same fix.
> https://github.com/renesas-rz/rza_linux-4.19/blob/master/arch/arm/boot/compressed/head.S#L207
>
>
> Does that fix your issue?

Thanks, that improves the situation. Now it continues to:

    Uncompressing Linux... done, booting the kernel.

and then it hangs.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
