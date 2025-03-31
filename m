Return-Path: <linux-renesas-soc+bounces-15120-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 556F9A76268
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 10:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5F7F7A1DF3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 08:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA69E1DF72E;
	Mon, 31 Mar 2025 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hV2sMaJC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1AF187550
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409839; cv=none; b=oe8bH1IKZNiIA/to6Ot8MjaL3Y3Ym9Vp7dyv463vKl0bYJfnwPLlT45PTl+P+q5llO6FAep8/eKbMyINRdJZv8Yip8dDmaQXJtnZfEXUdtlN9Wnt9eHOqWdemyTR7nFGxdd+tAbRaz62pTFPVe/J/4b0w5+XFTYpG63CPvWCQ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409839; c=relaxed/simple;
	bh=iaZq6sGjaRxHwDJEyMvTcI6lmbcpvCdHZM2yjd9nPM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b06Y2i0a9iyfzMxAOCGTizMaB9cl8EVVPza4dr0FzfElWfaVO8yZ1pppDefOQqQBe8MBLtrVxBDL0zZqx28+DPxHcIby5Tn5i9EcYj6Be46h0FSRtw0AkSvsQ6mPDPdA4xx0gPdJW3XF03ShP0fruT+kxfxiR7jt69EdQtPBo3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hV2sMaJC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=iaZq
	6sGjaRxHwDJEyMvTcI6lmbcpvCdHZM2yjd9nPM0=; b=hV2sMaJC+F2D/PdccPsa
	HrJdLRzN8WZ8hlPzDQeN+aSojgP3Xf76B97SZaEDFujrvkqFJcDVpICyXZUjr8rf
	G4TBYtffuczwzvoZ2P1sLaMdKVx/TL0wSdn/AeKJYprQ9IYERpBlNmj7EX2nNNdR
	pSBLSL++4UzLTg/lbpQn4iH+0g8/Hk5Fj0AlXfTBoKGZm3ZNqZrT691QbGFX6YgD
	+NV4/idQNkYQiUpTWmn24t2wgMUYly52JNq3ONy1vf3Wttik1sCaA36qc4Xj5aNE
	8hrb5zMs7FjQF6RffV4BEv03gFT4xMcM90YxxXJ4kvmjcAqWWvaZ/vHwhYHw82ge
	cw==
Received: (qmail 1157512 invoked from network); 31 Mar 2025 10:30:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2025 10:30:35 +0200
X-UD-Smtp-Session: l3s3148p1@1CHvO58xDNlQ8qei
Date: Mon, 31 Mar 2025 10:30:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mmc: core: Add support for graceful host removal for
 SD
Message-ID: <Z-pSq5e9MXTX3qfe@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-6-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pAAbVRH9P5V3qP8x"
Content-Disposition: inline
In-Reply-To: <20250320140040.162416-6-ulf.hansson@linaro.org>


--pAAbVRH9P5V3qP8x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 03:00:36PM +0100, Ulf Hansson wrote:
> An mmc host driver may allow to unbind from its corresponding host device.
> If an SD card is attached to the host, the mmc core will just try to cut
> the power for it, without obeying to the SD spec that potentially may
> damage the card.
>=20
> Let's fix this problem by implementing a graceful power-down of the card =
at
> host removal.
>=20
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Testing needs another day, can't do this via remotelab.


--pAAbVRH9P5V3qP8x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfqUqsACgkQFA3kzBSg
KbagIBAArZOtkaj5Se5cb5n8+eeOPL9H4Xo5SUN/nixyrZ1shcSoAk/H6LCVvfBD
WrBOvbU8mR+yGkvtDnZL8Sa9reqK7KD/VNIgfQfKcusHlO24h5dht4iuY9ZRYiqg
+MgW44aD2w7ajOR3h/OsNfuyXUY1DDIN6bGW6mawZtIUmj6l8eNKswIMLUEoeqmp
il+6YeXcwjhzXGdPxc4nVdb1wZtRqqXKghyWqS43h2JWYWGlvAJjmHl9UQ+9sMTX
eTQtFHet5Sx5B6TiAzepcI36qeSVY8jgWqxwCvy+divEhXS7RPfncBfH0L2iVpEW
soagRwKhOst/UGLnyCH+L7Ge9kD84YPbqEiGt+crZSxQy2cxaqJBS7IMlGg/yMTD
YGK4IBaU1JYz0UCc8vR1WIlOvsZHSnot+0X0oUSE4TOqq3kiQ/lX3tumzMRdEV5U
/0ysXjS5DH3GfFKZHW9dZJuIkrXkt0lkEwS10+vTznXyGbNSiSguOmgfHByNkuHu
oSOjO1SvZTmxBJix7gvqIaVmJtNAltrTHzOfwGiAu4m0OMsdyaJ3Sm8uAI6RM5Zo
lYKp6aFaxTiedxu5FUhVu+rfHG+7Cg4qUfeXLqmWKzQU0KtrJTxLOh3Zkil/axv3
ZKCFJ4P+j7laIc5iZRDHay3R5IU42sDZ9mb10z/6cyp0y5ggWcU=
=MJMm
-----END PGP SIGNATURE-----

--pAAbVRH9P5V3qP8x--

