Return-Path: <linux-renesas-soc+bounces-33270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBIoEj4VGGprcwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 12:13:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7135F0560
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 12:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6907530E14DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 10:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104F63B2FFE;
	Thu, 28 May 2026 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TWmiC7Kk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9713A5E97
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779963000; cv=none; b=bsrwVbD2E92rU/o5o11yNMyXFi9Dl3TtlyZnI2eYpBkdi7dNpGk+oMVfnxVjlW7SZ/NNm1ZgMb4UEult7gMxY2uFdqVAT1gYhOqmTuGa7VgoKfO7QEAK2i7Kz6PrK106wDcIMEV7M2c003gOsPQD3r1YKiPDiW1aa7TkcZ9APj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779963000; c=relaxed/simple;
	bh=jDJJEw1aEW13FPk5Ox8KXXR1xi9c6g3zuF8G653rRWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdjBIcMFhRqGxCEe1xEODTWLPyVI5TBkRuBZfGzdkvjUU2U2yNSMd5GEy0nvehUXh/ur2b2XDEtFDDyYFGSCJZNAIjhwbNTgX2kEzpAyOf8VEAkL4yCEdpaiUdVAy/beuRSIYTEtjP6VQOWNtEW9pdy1+0mBf7upgkHl+iRGziA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TWmiC7Kk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49041e84237so52059365e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 03:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779962995; x=1780567795; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3dEoQrHmxD3QAsur3ni9bkWOs/bYRX+l4pg8imj6MVM=;
        b=TWmiC7KkHeNsMtwCTWIN3VCe/GwirsFCe2zvSi5w5+JZLcN4NkccRBluKiJ3pSsXu/
         TsPCVdzjvl1lMGBhcHQgbfJ5qN/JeSeWeZLqr7dDylCHDRTDEErHP9f6bW1Xa/BDshmk
         ndXUc2OOinGLn5tAQLROEgInaOhznbotS39yrSjkHndcyno7DF2VmPna/s+GLKTlQnzh
         mYEHQtVnHgc8ZIyDZDb5lTZIkdCIq3UKKUsfIxom/ZAuMRMKP/iTTiFAvNPZfRgv4n0M
         j/M8AEIjshWiM3pCyapa5jzoc3fx85DV9V157lQWM6xIioCR5ghd7mOe5nqYP8tv4Q1a
         wMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962995; x=1780567795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dEoQrHmxD3QAsur3ni9bkWOs/bYRX+l4pg8imj6MVM=;
        b=KRsFQKEHjb6+5JarBX8bSF2lMxeLrL4z9qF4Bp8n/5Ylk41wqjiCCFQz0JPpe9GZcd
         9Hx8SFGYfy9YSx+XKMvBiMa7U0MSZJcEQmCxl29HPAFNISn4nj117it6SBPOfDDC1HbM
         Vu2fBo3oN3h64FiX30XBDs0C7z29GXBhb726nakZunvjNuoAF6KWJYv/daDHJQUN1ksN
         eUF2UWiKVtRv3MMS3gCIKWXvsnH9DOOHKURoDWKTTSB02HjGmikcGlyhKATJpWC76bvx
         ycUSIipa0DGMsZ/FXT/WU/hu+qSvDXaUVv6nDQGF4DGzekJe/MQH/oDxzZH/RG4IEdWI
         B7bQ==
X-Forwarded-Encrypted: i=1; AFNElJ/b0oNxH88f8l0RGSnDjUpan1xEeGV+ugTf2xh2/nDLzdY8aNYIofnmPQaFWQ/NLJxfbunkXvB2p5A9ZOkHvRXzFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDgc1q6a/6cU6X+IJT/TxqA3t4Ms1ivMyD1yLYu+ORwhYfFmK9
	3YfIbt1YamfSbo/2v+Vg4FmRCJlH6SS1J/oRidCIaLl5AjIvvUoitHp5LRai6eaCjGA=
