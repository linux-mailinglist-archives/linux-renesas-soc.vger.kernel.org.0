Return-Path: <linux-renesas-soc+bounces-11015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A869E6D2B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 12:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0E201677F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 11:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EF41FCFC7;
	Fri,  6 Dec 2024 11:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fwxDjnly"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F201FCFD0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Dec 2024 11:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483770; cv=none; b=RhMM4Py5CslKPJteLUdEG8unAChPKENlrzzPwzZFVEGE0cBE9kNj0JaHW1u/9wa+08L/xznM5SH2JFbLrl4Y/AgV5RBX3EbKQZsl75q1JM4PcHvnZV5tN+b4KQGnob/hqLnB2BvLu7idvucX1mecXAm45EK3kceoFksEmHJRwVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483770; c=relaxed/simple;
	bh=nKRp8G7zKLERyl+4hDYAGa83MoVP5NTbGCAPsiYEPII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSucOYReNIoiAdjeXKKTKhtSQxg809zdAMZgcgwP3QmKg8ht4KYumDkghFwLwv/L+VWArlmRx1nmsKuqiJiA/tFeHFKeuMewSXumhD6t2vNN/U1H6LFoSMmDvfLc2fSQWLpiNEsAW7YQDHWdGT+I6+1EETrJ87CnUsd2sC71gwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fwxDjnly; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=luv4
	qVIy34wd/+LlRrPAe9e4HKQGm07TFucZNszgWMQ=; b=fwxDjnly3RdUSK3uTJ3S
	mrKxJd0xkJzLm5x83yQxvPMxvOILccxlqB4QCHINZBnJLHPgEAMzvvaSpBTFlGpG
	WEO1BjK7Efdg62VaBBIxsoje6xwZN951O0DDFQ8NGB1TJEfJwGKuTl/A0grDCRn9
	QnXzgIot7a3AhC8KZgLlzIqIpem4CG799HFhKQJ8TGC0AoMVUA66soOiPYCQS80l
	ilDdhaa6jUMyQsTvuG9b7kdrJCIlpeRAGUEC6bC+Ew4FwNnRgGbB4OifdZpWdpPe
	A1wRqzFNbuVmHDyQ+6LvC8jtImrFmWloI8TUbfRMUsvLUp88Db9gk9gL5werCpEf
	nQ==
Received: (qmail 54580 invoked from network); 6 Dec 2024 12:15:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Dec 2024 12:15:56 +0100
X-UD-Smtp-Session: l3s3148p1@xH6AI5goeOogAwDPXwEyAJCPbOCqswPD
Date: Fri, 6 Dec 2024 12:15:55 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Subject: Re: [RFC PATCH v2] mmc: suspend MMC also when unbinding
Message-ID: <Z1Lc6wRWdWbI8Dcl@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
References: <20241104092215.20946-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mb12sGId6HHzPEwn"
Content-Disposition: inline
In-Reply-To: <20241104092215.20946-2-wsa+renesas@sang-engineering.com>


--mb12sGId6HHzPEwn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2024 at 11:18:42AM +0200, Wolfram Sang wrote:
> When unbinding a MMC host, the card should be suspended. Otherwise,
> problems may arise. E.g. the card still expects power-off notifications
> but there is no host to send them anymore. Shimoda-san tried disabling
> notifications only, but there were issues with his approaches [1] [2].
>=20
> Here is my take on it, based on the review comments:
>=20
> a) 'In principle we would like to run the similar operations at "remove"
>     as during "system suspend"' [1]
> b) 'We want to support a graceful power off sequence or the card...' [2]
>=20
> So, first, mmc_remove_card() gets improved to mark the card as "not
> present" and to call the bus specific suspend() handler.
>=20
> Then, _mmc_suspend gets extended to recognize another reason of being
> called, namely when a card removal happens. Building upon the now
> updated mmc_remove_card(), this is the case when the card is flagged as
> "not present".
>=20
> The logic of either sending a notification or sending the card to sleep
> gets updated to handle this new reason. Controllers able to do full
> power cycles will still do a full power cycle. Controllers which can
> only do power cycles in suspend, will send the card to sleep.
>=20
> All this is for MMC. SD/SDIO are unaffected because they are not using
> the 'card present' flag.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/16025813=
12-23607-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/
> [2] https://patchwork.kernel.org/project/linux-mmc/patch/1605005330-7178-=
1-git-send-email-yoshihiro.shimoda.uh@renesas.com/
> ---
>=20
> Lightly tested with a Renesas R-Car S4 Spider board. It bascially works
> as expected. Serious testing postponed until the generic direction of
> this is approved :)

Anything I can do to make the review easier? Some more testing maybe?


--mb12sGId6HHzPEwn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdS3OgACgkQFA3kzBSg
KbZQ/Q/8C77yTOY03g+aJJB/KPisdtEP1JirjZswRL5cZNJijo/8w7MDXw9TydsG
JDxTMPlo6IWgg61WorRqV9JzUclUpUsmxWGnNL02mjKcMMwK8+Lyjedhv09aQQDL
plJwEZk9YcNd+9gXb5E5vPH+uryD8au+qfEpE/+RrJSJ69EPA25fknO37LD3r//n
dvNMnUbKbpkKvl3F5x5PiCjt+C2P8gbiwtaNScy32AJhn+aDl7X5oMm/lP9kB3jc
yviuZzA21KsvIfWnT9OOc1zJRMh+WSrFvL/IxJo/zi8xwfcCEUuPqa7e3ggT3rlt
7RmZ1TtJqneqS/F7QrnuTDiiIwYtWpLHvpesraj2TUf9nJrjfbGsoIvj+jx0aBxJ
GpfgQERQp8dzUnilm55BPFl8dqh4TYGoobfoO9qaHI+OS9v443g2snGjQmm+a3o7
5eyttd1P9RKO5ZcPzn4Z6oXzjJ812PdbCPfKeUuBQYrezMFyYCXLO4KXrkmc0WSo
wc0gauPQt9pFpwDLrP+cBvapdf2d72XXde1MfMSkrHdJIZZXMDsD+gMT1NFpNznl
7n9JOTBFbFmzqfgSAWYxOGybC2vV4t2wtfez/qT3DNoOIYd7Q79wBJDANjgi/xHB
Ks46SYARYPh3065IF/QBGzWQbC/FWQSFGuaMizs3aoZVOg0fCbw=
=t9aN
-----END PGP SIGNATURE-----

--mb12sGId6HHzPEwn--

