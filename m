Return-Path: <linux-renesas-soc+bounces-22172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C56B92242
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 18:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 082F417E05F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 16:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A92310768;
	Mon, 22 Sep 2025 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hN/5y+Lz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4E6310764;
	Mon, 22 Sep 2025 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557320; cv=none; b=a0UoYlrB/IJANtsObxhPaBWHwTQenk/X/fq9Hr0vFn/Q9iyg5MMeruAv01trv+BIHS8VeTIbIbvXTyy1Xi6R8J07p6b3o8N6hzSP9k/YMAT2AbQoOk3EDHWZUmjkWqoeIpa7b5ZLzcC1aL5gb4Kwuk8goYeNrAINRAY+md7Eaq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557320; c=relaxed/simple;
	bh=1JhvlsGag/g0lsEn3CJ4T79NzeC8MMz8OYCOhlhCcfk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D7jEeUL4iPk94PIluXj+NODn0ZuNqFQIJMm+O+2J6oZLNilGvXb13houwvu1Tz6E+YWzU/pf3t18feIHkykCODcmhvPUrzB5UoR5Adg9ARs0pPb8cn0HTAoleE+YaxdgWJ8aR7TrAx6CI3HX0v97k2LiKqGsmXGFUWAOlWjGnLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hN/5y+Lz; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6891FC8EC47;
	Mon, 22 Sep 2025 16:08:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D28360635;
	Mon, 22 Sep 2025 16:08:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58A1F102F1942;
	Mon, 22 Sep 2025 18:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758557309; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Hg2NoZ+lLEZW8Bu+98QwiGq8+y6KwiE9j3xN84DMQww=;
	b=hN/5y+Lzx6vJQWz5+IvAyWUVCO9Sb8V+lGAwRHtGKlZHhiH9QpCd5NrK4oDe6YpbAmgnIX
	ku+RMG37326N+lZz5XAgWH5nSuHgiObTTQ/wHd4qezZ/j8mke5Pb9bIu9fQFPd8g1n3Cju
	Am6lH4IIJK54d9FjDmxzONgPRSDCYyw9zDpWxWdZ4+wDCsvfK9DcwHWCK6V0jRpp4ox2FA
	yW2suHPc7o8wJjNwTP9+ujj08T4lNrUfePNLgKMmQUwxNcgtFveSJ6/BKajTZCgbJnGNAa
	jRvZDa5eHTBYhQGXAU44mSibt4ktklGI+5PeSl+6j2yWOvGnTByBDSWp6SI80Q==
Date: Mon, 22 Sep 2025 18:08:17 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Hoan Tran
 <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Saravana
 Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, Phil
 Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Pascal Eberhard
 <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 5/8] ARM: dts: r9a06g032: Add GPIO controllers
Message-ID: <20250922180817.7c1b8f61@bootlin.com>
In-Reply-To: <CAMRc=MeLDe+o6dWkFCv6zc7ubcXicWdw4FA_A2p519OC4SH2BA@mail.gmail.com>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
	<20250918104009.94754-6-herve.codina@bootlin.com>
	<CAMRc=Mf9OB03FXEpSXG8XeJhtd7MkwJTH=rY11SBb9SazCMqJw@mail.gmail.com>
	<20250922173145.4d4dbb2f@bootlin.com>
	<CAMRc=MeLDe+o6dWkFCv6zc7ubcXicWdw4FA_A2p519OC4SH2BA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Barosz,

On Mon, 22 Sep 2025 18:33:49 +0300
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Mon, 22 Sep 2025 17:31:45 +0200, Herve Codina
> <herve.codina@bootlin.com> said:
> > Hi Bartosz,
> >
> > On Mon, 22 Sep 2025 16:22:14 +0200
> > Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >  
> >> On Thu, Sep 18, 2025 at 12:40 PM Herve Codina (Schneider Electric)
> >> <herve.codina@bootlin.com> wrote:  
> >> >
> >> > Add GPIO controllers (Synosys DesignWare IPs) available in the
> >> > r9a06g032 (RZ/N1D) SoC.
> >> >
> >> > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> >> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> > ---  
> >>
> >> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>  
> >
> > I have just sent the v4 iteration.
> >
> > This patch has not been modified in v4.
> >
> > Can you add your 'Reviewed-by' in the v4 series?
> >  
> 
> Sure, done.

I have seen your 'Reviewed-by' in v4 but on patch 8 ("ARM: dts: r9a06g032:
Add support for GPIO interrupts").

Maybe this is correct but here (v3) your 'Reviewed-by' in on patch 5 ("ARM: dts:
r9a06g032: Add GPIO controllers").

This exact same patch 5 exists also in v4.

Best regards,
Hervé

