Return-Path: <linux-renesas-soc+bounces-22906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 592E4BD1C3D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 09:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D54703484E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 07:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549DE347C3;
	Mon, 13 Oct 2025 07:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gsJhcPFn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681372E7192
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760340156; cv=none; b=efWRo2TChJeddkjo/088sxbQS0Z+dRLdy2wD1k+/o7PZFdNqO5KfNEaFOeR8gFBHZB8YNVpPkxF6737JoI62WnODH1VGMJQMk32Sm4ng8FBoEfbo+Uhp7J46gQFVKrXTQoCGOk1DYn6saUrsu2kuY/NPeivxY6m3K4gcZoyYl2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760340156; c=relaxed/simple;
	bh=iS41tnuuZhOJfyWt3/L8/kZCrwR00aDmJKYBiDSjaGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnclsUsigMDtL0uZDgRt7mke6aucvVjXv6XUeV4ybvi9VaEBNhsCAEFjFCFslXosiOBUh1hSrgsLQgKtLxBSEkENZKMyXju76SUIkZLmDgcPA11VeaxUja/lU8HrINjH0p3k8eHI5h/gbaX1x2xpJBwoIGDXbr+OMO2cMlCanJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gsJhcPFn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gh19
	CUbt+mZqdDIoD3K8ujL0f4BPFWA/7f0FphTIE+Q=; b=gsJhcPFnDicgxwQZmng2
	+DTE9wquyJ3NLsrU+ZTuwnElqhJ6Ebnr7o2SvttmR9pD+i9DbJlDTg6axlEIn6hg
	uwaXuuFLxicmAJTywF3x/wh7FM9RkWNW+1rzimGES8K/p8pIY5RrXmF3oLgzRvqc
	2EyBx2wxduH6Fg/f+3zlm8nm+HkwwBHK2cjjCEdW2wUbG9PvqayuZFIhs0B0+Tz8
	29Rp59IHjypSEP9IW07lU91y2tcEcxekUAUOB8ouNEg1Zd496/aAtEfMORfAJJqY
	8XRf1Y9ss9OGWw9z7VEFaxvtAyHsZKen0ZTVixw9pLSQNupJKZFJWUbb5c0nkaRo
	tA==
Received: (qmail 2414882 invoked from network); 13 Oct 2025 09:22:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Oct 2025 09:22:22 +0200
X-UD-Smtp-Session: l3s3148p1@bMaZIAVBerogAwDPXwQHAL/S9V79e5yL
Date: Mon, 13 Oct 2025 09:22:17 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC] clocksource/drivers/sh_cmt: Always leave device running
 after probe
Message-ID: <aOyoqfOQKRh81daL@shikoro>
References: <20251012091000.1160751-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TYHTGF8awE9qZkeC"
Content-Disposition: inline
In-Reply-To: <20251012091000.1160751-1-niklas.soderlund+renesas@ragnatech.se>


--TYHTGF8awE9qZkeC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Niklas,

thanks for your work on these timers!

> For non-PREEMPT_RT builds this is not really an issue, but for
> PREEMPT_RT builds where normal spinlocks can sleep this might be an
> issue. Be cautious and always leave the power and clock running after
> probe.

I am not a super-duper PM expert but this sounds pretty reasonable to
me. Only minor comments:

>  		ret = -ETIMEDOUT;
> -		goto err1;
> +		return ret;

return -ETIMEDOUT;

>  	if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
> -		pm_runtime_get_sync(&ch->cmt->pdev->dev);
>  		ret = sh_cmt_enable(ch);
>  	}

Curly braces can go.

>  	if (f && !(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
>  		sh_cmt_disable(ch);
> -		pm_runtime_put(&ch->cmt->pdev->dev);
>  	}

ditto.

And I don't if this is a seperate patch or not, but we could simplify
probe a little by using 'clk_prepare_enable()'...

Happy hacking,

   Wolfram


--TYHTGF8awE9qZkeC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjsqKUACgkQFA3kzBSg
KbYXjg//cNrHJwYHmq4N6DZOP4GBjiTen67p1+cbVDJgXIPS2xxy01at4dtrrWcH
S4bzJsriSFYxbaE16k3RAkwxxzxaSQMsXI3EFfXcKRxS3Jc46n+de69Q8QRsjXZz
/PHq3RnhXgcSp1Cbg1X1dw+gZPXlco38NfdxqGqvmfwwweIMIjc2ugxt/Bl2FsRT
UkUgMzspYkAxMOPWbwYSSMd6Afh1waZLozjko7mhprVjhicnsG1f+EZsbEX2Snlg
Ld23HLPLlhwv4InNRSaANMZvzLP/GdCTd1ABmTCcV0DparZEyvRWueEnlfJYQCjG
iFI1fcWY+XblYQR9PecpAywvzerQ5NeYdxOpXMlzfpyW5F3Wv2U/AE8uhVoHrpMm
5+es3P8sd3DEPPGPEUCb0IqXHG2F/FcIOJhVn0G0r7HE835keZiwn/ERyQ+Xr2ek
wxOgvdgYzMMoIrpiWeqt1SA/t+ljX8KiFkF9pr/NtgqeYAk4cCFz5690FYJPM3v/
4lNgwWIEiko/rnU1STZNvV8LYoRxxsyC4ollTeKjHY1Va8C9mRUcMqoc5b8tOsYu
OLHbEY7qhkhdlYF9ROZvbGw6c6wvko7tHPuWESIezSx/fBH2wkBRlxHlKZA8bTLt
KzWOjCMf2BC1PTP4wxuFIe3Xjxmtb+s3e0yKg9hPkVpRvM9lEuM=
=fhm6
-----END PGP SIGNATURE-----

--TYHTGF8awE9qZkeC--

