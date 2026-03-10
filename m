Return-Path: <linux-renesas-soc+bounces-29143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE+KKMlfsGloigIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 19:15:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0019A256469
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 19:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA4113051ABB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 18:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F3B3BB9EB;
	Tue, 10 Mar 2026 18:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KSzgFlhI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4D326D4CD;
	Tue, 10 Mar 2026 18:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773166352; cv=none; b=V4F35mhO1cds/PbTPjR2sUnlGbi0qbbI00JJpdHBvQ2CRW79jpZVL03fl7NXbk0poSBLqBJxcKIGEsMu9toOuQswqB9kYy7myN81Nunnwd1SgB2MsoUbEBZBHpZ/TskWAy9/rejWcOihLx6i/nWzkAZug0nO8B9hsnQ83WZivMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773166352; c=relaxed/simple;
	bh=WloTWxMSE2Fe7t0F4dJJbaN/dI1rI+CtZARKDjs2H08=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IERyYuHBem1G6tYUgueKOtvgjZ2KN1T5hqoFz9wsyauaf9DYkbsdFgXfoXvDEihzntekxEvnTd5fO1JkOCJxCshPYMupvJX1YsZcs0xaU2WpkhFCIYNmoIZ09lKjSeOtS839e2J0/T1vioHsVPEDFkTyd0A3YTUt3aKsamuyaa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KSzgFlhI; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C8A214E425F3;
	Tue, 10 Mar 2026 18:12:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 940B360002;
	Tue, 10 Mar 2026 18:12:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 649A510369709;
	Tue, 10 Mar 2026 19:12:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773166347; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MhTupiUaX+fQyopMmq6kATNdFQbTphgFtpGuNjsQLHw=;
	b=KSzgFlhIkYTC7gWFCkchxnJDReZsczimlLQzUWcZZGaRsagScWI1fewstFZ/Yeg/Pfrdmg
	Zob2JWtz3Qz+fSinBcfJ9YicJL1ilcyDaUBv4bmgEFeYdKaNNyfrVW1dgc8mRguAoH3W4m
	21BOmXrriD2aRcXNZGFjOcGKDqGo90FuZC8myeDqOK3gvE2oYfXyFLDaVUteTnnDh2uHwk
	60Z6I7ajI0xtVLez2KooyjDXPr28siLE6Dbv0JgRg/9dmg6vOK/RbAJdCLIx+4R01vrLHT
	hXIiItuDRPWG8dXGAhyYvXIunrrwFx66HzpOdN4V5clTkkx1k4aCvx9pxwzLsQ==
Date: Tue, 10 Mar 2026 19:12:20 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: renesas,rzn1-wdt: Document
 the reset line
Message-ID: <20260310191220.52ed546c@bootlin.com>
In-Reply-To: <392ededd-ee73-4afa-88b4-b15fe1dc3457@kernel.org>
References: <20260310173249.161354-1-herve.codina@bootlin.com>
	<20260310173249.161354-4-herve.codina@bootlin.com>
	<392ededd-ee73-4afa-88b4-b15fe1dc3457@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 0019A256469
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-watchdog.org,roeck-us.net,kernel.org,glider.be,baylibre.com,gmail.com,sang-engineering.com,vger.kernel.org,se.com,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29143-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[2.98.121.64:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Action: no action

Hi Krzysztof,

On Tue, 10 Mar 2026 18:38:50 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 10/03/2026 18:32, Herve Codina (Schneider Electric) wrote:
> > Watchdogs available in the RZ/N1 SoC can use their specific hardware
> > reset line to reset the system on watchdog timeout.
> > 
> > This line is not documented in the current binding.
> > 
> > Fill this lack and describe this per watchdog reset line.
> > 
> > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> > ---
> >  .../bindings/watchdog/renesas,rzn1-wdt.yaml   | 22 +++++++++++++++++++
> >  .../dt-bindings/watchdog/renesas,rzn1-wdt.h   | 16 ++++++++++++++
> >  2 files changed, 38 insertions(+)
> >  create mode 100644 include/dt-bindings/watchdog/renesas,rzn1-wdt.h
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
> > index 7e3ee533cd56..40a9a4ebc716 100644
> > --- a/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
> > @@ -26,6 +26,26 @@ properties:
> >  
> >    timeout-sec: true
> >  
> > +  renesas,reset-line:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    description: |
> > +      The watchdog reset line (dt-bindings/watchdog/renesas,rzn1-wdt.h defines
> > +      these values). A wachdog timeout asserts this reset line to perform a
> > +      hardware system reset. Two watchdogs are present in the RZ/N1 SoC and
> > +      each of them has a dedicated reset line.
> > +
> > +        - 0: RZN1_WDT_A7_0
> > +          This reset line can be asserted only by the A7 0 watchdog. This
> > +          watchdog is the one mapped at 0x40008000 on RZ/N1 SoCs.
> > +
> > +        - 1: RZN1_WDT_A7_1
> > +          This reset line can be asserted only by the A7 1 watchdog. This
> > +          watchdog is the one mapped at 0x40009000 on RZ/N1 SoCs.
> > +
> > +      If the renesas,reset-line property is not present, the watchdog timeout
> > +      only triggers an interrupt.  
> 
> I don't understand. You have two watchdogs (0x40008000 and 0x40009000)
> so why you would tell each of them that they can reset line associated
> with them? Can a watchdog reset other watchdog's line? No, thus code like:
> 
> watchdog@40008000 {
> 	renesas,reset-line = <RZN1_WDT_A7_1>;
> };
> 
> makes no sense and thus is pointless to specify in DT.
> 
> What's more, if reset line is always wired (and how could it be since it
> is fully within the soc), why would this be board-level property?

This is the exact same for interrupts and clocks.

Interrupts dedicated to IPs and hardwired, as well as clocks. Those resources
are described in DT.

Why not this reset line?

> 
> 
> 
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -41,10 +61,12 @@ examples:
> >    - |
> >      #include <dt-bindings/clock/r9a06g032-sysctrl.h>
> >      #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/watchdog/renesas,rzn1-wdt.h>
> >  
> >      watchdog@40008000 {
> >              compatible = "renesas,r9a06g032-wdt", "renesas,rzn1-wdt";
> >              reg = <0x40008000 0x1000>;
> >              interrupts = <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>;
> >              clocks = <&sysctrl R9A06G032_CLK_WATCHDOG>;
> > +            renesas,reset-line = <RZN1_WDT_A7_0>;
> >      };
> > diff --git a/include/dt-bindings/watchdog/renesas,rzn1-wdt.h b/include/dt-bindings/watchdog/renesas,rzn1-wdt.h
> > new file mode 100644
> > index 000000000000..fe534aff0609
> > --- /dev/null
> > +++ b/include/dt-bindings/watchdog/renesas,rzn1-wdt.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * RZ/N1 watchdog reset lines
> > + *
> > + * Copyright (C) 2026 Bootlin
> > + *
> > + * Herve Codina <herve.codina@bootlin.com>
> > + */
> > +
> > +#ifndef __DT_BINDINGS_RZN1_WDT_H__
> > +#define __DT_BINDINGS_RZN1_WDT_H__
> > +
> > +#define RZN1_WDT_A7_0		0
> > +#define RZN1_WDT_A7_1		1  
> 
> I also see little value of the binding, but probably because I don't
> understand the point of this patch.

I mentioned 0 and 1 for those lines in the binding and referred to this
header. What's wrong with that ?

Clocks use the same kind of description.
A bunch of defines in header file to avoid a direct number.

Best regards,
Hervé

