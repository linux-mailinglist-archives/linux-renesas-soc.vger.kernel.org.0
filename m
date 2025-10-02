Return-Path: <linux-renesas-soc+bounces-22616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0F6BB4E52
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 20:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94E6F177D59
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 18:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2A62522A7;
	Thu,  2 Oct 2025 18:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JC+92sJb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D886C17A2E1;
	Thu,  2 Oct 2025 18:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759430211; cv=none; b=SIinkUue1xxzElJM2d5J6KDeAKDWrBiSPNbEv3u+/0fo0Uhbt1XAOwPbEMoqW3vzMO5Gga0Dptbczk58xadToxJwm1GNwg6pLNO+iYIyyjvoEUUvsjjvSWDvoW6kldP/tzJnAaDxQnJCLPghzP6ckO/ihwjLmWvYZSLHDWPc3Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759430211; c=relaxed/simple;
	bh=n5kiSAcbhb2eHuuUHogicf0hIb8cWyg9KNsm4j+akvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsIhuZ58HcxJ8XlWLD1cndhqudDlN2/zVGDFhLx6p831P1pgxFY6zpUMTT9TkhF9r6K/Fr9uGPdNQOboR47krxTwGvHafS6JhCk0JPoxQzYDt1CbM6fdWFAAMj3470SW/NRGo8GAYQgONHn4hGzTefYsqf3Nt2eJhyKFfPF7R2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JC+92sJb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D2BC4CEF4;
	Thu,  2 Oct 2025 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759430211;
	bh=n5kiSAcbhb2eHuuUHogicf0hIb8cWyg9KNsm4j+akvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JC+92sJbWT3GFAshOqJqRxpkZoiXcm1Y3cat6v8hDF0pQmsTxEGSmf03mdaAGzGws
	 wUfesAvRp5saaFMpOQB3At9M+aJ9rHXFpaDqOmr39xLrtP1G5BGvnK1yPXq+7fNcL3
	 NaXiaaVDJ8C0w8eu2Ob31hlJi5llkUjrW7PQ9SxmXMkjs6iIb33RSO7+mf0kY//FhD
	 /ZKYO8+G9LDS12SmSgkzA7LDiUM44VZkGYzZw0sHdB5dssGsUDkqlwBtapFKW/nbCK
	 osPppBAgzVUZdZDEy9F2nZk/zNSiSjmB3sRpDO3XQV8MnlxMyAZXg1IsLN4ZZgRjYC
	 KRkfwgOWGvwXw==
Date: Thu, 2 Oct 2025 19:36:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: physmap: add 'clocks' and
 'power-domains'
Message-ID: <20251002-lethargic-veggie-f6d4b5e3d2cb@spud>
References: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x40NfRc09puMoOvJ"
Content-Disposition: inline
In-Reply-To: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>


--x40NfRc09puMoOvJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--x40NfRc09puMoOvJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN7GPgAKCRB4tDGHoIJi
0ktLAP42zDrr5TqKRUdJdYKMIoirw/SwiG2ofx0WSyImzyfVoAEA26Qdkusn1iOP
+MBcHgThSn6vsUsQ9DiGydsV9RAjiQQ=
=b6Pp
-----END PGP SIGNATURE-----

--x40NfRc09puMoOvJ--

