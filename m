Return-Path: <linux-renesas-soc+bounces-5379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6818C73BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2024 11:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59DA5281343
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2024 09:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E214142E74;
	Thu, 16 May 2024 09:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="sJMIatAA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60352576F;
	Thu, 16 May 2024 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715851608; cv=none; b=Gk405DRppphgU+TIVA6pMlCn0i6tGAuSXdtQzk8QRReJNbGNbK82VNZC3Ld6cB8N88O/3jg8CrhqjNDIBFPmIlJc+zHloj8pbKGq0nMKA53b7jBwe24FGBvZUbn9bGMnmeHczG7h+5OAfYrZSP6z8wBb+UuSvYA56UIO8B273QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715851608; c=relaxed/simple;
	bh=nb7YbQ/1b8v3jtmh71hREfxGGshguRO4vNSooGhXfBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MO3xO3kIhBvAGV+K0sRDMMm21txNiG6Zbx7DOP0fU9nmJDzKSPjEUZ+jkhQg1lwNyJmWs04wfdzcDyL7ywE0ZtLeQGuVjlMXsLzhjL6C0uT6W9y5H7NJ7XxFnEihG0G/B45G4V0HlTtqrUau87PlpUoPDH2qtxN2P22JMJqmDgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=sJMIatAA; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iwpgZMChDlDGQdY1FB4R79GudyxC2zX+GHB1AHWt+x0=; b=sJMIatAA6Q8YnBM8RwJOXcawHi
	Oa84a1T/KY4GRYolF2EfyYijV9SpHEV0JXnnptXTzDfZGDEbdhb0NQKCwlz4IMVrTa+zHKmZeDCTo
	uInjU7fVgoyL1kEvqLxuHBO2W8QtLa6cFjO1sCw7HNvSRD7O5R3DrDZqzkjW6fCzE0VJcr1ESzPll
	Kvp+t7jQZ5cM80S9u6sqbsWtJwBzRMk+pPrT6yea14hNKYqxy2aUyhwxiuL1+vjKS35w2YGMvMruI
	pxjldPHD65Aa5A3UB3U7H6QF6y0vMks2CmxBpAzT/2SchUu8DUJRcWjq3ZXmplCuAVl73jr+lkG5b
	04LbZfHA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37340)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s7XNb-0004e6-1E;
	Thu, 16 May 2024 10:26:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s7XNZ-0000Vh-Q7; Thu, 16 May 2024 10:26:25 +0100
Date: Thu, 16 May 2024 10:26:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Stefan Wahren <wahrenst@gmx.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: Fix userspace enter on LPAE with
 CC_OPTIMIZE_FOR_SIZE=y
Message-ID: <ZkXRQexBTBe5psTB@shell.armlinux.org.uk>
References: <200d273a83906a68a1c4a9298c415980737be811.1715781469.git.geert+renesas@glider.be>
 <8ef97b5d-2053-4051-b2da-6c2887c7b394@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ef97b5d-2053-4051-b2da-6c2887c7b394@broadcom.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, May 15, 2024 at 12:46:38PM -0700, Florian Fainelli wrote:
> On 5/15/24 07:02, Geert Uytterhoeven wrote:
> > Booting an LPAE-enabled kernel built with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> > fails when starting userspace:
> > 
> >      Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
> >      CPU: 1 PID: 1 Comm: init Tainted: G        W        N 6.9.0-rc1-koelsch-00004-g7af5b901e847 #1930
> >      Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
> >      Call trace:
> >       unwind_backtrace from show_stack+0x10/0x14
> >       show_stack from dump_stack_lvl+0x78/0xa8
> >       dump_stack_lvl from panic+0x118/0x398
> >       panic from do_exit+0x1ec/0x938
> >       do_exit from sys_exit_group+0x0/0x10
> >      ---[ end Kernel panic - not syncing: Attempted to kill init!  exitcode=0x00000004 ]---
> > 
> > Add the missing memory clobber to cpu_set_ttbcr(), as suggested by
> > Russell King.
> > 
> > Force inlining of uaccess_save_and_enable(), as suggested by Ard
> > Biesheuvel.
> > 
> > The latter fixes booting on Koelsch.
> > 
> > Fixes: 7af5b901e84743c6 ("ARM: 9358/2: Implement PAN for LPAE by TTBR0 page table walks disablement")
> > Closes: https://lore.kernel.org/r/CAMuHMdWTAJcZ9BReWNhpmsgkOzQxLNb5OhNYxzxv6D5TSh2fwQ@mail.gmail.com/
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>

This should be in linux-next now, if not by tomorrow - it was pushed
out yesterday.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

