Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB701C9607
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2020 18:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgEGQJB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 May 2020 12:09:01 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41233 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgEGQJB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 May 2020 12:09:01 -0400
Received: by mail-ot1-f67.google.com with SMTP id c3so4930422otp.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2020 09:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t0K8vs72yigTHRzm0BSfWUHqQ0xe0cRz3PNKTO88ZD4=;
        b=N43HgYhhEXgUFYdIe6hXh9zmt48ZvTyKQWq+v6jHwo94qq0pR6reRUwl3tvze0VHyl
         5uF+G8hxaJinbMEebXyh2JnRsTFGlM7IAPfG8ExyjikVT8pEZP6aV6x/80s/rYBVF7VX
         CfGKAqLcMgc+UUXCxaqVEq8ix+Xh7jtnVw8Dt2taDIgsMNP5AlVRzWZ2CXY7XEf7rib6
         uSKpq/4wnuF2n9+fwhNEIPw9xc1oqXSrzY4T6wyotIFDU4hD91zK5v6nvHAnO8QTCPD9
         rYP5doULN9+sx4uypCdA6YvMNCKdWNDbjpFL2lLMxELG1jPsz3ogWt5Rm87Leocp9wn4
         nSKQ==
X-Gm-Message-State: AGi0Pua6dnLXkvOsT/YHv7b5GadbTBiI51nSVrxrWQ+qPPdnYM0vS+Dt
        GKUbOGSz3Jk5Of1nFc7v+pE5tarBOjQ8aD0BsDc=
X-Google-Smtp-Source: APiQypKboo6HnKejXqdk1NgWdxPwPTzOwiSIdgcKXBZANn92+pyqbneMiJ3vWt531aGuATbyy/UmGiGRM2c/eP7Qpyo=
X-Received: by 2002:a9d:7990:: with SMTP id h16mr10670188otm.145.1588867740863;
 Thu, 07 May 2020 09:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200507080528.547-1-geert+renesas@glider.be> <nycvar.YSQ.7.77.849.2005071056450.5637@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.77.849.2005071056450.5637@knanqh.ubzr>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 May 2020 18:08:29 +0200
Message-ID: <CAMuHMdXgpR6HDQs_NS4W2C8NxqJp3g1DjR2VneUF5Rvun-L4jQ@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: dts: rza2mevb: Upstream Linux requires SDRAM
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Nicolas,

On Thu, May 7, 2020 at 4:58 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> On Thu, 7 May 2020, Geert Uytterhoeven wrote:
>
> > As upstream Linux does not support XIP,
>
> What?

Not for an ARM v7 platform:

    config XIP_KERNEL
            bool "Kernel Execute-In-Place from ROM"
            depends on !ARM_LPAE && !ARCH_MULTIPLATFORM

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
