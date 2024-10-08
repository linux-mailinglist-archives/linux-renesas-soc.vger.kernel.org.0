Return-Path: <linux-renesas-soc+bounces-9576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F4D9942BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 10:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97B6628813D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 08:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C70F1E0489;
	Tue,  8 Oct 2024 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z78DEJJP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C40F1E0483
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Oct 2024 08:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375957; cv=none; b=ia/UM7k70vTJ2RljAN8hjEUCtKkJtoVLLvMnD6wJnRCM2LdQoSdyYdOZpj2AJ4owTxRzsQ7LdaRS1xqAtKJCqJhqoX2c+pagOcHoMhT+ryqzLFE3NjpseIdOCTFx1wdn/m7CUUHrejl0DDCyXo8Oa2w8RpChqMNANznlAAcz75Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375957; c=relaxed/simple;
	bh=uOmKQ7nUzDGkx7pfIi6OXG6RrYigBkVLaKWzecRpq4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBKccWdjzd/O+X6OhI/CCim9AymRQKND706n84jJERWcNstjpOT+KC2TfzYCjR+1V48h3F0Nvb8rrSKnbYJVMQyC9XT6mssVAMcxGlpICZtc1eIZOg+p7Hk/EzUsOggv8Ld+oI4wqUzGapSrBvn4d/hRqmtl2OMAkFJ8zirjj/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Z78DEJJP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=uOmK
	Q7nUzDGkx7pfIi6OXG6RrYigBkVLaKWzecRpq4M=; b=Z78DEJJPb2nCXXXnAM7c
	TO9CbEzDuRMnZRrkFvW2UtczkJlfuue1gIr6AMdEiEhnOeT5nhE0wHSfnsTRcXtC
	1+QElCUfxT4vdavOlaCJMRAUPWGlHiGSXNU9/kiJ1ydoXc5Zt0zYQSNtIpzY2AVE
	we/YL2JeZ1xFF/Sp+atQ1K4Mp0D2nyldcS5Fnqrp4E11fsG2b6WI4EXeUQcjkTOh
	EnqOAxcw3zfMOb2cm4dwm6cSMsqxnz3NYWqNNyGPgECksuvM0pzDB6hpEwIVQPI2
	Kt9HrAXDAyFDqz59rRQCwl6WBHyMyukDd71CXEOLPPuHSTXTsxSS0OpOjPuZ6hxU
	GQ==
Received: (qmail 400174 invoked from network); 8 Oct 2024 10:25:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Oct 2024 10:25:52 +0200
X-UD-Smtp-Session: l3s3148p1@M+yj4vIjWHNtKPHJ
Date: Tue, 8 Oct 2024 10:25:51 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: support gpio-binding for SMBAlerts
Message-ID: <ZwTsj_GG6F1UZL6t@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240909110430.28665-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9NVCBK0mdUb9gLPa"
Content-Disposition: inline
In-Reply-To: <20240909110430.28665-2-wsa+renesas@sang-engineering.com>


--9NVCBK0mdUb9gLPa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2024 at 01:02:56PM +0200, Wolfram Sang wrote:
> Most I2C controllers do not have a dedicated pin for SMBus Alerts. Allow
> them to define a GPIO as a side-channel.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

DT-Schema dependency is upstream now. So, applied to for-next.


--9NVCBK0mdUb9gLPa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcE7I8ACgkQFA3kzBSg
KbYRtQ/+OYw8JWfZCgsHHmmSFfMKb7cC6+wdF2ZIGbe12D0Z81Dl0XWWW2NnafEC
g3BdcllaexiZMEroJM09K3bzb29Hz+MKi5L6xA9kqONL5e8X9qunPu3fWs3fiWqZ
2TRPxPwmBWSVh/0gnWbAKpfqIWHhpTEYLBsxL2eDut6xw1JXjfVhcRKjo4P5dfP/
en6ZPgdyqLBaz/jE/zNPurVUeRRWDyzAO7bE1QYaIkS/iuWTcJJlZPCrwFQjwrKF
GlOMO6GjHQHPtCdlBl+xtkwRYugFSjTuB8QVCLYkTBTh4xjtZufI5NqulDymGzpc
VXnNiEQN5Psh4aOXTPdZ+yG4h/iS4JsCaotRcqlCY0Qtle/M8tWLrl+eKU04er4T
31R9uCmSZjQxBn8m1QiGbGCC0Reiktw2KeM7M9jfNQ4nfev642MrgaN0mDVWDMcx
vv7oWTq9vxFB7qyhjv0zlpZm4i4DG3RChrNZabU4sS/xZNlvOAv300Um2q3dP5N6
loJSSpjTXxTOVCyI+V1jiwve/mibP414YoNkWs9fJKz6xT8XEEHkUTnbn+4MUwEz
74zWKR5KIzTSApzriab0Xr8YHufHWUJNfTqdwouwBehc877Uy0Tdd2wE4lbAynXh
elu4dQO8RfghcKbNyHU5AGaxYG8r91krjld8qr+h14o9KeNHQOo=
=OosC
-----END PGP SIGNATURE-----

--9NVCBK0mdUb9gLPa--

