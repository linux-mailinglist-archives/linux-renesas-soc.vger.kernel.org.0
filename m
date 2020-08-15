Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAFE245324
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Aug 2020 23:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729079AbgHOV6j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 15 Aug 2020 17:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728947AbgHOVv6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Aug 2020 17:51:58 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39132C08E819
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Aug 2020 03:28:45 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id f26so12446302ljc.8
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Aug 2020 03:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nkLgD7iEvbBky6d3/oef7jImu+P2rpQPLUTujy6Xnso=;
        b=j+5o5C/dlrGxkrEuO+EuFQ7sKWq2qNtTZnhtvTmI+Ld4yKE3EF4D2nLwDHrwFQVUSv
         kbQE7lto6PmlyY0WW8lNSD6i2BZRTcpHNp/m0SeF5EzK4YIS1ShuBcBm6/mSOfe5auCK
         cmgZgdv+QEQTBtjg36p2zxzkMdug3D6z+2smGaTmKUsj9o9eYmTov12HivIki6SK79xo
         VvhVU5VZRSvYuF/1i5FJjiE7L05J2GOP6pJm+bnc8HysP8PtYx1GpmJblJBvByUVLQLw
         yW3OxtDGujv0wcGvX9aeiZ6RVIM5UzLvv5lqOjhKUc1E3104jw1dng7IP5pnAEP10MEa
         dmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nkLgD7iEvbBky6d3/oef7jImu+P2rpQPLUTujy6Xnso=;
        b=C61rhmjUoey2YRd0e9aj85tfNasrZRKLVXkA0QP97aRM6hzBpIwyYLmxMUaPEWh8VW
         mg1TbGVjf2WTQqJONzYcu7geHJC02VBp/ZQshyBm5wbY3gYuYX45W8UK3EfPFdBq7wuR
         Az64NubbGZ1LSu6M3R1mg00gbu3CECqrMxS3pFvju50Ka8pbxgBBvkCPYxG3s5XK1Grr
         +j0onS+7jqYLBV6WTkKOGEgC3dPJYe+BV6AFQzQLu/Od5qX4XjGgPOvommoWfxtP3EsG
         qQh4Be1QN4uZ4NjhjqZLq+zIWKoRdZ3j1zfXcszeMYsnorZCqh78idvsFyK1o0oXkxkM
         52xw==
X-Gm-Message-State: AOAM531opky47xpsjLcNpdaBHNCZfCMncySHouZI0s/+7N6VLSzNzlAl
        R67CdIho9uwl1BteTezv04cMPM/8Wyfy9J/e/Wi0yw==
X-Google-Smtp-Source: ABdhPJzABDyPO/xmYqNIMR2E89o8T9unT4yPsJuhrVXqrczY/Jat3KJnhjb8zhQgrTcdLhWN0elUL+likKcPWm4te7k=
X-Received: by 2002:a2e:8144:: with SMTP id t4mr3429779ljg.100.1597487323671;
 Sat, 15 Aug 2020 03:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200706150205.22053-1-geert+renesas@glider.be>
 <CACRpkdZD3gVLdcjaOL9ZCfZD+hrOUB0-q0NpoHu6m1Ujupw6Fw@mail.gmail.com>
 <CAK8P3a33AWe-fa8jJnRrme56Hgc-hLdNH4FK6FEPyZ0=O=vwtg@mail.gmail.com>
 <CACRpkdbxQrmNtByZ1cHSROyX7rwwaa2Mb=GQLpVcDi4FsZ06FQ@mail.gmail.com>
 <159546718359.3847286.13460778905630969897@swboyd.mtv.corp.google.com>
 <CACRpkdaN22OjWsG+d-hp_NEw==3VVAsWHkFsiG642KmbjD_6Mg@mail.gmail.com> <20200815091620.GV1551@shell.armlinux.org.uk>
In-Reply-To: <20200815091620.GV1551@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 15 Aug 2020 12:28:32 +0200
Message-ID: <CACRpkdY=d8n1TSaSEGomO_ReC3HZKBqwTU93iTVX+tnNHCJ6Kg@mail.gmail.com>
Subject: Re: [PATCH/RFC v7] ARM: boot: Obtain start of physical memory from DTB
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Kumar Gala <kumar.gala@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Eric Miao <eric.miao@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Laura Abbott <labbott@redhat.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 15, 2020 at 11:16 AM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
> On Fri, Aug 14, 2020 at 04:03:41PM +0200, Linus Walleij wrote:
> > But TEXT_OFFSET is also used inside the kernel to offset the
> > virtual memory. This means that when we set up the virtual
> > memory split, the kernel virtual memory is also bumped by
> > these 2 MB so the virtual memory starts at 0xC0208000
> > instead of 0xC0008000 as is normal.
>
> No.  Virtual memory starts without the 32KiB offset.  The L1 swapper
> page table starts 16KiB below (or slightly more if LPAE) for example.

Thanks Russell, I am struggling to learn these things. Slow learner.
I'm reading through the assembler line-by-line and trying to learn
things from the ground up now, let's see if I manage to get these
things eventually.

Best regards,
Linus Walleij
