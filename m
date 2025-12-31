Return-Path: <linux-renesas-soc+bounces-26216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 412C5CEAF2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 01:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FD263007EFC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 00:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3464A01;
	Wed, 31 Dec 2025 00:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="kWNNJlAJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QtbQYduw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D913A1E67;
	Wed, 31 Dec 2025 00:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767139400; cv=none; b=pVsdMWXP+kFjhtoHDQAiETxBXDF5uif8L5saO10gtS+uOjfw0zTElotTPlUkjwQLzNXAIOYsboWn4SOIpl8AKpynkPswny4swxm+ZcZPWJ1Gta7DJCsCZ05/Y+SoHmnfi487rfirMIe78eAWA3GC912pjSs+cTYaHQXTq8ojoM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767139400; c=relaxed/simple;
	bh=fMKb2r6Z0KA7uF7NEmnqAKlVY2du2R5kD1x0I1akKng=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Y2MWWLS5wgiXfvFLA4WRFN8WIOfLbc3FGKRHExlc8hQkqiuMWiKX1fGXKrJ2NkAzUg48XtLIb7dCiJyhR0MtlOj37sRf05qb/PIbKVP4b10QmHFbMK4BhKDS++aFr3V58VscxZyoaMXiUYwNjhicejyDSTWTMsiTTzUc8y4GxUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=kWNNJlAJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QtbQYduw; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E78B47A006D;
	Tue, 30 Dec 2025 19:03:16 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 30 Dec 2025 19:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767139396;
	 x=1767225796; bh=QRzc+r79m3rzfJc+FmxmTipVTJ4rtMAJvY9eZc6ZTZo=; b=
	kWNNJlAJO2dOlkp3eLjvSAKUZ2ijMHrgTU53ftWnFS1liHjl+7n2egHnqc0lkDNX
	JGRFYIijWaJBI3nAeWYlPItLv134EMipNkKg46pztWKXBh8DLgEhl70jpxgrqCwT
	wwBs5mUWP1bd4PPUjmU+8USQYlv1bhzpiP7/9me1Jqv8U0VqZQXYm6eWn8beUtZV
	PCDtgQ3ftEkPZp1SAAwupyTuUpasZfC2/c0DOd8OGYKOya+pxSd2Llaz+TtvJL14
	fsAAYTe+JQ2s9P1+gS+0w+GB5w0+3wOkEGimbcdpKIYirnFrwCi/Hg7WYKih31YD
	XChQ9givn/8HdBiO+v7KGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767139396; x=
	1767225796; bh=QRzc+r79m3rzfJc+FmxmTipVTJ4rtMAJvY9eZc6ZTZo=; b=Q
	tbQYduwBpoeicJboUxv1y59uHQ3/E8PyyLgwd/K++TOXmWqKqpuZ5N6z3H4hk+hn
	ali0FDUHGVG86VPuDAmHt6rPoIisovNgSsuZ68SVENxk9l8kbKnR5oPWrRAXdiXm
	aBxXwyk70rC04/OD9qXlSu7JDpeXymqgFGJbbZujLVPhMIKY9C3hkGpXh+CCmg0C
	YI1KAIWHqR6S03QlrKvlRX65NoyGvtl4YpFrlrHgt05e4JXx5woou+0PUt/x+GSs
	hOhl1UpbkV+XoSKgweZMT0UgFg3ajTX49fwktgVKSJnWcDUHlJKEtlW0QTPVoAIk
	svwuiHMo5odhUp9sKuaNg==
