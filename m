Return-Path: <linux-renesas-soc+bounces-17357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 888D4AC0933
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 12:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D77961BC5983
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B39C2356B9;
	Thu, 22 May 2025 10:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cj2WJCiW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BF715E96;
	Thu, 22 May 2025 10:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908046; cv=none; b=UtqRQd/7Qr6dNVHLJ4Ur+dfaUbZdGcCc6saSkA274sSJPFVYjm1ZzbTQsuQiOiWIdxWjqiICLFHdd5tLptQBlUK5EJo2x8QW7gbs298d9gRcxIWtMfGjxIL39zJ35xz2LgH8D1DSe64kjMDxWv4b13wNBz+mSbP/IlYXflauYJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908046; c=relaxed/simple;
	bh=MqopuUpYpRBwINTm0XZy4Btrri9/43yCJfmha+uoSws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNvtjAdfDgDPuSdGyaM6QSW0TfLcCkPE6U858Entvc4bGeJXibwIhNyU90iXZkg5tM10WKC+HEZ+f5kqs0qfrWm3xHTC5QUDtzBzkXHcCyaRVJZpK9847BN5Wz/38kqSb6IsZDkRzlZmVtNBgI/Ykypy9asWmnEsUQdcfBHHxNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cj2WJCiW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D4BC4CEE4;
	Thu, 22 May 2025 10:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747908045;
	bh=MqopuUpYpRBwINTm0XZy4Btrri9/43yCJfmha+uoSws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cj2WJCiWjYkooKVwSF7qK5qxGnxD7tXSUsN1yjJeFEgcgg/J6VU0+CKvUu4K82JWn
	 2J3EhgNsiuNcS9LFh7XQt48XPGkVjcypJmoCjd3JredBT6Tf1zRaByi+y03ZiPIrny
	 h0ubB6YEsb0W3LPuq8M2xkXuqT4SDiCyiG5i+Xpqm3RTgyoKJsQL4BP6TAj40R2iYa
	 Axe4uLW7riQND3IRZcX+WkMpXqU7DdzjKS3xKXaCU4OPIPZOI4EYUQLZwXrhuES5Wa
	 rt4laTbjxh8v+1ny12wFiI7j5z3IAWAURoXdZxe/wBBitobPOfsXpEn5SczrUcBfHq
	 xn3VT8iG9nKwA==
Date: Thu, 22 May 2025 11:00:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net,
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
	jbrunet@baylibre.com, neil.armstrong@linaro.org,
	khilman@baylibre.com, martin.blumenstingl@googlemail.com,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/6] ASoC: ppc: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <6625e6b1-53a7-4357-99ab-bdf5810e6699@sirena.org.uk>
Mail-Followup-To: Ai Chao <aichao@kylinos.cn>, perex@perex.cz,
	tiwai@suse.com, johannes@sipsolutions.net,
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
	jbrunet@baylibre.com, neil.armstrong@linaro.org,
	khilman@baylibre.com, martin.blumenstingl@googlemail.com,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
References: <20250522050300.519244-1-aichao@kylinos.cn>
 <20250522050300.519244-2-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dYBUrfbV055H0pXU"
Content-Disposition: inline
In-Reply-To: <20250522050300.519244-2-aichao@kylinos.cn>
X-Cookie: Beware of dog.


--dYBUrfbV055H0pXU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 01:02:54PM +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.
>=20
> Thus, use this helper to simplify the code.
>=20
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/ppc/tumbler.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

This is for ALSA, not ASoC (same for patch 2).

--dYBUrfbV055H0pXU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgu9cQACgkQJNaLcl1U
h9CN3wf+PegrYTPlsVJy+enj/g4eJLMHrb+6cwhGIJ+rpuWUhYGaAAV3EeSH51g9
RpUaPpzmbI1W9rHSufs3UHUUX+xeLAOCmoGQY3zHQDiXcB6kH7ZnVbFLcGCEQjbE
63rKXX3DuoMTCyrERQSyyVztgwF4gtwM7/SpkrP6EF/IwRBHuR7PSbfudShqajl3
JmjzCk+11NNoW4pgUBcsCdTuxGyEd5eGZWAT/b68XKAq8AbndHwwsY2X0OC28Ibu
dCW1cX1s+NK6W/MErAM0B72wYF0HVOmzOT45F6UlMZVJqPDezTE8IB+oUmzSf+hv
3t/hI5FgEmIU4rj4jwuBpqaSXrPi2Q==
=1khQ
-----END PGP SIGNATURE-----

--dYBUrfbV055H0pXU--

