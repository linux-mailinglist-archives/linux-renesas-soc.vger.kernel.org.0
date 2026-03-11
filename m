Return-Path: <linux-renesas-soc+bounces-29222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIkIDOqJsWnkDAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:27:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1E22667E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 549EE3031AC2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 15:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52211EB9E1;
	Wed, 11 Mar 2026 15:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KtWQn+Wd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C4A3DEFE1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 15:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242855; cv=none; b=Ifj9/Oc9GbjzQSCtThaCKUDqWUZhLLgZtziCSVXN6YEoxIA/NpvO42ft7YUuYM3CecMycH59cE7Bm2K7A4fwIRuUn/M9jTkbekgFZy5tigeH30IxSwhsKb+BPHaDc2ZAj9l3qrZ/2qoAoGSYJR6GdF3x7aebxfv/8NfSuuplZtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242855; c=relaxed/simple;
	bh=wJNQd+SadSYDNivMNJ806HXfcaXIF0LG68EVF9omjvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5+wkQqVJCrrVZ2KCyar1i8As9xRXz/aC+al5/OpGJKSRCRIIaI0BhdlWMHkUTw/euYLQZHLrTdVGobTklVqoDwtL2lhjeG0UuOTL+yMsxt6RYPKmRrmATyeqZn2BefBSRabbKZuRftwz2rT1VNlfUP7DJDaR1M8DyNn5sSGi8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KtWQn+Wd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cnnn
	P7gfPtAZ3+ZsL0uKHlf1ZNDe3ftgJZs9HAcTj2Q=; b=KtWQn+WdxzHk9CDrCjXZ
	MgXDG/Sj1LXGkJiclelXpVSntQrt6y4HVZ7ADl0oskZvFLGIHghct8Ssxn7a67vt
	Ratk3CRHkar1ARpiliXfkv5tPuVyUN4Wk4yQJOUQNPyR0JiW1t3nDSYGQf4Wt/c6
	9MF+quhqvclKDG/qddEkF1sKFE9Eznl91dKxKC9QeGPb/vTAEMIHY4VOpsu7Ve1Y
	nSMmd8T6qEzpyyQBxggdcSaqmKOnGSDQDOhfEc7zSc4klvjtdmOMLgBOd2Iin5Kc
	dGREc3OUiNYPGPv2lzE51oXlqCrg2uXl7at9AzjGHAWaMzchKHTLdZh8LL3Sdn5d
	+Q==
Received: (qmail 3707300 invoked from network); 11 Mar 2026 16:27:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2026 16:27:31 +0100
X-UD-Smtp-Session: l3s3148p1@hWQ+RsFMaHlUvUmE
Date: Wed, 11 Mar 2026 16:27:30 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/5] watchdog: rzn1: Add support for direct hardware reset
Message-ID: <abGJ4nrjZVRdLvq7@shikoro>
References: <20260310173249.161354-1-herve.codina@bootlin.com>
 <abCSvdToaQG20uWT@shikoro>
 <20260311160907.0686cfa0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311160907.0686cfa0@bootlin.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29222-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux-watchdog.org,roeck-us.net,kernel.org,glider.be,baylibre.com,gmail.com,vger.kernel.org,se.com,bootlin.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 8B1E22667E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


> On think that could be missing is the way to know if we are allowed or not
> to enable this reset source.
> 
> Maybe a new "renesas,reset-type" property in the watchdog node could give
> this information. This property could take the following value:
>    - "soft":
>      On timeout, the watchdog triggers an interrupt.
> 
>    - "hard":
>      On timeout, the watchdog asserts the directly the system reset.

This would be configuration, not HW description, so not for DT. Also, I
think watchdogs are expected to reset the system. I'd see it as a quirk
if they can only raise an interrupt. So, let's go the full system reset
route, I'd say.

> Whatever resets allowed by the firmware, it is already overridden for the
> sofware reset and the watchdog resets the system.

I see.

> So my plan for the next iteration is, as you suggested, unconditionally
> allows watchdog resets in the clock driver probe(). Indeed it is the
> driver in charge of sysctrl.

Sounds totally fine to me.

Happy hacking,

   Wolfram

