Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54EC37EF740
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Nov 2023 18:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbjKQRtf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Nov 2023 12:49:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbjKQRte (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2023 12:49:34 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A69B3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 09:49:31 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 259DAC433C8;
        Fri, 17 Nov 2023 17:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700243371;
        bh=t3RO+MQ9z2LUNsTVC1dHHAaM1f/KVns6ngZmVPaHF1k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=STU2KUYp5jr/X06ogCS6ZPJtO5jcca8O2vPZ5PsqtmMwgX2jqevkoWWvoVpgRsj+I
         SGN9EBASuBae5QEC0nWT6YEfAN2mBSRsHogwC0CwOYRPee99MQdsR5eVeE5KevN80c
         +0vBu8Y7uahxgj0U9RecmVleym3gJZr85twUrAth1Zgr4DsV1EhsOocNSlaU8+56O8
         7veBLh8s1G/ezdb+Omw7h2BRjSJ9nabp82rSLfFjQtD4jruy8J3KVi5121VCtN9WHz
         MJhfc+Q28JJAtVx9Q1t75Y/S+FRQYgDlaoyeZwJVWIfiISPk6mPwex8TOQCsaK0eN7
         LMl76ipr9xw9w==
Date:   Fri, 17 Nov 2023 12:49:29 -0500
From:   Wolfram Sang <wsa@kernel.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 1/5] net: ethernet: renesas: rcar_gen4_ptp: Remove
 incorrect comment
Message-ID: <ZVenqeTESTUSOyJq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
 <20231117164332.354443-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4haptCi5eTjC83Le"
Content-Disposition: inline
In-Reply-To: <20231117164332.354443-2-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--4haptCi5eTjC83Le
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 05:43:28PM +0100, Niklas S=C3=B6derlund wrote:
> The comments intent was to indicates which function uses the enum. While
> upstreaming rcar_gen4_ptp the function was renamed but this comment was
> left with the old function name.
>=20
> Instead of correcting the comment remove it, it adds little value.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--4haptCi5eTjC83Le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVXp6kACgkQFA3kzBSg
KbZISQ//ePUZVmIbDWM38cFGxmHCwcX/DK0ujyjsIW4qiyBQTTbHXB4l0yA9ZUGt
msshuzWUSytgHn4K84/DYeaT8kTSkapM1884EcNiZQLHYZJy4OSHpeeiUQt/ld6v
vq9Vckdh/tU7BtjoZQRpcObmItxWQF/eqBL8miJ0XK3f6o5URcuPmRwpGPRJW2oA
e1LeD7ExITSNQIzy4AbEbaGUq0IL4vz0cS+B79829LNRGpidc1xUCR3VMzl8psfI
XHCVipg13mxuoWai6FY3JmIB+yGplE5Smlmw8WEWgaLn5yc0BDCCq88tjOdoGQA/
FEgY2Qw+zBqYAN/mwpaFRX68CFMHVMUNNgMO9ZiEfQ+z8oQNwm3tTvpBevhtC2UB
8wbhpD/WllV06+W8+AbodofB6AxP/mDFVZh9HJ4Ki5K5xHeDtd0DqfIXKN0k72k+
ieCjSoh7MKRbf5pm3YfvJtLTC448+VvvVK+LdW8FQBBWmrBI+3pIGJtqv1xt7S3x
HjBXK8yiUrELQ/6mcOxMugIs/WIVMK5Vh5sZvNuVdg7jbNLHOe2eZpglvNQqdRWk
b6MkOqXPQLWronmYKi+8PQqVp4FfsrQYRUTsesKcX1oKgfF05qj//tb1uz6XVZJw
LaOqXNcTLvp3DdxQFqWuI1FgpJnxVe/zQSnwlfBCCm1fhd05VYw=
=mQel
-----END PGP SIGNATURE-----

--4haptCi5eTjC83Le--
