Return-Path: <linux-renesas-soc+bounces-19626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C81B0EB34
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 09:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6586C3BC56D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 07:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF7142A8C;
	Wed, 23 Jul 2025 07:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k1t69TMi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAF3214A94
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jul 2025 07:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753254193; cv=none; b=ak9z9RH0jUMgoDkjuGH/PJc+3P6pIqVzSzlN/ihXHr4Tjq469vHv/uJEfDioaw2MBAK2P7X00UyDHEi6/NuhUkYFrmVMevaroZmRNRBDzypl6IrNbhAlFsB1+GgRxFA6GFdXPgc1l1aWy29UuzhletQu0H4Ic8j/pixGjUpdMUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753254193; c=relaxed/simple;
	bh=jdJupruoR45HsfSAZQnw28Q4CUwFXKWwUosDwGRRkLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hu3l09HK7uwnBHZLicrFZ2pwUtChiESqTqjWO6prdlAb07hYKHIhyi2KPvf4hXLpe6ONnZ7l1ulG44yRFRhxsv1umCE6X5mV14bP4uikMSdSvfDElWjFV7Z4b0XhPmPaN+rVph0CrPx/5iVQviMiJITXCwde6TD2JVgHkMcgahQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k1t69TMi; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jdJu
	pruoR45HsfSAZQnw28Q4CUwFXKWwUosDwGRRkLs=; b=k1t69TMiql7cF7+keeq6
	7CTUqQ4F+n8AW5zQxxwmqXSsnFQhdyBRohvSjxI7FsYg72YXCxqV+Oj86GjaS3FH
	m4lB/cxs4ShyjZed1EzZbUUhq3cAWE/spDZWch2knEaExUrGn685oNKjrmKeUgiD
	mBqqtOCnoAPrUshZOBIUgJ9aI9+ENiBIQaj0cGJserh/iYvGShNOwDGLtSrNIJ/T
	CVX9hUhQ3erZa/VdpFQWndUgchtR0GWI34wb885IOq7TvBdV1YdJ1IJ7p0MG2ZpA
	Z5EPKtRSpPjKy/QmM5jg+R6ICXGKKhbvFP/tfttoh2vbbaICdQ0fUXBg3ZmWUEkg
	NQ==
Received: (qmail 1603718 invoked from network); 23 Jul 2025 09:03:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jul 2025 09:03:08 +0200
X-UD-Smtp-Session: l3s3148p1@XqUdTZM67o8ujnvr
Date: Wed, 23 Jul 2025 09:03:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Magnus Damm <damm@opensource.se>, geert+renesas@glider.be,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] Update r7s72100 Genmai DTS to include NOR Flash pinctrl
Message-ID: <aICJLO0P12uHFlHs@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Magnus Damm <damm@opensource.se>, geert+renesas@glider.be,
	linux-renesas-soc@vger.kernel.org
References: <175109918476.52629.8694334943062364426.sendpatchset@1.0.0.127.in-addr.arpa>
 <aGjPcpFJo0kdNgoH@ninjato>
 <CANqRtoTkn7C9wC-hGT0Ejxy==JadLHfuSS_HzUR+jk=jo4EyHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eYzHE8QxzZ8o5ovQ"
Content-Disposition: inline
In-Reply-To: <CANqRtoTkn7C9wC-hGT0Ejxy==JadLHfuSS_HzUR+jk=jo4EyHA@mail.gmail.com>


--eYzHE8QxzZ8o5ovQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I've now written some code for the Linux pinctrl driver that makes the
> DT modifications in this patch to start working. Please search for:
> [PATCH] pinctrl: renesas: rza1: Check pin state before configuring

Done now.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--eYzHE8QxzZ8o5ovQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiAiSwACgkQFA3kzBSg
Kbbjtg/4gAlDGrnY3wjjLFFBvRbI+rgJ3df8lrC7f9w0J99Eun6qWv8nrFEUqcrv
uhRDzZHQ/PELJYVeWztsJvBsijI+NqTnPcChu1CVvjRJEtC2KJAkFJfWx4VpNKm1
26LHDj6sk9PLC3zpKCAZeFlp8WRCiC0a0aiS0wwUgv04PPDhxVmZjrZW75tCEoYU
kw7mbnDBYxugJoKLgxB6t5h5llYTFEFNMasvRJF1AlTa7yVa8KWRrqhr9aCulGxI
he8OJR0ozt23beilR2300XvnnNQjPDDvHWPNQRQDKx43Eg/z6EJ6qHeEaz1qUfVj
4STlCi+fe/hRIcZRkkZFapP83KSriWgUEgocXX5LT+Ucoz8sAPWUznCDzGQRXiRl
JkMiC/78hIPpdZGAakAE88VtC9aNRVm+O3TLKDWb8KTz/KaiHG1gvScf2jfRwm19
LBAAWBZFY0lmFuu9fa4lSwRuWgPR3IYQFSuyANhQXwvF4Ds13iYzp1cCKpPGoHkB
O2Hak70A7MPSJd9r2nvsoaRw5ceGikz2d0TMpvE+Z8rhlZr+VSx6pksKPdOe2WqZ
wgwpq2kjkP6Rh9/50IXcXu3XtgV1O5wjxG+Weefsk38puJUc7MKV62g3aThorVG/
1ao+44BmFSNXbxosRKReshF3Kw8whEBOAHBNY0ZspTzrjk5KKQ==
=NZEb
-----END PGP SIGNATURE-----

--eYzHE8QxzZ8o5ovQ--

