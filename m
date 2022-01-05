Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797CA4853D6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jan 2022 14:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236608AbiAENxh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jan 2022 08:53:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiAENxg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jan 2022 08:53:36 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F258DC061761;
        Wed,  5 Jan 2022 05:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kkiD2VavxZn0Wp7PKH9hvugEiFMUM3igIeXBQopwOT4=; b=rq7v+suYAL6dyc31hydeUplLUX
        KPE/p4MAVHNZGCWbxIIF3tSwfpULTsDI1jiOprGCUWq4mpXnvA6ZC0eSS0iCKnCPtQAbsxA6ljuO2
        6AiovSZHbMZyBr7rq5L39qKBk8v48VwUD5Qg1txJS3ku8PMiz5/r69WyYbidfiLxsNTH4SKWvGLdY
        4At/Yc+XcTGxekLjKcnuzOl7lULpVU6LpY22WJESUK10fCnmIvqSC2yT3hSH5/UN1sMxfRi6OU26v
        rjAQ87UANfLKokkjgsDoPAQQb/dan4NE9GTJ/ZBek+csPURN05qbpKij0GkQih+NWy4ivJRriApby
        yM7dPQaA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56594)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1n56j5-000846-Pu; Wed, 05 Jan 2022 13:53:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1n56iy-0008TT-7A; Wed, 05 Jan 2022 13:53:08 +0000
Date:   Wed, 5 Jan 2022 13:53:08 +0000
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Keith Packard <keithpac@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v4 7/7] ARM: implement support for vmap'ed stacks
Message-ID: <YdWixPrYkR1JoFHW@shell.armlinux.org.uk>
References: <e07a229a-e565-0077-9f8a-a24ffa45f395@samsung.com>
 <CAMj1kXG3neg0riLAaU32KLvB2PLBNzwqgO0F21nbK1ivS=FwMg@mail.gmail.com>
 <b22077f6-0925-ee00-41ea-3e52241926e2@samsung.com>
 <CAMj1kXHQrqZSE1kHaQyQyK6R58EV3cUyvJFmM1JYifaMemyUhQ@mail.gmail.com>
 <f469726d-86fb-cf54-2775-d4658d2f3a5d@samsung.com>
 <CAMj1kXGyL7yTV4+pOs9iBWYuVvVmPTZrV5r=nzqttqpZ6-vYJA@mail.gmail.com>
 <CAMuHMdWNuCVeFiDrhnFmX0F1jxz8Fs4eFx55ojJF3d2ro-udrA@mail.gmail.com>
 <bbb0c788-bd83-833c-9445-87cff525f728@nvidia.com>
 <CAMj1kXEYjUspxOnvK=3O4pkVtXT+iBPz6mkskn=K6TTUZc+W2g@mail.gmail.com>
 <4ae3e371-68d0-64d7-713e-88af45875b3f@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ae3e371-68d0-64d7-713e-88af45875b3f@nvidia.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 05, 2022 at 11:33:48AM +0000, Jon Hunter wrote:
> On 05/01/2022 11:12, Ard Biesheuvel wrote:
> > Thanks for the report.
> > 
> > It would be helpful if you could provide some more context:
> > - does it happen on a LPAE build too?
> > - does it only happen on SMP capable systems?
> 
> These are all SMP systems.
> 
> > - does it reproduce on such systems when using only a single CPU?
> > (i.e., pass 'nosmp' on the kernel command line)
> 
> I would need to try this.

Please note that I want an answer on the vmap stack patches by the
end of today (UK time - so about five hours after this email has
been sent) as we have only tonight and tomorrow's linux-next before
the probable opening of the merge window.

The options are:

1. The problem gets fixed today and I merge the fix today so it can
   get tested in linux-next over the next few days by the various
   build farms and test setups.
2. We postpone the merging of this until the very end of the merge
   window to give more time to sort out this mess - but what it
   means is keeping it in linux-next and keeping various platforms
   broken during that period. However, this is really not fair for
   other people, and some would say this isn't even an option.
3. We drop the entire series for this merge window, meaning it gets
   dropped from linux-next, and have another go for the neext merge
   window.

Sorry for being so demanding, but we're far too close to the merge
window to be trying to debug a feature that is clearly causing a
regression for several platforms.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
