Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8D270F49E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 May 2023 12:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjEXK5d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 May 2023 06:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjEXK5c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 May 2023 06:57:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2A1A3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 May 2023 03:57:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1345961A90
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 May 2023 10:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13376C433D2;
        Wed, 24 May 2023 10:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684925850;
        bh=I26sPr4q83vc+81mFEgAfrjxicXWUnJC39LXm+AoNyU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lcMZGX4V+ihUAVn3rStSftNAV6c6dNgEpFdQ1JJ8t9hbop0WE9rMpB0/LnOt13vSw
         Uzd1xz9yV3zFe9SbuExvrqsX4ijt7zKcu1aSPLFeOK1PBl/3gM/oKKo6wAqdB2zljB
         uBO/8e2OJJ04z+CMwlvtWLt3LtY4ImhbFiH9S3KB0+PT0Eq23536Mo4c5mG0cyAun5
         wiwxJfDfD2+JoqjPyhwU39iA6mrep3T/J1IHyKGbKWCMnET4990FilGJRYfAN54vIK
         H8MVFQbMJjLj08o3LICwMD1zBNXds/T5FBTQkJqwfbqCPfVuO7kxLsgaDcvya8+YtG
         z9RVB6XMX+iWA==
Date:   Wed, 24 May 2023 11:57:25 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v5 10/11] regulator: Add Renesas PMIC RAA215300 driver
Message-ID: <56f408ab-a969-4dac-b55b-80179fa71165@sirena.org.uk>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-11-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RMFfIBvjeMS3p1wS"
Content-Disposition: inline
In-Reply-To: <20230522101849.297499-11-biju.das.jz@bp.renesas.com>
X-Cookie: You will be divorced within a year.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--RMFfIBvjeMS3p1wS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 22, 2023 at 11:18:48AM +0100, Biju Das wrote:

> +++ b/drivers/regulator/raa215300.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RAA215300 PMIC driver

Please make the entire comment block a C++ one so things look more
intentional.

> +static bool raa215300_is_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	return true;
> +}
> +
> +static const struct regmap_config raa215300_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,
> +	.volatile_reg = raa215300_is_volatile_reg,
> +	.cache_type = REGCACHE_FLAT,
> +};

This does not seem to make any sense, the device is configured to have a
cache but every single register is marked as volatile so nothing will be
actually be cached?  Either some registers should be cacheable or there
should be no cache.

> +static int raa215300_i2c_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	unsigned int pmic_version;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> +		return -EOPNOTSUPP;
> +
> +	regmap = devm_regmap_init_i2c(client, &raa215300_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "regmap i2c init failed\n");

Why is there a check for I2C functionality here?  regmap will do the
checks it needs, and it looks like the check is over zealous since it's
requiring full I2C support but since the device has 8 bit registers and
values it should interoperate happily with a smbus controller.

--RMFfIBvjeMS3p1wS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRt7ZQACgkQJNaLcl1U
h9DpqQf/VZU6NWvcjnML9wdb7obMZ3VouCBEjqOJCxki0qWWzU06U9kStWxHrRaQ
SV2taGOCSGarU3egTWwhwtrvQUL+PVLZrJBhH9/uJKUdWZetln8PRJAPExZPUxgP
uiHvPX8KkWdhVX/ZyyUgf+wjF3ZGNss3UTUhr2abA5MsfMfKib+CiPRJAwMfzQmX
Gumhpg7TSqHFfg+MJPA9zP4Mlv8NILVUwtqP13yONvhJJezUu23/Hwo1q1AKTyNf
1yXJVydKDrzy6T3c0aAkn+9cU4O/FsS/oLC18kuPzqW4yHdHkC4m4GZ/nIIxpwPA
Le1Uhiz66J4UmX4hFjv7Q59qgb9X0g==
=bzYO
-----END PGP SIGNATURE-----

--RMFfIBvjeMS3p1wS--
