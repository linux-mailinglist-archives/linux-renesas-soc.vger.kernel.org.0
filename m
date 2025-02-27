Return-Path: <linux-renesas-soc+bounces-13782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAD0A482AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 16:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02AD67A1407
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 15:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C1326A1A6;
	Thu, 27 Feb 2025 15:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PhoDFskL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C8325F7A7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Feb 2025 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740669371; cv=none; b=EmRzj1MB8IWdKvSIY+8GQ5hD4cJgbdPYFUwntaVj5Q9AIPWPZ3rBRiokfFBxSYsapK8ZBGJ720EuE/waNyvaLxZEA0HS49WXaSrKhyZI8rb0mVmO/5lHaHhZR2ddz+VkXCDh7nH4W0rjyDKg4xGAsnl5hvYw0eIzmcVAGDQX/dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740669371; c=relaxed/simple;
	bh=1WEU+FHFg1+TSWI5of+ZNaqOIKSOd0S3NUVb5XTYkQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxxpVd76hKRvklMc0AGgA2Z76QWKXwNJ7nHBPt8sduLR4uls+5rhm6DuCBxNXVBtiTY1ojzu+kMrOJL1vXZfqWwzmbb7+9EK91UobDBLTw/yx3sg2+F+wyt1FY/sDdZniej+/xMxdIyMj+jHdZEGDQwiEcfTHovjJeY66cDLJ9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PhoDFskL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ku1b
	79/Vc/zUcC+HP8bCCsuJG7gbFIV2z/oR/rx6dO0=; b=PhoDFskLWgujnFiBmEtG
	PITMxefZA8pUlpYi4+mQ7h9ZbIh1U4aAp+6IS3kagJAHqMX/DZGe25dGKh0Bvn3z
	/50BnIiQigxWYAb2FcDSgJ0DdfIzXDReFOxPzDzy0w5GKqd21a8h5seRaCtKKcPB
	PIUpdM7QAHfRdxB30bhaVI9ksx1BkBtSpCbXm3r9LKgHxB7PXrGmfUYJ/18DKLsZ
	F4V+WoGW7+j/Z5z9K/nd8ZOfLvjM/K86SiIZcgcfVOvE9ZSfgTt1Ulg9Q1K0kGkx
	ZEpBHULRfZ3TyJ3AgdYVeQV0MSWoGr2atAPtlH0AVaHHtUVfV0bybuh1wteETJKt
	tw==
Received: (qmail 990505 invoked from network); 27 Feb 2025 16:16:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Feb 2025 16:16:03 +0100
X-UD-Smtp-Session: l3s3148p1@0pkJKyEvqFxtKPD9
Date: Thu, 27 Feb 2025 16:16:02 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Message-ID: <Z8CBsrD2gKL-V-UG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
 <20250206134047.67866-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9Hcunz0Ai+d1+e5J"
Content-Disposition: inline
In-Reply-To: <20250206134047.67866-4-biju.das.jz@bp.renesas.com>


--9Hcunz0Ai+d1+e5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +			/*
> +			 * HW reset might have toggled the regulator state in
> +			 * HW which regulator core might be unaware of so save
> +			 * and restore the regulator state during HW reset.
> +			 */

Since this is a hard reset, can't we just reset the regulator to an initial
state? It seems strange to preserve a value when the 'preserve' flag is
explicitly not set.


--9Hcunz0Ai+d1+e5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfAga4ACgkQFA3kzBSg
KbZsaBAAqDKMYBkQGMr9k2jUYu8bkTYKyBlEF0BoEdjeQA4iAH1l2mlZd2EybafD
4SDZAeTrzNaAjrENeTd7iVBOdgDQ5HYNdAC7lDGohuuzf5oDhRPFO5+0Q2z0AQDj
dc/vB6R1cSAQp6GObUcfVbBOKTa1g8+7km+3OcrQJ2upBZ2ZXaygdeedaOv0TBic
q+BazW02tFcBPmqxjHOnFR96GN7y7Yzc8ftCtV3D0kbFdFyDjwmO+3B2XQXOUjho
FJ81ajKLxwt2GQMQuIpOHtGkT8QWkpwNvNN85gRpOqabM5ZdM9SG1v0Rqj+cmD51
GfMcRIKCwH8wLW+wvfzLqYO2aMuvqL35QiHVJzHbFASH7BY5RmNywGD9dAZWMKKk
XlF2kEPECPtbdMDKVIDhZucVoy1OB/P9O+NVXumtbBWp5cXRJOjMa/gGZQpFbyxT
QEddYUps/SEUnCQkwxc2CEMNPo+Srx9TAF/Fu+G0g9GPk+M+QFQq9nu7qywORwfT
RH6t9KdxfepJsioiHZ3GS3caXjBjo0TGM7LtgDhiVayn27OhoTugxUy7xMbjorvA
p5LrktGjL38poCA4esJkIYpQk3ENiva1k8mybf8l3lCurU95uYQ4NoimlxSX/pFX
fvXZXj/oyOnXUQeXksXdUvzdqwce3zYZXVZHr6yoxzQAg1M7S70=
=BXhn
-----END PGP SIGNATURE-----

--9Hcunz0Ai+d1+e5J--

