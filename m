Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2BE20B393
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2020 16:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729218AbgFZOaN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Jun 2020 10:30:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:34708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729051AbgFZOaM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jun 2020 10:30:12 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6D62207D8;
        Fri, 26 Jun 2020 14:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593181812;
        bh=11Zbj1q8Un6cDDwWJU7oHrjJ/dOklYCNzE2mB5kxa0M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iyk1uIHmgEr68ixR/JNBAkDCnAg2NdIu6s6hldDaTfhSzgLUusdcAeiQjZHF6EbNE
         aY8ihCdprLNvwIgJVxj1zEi3aOkleKetnbATUl3ybuucbAfg9UVXwQaPywHYadz3No
         B8dcOhnItanlRI4Bj3qTmRmtsFUsGAfpMk4TjZ7U=
Date:   Fri, 26 Jun 2020 15:30:09 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, lgirdwood@gmail.com,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC v4 1/4] regulator: core: add prepare and resume_early
Message-ID: <20200626143009.GD5289@sirena.org.uk>
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1593163942-5087-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FFoLq8A0u+X9iRU8"
Content-Disposition: inline
In-Reply-To: <1593163942-5087-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Cookie: You can't get there from here.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--FFoLq8A0u+X9iRU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 26, 2020 at 06:32:19PM +0900, Yoshihiro Shimoda wrote:

> The regulator-fixed driver is possible to be off by firmware
> like PSCI while the system is suspended. If a consumer could get
> such a condition from regulator_is_enabled(), it's useful by
> consumers.

> The regulator subsystem already has regulator-state-(standby|mem|disk)
> sub-nodes and regulator-off-in-suspend property. However,
> suitable regulator_ops APIs didn't exist.

> So, add new regulator_ops APIs and prepare()/resume_early() in
> the regulator_pm_ops to set/clear the condition by new APIs before
> suspend() functions of consumers are called.

I can't follow this explanation at all, I really can't understand what
these functions are supposed to do or how they are supposed to be used.
Nothing in the rest of this series is at all enlightening either.  It
seems there is some need for a consumer to query things about the
suspend state but there is no obvious connection from that to adding
these new operations for regulator drivers.

--FFoLq8A0u+X9iRU8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl72BnAACgkQJNaLcl1U
h9Canwf+Ml6uP806W+OIy+9gkxQSTAXsFGpPbuYZmy0ITum/XRJLTUv2i8tO5DmC
VjLKc47zbAhabe2/Z9AUMoEA9OjJTFVAARZfn2y+kkd4UDkOjWmdVzNkqxrdACOO
oS+Le+kkNlwECWz3+QuZoxdCEa8RqhLitayqAzWjl0SH3hARU85r358UOe54XcsY
xqEoqKQimxcjEaAWODSS5qKP/9LbC3Ni3q7nXiIM4SovatGeiCauMn7NCkJm3FXj
++olczhykQk6XLvpysFCy477+2C1lviw6Veg15G1DAbjuWxqKZre6ySiDAzHLBjw
VfGtngaH+pT3PdHHLE6BfYcLgbkN6A==
=Tx7z
-----END PGP SIGNATURE-----

--FFoLq8A0u+X9iRU8--
