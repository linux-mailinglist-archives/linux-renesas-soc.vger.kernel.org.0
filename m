Return-Path: <linux-renesas-soc+bounces-7017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D4C9253E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 08:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63064B22CD5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 06:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6810012FF8C;
	Wed,  3 Jul 2024 06:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hFLUUxAG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947D14965F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jul 2024 06:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719989411; cv=none; b=r9LBpBSEItGVlIQoeQ4uQadqPXbpL/PM7eKJyILNR+/P3Mtnf7v1Qu9eFuyAoeBH5r2a+qj4uh41xg8iC1fJYyfTZLwtIsVWhz/YrGx0cq2hKdCRZpOYjHWdvphh1wk1JzrC+Lnd26/AGr7g5PaQm7zOi1gQ28G9qVCNXvPn75g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719989411; c=relaxed/simple;
	bh=W/vrC9kYcoT/DZsNbgZ1ht+RyhnN8lNgNTGy+oWpzgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9a0rVmepis3bHifGqpoNMElOJ+inpH+5OFRQvq5XpstTldwgBEl2SAN9s3TRG48bwNtkx+gSHRd+wdPmyhfITM/pD+QDET894U4TencR5pzEAPFs498VJKraSItUII5/R5CRD3H4ysmEgurawjWOx/tFe9Sdyh7fsoJoK7H6xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hFLUUxAG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=aHtd
	kmi/VDrEX0dWvoilPnFlbBzSKS1LMtKe6dSiBCw=; b=hFLUUxAGogNdvQtLAE+s
	IK8WdC1FhNAu05zCN7TlvWBpDeH6Nl/HlEGNncWLdkAaQJRxV3blkL8Fn4HVT019
	UYktBleYSqQooIfL9FwtT13OVAADPiaHy0m1051aZhPqrYsdrJfPjpnHWdypSUM9
	idmqWcs7//xwu1UOtFAa/qpJruCNC6rr6W4gxJ+X7iceuS4Zmzlb3ft6FP2jCv64
	t6MWB5yeaugYm+PLwOspN8UtDEK6syH6rkwGdHuDkseg3ZhGGTU2AwuEo4GkmKtF
	zNhB5nM6bZAb6dDBjHNugXXUG4LfULbuevnbD956q+ECqk8DcBjq77JfricUaQo3
	tg==
Received: (qmail 2708361 invoked from network); 3 Jul 2024 08:49:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jul 2024 08:49:54 +0200
X-UD-Smtp-Session: l3s3148p1@A5/fPFIcPqRehhrb
Date: Wed, 3 Jul 2024 08:49:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] [RFC] i2c: rcar: Clear interrupt registers in probe()
Message-ID: <ZoT0ke0NtzoCD1yq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20240702045535.2000393-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ZWs9rjrerz80yVN"
Content-Disposition: inline
In-Reply-To: <20240702045535.2000393-1-dirk.behme@de.bosch.com>


--3ZWs9rjrerz80yVN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dirk,

thank you for another valuable bug report!

On Tue, Jul 02, 2024 at 06:55:35AM +0200, Dirk Behme wrote:
> We are getting crash reports where irqhandler crashes because it
> uses priv->msg being NULL. This can happen if an interrupt is issued
> before rcar_i2c_master_xfer() has initialized priv->msg.
>
> The rcar_i2c_probe() function assumes that the I2C hardware is
> uninitialized and connects the interrupt handler via devm_request_irq().
> From this point in time irqhandler can be called. Normally, this is
> just prevented by the I2C hardware being in reset state.
>
> However, there might be cases where rcar_i2c_probe() is called, but
> the I2C hardware is *not* in reset state. E.g. if just the Linux
> operating system was re-started by a supervisor. But the hardware didn't
> get a reset. For cases like this make sure that the I2C hardware
> interrupts are cleared properly before devm_request_irq() is called.
>
> This is inspired by rcar_i2c_init().
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>  drivers/i2c/busses/i2c-rcar.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> Notes: This is untested. Does this make sense and is acceptable?

Yes, it makes sense to me. HW should be put to a sane state first in
probe. IIRC this slipped through during some refactorization. Maybe it
is also the reason for this code in the irq handler?

 547         /* FIXME: sometimes, unknown interrupt happened. Do nothing */
 548         if (!(msr & MDE))
 549                 return;

Although this code existed even before the refactorization. Also, I will
add a WARN there, otherwise we never know if this issue still exists.

Anyhow, I think Geert's comment also makes sense. But instead of just
adding the instructions, I'd prefer to reorganize the code. I hope it is
okay for you if I send a "counterpatch". I can't really tell what
outcome I actually prefer before I try out myself.

Happy hacking,

   Wolfram


--3ZWs9rjrerz80yVN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaE9I4ACgkQFA3kzBSg
KbYFLA//YoOsVv8ebgw7fmWEevoYFPNrfPIQviDQTW8JW7YfTBS/hzMaynolwPIe
OJWQt1j2h48BOyHwym4vjJQc/GxF/IqBFhch/WSJEJf+2O+mfaOuDweDUTsbHneP
RvYaV8udVUkTwb2vPEDJj5p6nDsox+ZA2YdjZFG5Q09UaeF591ZGtzQM7zgDt3TM
IGfUlQ/LFR2plDvnZsdi+W+QAzyXiQcLbUlT01RFLuW+04ADUYxOwcjLMAcYhKYv
1UVhsA2R9CGAfBEexlxWQQYUtjsLEu/eJkeY3Wr3xzAOpCIIXM3E+UbTPCBMxZw8
d6Ukql9wSRUiSfsxjevrEqKXBoo6696ppcKwZxLT1TdCwXiATMR1qrv4CkyQhr5M
MBUQ8cFFNYlmkXehYJt0peja28nXQoRP/ONCj6Z7QRF+szDGItYg00nSS0zyTbbF
b6fZMSXux5YXLI6t4od2ZuYHDyi1lXdZlF1NBYhEy3qeSmkZf2kacNCQlmJ3NCkZ
ddq4WilHLMCJoK+CTCsrlSw+Fc/K6Z00ggj9GTUmYLt5pQm0D0slMtNyPQFKjlFj
pGmJTqYC/V2DWhVtfAGcHyGDJTpvx34mq/u0ZmaqfzNl3BvHPbj6XgHI5LYT619U
pwVhaXYKGjlKPQF+OmNcBqZ8bBqH31Ffj+lRHJHNQDRs7dkKFQo=
=KFyh
-----END PGP SIGNATURE-----

--3ZWs9rjrerz80yVN--

