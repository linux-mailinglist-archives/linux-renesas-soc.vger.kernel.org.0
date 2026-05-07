Return-Path: <linux-renesas-soc+bounces-32232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHfvKxB2/GmdQQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 13:22:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5009D4E763B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 13:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82E9F3006B21
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 11:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651C73806D4;
	Thu,  7 May 2026 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mHJDjue1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4543B895B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778152934; cv=none; b=rWTQixwCCHxzB2ibD6JrIzPj6wRUaowlibaiNyJRkeMaERAH4/aFatPVa7/1CRNlSBVPDtTilqi0j0CzAG6Xw5A5WpZ7WL87guYS6G3QmVFUa5LOdVCbYUp2hNCoKQG11eE8ODNHMT1cevhLXl3vNQgP67kEXET63jS1eh9jy+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778152934; c=relaxed/simple;
	bh=6wrZY9IziN8qWO7M7Go6gONMebXh2ZZ6cInaOrkBUH8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IkCsDfojSngWvLnhWVOPybX7U/CQ8U/RlD+4IgP1G4k+GcZZbh5EkYw+uNJ9dber9mV+m2aodsbmeAJNH97xO/RT2ZdoQKjTeOUpmJg1HZmPFqE9a0RWcz95ziZu2S364EevkmDVWuUC8bTagt//8el5JQSL43ghPn4hRHV7QKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mHJDjue1; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 374EE4E42C2C;
	Thu,  7 May 2026 11:22:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B47860495;
	Thu,  7 May 2026 11:22:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C54A9102F24D0;
	Thu,  7 May 2026 13:22:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778152930; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TyVFfMB+bFVtMdTeDS+Mg+c4RXdxV+nVPBtIth66O7o=;
	b=mHJDjue13Ny6zxx3NkuAPI1Ol93kpDHpMSkO2coIizzlkFaydoNBAtF1/THfkEtWM4sMN9
	0uRK2LxMcT0E1Q3kTGQyVSSy3BneWuRRh9oPcy7WPeVVaRHPGjKJcaixLclJ2LW/5q1QbQ
	u5tWNUdFA71BI//Sk3ED4eiA4v4SqZ7ez3aVOy0EpNPW1jUs+O/PGa7LJtFcPV1pZYIWPD
	YOIZGWz3f49yOAwiGO5Ag7lYLbsZmomehby/F9i8uAmS3oSEj9K1+bjWhMZuGPAa6JiGLh
	zVqr3p2SYns2whVqjGOw7lGsI+M/EEt1ShO3RlrAhOgE2My2ow/H7Pk25HQ5gw==
Date: Thu, 7 May 2026 13:22:07 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/4] dt-bindings: watchdog: renesas,rzn1-wdt:
 interrupts are not required
Message-ID: <20260507132207.5f2fdb7a@bootlin.com>
In-Reply-To: <20260507102410.43384-5-wsa+renesas@sang-engineering.com>
References: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
	<20260507102410.43384-5-wsa+renesas@sang-engineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 5009D4E763B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux-watchdog.org,roeck-us.net,kernel.org,glider.be,gmail.com];
	TAGGED_FROM(0.00)[bounces-32232-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:email,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Action: no action

Hi Wolfram,

On Thu,  7 May 2026 12:24:09 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> It is now understood how the watchdog can do its job without the need of
> an interrupt. So, it is not required anymore but optional.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

