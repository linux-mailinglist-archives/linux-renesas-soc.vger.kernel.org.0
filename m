Return-Path: <linux-renesas-soc+bounces-4639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 549E48A69ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 13:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8573B1C20FEE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 11:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594DA1292DB;
	Tue, 16 Apr 2024 11:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XXNNehIL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873E284E0A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Apr 2024 11:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713268210; cv=none; b=tffr4Swc8+5JbZC5G5XHM2bPEJGMdcE0tQyVuNSlhVpQHt4dk5fcS9ZUzWrdlImmrpUPgj7k0UF2YGIjxTafmqmy5/Wa8I2zR64VP/Gnv4KPgzGFVqljjGK2aYHJUsdzH1vw1vBkL4NTwsFiPTlY46dKW/BikVJp3Litz3yvOpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713268210; c=relaxed/simple;
	bh=5aEkZTPO8OkpInmOZdFYq92u6kg9eYlaysddopQ5jic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYmiUVFVvRdE28CM5LvCcA8CCK2H9ls6yBZvWQNnRpBEKox3KVSf9dUb6AQAZ/6EMW+6Z351i2nMUFG+vSB46inBaE3dWgFmAwb6NZdXg+jGX/+d1S6WmR+uhIV4Z7QscuXTQMj85D+IjW4fj6r3gGA8Itrjd2Dr0lE34HOyonM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XXNNehIL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gtZu
	L+l3eAsHG5angaIjQUCt59U4AqubfWjDhcKYzN8=; b=XXNNehIL4feUasfK8Z7Y
	tyRitREvrusJLzDoW9qsfIcEjnlg77T96Dcr0L8FD5Z0L/PggbcdTKkD+1Er57XF
	seF8NOwN/H6uTYO6hI32EKgohCk9g9AXe40VlYuwHEg7JqCoYUZ9T11132DuBOuW
	VnCOdl8DGAJleo2czUhXG4fIqCd0zQkpr/WFLEc5q6WBTPGSQNfCKs4GMn4uKsfQ
	TzE9hXg8fsjRVC42LG8alWR5dJf0NDZMaEHbm0uBS8yB+N/1UinziZzO3df9FLKB
	MjuwO/O/C40s3SX2YBIKlrwl4gsYddi7GqDygcTHcaqUxR8F3I8RwPa1twxI/+lw
	zQ==
Received: (qmail 2392673 invoked from network); 16 Apr 2024 13:49:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Apr 2024 13:49:54 +0200
X-UD-Smtp-Session: l3s3148p1@lrwXVjUWRoEgAwDPXxiyACzheF6dGXh7
Date: Tue, 16 Apr 2024 13:49:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: tty: serial: sh-sci: hrtimer not properly canceled on chan_rx
 invalidation?
Message-ID: <6fcp525uab7fggrkoftpz5bjrvvpza735wnp5djzuab3hk5zte@vgk43d4ijbww>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>
References: <ee6c9e16-9f29-450e-81da-4a8dceaa8fc7@de.bosch.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g6cmxpbf6hxyckem"
Content-Disposition: inline
In-Reply-To: <ee6c9e16-9f29-450e-81da-4a8dceaa8fc7@de.bosch.com>


--g6cmxpbf6hxyckem
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dirk,

> Analyzing this we found that in sci_dma_rx_timer_fn() s->chan_rx is NULL.

Again, good catch. Thank you! Here is the outcome of my first debugging
session...

> Is there any chance that there is a race condition where the timer function
> sci_dma_rx_timer_fn() is called while s->chan_rx is invalidated, already.
> E.g. via sci_dma_rx_chan_invalidate()/sci_dma_rx_release()? Or anything
> else?

Only 'sci_dma_rx_chan_invalidate' clears s->chan_rx. I think these paths
involving 'sci_dma_rx_chan_invalidate' are OK:

sci_dma_rx_chan_invalidate <- sci_dma_rx_release <- sci_free_dma ...

A) <- sci_startup (no issue because interrupts could not be requested
                   and RX DMA is started in an interrupt)

B) <- sci_shutdown (no issue because 'hrtimer_cancel' has been called
		    before freeing DMA)

This path also seems ok:

sci_dma_rx_chan_invalidate <- sci_dma_rx_submit (error path)
  <- sci_rx_interrupt (no issue because timer is started after
		       'sci_dma_rx_submit')

This path looks problematic:

sci_dma_rx_chan_invalidate <- sci_dma_rx_complete (error path)

The timer is started before DMA is set up. In the unlikely event of the
DMA setup failing, s->chan_rx will be cleared while the timer has
already been started. This is in deed a very rare condition.

The problem is that I cannot trigger the code patch so far. It is easy
to force 'sci_dma_rx_complete' to bail out but, so far, I couldn't get
it called.

Nonetheless, given this broken error path, I suggest two fixes which
I'll send out as RFC in some minutes.

All the best,

   Wolfram


--g6cmxpbf6hxyckem
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYeZd0ACgkQFA3kzBSg
KbZoCg//Sqqiz0VVVWuJrJjfAFP89psww8SJ6xMrcfYbXS+fVXx9qrGoK2qbT7Mi
vc+VDjK/dxF1CY1b6F55SSzNmfdiX8rWGbfe6ht1suTeKZZeOHJ9xwNqn1x8ZtBL
fHqs9XkFNwkqoltOifMtILkmRHyaiSU54Y0ycgMKVhScbfqJlvvsYeEWiJ81zPkv
9vRJY1lEegdWNg9oWaUsqJeBnG5gaAmI6pXvBsSrsXHM2I79YXdafrUL4ivN83Xh
CB/166nPiqQEH8Ygg7TnG1ztCZV9de6nzJoPMsLCcUdtj9/pPlnugwF7x/b20NxA
afJUYT5y9gkoiwUBfSHA1w2T29e2Lldsx3rsZ6OGMJrf65doOpytXwbIL9qF0dHF
h1Az8nz2bqCUuU8FbioMNvh6R53xWG1ONgkAaVsKYWZVE7nZzX/JDoqzi6+hQRap
rHrPMtqk1vzNGvjVHav4rh2LngxIVp8O5/xjbjV/h2WbwlQBdqWD4UJISIM8Dt45
3Y824qcf9WrTaPjwEs3qoWVSvBJlL3uNjlSDI0SE8kIUau/WYDnskUwMoG8GR0nY
kdsq3U4PANLlqKLQ2i9Zd29zhK3HBQrebtbjac6EgI3C3oWXHX+bNhXlPysJ3A4q
/gXf9RAhrpIaFHpIi+fqeEwSKlA4+WkQQhTQdZJGIEjIXZIOYJc=
=mCom
-----END PGP SIGNATURE-----

--g6cmxpbf6hxyckem--

