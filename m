Return-Path: <linux-renesas-soc+bounces-28936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPXYIli/qmlXWQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 12:49:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3DC21FE14
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 12:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA724300B2B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 11:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27459363C55;
	Fri,  6 Mar 2026 11:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dRRi9AoR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7F733F392
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 11:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772797778; cv=none; b=Oby8/Z/eW1n+Nu57e5YPrgfbbbJdb2qBScS7kqkKsrEoEOy3Q5zpdEduEt9aMAc63JuhZtQvYLJhq191sYI1C92MG7YyVdfqFYQjy0bvMxYrp42xmB9d+f6QafpfbmiPtBJv9kd8CwE9YAjoEaxi2Yk/6A3pRoeAS1HQNN8lPCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772797778; c=relaxed/simple;
	bh=Wjq113QW0k+KgsnYyZwGU0Xj1t4ADCVrZtdHXKgwzx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZzqXVxpHjlDMTmvWQY4gSARQr1aQWsPEXXj1IRtw/TPnDcPGT5EgGNBt+KtE8eFhU9/e/zhk8OlFGwbMLwuQKK+khb0a2ktcm1lHBqGBJVe0mkJ/lTsGA2zVv+YowtJcKWt/6UI+aHtfPc/Svvj/5pasaeQ/Ge0cM64ZqlqMsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dRRi9AoR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Wjq1
	13QW0k+KgsnYyZwGU0Xj1t4ADCVrZtdHXKgwzx8=; b=dRRi9AoR7gRVGd251cTE
	dHVicZ7trstUtUl3yYzsOtVT5SX8UyfZRZYEb2dC9lGH0Zz20jj6lmUqXJXCMlqY
	6ug2WCNbMhICS036H6M1yyNtA3hPB6m0XHb5lYmRgTZI/KvO8UaMifrsffKfQsnE
	Ay+nFRrjGHu1s+X4bKSzvJqKPfN6OOzC/PpIDxXjJUNGv5WSJolkIwQHKENu4ztw
	Z++URVXQ5YzCI2EXsjJ3Dy5r8bx2Mq2mLW8R8AlZbBeb2oIVYl0cQTDZKQzGx1cl
	K8Bu0wq7Kbrkj/12vIuLmGU8CIaj6yXotg34EmEHUj7/qyfpbE0Y31DMmhcK11U1
	DQ==
Received: (qmail 1611070 invoked from network); 6 Mar 2026 12:49:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Mar 2026 12:49:26 +0100
X-UD-Smtp-Session: l3s3148p1@9uYapVlMmNsgAwDPXzF+ANZpdrMKUeLI
Date: Fri, 6 Mar 2026 12:49:25 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: phucduc.bui@gmail.com
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>, Bastian Hecht <hechtb@gmail.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Input: st1232 - add system wakeup support
Message-ID: <aaq_Rft0gvVqxmMD@shikoro>
References: <20260306104025.43970-1-phucduc.bui@gmail.com>
 <20260306111912.58388-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GiP2FLOrzOJ6xXEk"
Content-Disposition: inline
In-Reply-To: <20260306111912.58388-1-phucduc.bui@gmail.com>
X-Rspamd-Queue-Id: 8F3DC21FE14
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-28936-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,labundy.com,wolfvision.net,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sang-engineering.com:dkim]
X-Rspamd-Action: no action


--GiP2FLOrzOJ6xXEk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Krzysztof already adviced you to not attach new series to old threads.
Please follow this suggestion:

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830


--GiP2FLOrzOJ6xXEk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmqv0EACgkQFA3kzBSg
Kbbo6A//YpGu96Gn41EiQBLt67gdeLRRmQVTEg60skkWpxPhAtqQiqF8vTIb+jXo
DuTrk5LJttrqkSTImDpOSIqU8BaM/R6jcJuUaMj+2idFJw5U/krC5pzB5PpbE+DZ
LCIDviIpvL88CZApBziiQGSQeQPSXCOZThTw1uu84OxoGFccsoWyHD/cryg3Nk47
6Z1oNyYrzpWxASSjZMxZyHElJyCWADvm8CUdczIkES/hwuiylQE4m+SvuypUg/Gb
WpA+nHrQTM42U0E98Gew3CssKnjQFKwDQO2agd9YNAujwSCT9GfLfD/J9Fv6M9nX
l69PjOayu5+Y/lt6ij7qVf/2Nuez0tqLtRzKuuKHA+BD5IWx9upzGhpLd5q3IfWI
5IW6wcwt+t8X/uF9rGSbn39ltUZfqIZjtFs8N0qjAwZQtCtoXWqH20Nmj1eNt3M2
23+LXThZlA5vP9fs8cjANBdWf7Wx+9OV0aemReWMA1KsPxoThnqaW9hE9xvDEklQ
Go4xk+OKUi8FwJSJp70ve+L0wmHv6iFrzRFYBaLcqQcZ+j5AUWJEaAay+EwyKfRb
1L7045oF4U8Q/XhF4yr/9FQF63njbdeVH9jsn9uC/2WnMDhvqENoAh4lgcTpSsbd
t2dFptv8kGc7tA5OwPmimuNmXXyXcCdr6AswimzABUddjrpAQWo=
=zukW
-----END PGP SIGNATURE-----

--GiP2FLOrzOJ6xXEk--

