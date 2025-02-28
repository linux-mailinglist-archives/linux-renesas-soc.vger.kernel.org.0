Return-Path: <linux-renesas-soc+bounces-13794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E5CA49577
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 10:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 991F33BB8E4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 09:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2D22566E9;
	Fri, 28 Feb 2025 09:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Jb43rHwx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A4E24A046
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Feb 2025 09:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740735378; cv=none; b=oT4EwcK/nx5DfgK+ECYDA1Ho7FyedsTogJC0DUSb94dAwbYqBPjo/iiARr3dBtF4BRyfjesPTcGkm1jurRM9UdgqEov+RQLz78KptdONuPwsdxsmnBrnGXlGpyGmFoZ/vMEmfUVl2xHkVluoGijIRiRSYmK5P7R1tfpOPbtGchk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740735378; c=relaxed/simple;
	bh=Y+zkHAxkVPmyVgRH0J7cRbdHt4XLpsbYjNDYqG5dmkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIZcauSLf2n/J3nkE7wdaYcdwlFOJN8DFZOhPywrFcX0mTEdTNQtgpUbXt+5Re1mn7VKHXEV9OKRBxuzztU2UBRG5BfduZSFLC0hiGtRQtjycN+GVAxbe8PZEnVn4i5Y8ArpQS8GoZFWa97NrlqK9rv+WtPEDfNXMLRIw/Lfpxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Jb43rHwx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Bivf
	MMxF6on4efbBmTJrmNDnIyXD+J46o4Jvi8joGBA=; b=Jb43rHwxfDwaRJGtCoev
	dwj3XRSfWb21p1vIKq+LXyC7WZ3aTXNebzJe6xjaAcKLgfj1fjTjy6GdmRCwN/rS
	9HRTF7hHuWyQHTbVngadhDGu83lDeJkJMAhRp7Lfz07x0YVax67CWT5RwzJ7Yia4
	5Kb9AaLdvOFCzSG1mmTZRZ2+C50PJVENVZWYgomu5LnkRJ9PbjWX5zzm5FadweiY
	x0OManRVdTMZEa1WG5TZlPgHeeNd+0Yc32mQP71PwlkKPcwch+Bw3TjfabR8RXvm
	TinXfUVpeSe6F7guPTnZFDpiPPCkAKLGkB2iwb/wcu6Lpop22lDM6l4XDJeweBea
	1g==
Received: (qmail 1241146 invoked from network); 28 Feb 2025 10:36:13 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Feb 2025 10:36:13 +0100
X-UD-Smtp-Session: l3s3148p1@V1WWiTAvqMG57tsS
Date: Fri, 28 Feb 2025 10:36:13 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: Re: [PATCH v3 2/8] mmc: renesas_sdhi: Arrange local variables in
 reverse xmas tree order
Message-ID: <Z8GDjUv4qJwhocF9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
 <20250206134047.67866-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mr2vO4/w3u+GccLI"
Content-Disposition: inline
In-Reply-To: <20250206134047.67866-3-biju.das.jz@bp.renesas.com>


--mr2vO4/w3u+GccLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  	struct tmio_mmc_data *mmd = pdev->dev.platform_data;
> -	struct tmio_mmc_data *mmc_data;
>  	struct renesas_sdhi_dma *dma_priv;
> +	struct tmio_mmc_data *mmc_data;

I'd prefer to have the same types close to each other.


--mr2vO4/w3u+GccLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfBg40ACgkQFA3kzBSg
KbaWWQ/+LBgUHunFj7ZmwUzqU2FFb5awxJ+bD+ETmzv4FS4TNnzDKSAhUFne3jug
Ts3HZ7++sAW/32DkzQNf90LRTC46c2KBtvQFoX0QZHPNly/8a/VTQ8hg3w4K4V63
AxNdYAL4ceRPe+aigYyrcOqB7XNnrA0UwCKlfeDFb36nf35nIhWm15UncHflVCAQ
Xi8JtO8CQUyBAJ6yI7m3zJkzotk09VuU8T1p4eAf8XBgIbkE648N3lXm5NKBaFuV
M2EFoZpLW4j01JcMcdg626d+VVu5hA7nSeVZTsOny0inyvV1ikBZCbhGXnPhqgGj
iHS+x7YF5ZGim/1pd7s9GWS6H241ctyaCrjOpZOtVZtlkqWtqaeAR36FCPEGIwdI
Wj1dnw5wv3U20ULKQgCTRoZ64GYSuvgPFiLHW3+Opqaozh71x0YQyokBtXIBvusd
VLFy8YAY7E03ueDl0tKF48hObrb5FSoFwspTsAZGACFDGkLF/pbJrHA5/iBQzNpj
FVUPt9q4baByzo5vhGmd5gr2VFT86LY/g9fqutKFsIp2tP7ZGgukkjK8XDzPbO4K
SRIAo0O8uPMf0a8RIhGDwrPMXwCEreqZ/dmKqGQO4JymnkyvBLprcjVefYhzcbE7
wTV+3Lm5RMRTkhQ6nnHmcRV3JYDTN+M8A65L41qx88kEe0eJkbA=
=5lyl
-----END PGP SIGNATURE-----

--mr2vO4/w3u+GccLI--

