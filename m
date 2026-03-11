Return-Path: <linux-renesas-soc+bounces-29218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CE2jIKmFsWmjCwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:09:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6C52660F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A93C730185E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 15:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC50C3D8907;
	Wed, 11 Mar 2026 15:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="q1m+aGdc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB853D1CB5;
	Wed, 11 Mar 2026 15:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773241763; cv=none; b=qOLtKwWuydJyBMa08xYlXgM25sQrFFPMy4PW9jwqWQnzeBOF9KHwcIYFxfVSSeLNL/9V0FD4bRSbVQPcJOtkeP3MJdjjK823R34Vgrkor5jjQzg9MtTc36Ue4b5dnuBx9Gc3LiUQgAUWz3xNBdiSEZpW9Sqjvcz6N3KbyeJfHwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773241763; c=relaxed/simple;
	bh=50od7VZklJaoDPFU9masIQWTV9wnMmJcpnkKhfW/Ke8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QEGRz8UuLVX6qbnmNjgVDX0D+1kpOeNaLmDg9cKsLnrgbbkZzGHnBvDUMfqvuslowVbpzOhZvD5g+82UKAKxQN4qo4EbiEjA7cWcrTfZ7ZRWja9wodKiD7YqxH20C704Kn4EcCirD+a0kL3+hQpunv7iiINqMZ4PEnGlpA9utBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=q1m+aGdc; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A6C9BC41584;
	Wed, 11 Mar 2026 15:09:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 52F1360004;
	Wed, 11 Mar 2026 15:09:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 476B9103699C6;
	Wed, 11 Mar 2026 16:09:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773241755; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s1T2OqpYmAbRPLJVPDD3u/1CnzCwvaNxy3cFJRyOgec=;
	b=q1m+aGdczlBzSW0JhCJSyUIYzEhSzMmaevs9ADbx6/IYe11uvKD3ir3NpXA0iAkyLWyNnv
	wDFCqKqXCCNvZinNSOhiqxgKLKVTQ9HIhTbrg5qucwEiIqVAWeM7guzpsl484JZA4JBMs7
	cGPjIa/vSTF4qHvGociqduDkzdf3uf144/eTari3I/7uyPqro5UWsz2OT/Rb92Iq9RczCL
	qQaHYzb/2zVAEEchJrefK0zJ4kSD7I8btIQ/TfEPfFDwCnN+ntM3nkFMoIxaGXEdMuKEEi
	uLShZfJD8y8kOdymRce5TD/xkl/YFcPZO9LGHPcvjseYc3mIJBLi+Aw+G9taNQ==
Date: Wed, 11 Mar 2026 16:09:07 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, Pascal
 Eberhard <pascal.eberhard@se.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/5] watchdog: rzn1: Add support for direct hardware
 reset
Message-ID: <20260311160907.0686cfa0@bootlin.com>
In-Reply-To: <abCSvdToaQG20uWT@shikoro>
References: <20260310173249.161354-1-herve.codina@bootlin.com>
	<abCSvdToaQG20uWT@shikoro>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-watchdog.org,roeck-us.net,kernel.org,glider.be,baylibre.com,gmail.com,vger.kernel.org,se.com,bootlin.com];
	TAGGED_FROM(0.00)[bounces-29218-lists,linux-renesas-soc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3F6C52660F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wolfram, Geert, Krzysztof

On Tue, 10 Mar 2026 22:53:01 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Hi Herve,
> 
> > On timeout, the watchdog also asserts its dedicated reset line. This
> > reset line is connected to the reset controller (part of sysctrl) and,
> > if this line is enabled as a possible reset source at the reset
> > controller level, it initiates a system reset.  
> 
> Okay, this seems similar to R-Car SoCs, so multiple things to add from
> my side:
> 
> * I agree with Krzysztof that the renesas-vendor-binding is not the way
>   to go. The information could be either deduced from the register range
>   or you could have a link to the syscon describing somehow which reset
>   to allow.

I think deducing the information from the register range could be ok without
the need for introducing and use syscon.

On think that could be missing is the way to know if we are allowed or not
to enable this reset source.

Maybe a new "renesas,reset-type" property in the watchdog node could give
this information. This property could take the following value:
   - "soft":
     On timeout, the watchdog triggers an interrupt.

   - "hard":
     On timeout, the watchdog asserts the directly the system reset.

But I am not sure that this king of property will be accepted by Krzysztof
even if similar properties for similar features exist in other watchdog
bindings.

> 
> But:
> 
> * On R-Car, we require the firmware to correctly setup which resets are
>   allowed. Only in cases of broken firmware, we override it in the
>   system controller driver. The latter could probably be argued here.
>   The firmware is old and will probably be not updated anymore.
> 
> * If the watchdog driver kind of unconditionally allows its own reset,
>   we could keep it very simple and just unconditionally allow watchdog
>   resets when probing the sysctrl driver?
> 
> * If you don't like this, you could also parse the DT for enabled
>   watchdogs when probing the sysctrl driver and act upon findings?
> 

Looked deeper in the code.
On RZ/N1, the watchdog interrupt handler calls emergency_restart().

The clock driver (driver handling the sysctrl register area) allows the
software reset source unconditionally and register an handler to request
this software reset on system restart notification [1] and [2].

Whatever resets allowed by the firmware, it is already overridden for the
sofware reset and the watchdog resets the system.

So my plan for the next iteration is, as you suggested, unconditionally
allows watchdog resets in the clock driver probe(). Indeed it is the
driver in charge of sysctrl.

Geert any opinion on this topic?

[1] https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/clk/renesas/r9a06g032-clocks.c#L1346
[2] https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/clk/renesas/r9a06g032-clocks.c#L1282

Best regards,
Hervé

