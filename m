Return-Path: <linux-renesas-soc+bounces-5147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4EF8BC7E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 08:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E210B20D7C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 06:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71B7446CF;
	Mon,  6 May 2024 06:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UHLV8YKA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D8764B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 May 2024 06:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714978588; cv=none; b=edrnGmHQ8+Br74tOiRYtg+SNOZtWLczoFMHenfShCe9X6kbeokNc9MAGbzpXeJkSSw+MupYQp8OCjJT6YQGwKSqIyuvdZiC8dXQu95WjhygGJWtNBuZnUDa+p9lUTare+uHlGNKVhe2fazQ41rhHEOAyg2DsTrxrhMXIoT/v2Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714978588; c=relaxed/simple;
	bh=amoqiVcTiOgmro1rRAycugA49UDZlHPMBQWpxvUF0YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfq1NqjRLXkpYCu/HvAqtjI4wCDYYMDQLkjIa0aAtXu9kOtYnJYMLIsj4HeEiqbN6vW0o2D2gKxsxiVVuKY6F/ibMoIiUQdYx3yi4q2QHdLAZ8VaF02pUSpydWvIqY0Qjb3tcGGR8Q2zTMIb+ay9ZV0QFgYYgEZ4ZwevudKRDyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UHLV8YKA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ca5P
	LgliWAz2krKRUSnDejw3iEYb6pQI7T4ptMuANmg=; b=UHLV8YKAeEEcMVOuVDVs
	J7N/1/FLFQ82ri3sxosyBgTjkzPp0CKEaKU3uJfiflEkcDKHq5H9AydAp7cG/b9U
	NnY7HiF6pDkrenu7Qzm8xjXfm+8vJb7mSvgP5qndRVLkVV7ZsbSsSLCINTKvlPqu
	2SIMDz0wt7wa9soBeH6ub0zC2Bd64KFoRbxOJJacPzNgxrXK4MbxV8k+sNiYnm/J
	KVbResDcLxicgTszpqVZdxcwE8OA7brPew18GkYD6O4TC3IfVteA8oQQ/Ps5J69V
	54eUnSv8ImGLkjpSiNAGFEykJsV96g8TxD05nJYTi4jyg8iFHB82G4pgz0Scq+hM
	NA==
Received: (qmail 87776 invoked from network); 6 May 2024 08:56:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 May 2024 08:56:24 +0200
X-UD-Smtp-Session: l3s3148p1@1fhOkcMXHpUgAwDPXzrfAO1ieDVkyUqz
Date: Mon, 6 May 2024 08:56:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: tty: serial: sh-sci: hrtimer not properly canceled on chan_rx
 invalidation?
Message-ID: <jfthbcagpmtqkxls75liajodkifp7oxufawemjf3yryracpmay@davyrdnjerk7>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20240502174257.gfmk7al3qkv7jiyj () ninjato>
 <a2b7783a-d548-4a0b-ab2f-a1cd66af632e@de.bosch.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rsddwekjiv5ph6bb"
Content-Disposition: inline
In-Reply-To: <a2b7783a-d548-4a0b-ab2f-a1cd66af632e@de.bosch.com>


--rsddwekjiv5ph6bb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dirk,

> In the quite limited log we see "Interrupted shutdown" reported by a user
> space (!) application. Whatever that means, and whatever that means for the
> kernel. But yes, if you think shutdown/reboot is a reasonable path to look
> at, I won't exclude that ;)

Well, if the kernel runs into a NULL-pointer exception during shutdown,
you can surely call that "interrupted". What a brave userspace
application still being able to report that! Maybe there is a bare-metal
watchdog app running on one of the minor cores?

Happy hacking,

   Wolfram


--rsddwekjiv5ph6bb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmY4fxcACgkQFA3kzBSg
KbZF5w/9HbaySTQC9n3hISyIKlfN+n9eWNYmGz5fYoBGuKwgMGybUg6qGw7qOPH+
OMr0GZTjsjUdGrYmw7LUuhBhiUvuro71lBzfPVMG4gfk9+VSf0+W3pmQpqa0y8M5
j0Jnoy7F6BpKBf4uxu0/zKvzzaf0RTV0adDUI3UxES1v878fEQrQErmWK+WDKHZI
O2kCNpyMKTlZucc56zweHHBH6TjU461blcdxJv9kCql/i34krDHkGZeVj3x3LBoh
NxeObWyHfdJ1d1hjkwqI45Py7Cw0bR3fr9UbOloMKp0QNqpFYQ8gWnyR2NzgXCBz
n3nGZrwUOWlLGUm1VqJaKRxkiFb+O4X3m13kDD8Dx/58Wpvo6YL8c+SprTUQInSh
gqcnXf3IzN5N7Gc1wZFC1twrViAZnmREGq3JcvMuy0RoM40i27iXmtPh0K0EP0dJ
hDwE5Kp3ntRtzI/EHx1Re0gb/lJD9Ikn1By2EJ9epmirK3uHVanaH9ScZQKu5www
pghbpZ1YB/G1AkwVolzqsJATwooMKA/TQ4ur1WPzq0S1LOJNY3oAHYIEi2R1x16E
Of4fDX8jNuvRVO8G9bUrOUSOK564cDSvDSOv2XT31PcDgy1UaDzMBMT198DqH/o6
AE/n4Q3a3wWQB/b12EDKs61Kum2VbjIDyRVUqwjglVAEek8yf4Q=
=tORZ
-----END PGP SIGNATURE-----

--rsddwekjiv5ph6bb--

