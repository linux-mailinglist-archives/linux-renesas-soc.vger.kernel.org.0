Return-Path: <linux-renesas-soc+bounces-21519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39395B46279
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 20:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B47F1CC01DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 18:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2289727815F;
	Fri,  5 Sep 2025 18:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qCIlkDyE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F036B27814C;
	Fri,  5 Sep 2025 18:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757097708; cv=none; b=hruQPdSYHiICnaYOSU42Ns/osE/IryFHE0UndQJmULGr2TBbnqNgn6KelPJN5Y1uhNlRjDid3zzQh3LcSsglZScQ8pebiatiefBXwrlsY49+rOWijFhD3Pb6D8lzfnaONr9+5+VzCV5CNGl/NqCu/SSEEOpdbLo+aNQiku17xp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757097708; c=relaxed/simple;
	bh=WeIi89SnQNGL1h0wUByw5oTYq2pGLFI5/okk2z2uiNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k35cwQEA9GnEi/OV9lDu0hT02iIfBqm3wmf7HFTssnJGiD6rzZJPVWdOf2Dm1OdKTPpFnrDs6ZWbHZfNUn8zZuULUwJ35MDPrxN7cW84uDWK4tE3/ZS3jWSWv+9hbOgq3P59vz2GhYEZwuDSDiFo3PdM1DKGTPXA51dlLrbX7+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qCIlkDyE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7463EC4CEF4;
	Fri,  5 Sep 2025 18:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757097707;
	bh=WeIi89SnQNGL1h0wUByw5oTYq2pGLFI5/okk2z2uiNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qCIlkDyErCLZHaLujkCIP5Sjwzjevn4YLIshmhPJ4GhqLkw14x4zNw7KtMWf7uaB1
	 26PTyKLassS7U109RQy40I5zHqBwOTy1jYameg+UJXRe5NOlLOFeBCIes+hLU36N7P
	 /Fr/QRfeI6nNqfAKCm/PtOlZX10w1fRRE7OG4MmdXlzYXck02g0f4UiB3LKx9uLnv0
	 LFbT0qLFaKmpZwZbszPhaIk2684dpe8tvmlPKnPoL3IbWCHUz1uJyRlTV0XTbzxP4+
	 z8ol1YCajtUQUx9Z6XllhsamNncyT+OGy6PXoPnGSiIXRmPxBFOavaEpgCZMmT2Ici
	 90aXSvmgobHlA==
Date: Fri, 5 Sep 2025 19:41:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: ili9881c: Allow port subnode
Message-ID: <20250905-uncorrupt-stream-c8dec3b86d66@spud>
References: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FVrm5AoPyokpwu95"
Content-Disposition: inline
In-Reply-To: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>


--FVrm5AoPyokpwu95
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 04, 2025 at 10:01:08PM +0200, Marek Vasut wrote:
> The ILI9881C is a DSI panel, which can be tied to a DSI controller
> using OF graph port/endpoint. Allow the port subnode in the binding.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--FVrm5AoPyokpwu95
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLsu5gAKCRB4tDGHoIJi
0hSEAP4/qmZ7UvMGCy1vid0r+6oo/ExhIo6I+mAIWegcOfW1lQEA75NLP0m9asCZ
p4qFonDTerxvGlSyGD+ZhOB3ayeqKwI=
=bLcv
-----END PGP SIGNATURE-----

--FVrm5AoPyokpwu95--

