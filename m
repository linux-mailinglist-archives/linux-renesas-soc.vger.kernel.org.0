Return-Path: <linux-renesas-soc+bounces-32231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGMNLK11/GmdQQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 13:21:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 611174E75B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 13:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0484C3003823
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 11:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB2B36C9EE;
	Thu,  7 May 2026 11:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Gx0edOfG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95DE3B2FED
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 11:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778152872; cv=none; b=WQGLZV8/t7s5OsZWrWob7MvZipPOec33PsPXHRexWLLdRlH/ztlg6b6zWgWWpGY3hFJk+VwExwiK3hWN2stqFfTGeJwzFrBF71KfIMHPb/dVLhN+11RpLuEYS/me/M7nwWah1frFipTgk9lC5cdjK/S6/+t5gTidEgexRsWS+2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778152872; c=relaxed/simple;
	bh=k3w3Wg4hhYKzm2ajlCQugTngqghBsE21BpT/F90KZr0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cweRKSYChnvEZz/ha/R9FoOBlg0lc0T8i+o++qov37SPiVabJ8QoRB0ht008emdHYEbdsRpTyPykG8vYtpkj7od7aIpkfDKpgkk3/Lc3eerorvLWq0C6D9oJSQDrrg1p+eqCq9GaDjguG0SkDCpFU+yzTwLXoI7ujvPx6XFv0oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Gx0edOfG; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1A0E91A355E;
	Thu,  7 May 2026 11:21:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB85B60495;
	Thu,  7 May 2026 11:21:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C96EC107F2329;
	Thu,  7 May 2026 13:20:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778152860; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aOLysT8Z8y7OfYfpXXoyJQ4LwrS6dTwQ8oR1aY1rOIE=;
	b=Gx0edOfGF5ZRmePWCrjxbAa5P8sGxCQ2//lD3uDdvikDF+Nkw2RCNaBZax4skIsYCx4qSd
	iqmezGwKRr8i+Q5ctJ2Q/olOLRPQCXYG4gVDIhlxePs+cdMORUnHVyMQo2RjCKBDI81khT
	N1QzKLQKpoU0zsHM+wdu6EoL1gTv7C2gs+21O+IQpsfeOKohdniYZdMQXPf0dUf4ReKyUL
	9fSs0qpic/TV3hKPaK7rUrQq8wFwGwykgvOFWFsAszhw2s1XgHaPP47oFwZBiV0PP7QDR3
	4kAEc4/ir0WMBwcIG/u0i0d/nFTJfQ9F6KhqGYfI5g469Io8h6WYyY0w2WGLJQ==
Date: Thu, 7 May 2026 13:20:57 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 3/4] watchdog: rzn1: remove now obsolete interrupt
 support
Message-ID: <20260507132057.19e86962@bootlin.com>
In-Reply-To: <20260507102410.43384-4-wsa+renesas@sang-engineering.com>
References: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
	<20260507102410.43384-4-wsa+renesas@sang-engineering.com>
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
X-Rspamd-Queue-Id: 611174E75B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32231-lists,linux-renesas-soc=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sang-engineering.com:email]
X-Rspamd-Action: no action

Hi Wolfram,

On Thu,  7 May 2026 12:24:08 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Previously, it was overlooked that the watchdog could reset the system
> directly. So, a workaround using the interrupt which called
> emergency_restart() was implemented. We now configure the controller
> when booting properly to allow watchdog resets directly. Thus, remove
> the interrupt workaround.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/watchdog/rzn1_wdt.c | 19 -------------------
>  1 file changed, 19 deletions(-)

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

