Return-Path: <linux-renesas-soc+bounces-21516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E346B46269
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 20:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F06B31CC000A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 18:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7B1273D68;
	Fri,  5 Sep 2025 18:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLdZuogb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6056BA42;
	Fri,  5 Sep 2025 18:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757097640; cv=none; b=K4XlrGIAPv72kXPSqsL4HinZ4VvvG+23GaIoXCPoRnY8CenNfmAX9kaK4OGprrkjmgoICMSydEVdY0Cd0eJLQCneR8YhxVwwv2B/0KOzN2/8DDGqOrb3AkqQBD3fDQU4bQog8qp3SX5c609UvbSCIeLLQTRa+Bo0laVv2ibKoqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757097640; c=relaxed/simple;
	bh=zazs765EiAP1YNPFy8VgVtG1NsucovDF0NOtXp5Rdp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhRw5VQjXdJlGmow53tRGJXfPSM9MOPyiFDIaLx44RZMX4gklOomq+zXfuGins8b/Sgb7owyp9A/C4fRyz3tjZC47qagQoQksRPVFNMSPE0GaL4zbdoJyciAvxJGnep8/LIefwVrfpLasonvDw0ZKD+sQLrhIaNTR4ECvwpifF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLdZuogb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F64C4CEF1;
	Fri,  5 Sep 2025 18:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757097639;
	bh=zazs765EiAP1YNPFy8VgVtG1NsucovDF0NOtXp5Rdp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oLdZuogbEo/GI3zkymcBdtOez26VckC1jeHLR4xTgimm2jqpoPHK9EckuTB6mOtGW
	 FMHsjQe4QdQZ8Y2bIL5NAj827F7MAZJUilvgU+wmVNILE0zfQviyGeMfedFjGzIsz5
	 hOCjXUG9gGWKTaVvVe6q6tEW28AxP5vC6gVMwheM25W7KuQLreX5RzgrpqU3DQcWok
	 TIqOzQf2gLuc/wS+zGUyWDn1iikjPHSSJ92wX51Ju3UtqpLpLDQVKDqncm9WRLJ9hl
	 wOtVvtbSZrTuDtSxekrits4HOyCldeUy/KZ0iaMoUwAO1ohBvsvr+ViexJGrd9+jKx
	 t+UujbdsObRrA==
Date: Fri, 5 Sep 2025 19:40:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-hwmon@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [RESEND PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document after
 shutdown fan settings
Message-ID: <20250905-attention-unmoral-89d934074bf6@spud>
References: <20250904202157.170600-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QxZVX/RcT9k3KTuQ"
Content-Disposition: inline
In-Reply-To: <20250904202157.170600-1-marek.vasut+renesas@mailbox.org>


--QxZVX/RcT9k3KTuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 04, 2025 at 10:21:09PM +0200, Marek Vasut wrote:
> Document fan-shutdown-percent property, used to describe fan RPM in perce=
nt
> set during shutdown. This is used to keep the fan running at fixed RPM af=
ter
> the kernel shut down, which is useful on hardware that does keep heating
> itself even after the kernel did shut down, for example from some sort of
> management core.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--QxZVX/RcT9k3KTuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLsuowAKCRB4tDGHoIJi
0qfTAQDg1gtz7eMk9y+wSB8sMq81EkdkMLWjLCXFqTbFxxYrzwEAxgoRUmVDJTc4
jOVOsE9yiEIsYDz16a8YWnAawoQvcQQ=
=TMpf
-----END PGP SIGNATURE-----

--QxZVX/RcT9k3KTuQ--

