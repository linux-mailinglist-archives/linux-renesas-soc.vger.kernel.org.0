Return-Path: <linux-renesas-soc+bounces-15901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 605D2A87D1A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 12:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DD8E188B338
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 10:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8CF268FC0;
	Mon, 14 Apr 2025 10:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linatsea.fr header.i=@linatsea.fr header.b="RO5VAnnx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA6F25E471;
	Mon, 14 Apr 2025 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625333; cv=none; b=RwohT2ZuZdsk++l8s6JGm40Io8rFuX1MXJ+cR44LW7NQ7YhnAhoqKeL7CK6k6ofNa/ZNrTM187g5lYsdA3yYCLqU1JzbhJ8BkGFBLL975ukVRorJ6NXw547jfMK4hImm9++0ygW6qLGb3lcg3M39oH/gVFxMHnsh7ijOcGn6IWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625333; c=relaxed/simple;
	bh=ikcFIKiUa4XCXRzxwCujAZL//L2GImleFBpghLCAdbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1QNizTsv5vgjUpI+dFeIWC3Y79yzhROXs1bfTL19IDi2a3oDbY/JZXG5RQG7PIK5SIRDfpg1Vpyy9gh8CPWwWdEADOKZN5GPU0wgwwCE6CXqHnmKzNQmqQ7tIkvisfgrnpFrgWPfI75OK7qVjYqoyO0Hdp3Wn9IFkiP08n82Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linatsea.fr; spf=pass smtp.mailfrom=linatsea.fr; dkim=pass (2048-bit key) header.d=linatsea.fr header.i=@linatsea.fr header.b=RO5VAnnx; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linatsea.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linatsea.fr
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 38015584AE7;
	Mon, 14 Apr 2025 09:23:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 108D4433F6;
	Mon, 14 Apr 2025 09:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
	t=1744622617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2xX1JnrLD/Xmneb1rgW8av3OLo09hQ4pZGDbeGR+qj8=;
	b=RO5VAnnxDB8lpFxKu641LS0B9QLtjt9TUl9rTMYFBCSXgRg5jmtbsItblG8jlNiXcDHr9P
	ZTiHksLdTyzu2/OAqJ+hurpuJitXUf4TB5aAHq7zEwh+V96wXLpyweU7W05QpDXdV9wZqz
	iQfDu2WvOGFyNTQWdW3mf5nTGeH2sCyw59gw4S0jzlLsTRg7itiTvSNu0fcQQYBHV0Tryc
	7v6hp5vT5D50D2T9UkuXgi8JjeojuaSRJdk6aabHHnEby2e7ieLDeqKSOvdXmcVcCNkT7g
	uKgkyl/7vl/dZnqrL1UTjo09G7NOVaTP/lgmzAVVxHPfs8S4fqg4CYoDNA1uMg==
Message-ID: <eba16d9a-9e07-498f-a7ab-0bb36076de40@linatsea.fr>
Date: Mon, 14 Apr 2025 11:23:34 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/13] serial: sh-sci: Add support for RZ/T2H SCI
To: Greg KH <gregkh@linuxfoundation.org>,
 Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
 <20250403212919.1137670-11-thierry.bultel.yh@bp.renesas.com>
 <2025041152-puzzling-clinking-e573@gregkh>
 <TYCPR01MB11492DDF2728C9D3B3F14DCA38AB32@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <2025041456-legacy-craftwork-2d8b@gregkh>
Content-Language: fr
From: Thierry Bultel <thierry.bultel@linatsea.fr>
In-Reply-To: <2025041456-legacy-craftwork-2d8b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepvfhhihgvrhhrhicuuehulhhtvghluceothhhihgvrhhrhidrsghulhhtvghlsehlihhnrghtshgvrgdrfhhrqeenucggtffrrghtthgvrhhnpeffleefheeutdeuhfehteehkeduieeltdejffetkeekuedtveeivedvudelkefgteenucfkphepkeelrddvgeekrdejiedrjedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeelrddvgeekrdejiedrjedtpdhhvghloheplgduledvrdduieekrdehjedrleejngdpmhgrihhlfhhrohhmpehthhhivghrrhihrdgsuhhlthgvlheslhhinhgrthhsvggrrdhfrhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehthhhivghrrhihrdgsuhhlthgvlhdrhihhsegsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgp
 dhrtghpthhtohepphgruhhlrdgsrghrkhgvrhdrtghtsegsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsvghrihgrlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: thierry.bultel@linatsea.fr



Le 14/04/2025 à 10:58, Greg KH a écrit :
> On Mon, Apr 14, 2025 at 07:54:12AM +0000, Thierry Bultel wrote:
>> Hi Greg,
>>
>>> -----Original Message-----
>>> From: Greg KH <gregkh@linuxfoundation.org>
>>> Sent: vendredi 11 avril 2025 16:57
>>> To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>>> Cc: thierry.bultel@linatsea.fr; linux-renesas-soc@vger.kernel.org;
>>> geert@linux-m68k.org; Paul Barker <paul.barker.ct@bp.renesas.com>; Wolfram
>>> Sang <wsa+renesas@sang-engineering.com>; linux-kernel@vger.kernel.org;
>>> linux-serial@vger.kernel.org
>>> Subject: Re: [PATCH v7 10/13] serial: sh-sci: Add support for RZ/T2H SCI
>>>
>>> On Thu, Apr 03, 2025 at 11:29:12PM +0200, Thierry Bultel wrote:
>>>> --- a/include/uapi/linux/serial_core.h
>>>> +++ b/include/uapi/linux/serial_core.h
>>>> @@ -231,6 +231,9 @@
>>>>   /* Sunplus UART */
>>>>   #define PORT_SUNPLUS	123
>>>>
>>>> +/* SH-SCI */
>>>> +#define PORT_RSCI	124
>>> Why do you need to tell userspace about this specific port?  Is that a
>>> hard requirement that your userspace tools require?  If not, please don't
>>> export this here.
>> This point has been discussed with Geert and Wolfram.
>> We cannot use PORT_GENERIC for this IP, and adding the new type
>> is just keeping consistent with the sh-sci driver.
> But, why does userspace need to know this number?  And why doesn't
> PORT_GENERIC work?

The reason is that the sh-sci driver discriminates internally between 
port types.
There are number of locations when it checks for PORT_SCI, PORT_SCIF, 
PORT_SCIFA...
T2H SCI needs special handling, too, that is the reason why PORT_GENERIC 
cannot work. I just therefore added this new type.

>
> thanks,
>
> greg k-h


