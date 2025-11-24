Return-Path: <linux-renesas-soc+bounces-25094-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 793C2C8239F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 20:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A45CC4E7B17
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 19:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC01C13AD05;
	Mon, 24 Nov 2025 19:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MYdVXEb2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WZeKbF94"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B67D14AD20;
	Mon, 24 Nov 2025 19:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764010917; cv=none; b=Gl/Y9fpQB+b2G0MLHuSWbvjVJAL7qDeWLAKaXXQbZG2Wki0palP8WDiqjXsur1ts8m33+y5ApGo/YHCfh95ucsrgnyqgCBTu/5l1lO/V/SPAncNBcgoJ1txNBccpfdFeRuu52iLrnjDlghIVOcHlnye32h8e9B6jB33kY0tG7ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764010917; c=relaxed/simple;
	bh=sz+Y8giwQknN1JPeeAsEOJmAq3bCmXnPgTBhXx0+zPQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UY+90xMc5ijlHdeEEQDjJksBhOOl7jKLOLww8zUsvdp6mHYB/Tq93W+BbAjWX9bL6vv83rtFtjuwgvaBXCKa7ogANQ8FrTF9ZCWApCKf8G31+jSxaYBHX62ghjmUd6m0HQgEZScGNg9Vvx5ym9pYnYgeyADzMAd17ApmX0b4u+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MYdVXEb2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WZeKbF94; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764010914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nYNx1QoM3TDXu2xTjuXSTLwEHNfYf7gMZwpVUu8pe50=;
	b=MYdVXEb2pFqRvqBzY3b4pWujfixlU580glHBcDdcaRynnRgyXtbzorLYvFBGvaZp3AXZRw
	yogsueZdqkoHOjQZFrQDKvx+/6evFNZ1dbirF7PR7GMK1a/7ClW5Ra7HFDUc1AJ7NpdxrS
	VBeAkb5IHD0PgwckoCOibRk3hx5ck7IFWNePC36U1Wcd07ZJhsKgtpZx3P7lEwwatpEfmC
	NzTNmJBm6ejzw60mXJUvKLAVnbYwUQrqfEFfVwDpx8vL9rQOMuFpBRlIbrAYaE/CQx4BgH
	eBY+xNl1kk5l6k3rSJAA1POBJ1KM2GcjMO60DrjORrWRX/TRy6RByqNkevuYnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764010914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nYNx1QoM3TDXu2xTjuXSTLwEHNfYf7gMZwpVUu8pe50=;
	b=WZeKbF94VI3cj/MUVmPoC3lBw5JWQTtdVCzta98XAs5OjNhuyU9447Bm+yV75XtBPveDeS
	WVZFN2pawK5OJFCg==
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/4] irqchip: add RZ/{T2H,N2H} Interrupt Controller
 (ICU) driver
In-Reply-To: <TYYPR01MB139554C11AC25646D5503985385D0A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
References: <20251121111423.1379395-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251121111423.1379395-3-cosmin-gabriel.tanislav.xa@renesas.com>
 <87see6hxjb.ffs@tglx>
 <TYYPR01MB139556A313B1377F9306A7F6485D0A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
 <87ecpnilqw.ffs@tglx>
 <TYYPR01MB139554C11AC25646D5503985385D0A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
Date: Mon, 24 Nov 2025 20:01:53 +0100
Message-ID: <877bvfi7a6.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Nov 24 2025 at 15:28, Cosmin-Gabriel Tanislav wrote:
>> From: Thomas Gleixner <tglx@linutronix.de>
>> Sent: Monday, November 24, 2025 3:49 PM
>> 
>> On Mon, Nov 24 2025 at 12:50, Cosmin-Gabriel Tanislav wrote:
>> >> From: Thomas Gleixner <tglx@linutronix.de>
>> >> Sent: Saturday, November 22, 2025 5:56 PM
>> 
>> Can you please fix your mail-client not to copy the whole header into
>> the reply?
>
> Outlook, it's unfixable. I can remove it manually each time if it's
> too much noise.

Either that or ask your colleagues how they avoid this nonsense.

>> >> > +   if (!irq_domain) {
>> >> > +           pm_runtime_put(dev);
>> >> > +           return -ENOMEM;
>> >> > +   }
>> >>
>> >> The mix of 'return $ERR' and 'return dev_err_probe()' is confusing at best.
>> >>
>> >
>> > For ENOMEM, dev_err_probe() doesn't really print anything. ENOMEM is
>> > what other drivers seem to use for a NULL irq_domain_create_hierarchy()
>> > result.
>> 
>> That's what I was missing. Now it makes sense.
>> 
> In conclusion, should I keep the bare `return -ENOMEM` in both instances?
> Just to make sure the next version is proper.

Keep the -ENOMEM.


