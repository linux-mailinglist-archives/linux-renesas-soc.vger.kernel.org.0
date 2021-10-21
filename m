Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 253A743644A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Oct 2021 16:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbhJUOdC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Oct 2021 10:33:02 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:36433 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbhJUOdB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 10:33:01 -0400
Received: by mail-ua1-f43.google.com with SMTP id e10so1614021uab.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Oct 2021 07:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qKVl7QreEQRU9xLpEb/UURc1zUEMPSL5sFW4Bobws/U=;
        b=7LTjx8zwD2TUpSFZ/2QJjqcW4NMiisDWNa/vDOZGgIh7oeThJETFkTs9xO5AmCVA7+
         irGOU1DpWINKhuzpXO0nnYBrsXTbH00Zbk5a7Ql8j8NLTGW8mhMiOY82xFa/ubRPhwSi
         hz4QHChiqR/ABC5kIVbqARomm8uaDRqD7hFf9YJJHOuEl1KuRVSzdozAZiC39iJjouS0
         btakHhS5P3UAd/BRSCL2VgPnaLiNk2fBxMXJ3yIzQJuaMrCI/LTKrhkGlMWQTmhShrrJ
         wkPIbNPm66xGv4Ql2m7KxcLvJ3k3Zl8RpUmIN3SgYGnyBsTbW1kiVaPaKgFkPZONgXY8
         i0LA==
X-Gm-Message-State: AOAM531UD2Dfi6MA4TRQThkFZ4UDtTJKGlnd8WbLerT5GSqKNOWle3F1
        NmcbWt7+GJiTELYw5UG8WrVWE0BxRjvIrg==
X-Google-Smtp-Source: ABdhPJzT9tUn45/ONKOuOYwD8KfpX/kIqBMy2c9H0df6geLQ350RPdu7h858fmXASKDz8NoM/+65EQ==
X-Received: by 2002:a05:6130:426:: with SMTP id ba38mr6745665uab.108.1634826645410;
        Thu, 21 Oct 2021 07:30:45 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id g23sm3215769vkd.15.2021.10.21.07.30.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 07:30:45 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id bc10so410088vkb.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Oct 2021 07:30:45 -0700 (PDT)
X-Received: by 2002:a1f:5e84:: with SMTP id s126mr5949048vkb.7.1634826644879;
 Thu, 21 Oct 2021 07:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211012121117.61864-1-julien.massot@iot.bzh> <CAMuHMdUyO+L40hP5+uzeyY+Tn-9un-ignekzzqx=5Nd6DkJSxg@mail.gmail.com>
 <2df286a3-c805-c160-d656-5ab88b7ea3ba@iot.bzh>
In-Reply-To: <2df286a3-c805-c160-d656-5ab88b7ea3ba@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Oct 2021 16:30:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPpajirqtSwHkqphOqGgyf-FKe5O3oMvY44fxjsuCdOw@mail.gmail.com>
Message-ID: <CAMuHMdXPpajirqtSwHkqphOqGgyf-FKe5O3oMvY44fxjsuCdOw@mail.gmail.com>
Subject: Re: [PATCH v3] soc: renesas: rcar-rst: Add support to set rproc boot address
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julien,

On Thu, Oct 21, 2021 at 2:52 PM Julien Massot <julien.massot@iot.bzh> wrote:
> >> +/*
> >> + * Most of the R-Car Gen3 SoCs have an ARM Realtime Core.
> >> + * Firmware boot address has to be set in CR7BAR before
> >> + * starting the realtime core.
> >> + * Boot address must be aligned on a 256k boundary.
> >> + */
> >> +static int rcar_rst_set_gen3_rproc_boot_addr(u32 boot_addr)
> >
> > phys_addr_t?
> Not sure, in the remoteproc subsystem the boot address is in the
> remote processor address space, which can be a different mapping than the host
> processor. On Gen3 both the realtime and the application cores share the same address
> map. (excepted for 64 bits address)
> So a physical address from the CA5x processors is the same on the CR7
> processor.
> My feeling is that it's better to keep u32.

> > Do you have a public user of this code, too?
> I have one that I plan to submit to the remoteproc subsystem once
> it will be possible to set the CR7 boot address.

OK.

> Please have a look there
> https://github.com/iotbzh/linux/blob/iot/for-upstream/rproc/drivers/remoteproc/rcar_rproc.c#L114
>
> In this function the remoteproc subsystem already fetched a firmware and parsed the elf file.
> The firmware entry point is stored in a u64 variable
> https://github.com/iotbzh/linux/blob/iot/for-upstream/rproc/include/linux/remoteproc.h#L550
>
> Then we can start the processor by deasserting the reset.

Given rproc defines this as u64, I think using u64 would be even better
than phys_addr_t.  I'd like to keep this as generic as possible, as
someone may want to do the reverse too (boot the CA5x from the CR7).
And of course there's also the SH-4A core on R-Car Gen2 ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
