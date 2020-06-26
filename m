Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF2D20B439
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2020 17:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgFZPNp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Jun 2020 11:13:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:58490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726389AbgFZPNp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jun 2020 11:13:45 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C600206E9;
        Fri, 26 Jun 2020 15:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593184424;
        bh=7K3GtPF/yNqjge87mKTzhCmXwB6Sm4VKEt3qXZcJyao=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qLdXLeABrBNJTp77FNBi7mWidAU7wa0d4+mBC6RBOpRkklt+YfrLaDb3yQvaRZ5tN
         t27PYR9HWZl2hcp4Q/cRMGCeCu3Wth3lMZOtfKPCtlifCC1OxtBqvo9hv4WIkM35GI
         BJyXCDuYzzKO6BbwD9vVps7BW/RsvZyCszL+AHK0=
Date:   Fri, 26 Jun 2020 16:13:42 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, lgirdwood@gmail.com,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC v4 3/4] mmc: core: Call mmc_poweroff_nofity() if
 regulators are disabled
Message-ID: <20200626151342.GF5289@sirena.org.uk>
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1593163942-5087-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3oCie2+XPXTnK5a5"
Content-Disposition: inline
In-Reply-To: <1593163942-5087-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Cookie: You can't get there from here.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--3oCie2+XPXTnK5a5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 26, 2020 at 06:32:21PM +0900, Yoshihiro Shimoda wrote:

> If regulator_is_enabled() of both vmmc and vqmmc returns false,
> _mmc_suspend() should call mmc_poweroff_nofity() instead of
> mmc_sleep().

This is possibly something it makes sense to do, if the power did
suddenly vanish on the device then using a separate cleanup path for
that seems sensible (it's probably something worth complaining loudly
about).  Registering for notification on power loss might also be
sensible.

> Note that this is possible to happen when the regulator-fixed driver
> turns the vmmc and vqmmc off by firmware like PSCI while the system
> is suspended.

This is not a good interface, if there's a need to query the state over
suspend then we should query the state over suspend rather than trying
to somehow shoehorn it via the runtime enable state which is going to
break any other users and relies on the regulator driver doing dodgy
stuff representing the enable state.

--3oCie2+XPXTnK5a5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl72EKUACgkQJNaLcl1U
h9Bz7wf9FqHYn7nUdnV/sgGEXVM8N4F+UBVa1HKYde1K0sbexZVtvm0OT2Fezxx5
d73GSY83eeYJ5vQEWBIAnfiQEoul7UCwaOP+iZVR5Wj35PTHxMSnmzzF3Cy0ipgA
HgYKUI83BHpDz4/Vbc7lan1e/LJW9kpbYCnFRXzeNV6FT7SsG4ADBMkgfJu9lXZd
rwgDXtt/irKOrIHu6ubdQXMSJRQ3YTSRzn1FcwSCCF6PL1X9flJB85D3j6I46E0c
CdYYjvVLXxSoCiXw03cQaJUlrJvddzBDotKL4ZTxge2q9y/Z3fMJq/FXWng+Z48r
aVI2Qf8NMO+s1E6s2bJD2+SLhD9sUA==
=4D/7
-----END PGP SIGNATURE-----

--3oCie2+XPXTnK5a5--
