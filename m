Return-Path: <linux-renesas-soc+bounces-3465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED56871CA1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 12:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF280B2245E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 11:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEACA5BAC6;
	Tue,  5 Mar 2024 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kTX1GA0l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15695B662
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Mar 2024 10:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709636310; cv=none; b=Jbsu4YIzbVvWnTJpvFIKw2nuPsXQu+f0hG6210pZWLjU62w4tQKIebK6Yz1CjJvisKj/y8cGlcuYaJm9goCsDZIIsh5TTwzJQZcVJqyM6VTyNYPcJtJOxZ/oH4BO0qkr2GbakaGCKLS61pxvDFb5p740yHWc7StxcDWhhKyB0pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709636310; c=relaxed/simple;
	bh=f7Q8xEnTZun4xlenz0nLn7ZHUaKzak+LPVyCMOJnHYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EafVoORkpqVTKiziUXTax/1mQBeJZN4kBOzsvrrq9E5OlNCIXl9N/wzcPXuzidQ6bT56kAc4RLIHHcBO9cmHDZ2Jo1W6PiLToawargzXubWDYUvLqS71JgiAM49i7uUSXMd5LSb2vnmOsNxgqXloYS9u/u+9d4fAnOdtwLcxDxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kTX1GA0l; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xPuH
	QcklJTcuhcQurcuZovTdWGwzKidbYfnoix/AruM=; b=kTX1GA0lnCujzRpEw9OQ
	rUf8RLNGxnHfeTnxvRugGMgNOHiuBlIMSoyIcfHESYVtpvetbi7d2kSRIoubybVl
	vmF6zkwqGXm3vv3jDA2XwzD3WugrtvRESyfFil06+f6z3sTRWlz+C7+AUa4Odqzy
	X/CjAf+dIG6GgylR8zoh+xDwECD0VIQPtlFhI1G3PCPfl1/M5Kia+ifxw2fcjUgf
	pBUc+qauGd0+LWQIjKJxIhE3gql6pht/u/k4MJCuJKBPVDFr57k2ZZwqTKEpILgH
	STpj6uOPHbWzAEMIDjlOHJ/RZo0UthXHFDFQ8Z0oDVMYgAUuGnnOScmFZUBlmGlI
	lA==
Received: (qmail 3848895 invoked from network); 5 Mar 2024 11:58:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2024 11:58:26 +0100
X-UD-Smtp-Session: l3s3148p1@rMW/uOcS3K0gAwDPXyskAOYD60938Lkb
Date: Tue, 5 Mar 2024 11:58:26 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Dirk Behme <dirk.behme@de.bosch.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: tmio: comment the ERR_PTR usage in this driver
Message-ID: <Zeb60iSJX-oY7l9a@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240305105623.3379-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I+w6onKpvUCg+xgS"
Content-Disposition: inline
In-Reply-To: <20240305105623.3379-2-wsa+renesas@sang-engineering.com>


--I+w6onKpvUCg+xgS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	/* Ready for new mrqs */
> +	host->mrq = NULL;
>  	host->clk_cache = ios->clock;

For the record: I think these two statements should be swapped. First
set the new value, then allow new mrqs. However, I want to test this
change internally before submitting it.


--I+w6onKpvUCg+xgS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXm+s4ACgkQFA3kzBSg
KbY4LxAArWrACN31Hi0404iyhszQZuB/3l564QxUJ2iBDOPZ5LA9U5jwKum+FLSa
wuuT+47FsXuSvCl0AAghHLO6J6iqoX7uiUkBwA5RB9/CJDEN/PpZ58iJJl2H/9/0
cZpS9hkSJSx4Rlf8QKgIn9ACD+CzYMXvW+H1dJdKsrl4Zfs45OKMZtyyE9FPLQN0
1zRj/hdFsPJXbGmz6rSJSBKShevsG51gdfpuj/5a5ckt7uGuJ0YSWjhMJXZFSBsQ
FtBBwncclxs4sl+iZG1iM4UopSCMce8wqDQN51ccNVNCYlcDWRlV+CWkIJxMnh3l
63DpxdcMsUFgojcBVGyMKZ3nSfYTIbe7I1mSAYSL7cVm0fQKznruwC0F5lxYR7uk
NdjoSUpFcVAG8lO3DZz9SZIy6v09S0NmWwvA9GSTCNrwaUFZ+fx4ZI8BMABcUdMD
Y7pQ/gLHQW1O4G0D3Uds4HaEmHprA47wcg/JaguFyxgT55LRIhib7KbrlEgH6vdw
GwIS3cvemQuVo3Fi0yeDIr6hbU8YEX+Ulmr8WcqZR7h02suF6BxstCLUviDqt+e1
gyasU3CCcjMBgrlR8v69Ci1u9JeUREMD+hE0qzNxiqGlX9VVuwNry5W5+Qr0IBGK
aTnT7wgY5dz3SEl3IYsE4+Q93AA46/FUVxGu0t8E9r1jKmZR6kA=
=LaVY
-----END PGP SIGNATURE-----

--I+w6onKpvUCg+xgS--

