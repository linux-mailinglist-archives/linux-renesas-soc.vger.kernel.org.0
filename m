Return-Path: <linux-renesas-soc+bounces-7019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFD8925483
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 09:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8B7F1F247B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 07:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C66131BDD;
	Wed,  3 Jul 2024 07:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UNTzQ9WI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FE9130488
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jul 2024 07:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719991182; cv=none; b=THLrx3DPJdIR6Vr2Qr0+3dk4UO5heYkhxrxlZtlW46i1ragzUhma11TkGgnJg82iah8Nz7hA8TMJkTSVWU3yVjYEMDWcjiNGBL6AKw/QpAOvPtHrH5qCXJgicRemFFWLPu4t46dESMM0RKtSqvLQgLAyxWTPd6H6Q7ZNykQEqd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719991182; c=relaxed/simple;
	bh=zK3z+X8u8cLynH/6zHDDP9YVe1jh7q+JWCejKL28zKA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjO1XpsK7keLcfT06hTlX57CQPqYO0PTrzVaD70jY9yrux6M64aQLbt9MXQxEpiA1mDQlmA91JYewtaUNMDoRVzSyqM5cMxU5qOfsnNGW7F+F0HtC0wwxPJpJ1RrpfN89uVWk5aCB8gx6BU5nuNJsS81sv4Zrjo0/myTpDx3lAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UNTzQ9WI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zK3z
	+X8u8cLynH/6zHDDP9YVe1jh7q+JWCejKL28zKA=; b=UNTzQ9WIR9qcMOYkF+Qp
	bx4Bry8XG2LRDP3M85mRLRO2K8hccakz6Ep7U43+VJdoSn74FqVfviT54bcBT5x7
	Zj/6G7BM2xw7EMWpjCySBdp52A00IlI0M25csTIEmoSG3Ukkh7cXvTWzTpEyG0Uy
	YxqkeeoJBhPIdt0RkOEzUdOWk2YURvjnv4Nlaic+swjZUXjqWGpA8/RoBbMdLQjC
	k8i4B0xDxxjyJQ9LB4cQacVIy/3RE3bx7rg5U/9X7BtLNFLrkGUwgddqNkXSaEQW
	osMzGeNZpkNyYojYQ5/WAgRPMw/4PFYcAlhP9Ns9x24Wh57Ls2FrvZmQjMMhSWS1
	QQ==
Received: (qmail 2716520 invoked from network); 3 Jul 2024 09:19:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jul 2024 09:19:36 +0200
X-UD-Smtp-Session: l3s3148p1@ShMWp1IcjtVehhrb
Date: Wed, 3 Jul 2024 09:19:36 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dirk Behme <dirk.behme@de.bosch.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] [RFC] i2c: rcar: Clear interrupt registers in probe()
Message-ID: <ZoT7iM2DJG1p1GB1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20240702045535.2000393-1-dirk.behme@de.bosch.com>
 <ZoT0ke0NtzoCD1yq@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cdEluVlAFAp/gfR6"
Content-Disposition: inline
In-Reply-To: <ZoT0ke0NtzoCD1yq@shikoro>


--cdEluVlAFAp/gfR6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I hope it is okay for you if I send a "counterpatch".

Sent this now. Please try it if you have a chance.

I think your patch here might not work because you write to registers
when the module clock could be off in most cases. My patch should be
good there. As I said, proper testing scheduled for tomorrow.


--cdEluVlAFAp/gfR6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaE+4cACgkQFA3kzBSg
KbZ4jQ//aT5dWQObYmc76Zl++ps1R+J6qcwPLBNhXjTYtHJS3oMKvRRDx5cO3XWn
mpbJQu305SIEmjo5WNDbKSCDsd/xqqPLTis4DfzK0yKed5Ia/t+J/Ike01eab5zH
LSmwYe/3ErL+j4Fgmo2u6OOmGuAUQAf8hVfNiYN6MSUiP/FuB4n/LJa7EAjNpx8V
cOD1D5e5MhUI2RziinQ3dItcMi0mtDolzd4xFpdgmqWsQZXDK4VGfQXYVrdqMX1m
ywukkm+AFPNaN+Bk6GRtBk/ngR/EguzwB74shCiZadmds/7fYQNFCOskCWfVtJV3
x8UIva9Uja2q7z4lWq5mQf8THfcz1BZZBWTT3lA7jkTEky0/0fVQOtOBVOYkPDHO
F8goDZY/ahIa6OGWaadmaSvTRAx0ygHKYr74XGziufvlhH7q3mV6HS4FyJrb/QoF
0kqiNFnX22xmJlQroZepMJw+ySmWQTMDtXJZ5XTha7BYDWumtg3Qh3LbQI+g86Tz
rDt32BiuPv1dZz15Tk4rL4b6QCVJMCXftdRqgCNjTtqPtx4JkJSnkaAR0nWy4Q9E
Rulr6iCJ4rlhJ4h3VlQIgmFQG/2c7QP3pW+zxlZNZuucgIMR6ZdvcesJcCsWebVG
DCJncb7el9wrg2fLarFZUtf7qkr/liO1gQUPIvLpDys/jO5OsOU=
=DV9V
-----END PGP SIGNATURE-----

--cdEluVlAFAp/gfR6--

