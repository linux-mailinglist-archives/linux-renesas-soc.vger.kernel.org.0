Return-Path: <linux-renesas-soc+bounces-26886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFBDD27C1C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 19:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6871A31D86AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 18:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9F13C1997;
	Thu, 15 Jan 2026 18:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jdX0wyNc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED13C3C0093
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 18:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768501742; cv=none; b=DcFyZ9b6S3DJ9izJcnXmTKST/0xT9WF59onJG6emDoz4R5K1DqwGcHZoj5mn3FjmJevyp4O1NHa0o3xw6nyr+jcprOzU9kfZbYVHvHRA9P+BT+5FrtSplOVhLprQTdTSCvWemhhl1fBjq6ew8cj8Pm7t1CNuSBdk82ySyHU4c7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768501742; c=relaxed/simple;
	bh=SDnfa9yM1dXJEW7Cq43Kq1Q6vns+Z2wxaLOWheQMgW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OV2zz92hZb2EIcnnFT83F/TYWL4aqQDrpNGtTT1tpykO119P3Euz2bVZR1cgiMF87ipXQOfAKuVcKM7J3SFdTldVREmEfViA9lHMBPc4CkNDJcvt8vLQ3W60U4HgE91y4XUGfmJYNx0tDsvmIg1VDHXBjiphszuBt3L2UJulURc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jdX0wyNc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=SDnf
	a9yM1dXJEW7Cq43Kq1Q6vns+Z2wxaLOWheQMgW4=; b=jdX0wyNcJttDKzgKUHxI
	MVs8PJE3v8ChB3v0Rd5NdUZCpdy13Ty1Gjt6lmzsz2Ur5k6uJ4X4buRw2/VvCP/6
	PA/gcqyQuNu1+RYZ4XQ09PCN6s4jicKByHQ4iBafVgqDcZ/mZUU2X74vSvn0FKg7
	mAHgdzShKlWt5B3NbR133Jce5n1FAcs4G7wERcr+aNoNQMOxpVbHm+3posxutA33
	3NhGKBxRYDL4OUmJ0OhrhiiC3XSKRN5XqSe8DkzIs/8ZdbusBlsEcXggI6wBf1vt
	YTyAlZGAeWrJ7t6YmchNGz0ID2l4w5amdUHZbwFjmlJXE4cBX9BmEgT9XgD7WQy4
	ow==
Received: (qmail 2641383 invoked from network); 15 Jan 2026 19:28:52 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jan 2026 19:28:52 +0100
X-UD-Smtp-Session: l3s3148p1@+d6HZXFIZmNtKXMO
Date: Thu, 15 Jan 2026 19:28:51 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/7] i2c: gpio: use i2c_adapter_set_node()
Message-ID: <aWkx4wa955UI5kKy@shikoro>
References: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
 <20251223-i2c-ada-dev-set-node-v1-3-2e36e0e785b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aawwAngujd+ljhFp"
Content-Disposition: inline
In-Reply-To: <20251223-i2c-ada-dev-set-node-v1-3-2e36e0e785b4@oss.qualcomm.com>


--aawwAngujd+ljhFp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 11:06:50AM +0100, Bartosz Golaszewski wrote:
> Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
> This allows us to hide the dereferencing of the embedded struct device.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Applying this patch fails for me. What is your base? I don't have the
commit referenced in the first patch series. I tried current top-of-tree
and current -next.


--aawwAngujd+ljhFp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlpMd8ACgkQFA3kzBSg
KbbnbQ/+JcSnhnaxzTXp3KedeJIL/hJDoadTrq26SA/qbY+Gc57xlULu3EDgDEU7
2KctbxYTkQ/UMBvBgAqZeDY8rcCkAutv5zHUaMJUEnYuAIRauPFyS70ZUsjOhWsw
Ff4DJ4lfnN+J62WraRKXB+0CAWQUGjkpN/hEEfTgU7fdi4x2k/WxMxtRFjqR5P2K
BNsZ7jKkwhLM7oF543u2+G57osAzNql0WkBZ2taRC0Qo1tU8Rx3COXrOvWNCSRsv
GU9ZT13J/H300Z+4xqTHgvCFjmFr62u5p6dW/QTd4OZVUGxixw7Styb5oKXRr50V
GSvwBYEZWNZAHZmxB1V70pZXe+Y8dvvvBj+bXfElqpd5uFTgFn7jTOSPSFs5rjEC
IiJxKlaDBGu0ZAtKxRt+Z6xSMorBqSnKZVbu/iZPDsxTroU1gItp3v3slG4hCnAm
qcQxGcOe8XxYluMuCt9tU/Ho1bOT2BPDUN2DCRfaRL2A54Js4fk05pBa+2iSWOPr
8w6xUo1zCoN1s7CSbCtZkrsKMnSCfVkkknfaDtv3XcQDs4u9de/s4/eVG87QqVFg
IX5BHacyIquA7eEjv6DJCjhutQ8E7cDRXBiF4PCvQ5h1NQVbcQ1vE1aI/0QOk4bV
uZOWlCIU0bQNb23V6SQ/KhvYUoIHYYSTErF2Nipjx5p4rSZnd1M=
=gkW9
-----END PGP SIGNATURE-----

--aawwAngujd+ljhFp--

