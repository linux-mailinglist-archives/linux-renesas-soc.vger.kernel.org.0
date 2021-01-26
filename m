Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD021303EFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 14:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404187AbhAZNlu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 08:41:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391768AbhAZNlm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 08:41:42 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EECDC0611C2;
        Tue, 26 Jan 2021 05:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=F7Ri1jDa+0p/Mntg1rR5pjiOSiSOGrYBiVXG3iBxWdw=; b=ZlKAwmRijaiAU7MOCcisK0OGd
        G6KMyzAzXJAFJmLrGZA1wW809O/uTiZDTXwjUM+hRn+zc5PQAlvHeI/nz9WqhpMHne/ZJX/J8l33N
        2/KBrnN/rWXSuMHZmUEmWP9es+tQqgyLCHaTqbdMhcueeZGdIjnzZIn75DD8IyUVVsRqxU92AS9ns
        A9FG8sWlxjVtqXMAWUH/muU2vgnL0P5c4ZjZ+6AzLGnzjbuIVf//X++QBjHZxD5sM8NLE70k6/iAe
        OBm3/+Td78DD5hIGL+3r+vK7DgJbkjoZIX/jd9MxZFxnv+/Gd+l9GBBuu0F529DUH6YlRxIViP1rK
        uOH/OCdQw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52972)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1l4OaY-0004Sz-1i; Tue, 26 Jan 2021 13:40:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1l4OaX-0003qb-Ky; Tue, 26 Jan 2021 13:40:57 +0000
Date:   Tue, 26 Jan 2021 13:40:57 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm: smp: remove unused variable
Message-ID: <20210126134057.GH1551@shell.armlinux.org.uk>
References: <20201228120147.59387-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWD-8YxdrTmaTW7YTOFj+8hHM5LvegnC274QOTOO_gXcg@mail.gmail.com>
 <20210126104155.GF1551@shell.armlinux.org.uk>
 <20210126130240.GA2413@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126130240.GA2413@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 26, 2021 at 02:02:40PM +0100, Wolfram Sang wrote:
> Hi Russell,
> 
> > Those who cause breakage really should be the ones to look at patches
> > that fix their breakage.
> 
> Does it mean you want an explicit ack from Thomas or that it should go
> via his tree?

What I'm saying is... don't expect me to always review patches that
are for fixing code that other people have contributed - I wish those
who introduce regressions would stick around and attend to breakage
that they cause, instead of hoping that someone else will do that
for them. It's a reasonable ask.

> > The way patches get applied is if they end up in my patch system... if
> > they don't make it there, they don't get applied.
> 
> The patch itself is here:
> 
> https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9047/1

Thanks - I'll get around to it in due course. Since I'm no longer
supported as 32-bit ARM maintainer, I only apply patches once or maybe
twice per kernel release. Quite how long this will be sustainable for,
I've no idea (it depends whether I get any actual paying work, and
how much.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
