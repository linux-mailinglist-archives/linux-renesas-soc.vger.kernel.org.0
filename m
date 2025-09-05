Return-Path: <linux-renesas-soc+bounces-21531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BBDB4644C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 22:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECE1C1CC5701
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 20:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BC92D12EF;
	Fri,  5 Sep 2025 20:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cDgw8gAm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4EE2C21D5
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Sep 2025 20:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757102682; cv=none; b=VSxGkj0SeQcHW7FgGIoCxP1t0rb933KQ0s25CjssvLXaSamnU/eakDG8+fkA8cDjXVKLKrHudeoGqs1h1TUvBbzskKvaEX9q1jb4+jTWbdxbKe5Z9YPap5yankXP2fqXqQs/IYnfJCsOEKMgo5OW33XBM+g47asMiyeykaAkfnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757102682; c=relaxed/simple;
	bh=11GbqDXssApiU9y+vomJ1VHqHgmumr3HAlGd4PLdhNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrqMuhBAYOOMNmixSchiUUMr4yuiuel2XDSWUuejgGwACVWj/I/Nzc4cJ7tYXSTk4Krsl7RnpH2YAs7rdj3RCjLuwgUkjYkOCpnPOCTFJW1Epl9r6+b/p0XvNAfws/jPovcDzk0E72yuH1Y4Ym4jhiuDbtvuPsHDWr8TnvlD7/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cDgw8gAm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xj+d
	VF/YryccXvlypmfMjf5O3cBWAm2GjD0ww5V4SRc=; b=cDgw8gAm6HQuL4qnbhvl
	3V6qT3ETttXViq6E5ZyRDIYxChs5GwPHsWTHbtNVW67zgU4/3k1pEKUYAbBNd3Qq
	2scnAxM/L4uNOofMQ/qeBfxqRodiA710te/seFHfPtU6aB1QIN0JLhjmv4Mq+R5d
	2dulOOJ4AqfWSoufO+bdRIAlHkTyladuFqFxktJdASuIs34AZ5vN8knCjGuqTXWh
	DfBBI6YZr5tyWZy0UrbnqQjd/CbzM2F9btK69XrxlICIJR376sA2sVi00BXg4cw5
	JIg5BO13UOlxoy2JROtFVUuTEsFR0BvKxFXGpu6SWvOLJcQb98ggG7Cf+/c7l+qL
	eA==
Received: (qmail 4158411 invoked from network); 5 Sep 2025 22:04:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Sep 2025 22:04:35 +0200
X-UD-Smtp-Session: l3s3148p1@CwbEWBM+JqsgAQnoAEvNAIPWyJz1dhzG
Date: Fri, 5 Sep 2025 22:04:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT
 DTO to Retronix R-Car V4H Sparrow Hawk
Message-ID: <aLtCUoIPSFfYb-k7@shikoro>
References: <20250905020149.257459-1-marek.vasut+renesas@mailbox.org>
 <aLrXzl38OUhTJgxP@shikoro>
 <273d5067-4c9d-4c8c-8633-7f2d7c708216@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <273d5067-4c9d-4c8c-8633-7f2d7c708216@mailbox.org>

Hi Marek,

> > > + * r8a779g3-sparrow-hawk$ grep -H . /sys/class/hwmon/hwmon?/name
> > > + * /sys/class/hwmon/hwmon0/name:sensor1_thermal
> > > + * /sys/class/hwmon/hwmon1/name:sensor2_thermal
> > > + * /sys/class/hwmon/hwmon2/name:sensor3_thermal
> > > + * /sys/class/hwmon/hwmon3/name:sensor4_thermal
> > > + * /sys/class/hwmon/hwmon4/name:pwmfan
> > > + *                       ^      ^^^^^^
> > 
> > For me, the output looks different, though:
> > 
> > /sys/class/hwmon/hwmon0/name:pwmfan
> > /sys/class/hwmon/hwmon1/name:sensor1_thermal
> > /sys/class/hwmon/hwmon2/name:sensor2_thermal
> > /sys/class/hwmon/hwmon3/name:sensor3_thermal
> > /sys/class/hwmon/hwmon4/name:sensor4_thermal
> > /sys/class/hwmon/hwmon5/name:pwmfan
> > 
> > hwmon0 is the Argon, hwmon5 the (unpopulated) on board connector.
> > 
> > I hope the naming is stable, but in any case, the docs need to be
> > reworked a little, I guess?
> 
> The hwmon devices are allocated first come first served, so the list can
> look different for you. You need to look up the fan you want to control, of
> course. Look up by name is simplest, if there are more fans, it might be a
> bit more involved to find the right one.

Exactly. This is why I would suggest to drop the '^^^^^' line from
above. We definitely have two pwmfans with the above dtso. So finding
the right one needs a second look anyhow. And while I think it is quite
likely that the list of hwmon devices will look the same (I don't see a
race condition which would make hwmon0 and hwmon5 swap), I agree we
shouldn't rely on it. I would also think that we then maybe should
change

	echo 2 > /sys/class/hwmon/hwmon4/pwm1_enable

to

	echo 2 > /sys/class/hwmon/hwmon<X>/pwm1_enable

or something? What do you think? Just suggestions, I am not really
insisting. Well, maybe, about dropping the "^^^^" line ;)

Happy hacking,

   Wolfram