X-ME-Sender: <xms:Q2hUaZ3h3hoEOnVMh9ao5-2Bw__05Xz-h4hpaxna8KgV1rJuhrnXZQ>
    <xme:Q2hUaa7x462diljF7XPle_2NlOLXOJZE_p28HoW8RLdb_gNVe_k1Guv6oMl4RqEWT
    8P-46KXVgHFWJtEk9kaPCkEX7NNvyInPEQJ4V-IeXlwkKOHlmocHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekudegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeelffehlefffeehvdfgveefudelieeiveffvdfgiedukeeihfejheduudduhffgtden
    ucffohhmrghinheplhhkmhhlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthht
    ohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgrhgvghhorhihrdgtlh
    gvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhosggvrhhtrdhjrghr
    iihmihhksehfrhgvvgdrfhhrpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesgh
    hlihguvghrrdgsvgdprhgtphhtthhopehhrghojhhirghnrdiihhhurghnghesghhmrghi
    lhdrtghomhdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepshgvsggrshhtihgrnhdrhhgvshhsvghlsggrrhhthhesghhmrghilhdr
    tghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehk
    vghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Q2hUafBMbG612pjQukbbeIYolVOoThuv5W9-PKtyH7Si-0xH9WxBBA>
    <xmx:Q2hUadZsJ3nIw2LOEaQHS_tJvTqp0FJEf4RdY79ocTOffndCW3I5Hw>
    <xmx:Q2hUaZ_6jJ4aw7u8cP5co-MNdV1imw-0I2MKSVK7GqEo7mR3iQRWHA>
    <xmx:Q2hUaZgXFyzNzo57dS9kHCOgH0rkLq-Fl8iX_9Eq7qPemGl7NEpzTQ>
    <xmx:RGhUaaducKixJlXmKPS72lDnfupk-jUfAaCnqrNFcBCe18a6OJqlhwT_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BFD1B700065; Tue, 30 Dec 2025 19:03:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AXfFZUabNlQ-
Date: Wed, 31 Dec 2025 01:02:55 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Robert Jarzmik" <robert.jarzmik@free.fr>
Cc: "Rob Herring" <robh@kernel.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Magnus Damm" <magnus.damm@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <4e5c631e-8c7f-4f38-a60e-2db829ff9f06@app.fastmail.com>
In-Reply-To: <m2wm26lv28.fsf@free.fr>
References: <20251212203226.458694-4-robh@kernel.org> <m2345fmkg7.fsf@free.fr>
 <35405ed3-1319-4d3a-84a5-ad67f4c823ad@app.fastmail.com>
 <m2wm26lv28.fsf@free.fr>
Subject: Re: [PATCH] ARM: dts: intel: Drop pxa2xx
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Dec 28, 2025, at 12:11, Robert Jarzmik wrote:
>
>> Robert, let me know if you or someone else is able to spend
>> some time on sending (warning-free) dts files for pxa2xx
>> machines soon. If not, I'd plan to remove whatever is there
>> along with the board files and drivers.
>
> Here is one attached, the previously mentioned mioa701 board dts 
> file
> I've been using for years (the date of the patch should be funny
> enough). It was first submitted here :
>   https://lkml.org/lkml/2018/9/15/321
>
> I'm not very sure pxa25x and pxa27x should survive though. Lately, 
> the platform which I have left have 64MB of RAM, and cannot cope with 
> recent binaries sizes. And to my best knowledge, pxa2xx architecture are 
> not built anymore nor supported ...

Thanks for posting this one, that is helpful both for reference
and in case anyone wants to keep using or bringing back pxa27x
after we remove it.

My feeling is that if neither you nor Daniel are planning on
actually using PXA2xx on future kernels, we're better off
removing both PXA25x and PXA27x along with the board files
and only keep PXA3xx around for Raumfeld.

Looking at when PXA2xx was used, I see a lot of handhelds
from 2002 to 2007 but not much later, as smartphones then
started moved to newer Marvell chips, or TI and Qualcomm
alternatives. The last embedded PXA2xx boards were in 2010
(Colibri/Income, Voipac vpac270, Arcom Zeus), and were all
discontinued by their manufacturers years ago, usually 10
years after the hardware introduction, and nobody
complained when I removed the board files in 2022.

I had left the gumstix boards in the source tree at the time
because it had more memory than the others and was supported
by qemu. The upstream qemu releases now removed that as well.

If you or anyone else is still using PXA27x, we can always
bring it back later, but I'd then put the burden on them to
submit the dts file for inclusion without introducing DT
warnings.

> The drivers might still be useful (the DMA, the SPI for intel CPU, 
> ...).

Right, most drivers have to stay as they are still used on newer
chips. The ones that I think would become obsolete without pxa2xx
are pinctrl, cpufreq, camera, mtd, udc and pcmcia. Especially
the latter two have come up a few times during cleanups where they
cause extra work from complexity that probably nobody is using any
more.

> +	docg3: flash@0 {
> +		compatible = "m-systems,diskonchip-g3";
> +		reg = <0x0 0x2000>;
> +	};

This currently has no upstream users I can see, so
removing pxa27x would probably mean we should remove
that as well.

> +	panel {
> +		compatible = "toshiba,ltm0305a776";
> +		lcd-type = "color-tft";

I don't see a driver that matches the compatible string,
does this one actually work?

       Arnd

