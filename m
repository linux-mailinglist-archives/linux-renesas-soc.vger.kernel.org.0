Return-Path: <linux-renesas-soc+bounces-11906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A9FA03DDE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 12:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30E081881E72
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 11:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C5C1EBA16;
	Tue,  7 Jan 2025 11:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="M93RzCx7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED5A1EB9E3
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jan 2025 11:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249693; cv=none; b=mefzBtGaH13Tua4YB9ums1lQbWJRWyzZxk+dWejc9IOjh3pdLwmoO0WvcTd/WqSPhVgtcXsUG/0DW9z3K47eYClbR6vRx1zxSo7Qgc5KsZLvz99owFNmykIcrPoieYqQ7VxKgQ34yMKeuVy0Xa+XVwq9zBLNcI+jUYiuKxSgBB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249693; c=relaxed/simple;
	bh=qzmvKENEcgCdAOD/d83hNKHGRbPLcOiTEJakXS+I/EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MG6IOcZ570sHcKXe1WNw9Qs3Tf5kMW/b0ZRT6y//J4q+Hb81vhEzfE2wJsWGwPt+QKHVqAq9d44mnp5WEHks840TvCbAR9YoWdx1/2RIMvlDEoLeKeAH8sbw4SInOKzDgGPY1sSP/OYlJdviDTFR60sl6NpOIoZ9MZSszUVYNbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=M93RzCx7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wiXx
	JICog3a/eIKOwNzjWVpixEqqn1fFp/qnieHT+38=; b=M93RzCx7j3YGkDIXalQl
	kmXiNFmXbHYOJ7MfYgD2ryj6GbgKxPs1/UX6A6TeHinIYXb8J39sTR9HHT5KF7bs
	OXyE4KfXx3cH+SBCv8lSN3I9TtWliiANdL1mk5o6wODn18NCPgDel6zJvtJRWCyZ
	WWTyR+KWkSK8lpJN2Y9TsYyM4z6UrTx5kGSZ+DThReMjAgJz5hjlg3aAsMC+gGyp
	6RqE2G4n7Xt+ndShWpjfiFNPIQcMmlvdgX1pqf6EFLpYZaUhDIXHq4BeKeoaVzXt
	HzqPQCMbbRecj1qgfGi4uIvKyLfutQ4f9+4avwUczUkPhjTXuHjixev9llqXgs9t
	cw==
Received: (qmail 2184330 invoked from network); 7 Jan 2025 12:34:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jan 2025 12:34:38 +0100
X-UD-Smtp-Session: l3s3148p1@eBdMIRwr8sEgAwDPXw20AOMQ2KO98fSH
Date: Tue, 7 Jan 2025 12:34:37 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFC] ARM: shmobile: rcar-gen2: Remove CMA reservation code
Message-ID: <Z30RTcU-lBD2KTCq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <3d38f4fec20c4af46e4570012de7017eee9a39e9.1736249109.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TBHB6wWVwj21RDVa"
Content-Disposition: inline
In-Reply-To: <3d38f4fec20c4af46e4570012de7017eee9a39e9.1736249109.git.geert+renesas@glider.be>


--TBHB6wWVwj21RDVa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2025 at 12:26:55PM +0100, Geert Uytterhoeven wrote:
> If CONFIG_HIGHMEM=3Dy, two reserved blocks are allocated on R-Car Gen2:
>=20
>     cma: Reserved 256 MiB at 0x70000000 on node -1
>     cma: Reserved 64 MiB at 0x6c000000 on node -1
>=20
> The first block is reserved by the family-specific rcar_gen2_reserve(),
> the second by the common arm_memblock_init() (shmobile_defconfig sets
> CONFIG_CMA_SIZE_MBYTES=3D64).  As both blocks are reserved (eventually)
> using dma_contiguous_reserve_area(), they both have the same name
> ("reserved").  Hence if CONFIG_CMA_SYSFS=3Dy:
>=20
>   sysfs: cannot create duplicate filename '/kernel/mm/cma/reserved'
>    ...
>    cma_sysfs_init from do_one_initcall+0x84/0x178
>    ...
>   kobject: kobject_add_internal failed for reserved with -EEXIST, don't t=
ry to register things with the same name in the same directory.
>=20
> This causes cma_sysfs_init() to fail completely, and not to create
> /sys/kernel/mm/cma/ at all.
>=20
> Fix this by dropping the R-Car Gen2-specific reservation.  Compared to
> when it was introduced, now there exist more flexible mechanisms to
> control the size of memory reserved for CMA.  Users can reserve more
> memory by increasing CONFIG_CMA_SIZE_MBYTES, passing the cma=3D<N> kernel
> command line parameter, or adding a reserved-memory/linux,cma node to
> DT.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> Note that increasing CONFIG_CMA_SIZE_MBYTES in shmobile_defconfig is not
> a good idea, as it can also be used on other Renesas platforms that are
> more memory-constrained than R-Car Gen2.

Ack.


--TBHB6wWVwj21RDVa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd9EU0ACgkQFA3kzBSg
KbbNhQ//VT8NXrOOgTF42rqx2+xsOR/Z+36cBpsE6jRplTJr6mMGCBQKB2ZPvmYQ
9JFOge48b/ev4DQi4jxm5aKf1gcofMKC1/OsMuozs0BRPY693I3NupIK6TaMo3yq
lvnT/dkKXq9dGxLlle8R6FOaH/9gB//iZfiWJ8cIOfv0Du+BJddXQCMwOK0mmG+w
P7vE6VQJqw59VSoV3Bx8bJOYnSZzJftfWGi+oL6ddA5EK3PABxg2xPqLKmHkgCNS
zXb3+ZLro5P0hmVxeKMD+fspiAGw86/CKSBroewNGl+lgWIwWo0D24DNxlsD3aH9
WcQqXiRYN9fsMeNoALcsY7wOoVewn9BLUJ5oaGRb67HSUZg59EN+XH+a/6W8YSeC
jFsigWWQaSQAUyKGp8ZwKzHZEHqBy0zQ5uubLLpreBkaaTuxlPDLBV/lRFb4PyPX
3V2RCh3PSHj4YiE9JqVmZyxFTJCX0c0+vq3+jIVdL61NBpfL9IwvapcTE8Jcg/iB
FhySbtZ1NKsN7xG7bKihAAg79VFzWLn8S+qch1eSVSzlf/+kVSu7qzB/RzNYOR0D
jDPV5iW0O1+VUPO6ftLA5UWOkCdzzPnDxSYzFtRMTamaDDBTDwatuTh38A+75x5x
lxSBnxFu5yPQmg327z7zYNzxyWo7nePE1fVbdoNW2bKUFxW5rqY=
=bKFv
-----END PGP SIGNATURE-----

--TBHB6wWVwj21RDVa--

