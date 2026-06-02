Return-Path: <linux-renesas-soc+bounces-33468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6vAZKuNTH2pSkgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 00:06:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF41632562
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 00:06:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H33pAmsi;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24065300D951
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 22:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8553A7828;
	Tue,  2 Jun 2026 22:06:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E904839769B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 22:06:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780437981; cv=none; b=gQVY2ywpH2m14pNZeUEhNiWy2CO2ful4bWEVF5zp9KOpxMiHHZrrJfUrjhUX1wilueb9+43GwpOKZGxcAAqawCNmbLbv5Jwpfh9ujR5XBCVklUU4IfGBFjA/fAcLh+0wgEBQwtZ6+pm0cX91oK0boB8+lQpwNRcw+vndSkiCvV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780437981; c=relaxed/simple;
	bh=6bFM7RnBqOusxScs1N1KTjygnjpRTHNuBBIsjnLMCIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+Fe1GMxsQaYsPMkj3InGV0irDo2o4U79KtiNBtk7S18ieAsqB/u1hveInlnKwASUuHNDW2B6ndsqUf1Yn9J4Ub68qyNjNdUv+wJSKqjXf9dxsf5VJSRHksUJet4GWPg8HoO6jJrUGcIKhFLkGbqr3JcVIngkTrauBxaugETV/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H33pAmsi; arc=none smtp.client-ip=74.125.82.175
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-307263ad0cbso3202462eec.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 15:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780437979; x=1781042779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=83NdS9WzqEj31Fng8v49SeEyE/axOdCOAa4Coh7yKjE=;
        b=H33pAmsisBQDRPLsbYm0cVUb/O53TYIcxuMSb+61rFH3b0zvPP6/PnioK97SW5iJnV
         4YvyXFmdo9/4eqMSyeQ88KLMwpLE7iVwCRq0qJ0ibhzhJz22slGn4EI+ZGCkQrir8sd5
         AhmkwAuwn4e+z2Yjm2lwkTUDfcowl62HYkiK5MB2uioh8RzWfD9m+iyw/WfhiUHrYBiB
         9OKyGq64X/VZxOmCgupXrtPi3frs16O2ypOwKmi9vxRDf+onlDy1Nm9of8ioiaVA69Z3
         aGFpWyazAIHu5LceGB9vdQXSGlqGwn3Y6WvMTWogCJzmcrcrAktKSQVxCg7Vl+3s4kfz
         Yslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780437979; x=1781042779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83NdS9WzqEj31Fng8v49SeEyE/axOdCOAa4Coh7yKjE=;
        b=hALBaL8o3Ho/pxssCBj7yBVDhvVJeiR7SyOaji2cDTVbKUNhCLb6P59zdltQpv/z1l
         i/LA7xI0BOqV8E0EDvbUwKit00Xm4lgryk74c8/TjLnt/1lPFybXEmBeg6vUtRzmtVzu
         asZsI5YjdPx44+wM/glf+m27pBjR0O0GbgM35R6noYfkl7CiNv8KMWlYLz/AgeLtCEys
         9sMFp1m4oIfUNDdUbtU7jyH+28N7Y2TH00xS4rt7ckRGKIPize6HGvRU/oCA8434k5YT
         3YEFDH2jG/5AzrpPsaC5EOsHmcBQ/8av/CSqIlP436zDK9cr4usIzoKmUBvw/JJoh6yP
         uUIw==
X-Forwarded-Encrypted: i=1; AFNElJ9lEQaFeb5vyU2w9VFykR6RU/nPhiYeMFTEqcWyyQGD8U5vbAQGKSz9tfKDPZBU3RpiqMSPq8OOLxBoN+Gsksm/ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMKdF0ynQbJWht1gp4k+Z51jE5mq+gzdAbTpNgsG3CsbUiQZjF
	fnrMoXn1kbEm+DRfnYMYSIqVKwrm9S/4lzNbSNHKRmn9pGuIaxg2U2VxjTW7yw==
X-Gm-Gg: Acq92OEBhv2aiDfo1RwATmjPkHuJzvSy0IwH4BmP3oTGXP25lO66xxG+AD5bvH7APhN
	E2r3UpmLl7Q6qaaKUwMuWmysJCD5CuBvpCImwQla0xIPeUkj7c36BxvFn8n4z4KhQDWoM4cADpB
	PU6lraCnheUegsCTnY31bWdfa0NxLSmlPYGd0kPyBHCTjPekkc5R79ju+Phtz5QDpwMxXcVRtqP
	0PRrG+tF6T4HF7OD2mkFYJ+h+sBEcUwl76RMqKONvizxUDRm296r1Jz4wvHOymzGfvNyEUI/CnS
	X9Zu7nOn+vtfkAxga6GKpyIkEAcwDT1C3X4ueHazzErCwrciGebBK0RQ7ED4DBR/hrylgLOyA3M
	cQRRJeNoquq9wnCMYUc+OF9Ua2pxX7sljUfcsvfKS7sm6pNOsy3QQwcbBvhK6JgbzaoVfNrxLOC
	QRNruxj33Y/W4IzTlhAXVw8xwZYzvuqb7rehFPN8LnGSbZpkTU49hsy+HV06Xv9hCDh35eILX/G
	xc=
X-Received: by 2002:a05:7300:7252:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-3074fa79f08mr317280eec.10.1780437978893;
        Tue, 02 Jun 2026 15:06:18 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:c4f4:520b:1304:b259])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dfa3a2asm1102723eec.31.2026.06.02.15.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:06:18 -0700 (PDT)
Date: Tue, 2 Jun 2026 15:06:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/5] sh: mach-rsk: rsk7203: use static device
 properties for LEDs and GPIO buttons
Message-ID: <ah9TXCcBPNh77Ut5@google.com>
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
 <20260520-rsk7203-properties-v2-3-465f3308021b@gmail.com>
 <ah9TEJ_jrfcJwrb9@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah9TEJ_jrfcJwrb9@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-33468-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:ysato@users.sourceforge.jp,m:geert+renesas@glider.be,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ABF41632562

On Wed, Jun 03, 2026 at 01:02:56AM +0300, Andy Shevchenko wrote:
> On Wed, May 20, 2026 at 10:13:19PM -0700, Dmitry Torokhov wrote:
> > Convert the board to use static device properties instead of platform
> > data to describe LEDs and GPIO-connected buttons on the board, so
> > that support for platform data can be removed from gpio-keys and other
> > drivers, unifying their behavior.
> 
> ...
> 
> > +	for (i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {
> 
> 	for (unsigned int i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {
> 
> ...and drop the above definition of i.

Why? I do not see coding style suggesting this. 

-- 
Dmitry

