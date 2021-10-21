Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC00436002
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Oct 2021 13:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhJULNI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Oct 2021 07:13:08 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:46059 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbhJULNH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 07:13:07 -0400
Received: by mail-ua1-f50.google.com with SMTP id a17so324392uax.12;
        Thu, 21 Oct 2021 04:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=NiDoiN/gjYe+NR2j6ocH9JPnqQ+cVfUkoRHRlpOG3os=;
        b=UbPhpmYVB8xFVoyKBiZAkA+YTWWXvwU7JXNLzceUYabdfU3hV9h7E19CtK7ZNIbzgj
         /DX0ZxOOceW5djUnIghnbdOADuzCPUP8WqeuAZYaB/N50y9BLhtfNHmCUMFzE6aJGzL5
         IsPrXb+qTwgUX70g3HyQkD9pMx09/mTP3NzqI0BhbdpJkZyAXn90icLJkyIRZHy21RSc
         vc7wUDsCC2Lb7I6WER0RKF1YjuaLwT0wsWSMA0N83GbfqfYTnk7PDHYo4kTtwIDHntG7
         9xW1EAVJMOdsd855MsSNDA/V3Ao2f36cclugMPO0Q8U4Cbb0Wkb824Lv894ngwV/3yHq
         Pngw==
X-Gm-Message-State: AOAM5316iTCvV4qbWQx2EMY9BAEZ6ekEtx90BTWAS36nUQuxaGKB9vPz
        f67gTeDlSJWC2u4dPMT4GXoR6D2to0lMLg==
X-Google-Smtp-Source: ABdhPJzUdJ4ms7vTEULfRWp7IkYmuL5cOImhVVZVvfGiyDsx0h1Qrv7EABNgn+cJqZdJiLPkvVqnRw==
X-Received: by 2002:a05:6102:38cc:: with SMTP id k12mr5087861vst.24.1634814651397;
        Thu, 21 Oct 2021 04:10:51 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id b20sm2881390uaf.10.2021.10.21.04.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 04:10:50 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id i22so351404ual.10;
        Thu, 21 Oct 2021 04:10:50 -0700 (PDT)
X-Received: by 2002:ab0:3d9a:: with SMTP id l26mr5561151uac.114.1634814650361;
 Thu, 21 Oct 2021 04:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com>
 <20210928200804.50922-5-wsa+renesas@sang-engineering.com> <CAMuHMdUdjNXkW-F0-aPR-o6uQaHsYz=yKf6RhC2tvxRpdhDzhw@mail.gmail.com>
 <YXE5597s0BigDNzu@ninjato>
In-Reply-To: <YXE5597s0BigDNzu@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Oct 2021 13:10:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXgWvP+mj-1uUqS0JYCe_FOo3Hr5DfafJ-eUX07VK4qw@mail.gmail.com>
Message-ID: <CAMuHMdVXgWvP+mj-1uUqS0JYCe_FOo3Hr5DfafJ-eUX07VK4qw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/9] clk: renesas: gen3: switch to new SD clock handling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Oct 21, 2021 at 11:59 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +       return clk_register_divider_table(NULL, name, parent_name, 0, sdnckcr,
> > > +                                         0, 2, 0, cpg_sd_div_table, &cpg_lock);
> >
> > So the SDn clock can no longer be disabled, as CPG_SD_STP_CK
> > handling is gone?
>
> Yes. I thought we can do it since we had 7f2c2f38c1c0 ("clk: renesas:
> rcar-gen3: Remove stp_ck handling for SDHI") anyhow.

OK.

> > > +       /* Fallback for old DTs */
> > > +       if (of_device_is_compatible(pdev->dev.of_node, "renesas,rcar-gen3-sdhi"))
> >
> > I think it would be cleaner to check a flag in struct
> > renesas_sdhi_of_data instead.
>
> Because new SoCs with the fallback compatible might show up?

Because it's frowned upon to sprinkle of_device_is_compatible()
calls all over the code, especially if you already use
of_device_get_match_data().

> > >          * Some controllers provide a 2nd clock just to run the internal card
> > >          * detection logic. Unfortunately, the existing driver architecture does
> >
> > The core looks good to me, but I have to admit I'm no expert on the
> > SDHn/SDn clock relations and the various SDHI transfer modes.
>
> I am really glad you like the changes in general. And you point to the
> reason for this change. All the clock relations of the SDHI transfer
> modes should go into the SDHI driver. Now, we can control SDnH and SDn
> seperately, so the SDHI driver can do the proper things depending on the
> mode and the quirks of the SDHI instance. I really think the clock
> driver part should be as simple as it is with this series.

Good!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
