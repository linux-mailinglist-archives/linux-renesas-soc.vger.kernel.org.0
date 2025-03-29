Return-Path: <linux-renesas-soc+bounces-15043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B08E2A7551F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 09:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 519B1170B54
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 08:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B1A16F841;
	Sat, 29 Mar 2025 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="QgRooTHi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="H4pHMqxJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E63322B;
	Sat, 29 Mar 2025 08:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743236472; cv=none; b=mctNeyyFuDg1P5J+SQ7NzM/4BLmAFM/oxNKqSDWE92kteVFjMtLTgqDuuDvko3n0xLrsf1oy23UbRd0+qSnDbFRrqglYA4AmO1Agw5Ht60Ks4S5UcnuBMGc7hTfFWwGPP8m0AwAbXywL4ZOHGOCZE34k0rG1lhgceCQlVZigFcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743236472; c=relaxed/simple;
	bh=QDAB0m55g27E6p45mHvxVY4scga+fDK5Z4vdhZXG22w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tP2R9dgEGDpqE6H5neZgOpAZGBVPEtbLgKgip/Z80AtnwWZXRfv8VBMqL8UDZLqZlpY+k1E1vs2xHGPjXpAH1MGd97MLFSxSpxvYSMHu+ZUSPx5B4gwAWcqw62PKHPW8K14Vnin23xx8qoSEu/rtdDCH/85RKjgO0HBzf/aZn2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=QgRooTHi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=H4pHMqxJ; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 4A83011400E1;
	Sat, 29 Mar 2025 04:21:08 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Sat, 29 Mar 2025 04:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743236468;
	 x=1743322868; bh=SugjB2hxXE9R9kz/zxH8KYpJQN3Ownr5fZvSRSXceCg=; b=
	QgRooTHi86+koT2nKn8GWz+UoGRfy68Gc4uiUV59OJw3Xe4TxXOTetDxXHUlhGKF
	ZRWgggolyRZbckjyBX18CVhD4qiYksHV3aMWDWq/rem8n4hes7F10bgnIQudWUTS
	UPWaBZObUvbf0j1VpQbgNiNGedf7/s08aToBMRF0zkbs4IWUy/bK5H7rAFh0TDpd
	ZZY+r1HalbiMZOfJTEIQsE/l1DVw/L2xGeOjiuil3yQMSyRoSG8W2COovRv72lWb
	T+cXFknJ8GgRaSNTzMBasQGKrHdbdwguY5FUVGsalyb53zmV3zUV0jeRANcKfk+c
	627y9VTJDCiKoNI12NP68w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743236468; x=
	1743322868; bh=SugjB2hxXE9R9kz/zxH8KYpJQN3Ownr5fZvSRSXceCg=; b=H
	4pHMqxJiE03vy/hfQjcC/PyroDBG8NCmlZ+PEGlDo13A6QugVx38a2gm1GVMExlL
	TNOESnMWPIvwYsfMMXRt9iDxyONainI3JiUixn4BGGOAmbU1cw0E78wLlfO1Ixhh
	GVqVa53ikqhOyz6wZpCly+bFqzX4ekTBo/w7dN0ZwW2mXU4hsb6Gwkmn7hcJnGhi
	RfB7TX5x5mz4ATl2JyblBG3NSfENzDJ3M81Kqx1vX1+TCJp8JzE4h2pfkAHHo2Rj
	1MpOuI/MRzpGYTwh6Fu7AphM8dYvYuf/uxdfRo6YN3zw76Pz9Xq0hy+SV5n94zwB
	aoZPjPJ065y1zE7mgSaTw==
X-ME-Sender: <xms:ca3nZ1ezqcfuVOyK9mmG3GApj90zmWejLb00bWdLLMpffPEv6ckjbQ>
    <xme:ca3nZzOii4gLYtY-3KXom0GK3Qiz57oqszOICiZZqIpVwU5iLw90nFZl1zS06pn1u
    MmHoS8-g3tOGGg3xWE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeefieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsihhjuhdruggrshdrjhiise
    gsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtthhopehprhgrsghhrghkrghrrdhmrghh
    rgguvghvqdhlrggurdhrjhessghprdhrvghnvghsrghsrdgtohhmpdhrtghpthhtoheprg
    hnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdr
    tghomhdprhgtphhtthhopegsvghnrdgthhhurghnghesghgvnhgvshihshhlohhgihgtrd
    gtohhmrdhtfidprhgtphhtthhopehvihgtthhorhdrshhhihhhsehgvghnvghshihslhho
    ghhitgdrtghomhdrthifpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlih
    guvghrrdgsvgdprhgtphhtthhopegsihhjuhdruggrshdrrghusehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepphgsrhhosghinhhsohhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epshgvrhhghhhogiesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:ca3nZ-g5kk8dsL37AyxnNlwKEAARWZQ8h1gw9O0-fdBW3aJ4NQRq2g>
    <xmx:ca3nZ--DDBgkMbKK-IuyHfES0fE3EV8aS7cc_nIQ3Qs4gxSySlLg3Q>
    <xmx:ca3nZxurdJrQILgcTj4RBFkiRxCudXsZT1cz15oDYEktZJ1-jg53Kg>
    <xmx:ca3nZ9G4MT0LvY7J-XDEi9lN5EXOkZ-mjyj_MLgGKYbgCpZBsNX7nw>
    <xmx:dK3nZxNCCSzLf7x4592_LWb-ZVbJFynfJ12Rjm5jIjAwQfMXD48dG2V_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B33312220072; Sat, 29 Mar 2025 04:21:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tf583c862d1eb4221
Date: Sat, 29 Mar 2025 09:20:45 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>
Cc: "Adrian Hunter" <adrian.hunter@intel.com>,
 "Victor Shih" <victor.shih@genesyslogic.com.tw>,
 "Ben Chuang" <ben.chuang@genesyslogic.com.tw>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Sergey Khimich" <serghox@gmail.com>,
 "Shan-Chun Hung" <shanchun1218@gmail.com>,
 "Peter Robinson" <pbrobinson@gmail.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Biju Das" <biju.das.au@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "kernel test robot" <lkp@intel.com>
Message-Id: <60a19227-0bcf-4c50-866b-e659e436472b@app.fastmail.com>
In-Reply-To: <20250329080036.49170-1-biju.das.jz@bp.renesas.com>
References: <20250329080036.49170-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] mmc: host: Kconfig: Fix undefined reference to
 rdev_get_drvdata()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Mar 29, 2025, at 09:00, Biju Das wrote:
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 6824131b69b1..f62e436b1d4f 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -692,6 +692,7 @@ config MMC_SDHI
>  	tristate "Renesas SDHI SD/SDIO controller support"
>  	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
>  	select MMC_TMIO_CORE
> +	select REGULATOR if ARCH_RENESAS
>  	select RESET_CONTROLLER if ARCH_RENESAS

You should never 'select' another subsystem from a device
driver, that just causes circular dependencies leads to
unintended effects when a subsystem suddenly gets turned on
during 'make oldconfig' or 'make defconfig' when it should
have remained disabled.

I see that I forgot to send a patch I made when the problem
showed up two weeks ago, I'll send my patch.

       Arnd

