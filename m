Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECADD1171E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 17:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfLIQh6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 11:37:58 -0500
Received: from foss.arm.com ([217.140.110.172]:37854 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbfLIQh6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 11:37:58 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 453F01FB;
        Mon,  9 Dec 2019 08:37:57 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B783F3F718;
        Mon,  9 Dec 2019 08:37:56 -0800 (PST)
Date:   Mon, 9 Dec 2019 16:37:55 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Subject: Re: Regulator probe on demand (or circular dependencies)
Message-ID: <20191209163755.GF5483@sirena.org.uk>
References: <23236201-a387-7257-35a4-ee4ed2f6bfd0@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UBnjLfzoMQYIXCvq"
Content-Disposition: inline
In-Reply-To: <23236201-a387-7257-35a4-ee4ed2f6bfd0@ideasonboard.com>
X-Cookie: We read to say that we have read.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--UBnjLfzoMQYIXCvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 06, 2019 at 04:38:04PM +0000, Kieran Bingham wrote:

> The MAX9286 also exposes 2 GPIO pins, as such I have configured the
> MAX9286 driver [1] to expose a gpio-chip [2].

So this seems like a MFD then?  The nice thing about using the MFD
subsystem is that it means that the drivers for the various subsystems
on the device can instantiate in any order and defer separately without
interfering with each other which seems like it's the issue here.

>  - is there anything I can do here within regulator_dev_lookup() to
>    attempt creating the regulator_dev 'on-demand' when
>    of_find_regulator_by_node(node) returns empty? (or is that crazy, and
>    just a rabbit-hole?)

This seems like a terrible idea, you'll have a half baked regulator in
the system which will need special casing all over the place and
doubtless be an ongoing source of bugs.

--UBnjLfzoMQYIXCvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3ueGIACgkQJNaLcl1U
h9DMDAf8CpQOBN0monPnjHxv964dVMtgkGtKsdUu8Oe9P6GjpeW7mEjijunzKrs6
sleWk7koDmdZlJkRnjYhnZISIOKlrxLG5qWQPXaQDhtEJMcyqMiKNL4lTk5UVDbB
sKMmSyFw+cOK03ocOiwZ3qVFXO8SpT3Xw3lp+1sw2z7v+R9LhY0QcicaqYmvtxal
DsH+LmdJfATO5dLdHYWBnBGoFMr5o5POk8WkqkualCFU3pSkA6khlR9KegwfzK6l
uy1zPcsMkrN47yYTFXREAZarPhmQ5AfSsE/k/qeyJiElP/uXJdhNswPYAO6m/yxr
jyWeDQX+l3rCS6EGzdJgNVYymBxFgw==
=AasC
-----END PGP SIGNATURE-----

--UBnjLfzoMQYIXCvq--
