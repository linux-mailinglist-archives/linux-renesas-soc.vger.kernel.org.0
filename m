Return-Path: <linux-renesas-soc+bounces-12293-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4235CA17F95
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2025 15:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6D8B7A2F67
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2025 14:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9693E1F37D4;
	Tue, 21 Jan 2025 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="kRfQF0VP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090691F03DC;
	Tue, 21 Jan 2025 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737469189; cv=none; b=plxM+V5oWktrzP3IjdYYCm/s/6w9CM4Fc3WVNRdxjGGWDIzlDsGB2AXq6c47EzNqDiyQcbSfaK92x91+geUghqYmxaYuzQCBZ1lZuoymA4b/d1Hi1murofi3Wwdj13rKF2gAoo47Drj7fuaKKB+syjdYvrCPVgX+IG623b+1ico=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737469189; c=relaxed/simple;
	bh=Bb/hN0Csaj+Z1+IYPpBbW7p94sfP2NXwCNLzi/ILpn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huBk+scCtTsQUyJQC8nTEVSDRNqF7VOky3Wk/9D0SH5YpOXhNxkkuImpVzw1A7kw42pKt3CafGfV/IR/CPeh7QyqMU+Z+1YeTyp36nPwCs2xKj3noNzQUp1YD74aLgzUkPlGPsqJD6x51cONE5eueIAvurgQdbFzISjzo1gnYAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=kRfQF0VP; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jMdYmwmLPyDuVRsbkv93AlEBzIO1Opr34EVAtN7rIzg=; b=kRfQF0VPZ2zh5eyHFHt9OFbw7i
	F70eXR9dI+FP4iMiLNDozLfDCKz6XXFTtoV/GCmoYoej6vZfFQb3iXQMz1LeqsefvRTz9vuV8Vfkr
	+u/b8Jl+YEoJAcuEO1IyAvBnKKh6A85m81xpx3A6S9pNOGxl+niZYUVK2XehbdCYthGMgjnxMhobY
	+8Cu2GGJmcQFv0E58PvCMeYrfsokoiBK9Dgw2NRT733jii2C7dWnuYdUyFBMH6J76Xdd6/KutdmGj
	gfTPyc9OtXK1QspBhrY4OO7NZkEBJulU3Nr7UyK/7tyHf77ssJSoyPBObP1VlpDQOgdqPZHwpDplx
	GikDbNCQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43796)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1taF6P-0007KN-1u;
	Tue, 21 Jan 2025 14:19:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1taF6L-0003xt-29;
	Tue, 21 Jan 2025 14:19:33 +0000
Date: Tue, 21 Jan 2025 14:19:33 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ARM: cacheinfo fix format field mask
Message-ID: <Z4-s9UHBJZx9APeE@shell.armlinux.org.uk>
References: <20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org>
 <CAMuHMdVLvCNZtc2qYrsnMz5L0Hyr70x-Hj5NA8izYBH2tf=yFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVLvCNZtc2qYrsnMz5L0Hyr70x-Hj5NA8izYBH2tf=yFg@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Jan 21, 2025 at 03:12:13PM +0100, Geert Uytterhoeven wrote:
> Hi Dmitry,
> 
> Thanks for your patch!
> 
> On Wed, Jan 15, 2025 at 12:11 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > Fix C&P error left unnoticed during the reviews. The FORMAT field spans
> > over bits 29-31, not 24-27 of the CTR register.
> 
> Please add
> 
>     This causes a warning on e.g. Cortex-A8 and Cortex-A9:
> 
>         WARNING: CPU: 0 PID: 0 at arch/arm/kernel/cacheinfo.c:43
> cache_line_size+0x84/0x94
> 
> so people find this patch when looking up the warning.
> 
> > Fixes: a9ff94477836 ("ARM: 9433/2: implement cacheinfo support")
> > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Closes: https://lore.kernel.org/linux-arm-msm/01515ea0-c6f0-479f-9da5-764d9ee79ed6@samsung.com/
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> This fixes the warning on Cortex-A8/A9, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Note that this changes HWalign on Cortex-A9 (various Renesas SoCs,
> with 1, 2, or 4 CPU cores):
> 
>     -SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=<N>, Nodes=1
>     +SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=<N>, Nodes=1
> 
> On Cortex-A8 (BeagleBone Black, i.e. AM335x), it changes HWalign,
> and causes a warning message:
> 
>     -SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
>     +SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
>      ...
>     +cacheinfo: Unable to detect cache hierarchy for CPU 0
> 

Also, has this been tested on CPUs that don't implement the cache type
register?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

