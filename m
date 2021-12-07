Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4E5846B572
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Dec 2021 09:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232304AbhLGISL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Dec 2021 03:18:11 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:35781 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbhLGISL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 03:18:11 -0500
Received: by mail-ua1-f53.google.com with SMTP id l24so24991714uak.2;
        Tue, 07 Dec 2021 00:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Im/95wWBcL00BOGyJ9v1SQD2hiUfJwtvdeae0rhshHE=;
        b=pdQyizk0M/y/OG+6k3bfvao53q+vf8Asj5c/VBknCclJ9Rdz/9OsZF9GuLteauXjxg
         KELcOkB/ucQJ5Nl0g6sxVD/+ZIPc3hLrjK95URsBYXIfMeTtZ9ZWUdb7c/p3BwSCj/JZ
         aHhHboYEUuvh55B5sbOVaEnEMk2X8d7FjHfExm2gzyyp8GKxfaliWWOYf0vaQXaNoc70
         5q4HROZcXAJuzTH7pXQfb30RTguTNm61UxmDsKUqq/1mFMZndYm+dLeXEN5hSSlahVq5
         fk1refeI+x/OGEcOkw41wmj9BTmpMEh+EOqgXbsaIJ1NwVqWXBeXIJh+tEPimR2yFhi1
         pWtw==
X-Gm-Message-State: AOAM530/25EkD7ev4YbG1c8/Skv5S2Jo5F77mNmRS3Oc42JC/kqCMqu5
        XXzWBO6lV2w77Hr2kKoIp5Xsy2JACOzFeg==
X-Google-Smtp-Source: ABdhPJwfhqaEVZSPptMLitDEQsKZKPeQ3X58rJg8Lc8+M9BdyHZvSgFjPf6GCOyyCGD0jjrHHBGcQQ==
X-Received: by 2002:a67:efd5:: with SMTP id s21mr43500967vsp.73.1638864880601;
        Tue, 07 Dec 2021 00:14:40 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id t5sm5946298vsk.24.2021.12.07.00.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 00:14:40 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id b192so8716974vkf.3;
        Tue, 07 Dec 2021 00:14:40 -0800 (PST)
X-Received: by 2002:a05:6122:2193:: with SMTP id j19mr49838152vkd.7.1638864880073;
 Tue, 07 Dec 2021 00:14:40 -0800 (PST)
MIME-Version: 1.0
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
 <20211201073308.1003945-9-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXwYqDO2q=SYC=r299QB0TRgga4-ijDCdA7tordBw1OUg@mail.gmail.com> <TY2PR01MB36922481D5C75272BA7B7D9ED86E9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36922481D5C75272BA7B7D9ED86E9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Dec 2021 09:14:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBNrWaXNLgA6q+19QQ5nSSnuM2r+VrsVMprM80heQm4A@mail.gmail.com>
Message-ID: <CAMuHMdVBNrWaXNLgA6q+19QQ5nSSnuM2r+VrsVMprM80heQm4A@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] clk: renesas: rcar-gen4-cpg: Introduce R-Car
 Gen4 CPG driver
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Dec 7, 2021 at 2:51 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Monday, December 6, 2021 9:43 PM
> > On Wed, Dec 1, 2021 at 8:33 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > According to the official website [1], the R-Car V3U SoC is based
> > > on the R-Car Gen4 architecture. So, introduce R-Car Gen4 CPG
> > > driver.
> > >
> > > [1]
> > >
> > https://www.renesas.com/us/en/products/automotive-products/automotive-system-chips-socs/r-car-v3u-best-class-r-car-v
> > 3u-asil-d-system-chip-automated-driving
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> > > +#define DEF_GEN4_Z(_name, _id, _type, _parent, _div, _offset)  \
> > > +       DEF_BASE(_name, _id, _type, _parent, .div = _div, .offset = _offset)
> >
> > Is there any specific reason _type is not fixed to CLK_TYPE_GEN4_Z,
> > like before? Perhaps you have a future use-case in mind?
>
> This is a similar definition with DEF_GEN3_Z. And, there is not

Right. And we never finished ZG clock support upstream, due to issues
with upstream GPU support.

> upstream use-case though, if we support ZG clock, we have to use
> _type for ZG like Gen3 BSP. In Gen4, we will support ZG clock
> on other SoCs in the future, the _type is not fixed.

OK, will keep.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
