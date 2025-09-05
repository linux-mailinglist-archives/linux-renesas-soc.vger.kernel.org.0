Return-Path: <linux-renesas-soc+bounces-21517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EE0B4626F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 20:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 747AC564D15
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 18:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C29274652;
	Fri,  5 Sep 2025 18:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSKc8NVc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD69273D68;
	Fri,  5 Sep 2025 18:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757097664; cv=none; b=bjKwlrX3kF4O8bBPbqMSQznOLu9Vh1kJGD+NwmTWBdyPkNBiP7hFBTpA59siCpHsvFnSwsxK38vNJnu7IpvazmISpbAnBCWa312v8PnBCm9AVJPkpGe06tyIHprekkG+Ny7HHEENVfRpAUndTBPZTqtMiohbXGzGJgsG9tDQZCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757097664; c=relaxed/simple;
	bh=tPD/4gTqPC5pDHvLRJFLCSZXmAYarY7iaOLMnBlun2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdMcJh/7OrKWsBtg1HKjbwsZb9chTZRXUdXLtPeWNUavwxaA7aW0kw6rZM0j7TH1TzJFtgKifIOplZr4ZPkr8ZF2FskbkRrcIhpAYba2u55TsViDaLevo9Qv7H2afSN8kNBmUeR8LJcN44be41AE58m46BpD/x6ep6noIlzRQGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSKc8NVc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0543EC4CEF1;
	Fri,  5 Sep 2025 18:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757097663;
	bh=tPD/4gTqPC5pDHvLRJFLCSZXmAYarY7iaOLMnBlun2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dSKc8NVcXJTAtpE1KLM6abj/quuwlm8FkqpWbg7nlVLG86vhV2MxzwRTg/pBV+0Oe
	 02QCqPk1RT35RO3Qyw/RanSMC4U/7fIa2BFaLkyxrfxPVVNKSfjMWmML90dum6q2i6
	 JFWRKJ7X+Vplh6ZTKRYiguqZ/5FmjEbEZOGbFjuzS/Y8nUYyefWx0hojErplcmlWKW
	 j7DgLT897jBGh9ygWH3DNlYDU/n3YfOMjD95/TKzyzaGvTlgmc9gEDGPPnOU62mrO8
	 KhQN82r+0omH3qpYuDyfYNx2SFIh+6TufkH5t8EutIwNhlGZS3DIFJnz6NAhv617Cv
	 IsiZ9DXB5Ja8g==
Date: Fri, 5 Sep 2025 19:40:57 +0100
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
Subject: Re: [PATCH 1/2] dt-bindings: ili9881c: Document 5" Raspberry Pi
 720x1280
Message-ID: <20250905-lumpiness-elixir-d29599d3063b@spud>
References: <20250904200238.168307-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fsKq9MF9ZFFMAYqq"
Content-Disposition: inline
In-Reply-To: <20250904200238.168307-1-marek.vasut+renesas@mailbox.org>


--fsKq9MF9ZFFMAYqq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 04, 2025 at 10:01:54PM +0200, Marek Vasut wrote:
> Document the 5" Raspberry Pi 720x1280 DSI panel based on ili9881.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--fsKq9MF9ZFFMAYqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLsuuQAKCRB4tDGHoIJi
0l54AP9ctqrqVd/7tPhoamoK/SxixmiA0Bral8abDxCWaTONPQD/Q7OMeI63GIiW
B3pE9QDCTvlrqe2rhoidFetRCA458wM=
=pPH8
-----END PGP SIGNATURE-----

--fsKq9MF9ZFFMAYqq--