X-Gm-Gg: Acq92OHosdBSCD3zgnXnYCBq6Fo2ojgOAYmVmW00I04NypMv2MELNBDypBrMlm77jHa
	11IJrfYXNz12tVXukIurAl7Q0HK3J0Hl+ROvNIc7RUwAPFltezTKtJMopNQi17ejHjAP9wcZpRc
	ZxtVkZVgOoYSXVZ/SzJDD5AccGnqYKyL7R0mUiwn1V11lEHTDZjUdwVkYf8K6h1xE2sBRtnXw13
	DATi3tpB+oMLGqRxWIMzEBvXvs4Fwdb61A91F0hPIODjKWpDL0+P1JkSe5abT6hIWX8ywjLr94N
	5vPTagEzJ4Skq7W12kV+ZepdOlDgfD1WfwXMT2uFt778N2kAVhcEs3oCRS7ryOY7GLsDGiS1zTO
	IsMUs34ytMOvUzvsNEOgnpMKYtUrdMwmkXon3a26nPyYjrBE8c+IFmuhIOvlXQJhDI/NUlaoqME
	JgmDvEjXkIN0erOpmGYj5OlpjZQ7i6Lf6BAkyuZYja5nh3lIV5QtTRU2OZiNdNiQ3+/lqX/lP7x
	uVzPeQp267m9W3U8mOkmJHHKA==
X-Received: by 2002:a05:600c:528c:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-490947a4918mr14900895e9.7.1779962994786;
        Thu, 28 May 2026 03:09:54 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49092654e10sm28651945e9.7.2026.05.28.03.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:09:53 -0700 (PDT)
Date: Thu, 28 May 2026 12:09:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-gpio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v1 0/3] gpio: Use named initializers for
 platform_device_id arrays
Message-ID: <ahgUGOsIxlFrf9mD@monoceros>
References: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
 <177995803708.5037.5318741720946502441.b4-ty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2z3wzt7537jwqmcu"
Content-Disposition: inline
In-Reply-To: <177995803708.5037.5318741720946502441.b4-ty@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[bounces-33270-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,chromium.org,vger.kernel.org,lists.linux.dev,ideasonboard.com,gmail.com,linaro.org,free.fr,iki.fi,kemnade.info,baylibre.com,atomide.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BB7135F0560
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--2z3wzt7537jwqmcu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/3] gpio: Use named initializers for
 platform_device_id arrays
MIME-Version: 1.0

Hello Bartosz,

On Thu, May 28, 2026 at 10:47:55AM +0200, Bartosz Golaszewski wrote:
> On Wed, 27 May 2026 16:57:26 +0200, Uwe Kleine-K=F6nig (The Capable Hub) =
wrote:
> > this series targets to use named initializers for platform_device_id
> > arrays. In general these are better readable for humans and more robust
> > to changes in the respective struct definition.
> >=20
> > This robustness is needed as I want to do
> >=20
> > 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devic=
etable.h
> > 	--- a/include/linux/mod_devicetable.h
> > 	+++ b/include/linux/mod_devicetable.h
> > 	@@ -610,4 +610,7 @@ struct dmi_system_id {
> > 	 struct platform_device_id {
> > 		char name[PLATFORM_NAME_SIZE];
> > 	-	kernel_ulong_t driver_data;
> > 	+	union {
> > 	+		kernel_ulong_t driver_data;
> > 	+		const void *driver_data_ptr;
> > 	+	};
> > 	 };
> >=20
> > [...]
>=20
> I fixed your SoB as requested and fixed up patch 2/3 as one of the driver=
s it
> touched no longer exists in my tree.

Right, I noticed that conflict when rebasing my stack to next-20260527
and assumed you'd cope for that.

Thanks!
Uwe

--2z3wzt7537jwqmcu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoYFG4ACgkQj4D7WH0S
/k5FBQf+Ibzmukpa6UhZfcZUhGe0XaS6TZpmFiyy9QMJVqt3bKHdEafowQgl32yf
5w0pLkWFfORjHv+FEfH+wollsB7//hBHnEOT2nlVo2tI9s4lxfmJlJBAQYUSOPIs
vKiKxxRT5p4uRCRhV1JWg2TBVimsUw9GG2tTXHK9jOMI2SU3iYsKoSbmQLN9Rctw
k7N3zinvmqjGvYrYWYSdwN8ocBYa0b4JZGH2N3QabvS92i9doS2RMU46QIoCixGR
OLNW6wEonHxnaNjpK36WFWNH/6tXbxKMuWBDM9R3xtDtWoaLDHnMOQNCSsGVMqOI
9uMi39yy5eMdBL5EINcaVkZvXFD54A==
=ul7F
-----END PGP SIGNATURE-----

--2z3wzt7537jwqmcu--

