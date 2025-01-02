Return-Path: <linux-renesas-soc+bounces-11774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EBB9FFA97
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 15:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAB35162B98
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 14:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C526E1A01B9;
	Thu,  2 Jan 2025 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RJmZSppv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04221917D0
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jan 2025 14:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735829224; cv=none; b=WzSDftUqvhYJ02CBs/wzVUqlR2BzM/0is6sGmOhAxKgi2cZePv12wQj/nevbMi2Fxb15XlBNZu8gvDWJsbx5/+DGED3ejZ+yKyZtiIdakfD05E+pILXKqui9orPASgrc39JzNIRBtYuWh7bRXC35Ygi6i9dTZw5FZiDCsvDJfik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735829224; c=relaxed/simple;
	bh=StcDF5+7kQlxPYvTykrwHF3Sr4p4uG65z/KjwN/9j4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oam7K41mLOzSvLomgF7bRvtF2ANj6GB2LUcgT1+ffQyeD4+2uy7JKVBSytXA/Lmt8ubKIcHKzWhRAK4PbfM57Y99ChVt4+xF50HWtAB8tdZh2cxZcgY0ZyDjjdZxH/OTAPmztAeL+OuGeY/13YE871wbT+6NS5ZHOq8qMI3aYHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RJmZSppv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=StcD
	F5+7kQlxPYvTykrwHF3Sr4p4uG65z/KjwN/9j4E=; b=RJmZSppvOwe83nqH5trG
	kl3+6oWLGLXhT3Hge+sEVlJMCSgp+QGuFKI9ygD6ulqDoyk0rI31dczORczoX9Oq
	ipbN2RO+unIUIoe5lR+VGb+UawzRFb+Ea5p10e66mpDRvMLKj0B11pGors77Zan/
	qavCyM8TsiYQ83i0AZa0yg6lhJw27GW/+s470r4lHuHTU57ltMBr75rL21lB4TuL
	9TC29tDCsjSfyzxwkRn6RBViwsRaxQ/rpJm/XvqIIYjrpLL6avb5ppyv1wmEk2e1
	vGwtaaw1Cm77dn02+dH4Ka6enXtx5lrAK221AEXPPtb4PUVyvQOPMTX+A6/uLxE3
	SQ==
Received: (qmail 651281 invoked from network); 2 Jan 2025 15:46:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jan 2025 15:46:57 +0100
X-UD-Smtp-Session: l3s3148p1@WC7jO7oqGIAgAwDPXwckAOCWr5vU5gRW
Date: Thu, 2 Jan 2025 15:46:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
Message-ID: <Z3am4CLTgidnFmTP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-5-wsa+renesas@sang-engineering.com>
 <76f97f65-28ad-4d7f-894c-e2d1f241e973@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ePuQ7l7ANqBwk8t"
Content-Disposition: inline
In-Reply-To: <76f97f65-28ad-4d7f-894c-e2d1f241e973@linux.intel.com>


--5ePuQ7l7ANqBwk8t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Please rename s/get_parity8/parity8/ also in the subject line of patches
> 3-5.

Oops, yes, will fix!

> For this patch:
>=20
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Thank you!


--5ePuQ7l7ANqBwk8t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd2pt0ACgkQFA3kzBSg
KbblUw/+K3Fvfj+Fzt8Qr+cVqEWjfZsGNK4byBMX7MKRczt2Y8vA9ejviDHJp99k
O+R0qNrKyXt5ZubBqCQAls3doSTMTv0LLFuPpgrn0v+5UZgioEtK+bt4dd0rGp/z
/OdLnMwV7MrE3Ck6YL4aaCSJOU4Y0499f/eWHaYBvth5ZnzxPU/zT7LBqBzTRMtF
f1gsbyKfauUqgl+JD87wJ4M0tKBP/ZjTFg6kOl8V87pVKFkwTIECz9kYGZs5QnmR
07ylMBLMS7jTWtj1Nwga85XgzW2HCuy9dj1g7KRNsA13Hlqopq5WVZwAAYyNb4Kr
bpzQTaM1UVIgn3bsC8xHUR43WZMtNKxDTZ9EPWebwETwzztp9IRQ4CxeU7BXN8s9
ipa/KXb5bxbrRT0MSCaKZ1NtNKTSO52VCaPL9cE+hVkpTUHgbOqaCgeYP0JuBs5r
tONRTsz/a/eK/a9RvhwyhNWUmK8Q2Q8GNoB8qtlE5zcxVBfIld6U/Bs1cUp+tucy
PFXfkEXDt04JL4ZmgVSaGbIHPQZR2B+54zRalAyBUJcZpvPURKOY6YdBrQ/l4bFB
AJk2eMHfDq2Q1WdOAfFjyIJvmMb6hk93X3SudTg/zOCKtFpisHSWupzkyPE+FjnH
E0vZ+0JrVCm5EBhP/0m1Tou64E1C9HeqeOuNg/TdGmJF+3DHVmU=
=B5o4
-----END PGP SIGNATURE-----

--5ePuQ7l7ANqBwk8t--

