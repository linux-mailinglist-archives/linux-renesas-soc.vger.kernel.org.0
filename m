Return-Path: <linux-renesas-soc+bounces-1282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C526B823EAF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jan 2024 10:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67F2DB21028
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jan 2024 09:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29F2208B9;
	Thu,  4 Jan 2024 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCeF7Zbe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E36208A3;
	Thu,  4 Jan 2024 09:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CEDC433C7;
	Thu,  4 Jan 2024 09:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704360724;
	bh=1EwMajLeaQURshMF2Uz3kgEaXtgo04uFO6ueod/AG4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fCeF7Zbe982JybIbLj8gAUp3Tl8UoewEetIFfLl2ZH23XcGEFNZv0taXaNI2SduYL
	 X2Pbz6FT/HwXeohsCe3mDgimmYfeoldFOHznt7qF2okIHOLR8xysLg8vAVxyPld1Jg
	 CcQttF2W2whj1AOpRLJ/VswRGOxoZthm2kzy72DG5hip/kad8QE+MThl6Jnxofk7mV
	 kBoqk1VJO0AtmL0+4rYmmiKZhchQSYkyVA+tavtbf/HMdi/rNF+jXZuXMxSewy9mkB
	 rZatuNO/RkE3AGZdculHK97K+imKOSN8R1OP0QFY0bz/FALXPWAyCEHrN4f//Fi86d
	 DQW92e+HRxD6g==
Date: Thu, 4 Jan 2024 10:32:00 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net] MAINTAINERS: I don't want to review Renesas Ethernet
 Switch driver
Message-ID: <ZZZ7ECMTRYOOpDlf@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
References: <6498e2dd-7960-daeb-acce-a8d2207f3404@omp.ru>
 <20240103133735.7bd660b9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0kCCt+reK79FwhTP"
Content-Disposition: inline
In-Reply-To: <20240103133735.7bd660b9@kernel.org>


--0kCCt+reK79FwhTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

a quick two cents from my side.

> First off, very nice to see a refinement of MAINTAINERS to narrow
> down the scope and make it more precise. Thanks for doing that.

Ack.

> IIUC you want to support SuperH and the AVB implementation.
> It'd be more usual to make the entry cover only the relevant files.

Ack again.

> And for bonus points perhaps add an entry covering the switch files,
> mark that entry as Orphan?

I think Shimoda-san will happily maintain the rswitch driver. He is
likely away this week, though. So, my suggestion would be to wait with
this discussion another week so he can take part in it?

All the best,

   Wolfram


--0kCCt+reK79FwhTP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWWew8ACgkQFA3kzBSg
KbZVExAAhBK00mzPEqr8toN3px0+LsvjYmr1D/8H50Z5AKcn5ucm+xQZWdks+/rf
4i1eop8EcW8pXzccUR2NfYmmtVenptwFmOcoTzr/G/kK1piQDYhk4E3x5x7tSUHs
W7dKFMkKvspszP51fE8x15tBvnybvcIyIGYtZiYimLYntSdgZHiP7BOo5DPqQFoc
yfYAueHg4TSZlQ76e9en3QZLESOEvyyLv3bZtY7T1zAXom3hE4ouqd8B5xjejFcH
aOGs5XHprvV6mhf6yLM7S1lCYy8k0GOPxzGrX94XeqCI757Zzh8Y0rFff9v7pLsY
jhcWR7rK/vI0UgAFv5HlsjiuoFGXKbJFx6PaWimKTJaPJ4qb/2eM9yRvVb6PA6lV
arZ5l+TNQVwzWERJ8pY2oO8V63CSNrKyCCyfOGJnL10qj06fWgI8RxPPXtV02FOw
4bhWzp0fuVH0ckN/X/VJwde6FsK+PTcphZm3Hs/+Bn/TAb43ZKIm4JUVFEDrNHcK
0JmlzJTxdlSqkROwr+mCHF8CXQVPd17DjqYzKmpWvcQDad8OCX5Zt3m9c6OeLCt/
+WGqyoxk35fb8gW97aNBDAcwt3Rd7C3N4IhAap6nZSgfgTil41m4QpuFaDJf22k3
HFVB2m37XSDxBDok+f4dupPS+hl7OI3ExHGJ0iiFfTOQ9sPODQc=
=cfrf
-----END PGP SIGNATURE-----

--0kCCt+reK79FwhTP--

