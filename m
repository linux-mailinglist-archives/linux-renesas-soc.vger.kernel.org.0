Return-Path: <linux-renesas-soc+bounces-24275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47980C3CE43
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 18:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFAFB1882C0D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 17:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0556B346A18;
	Thu,  6 Nov 2025 17:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbVAZQip"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03F533030C;
	Thu,  6 Nov 2025 17:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762450832; cv=none; b=kXjE2JtXImt27IwSIJp71/XaueocyJGfUos33xYLnNnPvjVv0RvoGsTwjcxI1P4MbHHrofuF4Adejeo8TUghjU7pQ7d/I/Wv8dhmIje9gqECI4zfk0fhJDBcP+3YyjIJoptI3apJIM8QRtm94r9J42o2geeGQHTWvun+EwEjmI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762450832; c=relaxed/simple;
	bh=5p+0b8Clnp2p5Xtmd2HAgDF9wUuv2mhGSLMgm4qPzSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4+tDKjaiJ2Y//9MltjmybFWeMFJ3myR1hFV2xUYiVS0H3CJ214gXFntB7SWUdeOrIxc3WrrTZ7wnUTIFiFNCjkBR7FWdV+j9+zhtQhH3qiOfPv5R1IMWOgk/4K7OumjGJ7ibZH0B22YwgokJKpyJAF3SP3QsAqJVQbwnpnlSQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbVAZQip; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61498C4CEF7;
	Thu,  6 Nov 2025 17:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762450832;
	bh=5p+0b8Clnp2p5Xtmd2HAgDF9wUuv2mhGSLMgm4qPzSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WbVAZQipRy2EOOC/+c4YnyS5CnGncofhBgcTLtxgo57Vi7S2g6t8qmZFAWLYZX/F2
	 /0AOOa9hsy4dEf43OgNMW3JNI6AY8xpKxci0/GF4QNnlUUEUcPG55l2/Tx+PtCwLmr
	 eat0Hxn776b2QtDXjfjeEf5TeYI7QanWe3gut+fFOzewH+59DwCl7z+nGTLOM4CHTV
	 oTIhRG/0q+c7v3g4EAdeh8JYCuDtCq8mhu2H1jTxMzHNdfOt48HN5GHQUagdiT5b1w
	 yMygHch6XapHLUSu881s3yoauCoKF7pqh4XKN2HIyh/zQiNcIdpB3F2ErnccTTCvYB
	 f/t2xr/4mx+vA==
Date: Thu, 6 Nov 2025 17:40:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800
 GPU in Renesas R-Car V3U
Message-ID: <20251106-tint-thicken-c1144805dbe4@spud>
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
 <20251105232737.1933437-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nug6ibDGNUNHBi09"
Content-Disposition: inline
In-Reply-To: <20251105232737.1933437-2-niklas.soderlund+renesas@ragnatech.se>


--nug6ibDGNUNHBi09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--nug6ibDGNUNHBi09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQzdiwAKCRB4tDGHoIJi
0q5zAQDQO3HU4rBHEYYaA6op6DN3b+E6VTQEq+5YjfFxJtsiDQEAqJ3q5tQGcerO
A41x5Hh8DasWQ9gqFNN1XGWaoCJ8fg0=
=ba9X
-----END PGP SIGNATURE-----

--nug6ibDGNUNHBi09--

