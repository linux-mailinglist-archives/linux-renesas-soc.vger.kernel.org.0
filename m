Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F03352E08
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Apr 2021 19:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235581AbhDBRLy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Apr 2021 13:11:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:37614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234759AbhDBRLy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Apr 2021 13:11:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6219961152;
        Fri,  2 Apr 2021 17:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617383512;
        bh=YZ3G/97YtIoywVZIaPwmVWW1AObOMDr0oGWxrhfqG1g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aPVRh6JSQNFNZ/Jt7JInaJIqkE/HzQ/rtPaeFvEpEYhdObfuwqq3bzp9Y70vgFnVm
         4646UPA+P6SFk/+ptF8FGx1u1gpgrzSKt10QOFb88JGpgjoZ2HbJUlAym1gLU0SiC1
         I/EQfkRwJ/ZlIHVJjRIswdtey+LN+ERP6uCAYT0fQPzzAubHbapziAwqSMyiqwxgj7
         me6X2PRGug4B0b0u/HQqrKVRKYwWV08K8xPUOhSBEZPaK2dfmp4Xes2QCEKUciBgHa
         qCc6NKumng7RGUvvm7t2au+5fKQqtEcPRCeJpnosCk/vSm0ihFgOa3ESdvIVyqqArT
         gHzYgI/H2SE8w==
Date:   Fri, 2 Apr 2021 18:11:39 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v3 3/7] regulator: IRQ based event/error notification
 helpers
Message-ID: <20210402171139.GB5402@sirena.org.uk>
References: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
 <0acca88796cab147398dbc346b3ea9728a9e3238.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Content-Disposition: inline
In-Reply-To: <0acca88796cab147398dbc346b3ea9728a9e3238.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
X-Cookie: Dammit Jim, I'm an actor, not a doctor.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 11, 2021 at 12:22:36PM +0200, Matti Vaittinen wrote:

> @@ -0,0 +1,423 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 ROHM Semiconductors

Please make the entire comment a C++ one so things look more consistent.

> +static void regulator_notifier_isr_work(struct work_struct *work)
> +{

> +	if (d->fatal_cnt && h->retry_cnt > d->fatal_cnt) {
> +		if (d->die)
> +			ret = d->die(rid);
> +		else
> +			BUG();
> +
> +		/*
> +		 * If the 'last resort' IC recovery failed we will have
> +		 * nothing else left to do...
> +		 */
> +		BUG_ON(ret);

This isn't good...  we should be trying to provide more system level
handling of this, if nothing else it's quite possibly not a software bug
here but rather a hardware failure.  An explicit message about what
happened would be more likely to be understood as a hardware failure,
and something which allows handling such as initiating a system shutdown
would be good as well - I'm not sure if there's any existing mechanism
to plumb userspace into, or perhaps some sort of policy configurable via
sysfs.  That could be built on later though, I think the main thing here
is that the logging should be clearer and distinguishable from a random
software fault which is what BUG_ON() looks like.  The backtrace and
whatnot that BUG_ON() provides aren't useful here and the message isn't
going to be very distinctive, some custom prints will attract more
attention.

> +	/* Disable IRQ if HW keeps line asserted */
> +	if (d->irq_off_ms)
> +		disable_irq_nosync(irq);
> +	/*
> +	 * IRQ seems to be for us. Let's fire correct notifiers / store error

Missing blank lines in the file.

> + * This structure is passed to map_event and renable for reporting reulator

regulator.

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBnUEoACgkQJNaLcl1U
h9AZ2Qf9FKDfBsBEi1RJMy2x3lRPmLjdNeIDsae0HYA/8z/Xnsg+bL+co2BYSFx/
+wh1NJuNyjY64qKyPD9qNf+4d0I1Cfo0krXcA9fm/wOHMch0RFKyUNwaZxYlUDcW
+bbLI/uVevW0XHwBfwdc/VSlpeVHTAqZnqBnCjEaR8twPSvoYJk4ekLMMsA9auQ4
/98Lkyfv0yZM12lHXBK/D+9mJ8EnoA6sAJLqiWuwl8d4lqq5AWP01BpHQ1r6Au8G
vtpCndYpx+ST700AqypZO+PbwqqZ6+eWDaPIBvhI+SczibZBzDNvtJpFE3/xEo2/
ozrQZ/eKkvGRUlfrtivVni8ErcvY0A==
=Rhqr
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
