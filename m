Return-Path: <linux-renesas-soc+bounces-15542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D479A7F750
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 10:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 360B31892019
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 08:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B957F2638AA;
	Tue,  8 Apr 2025 08:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="X8P5a+3R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A684653363
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Apr 2025 08:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744099785; cv=none; b=RXnr8KuGORH9/6Wm1XLkdqWnMvcxuGyyryIJMGsmxoAf/CeKdji1Ql3kK12O80a9WZRbPdvFpOdNv1IT9TS5JFRgG/IDsiy6XpCtkAWgyhSYToM9qIY/mF3vRpw2YoKnU9ByXVgJ2k2z/TqTYIJs2gFnCgRkrYxx+gUSDIuvess=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744099785; c=relaxed/simple;
	bh=XRf0zAamyphypjWBEWWLCmbvcKPpfe6zqTtigwZbZJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGQzenVsrKYync4yeBQwXhKIdgg5r2nLhCCGesdFQXSd6KdvWwQT87hh7f+HkhA3ZCfglu3I+xMcNDbLr1U6yjn4Em1/DDsT/WxnoXEVgKKLLoQEVIPxljDk1pVz73hvASe4/Xk1zreetfkraF5BLR4BTasS1R3aBQMqa+pLBNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=X8P5a+3R; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2ZDu
	8l/p2Ttljr2CD08dPMjrizR2y53tHnze2nBVxyg=; b=X8P5a+3RjSSds3BZ9v9h
	I3g3NEZguYT3LwBs3KfFJzTRUgkp8/FB5g9gLdHp3gKw5Gl3vm2TweMiuJ+pQ9NF
	/wt32td0pMeQBLuzNbmEClBCL4J/TFop2GMOvNEED6OTxgr0gUjah5zHT0TxGGcm
	oE9EBbgunB5ybom2ctEE2Q0ojhJr3rr8aLbJ9dlXY1RRqky1M/27rMMxwMfxNK4b
	W3OJxPl6P6k90a3tJV3Wqn+c1898HQxkzZNLiOe3pJaEQgcVSn+LXk0n95UPsRGy
	lpISKijhXhag2AGFVxdj7HhSCzEJusdKGCdEm+ylhQ+a3CqrHCV8E1oyXWQpMFb9
	6A==
Received: (qmail 4105087 invoked from network); 8 Apr 2025 10:09:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2025 10:09:41 +0200
X-UD-Smtp-Session: l3s3148p1@kZrq3z8yPt4gAwDPXyfYALbiJ46yNPq3
Date: Tue, 8 Apr 2025 10:09:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] mmc: core: Further avoid re-storing power to the
 eMMC before a shutdown
Message-ID: <Z_TZxXORT8H99qv4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250407152759.25160-1-ulf.hansson@linaro.org>
 <20250407152759.25160-3-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wFaAIlzBKtP9i0pS"
Content-Disposition: inline
In-Reply-To: <20250407152759.25160-3-ulf.hansson@linaro.org>


--wFaAIlzBKtP9i0pS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> @@ -2187,11 +2198,12 @@ static int mmc_shutdown(struct mmc_host *host)
>  	int err =3D 0;
> =20
>  	/*
> -	 * In a specific case for poweroff notify, we need to resume the card
> -	 * before we can shutdown it properly.
> +	 * If the card remains suspended at this point and it was done by using
> +	 * the sleep-cmd (CMD5), we may need to re-initialize it first, to allow
> +	 * us to send the preferred poweroff-notification cmd at shutdown.
>  	 */
>  	if (mmc_can_poweroff_notify(host->card) &&
> -		!(host->caps2 & MMC_CAP2_FULL_PWR_CYCLE))
> +	    !mmc_host_can_poweroff_notify(host, true))

Ooookay, I think I got this logic now. I think it makes sense to make it
more explicit in the comment, though:

"This is then the case when the card is able to handle poweroff
notifications in general but the host could not initiate those for
suspend."

Something like this?


--wFaAIlzBKtP9i0pS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf02cUACgkQFA3kzBSg
KbZ6hQ/+JgjDM+tiqwQyiVHY1ME8Pp9vdyk4aU/f4kmFB0OkiTrvhclAvVKoISaY
o4UkChV0O+1a+6hcltJS6vHzFNXeY/UYFlKtw1b14DFdAUc9829SOT7+D1c4DWvN
VmfWkJqaeZaXgKfPutJJKYayfe4RX1FqZujSF1Vyc2NKhmYxCfrLBKf9PJdrDM+H
Kiv9+nOn1ieG+qJWPJp0wqrQe0NnVvVA0LF6X4zaWqLqKcg8Ad6+OtP18nA8OR4L
nmNczgC1aeFeE30hTb7rONdWucdH45R76ikbutdfGigsv2PCd85xGam56/BQQ811
kGXfBUTmnkS/WsycWBCR52zX6ZNRPMBfq2/szudJjnboe/vWbxJnLfbcxIHzUeLb
NYwYmgpEPaIbm22SutpIZdG1lHcmr6GLF60p8AUTTd6P712sLD0mEHlpa5fvBY7I
DhIF/UBvsjd1/hQqTZui4EbA1rFSWId/qKACg4AKQUqAgX+U4TxHMfNJdDBDHdp0
SEG3T099X2W+HaQyYIPwE0ccSYRHqEa/7JTO4HSDQLCiCAPawqAmd/FlDwDkrQgi
IC4+z+MwdmU+K22SGSmJNfUlvsCUPmFsoKmPzcoG2EBzFpN0c8P6s8JDlogi0iwG
ICBr6LHOf/jg55SeRjFiRZG7wJZ3ujF9pMW5eqQAaziy98io538=
=PtM2
-----END PGP SIGNATURE-----

--wFaAIlzBKtP9i0pS--

