Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841D924537E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Aug 2020 00:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgHOVvZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 15 Aug 2020 17:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbgHOVvK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Aug 2020 17:51:10 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A3DC03B3D8
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Aug 2020 02:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Y1H4KExg+Xxb97SUH1b1DBcijfRUO6lVoBXvieHFdbo=; b=fDTuEkmopPzKN+Nf+a5xb5WIe
        iB/WKM08ObT8zzPqMRIFh7z1pZcSOrM9N0SB0OrEK6KndpD6FIzAlV8VrUl3b0JOJJ/OJGFygRQ6q
        CxYtRKLMBTJAOtBC35WJGLUmtZZtsdYPeBbpld7zs/Mw4vGcHHTqLucoYhYQO5FryFqSdf6vzuqYL
        dhYmYUTD9oXOGqJeF6Yx5FBjNcPTYiRVJ4+1VtXCNMyKiEcKvOASxPj9DEe2wBrvXrYUtQaCaWZrt
        0QheXGiOStQ0vUn2dbqJcDgZH+837vZ285c7g0LP9nm11sSfrDRAPIZqOH3OTNhhllA80bcN4iqfw
        fbctn1Lcw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52758)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1k6sIc-0005Dj-ND; Sat, 15 Aug 2020 10:16:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1k6sIX-0006hf-1w; Sat, 15 Aug 2020 10:16:21 +0100
Date:   Sat, 15 Aug 2020 10:16:21 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>
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
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Eric Miao <eric.miao@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Laura Abbott <labbott@redhat.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH/RFC v7] ARM: boot: Obtain start of physical memory from
 DTB
Message-ID: <20200815091620.GV1551@shell.armlinux.org.uk>
References: <20200706150205.22053-1-geert+renesas@glider.be>
 <CACRpkdZD3gVLdcjaOL9ZCfZD+hrOUB0-q0NpoHu6m1Ujupw6Fw@mail.gmail.com>
 <CAK8P3a33AWe-fa8jJnRrme56Hgc-hLdNH4FK6FEPyZ0=O=vwtg@mail.gmail.com>
 <CACRpkdbxQrmNtByZ1cHSROyX7rwwaa2Mb=GQLpVcDi4FsZ06FQ@mail.gmail.com>
 <159546718359.3847286.13460778905630969897@swboyd.mtv.corp.google.com>
 <CACRpkdaN22OjWsG+d-hp_NEw==3VVAsWHkFsiG642KmbjD_6Mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaN22OjWsG+d-hp_NEw==3VVAsWHkFsiG642KmbjD_6Mg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 14, 2020 at 04:03:41PM +0200, Linus Walleij wrote:
> But TEXT_OFFSET is also used inside the kernel to offset the
> virtual memory. This means that when we set up the virtual
> memory split, the kernel virtual memory is also bumped by
> these 2 MB so the virtual memory starts at 0xC0208000
> instead of 0xC0008000 as is normal.

No.  Virtual memory starts without the 32KiB offset.  The L1 swapper
page table starts 16KiB below (or slightly more if LPAE) for example.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
