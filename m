Return-Path: <linux-renesas-soc+bounces-12736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 396B9A229DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 09:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A24D0165B51
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 08:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12C51B3920;
	Thu, 30 Jan 2025 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cjVXisjA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143AE18FDC5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738227334; cv=none; b=pDFssoTg3OdIL54luXT/dJxl6HujvGBXhlNK9DavPeZ2Fc/xmmBkGyPrD0E+29rm0udsFlDl5uLg119C72kVrgh+XGbyylpudsede3fn16Z2knaJaeSTJuLimHPnw8ZE+7LmxDYCEFom6Rki+l3NffUpSBZB2zwBLL6Hj3x5js8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738227334; c=relaxed/simple;
	bh=jr1YXPpuQn45WWMtqArMdX7mIGv0AG3t2/kPaXHqraU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/hluMwVqvlnpKCIvVNgGgbHwkxr1/GK4zDcSIdzgVCW4IyLubm0gzsMdp+oBoJp0RGsLjq0FkGo3KnBE89nVmzKieUoUs89HfcnOPHjf+zaLtKvSUXn6Qyi5uI9Jvf0hfmXWDuY3y+WZB0dp0nafUFUF5F1cumNxJ6NxqJ+Iug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cjVXisjA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jr1Y
	XPpuQn45WWMtqArMdX7mIGv0AG3t2/kPaXHqraU=; b=cjVXisjAqk1ws9w2mpk7
	Buy7DNRu2DKVqkQoh4oOMu3m9CtmwPHYKPh2MC77Npt8qK/w5vEvqSYyd8L3s4//
	R3+g7HKBeActGSyrr7hFmvdexoIwcQH1qqd49lZW1ifez0dXoCMkn3dGBetyF6+3
	E9xYo1fGIYz7EkhdPFmLSDTqnQClCPuNRz2TQlLfWmLe9zGULCiPuIF11C8cvQ01
	NVKIimuH8X1VRN4Pbkvu+2ubl5v2HGq1tATxgGK80ifhOy0B76idgsyeBTQIvqYH
	wqlvFnvGqncygSvXmCK9c9ckwG7GOFcZ98nxp/jxnYmYRUzkMJ7IhGhJbjBIOk93
	mQ==
Received: (qmail 1209702 invoked from network); 30 Jan 2025 09:55:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jan 2025 09:55:24 +0100
X-UD-Smtp-Session: l3s3148p1@+ewtlugskqtZz6wz
Date: Thu, 30 Jan 2025 09:55:23 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org,
	Carsten =?utf-8?B?U3BpZcOf?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RESEND] hwmon: (isl28022) Use per-client debugfs entry
Message-ID: <Z5s-e0JwnO7o5hj0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-renesas-soc@vger.kernel.org,
	Carsten =?utf-8?B?U3BpZcOf?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20250123160347.44635-1-wsa+renesas@sang-engineering.com>
 <50e84380-f054-4c2f-9961-6b8a1784ea10@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i1kclPcaOoaYfPWT"
Content-Disposition: inline
In-Reply-To: <50e84380-f054-4c2f-9961-6b8a1784ea10@roeck-us.net>


--i1kclPcaOoaYfPWT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I expect that 'i2c: Fix core-managed per-client debugfs handling' will
> be applied in the mainline kernel by the end of the commit window. If
> not, I'll drop this patch and re-apply it after the problem in the
> upstream kernel has been fixed.

Rightfully so. Just waiting for buildbot success report.


--i1kclPcaOoaYfPWT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmebPnsACgkQFA3kzBSg
KbZwCQ/8DYYtAqtaKJYUgSFYRfA5EfQ/RpQdFlFFQfn87awwiRy6HpbsQUgj20QK
8q+1R+/OzHysJzIi+F6Vmy4+p3+2gtgjfRHsobziiwflAWf8nSxCmXe8A9bGVjGq
YRIyuydILRSDAZnqlUhSFgKvEGJSLPIk3OB9zM1PJN2I1P6xgJyC9YcLUaVkqy32
KXcd5uPKt+t58Fzq2Tk95i2FXlHJX6bOWJ6oneUSzWENPtRKiEiUzQD2/My9r8Bo
fXIunApeEY8X2M13y+HF/aopkchOLOnoUsAWHqTgxj704Sr6KvSAb6eBLymTBZpi
TI+EB4wGsGD1CNL80Fsfx3QtKbEvsFNNiDCHKw/h4c1TRlTKkES+3P8jCRT3RuR2
j4Qsqw8xf4DUBuaFk7GvpYDqvM5PVzRMhaqDlSJsfyNaQsPZvUvEFQYsoWowWe/7
1Nay0sLxDOpzTTxVAWGeSbm6o+KFyXxWAOle32FucAHEN4tS2SQ7kfJ18sTM5QTl
JN7fccOomESborZnDxKKAC8fqDGrZFRafesqvB+5XCy+79k4Ac3w/a4yrRg7zRdO
SPFfLUfYhpIifkdbqUSlpko39y9r53xxmkJaezpBS9hF7JuT+b4cjDX9poNCzTrZ
6UJoGtp7J4glEeXU8FaYRAUUb9bM49+0Es8uGf9vmjhac73q848=
=F/Q7
-----END PGP SIGNATURE-----

--i1kclPcaOoaYfPWT--

