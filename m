Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A74A7EF746
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Nov 2023 18:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjKQR4M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Nov 2023 12:56:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbjKQR4M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2023 12:56:12 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D804A5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2023 09:56:08 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA19BC433C8;
        Fri, 17 Nov 2023 17:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700243768;
        bh=1p4P9Op6hEUhX+/V2S/HM+zat8BnW6gP9PEcZPXjnIU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BI6dpq+uPWgHYgmdmQOhwAMOzJHDbWy2GIobNfMv2Dkpq6cHj/w2WT07JvZcrxD4p
         lY3+wuUSp9AM4n7yagu8o3k5geXjpMD2kZNv7nRxajJrxMyQ21ISN1EinE9kje2Fb7
         lyNoeZDpRKAnZYINrq7iJ0Nmfo7mMCbCA9Lg34TKP9FNXxBZ4Vk6ExzrA7O4MiXP2/
         AJ61oKAxZjXk2ZWjPED/V2lzDCE8njqOertBd39ISYDvTYPVyGWj/jt4T2zXsay8GK
         b7QUnYLOC7sXY/g0maZpV1zG+libRewG4psR1mQEyBMImMLMV/wdgQwvYWt2gqJgJt
         nZ3d+H69sI/Wg==
Date:   Fri, 17 Nov 2023 12:56:06 -0500
From:   Wolfram Sang <wsa@kernel.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 3/5] net: ethernet: renesas: rcar_gen4_ptp: Prepare
 for shared register layout
Message-ID: <ZVepNmLR5gNsyi/g@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
 <20231117164332.354443-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9KlMvLkSYU5Yj9nU"
Content-Disposition: inline
In-Reply-To: <20231117164332.354443-4-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--9KlMvLkSYU5Yj9nU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 05:43:30PM +0100, Niklas S=C3=B6derlund wrote:
> All know R-Car Gen4 SoC share the same register layout, rename the R-Car

"known"

> S4 specific identifiers so they can be shared with the upcoming R-Car
> V4H support.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Other than that:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--9KlMvLkSYU5Yj9nU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVXqTYACgkQFA3kzBSg
KbZd+Q//eAA3sVmWFTeSObH/ur7slGDimjpT7psMlNTbIrXm/fG9h54YQ/TBmvKB
r/57d35/0MWXgB03XSvKkzOrv0irgY7ficyJ4vwXqGTdiDYxh27sqMmVx0sBTnAQ
xKTeO0B8g/QfxbdzDLGLFnMeIRSCb2iMR6FyNMOrYXIoTEq6756Jq/ZCuMWVwJbw
M5tVu44Z0dsaZgW2ArilZrPvzq2lpI4NUy8UtwAlwZhmkd09B8kciWYw+I0sTah6
hNUSLfcV26kihMb+W+vDf9HRSO+cspEh366gLONtCZAvqeNgNHEQwc5R/36Gb661
hImfwRkVP5PIQkFSPCggPdkfjCPwec8CtPe+DVHdkmzvQQYmFL6a1YWonZJUPPmI
a8zn1QUgCdgF4qKnli9cn13CCBa9KX9ZncGEo7Th+TEn5ZR0Fu5bLP1RGIzrYfYE
dhobvSQAwvHcADNbZgaUT49M10gK8XY7/+9ablpefZqk/zQz6Mu4lVeMDQu5RYsw
Kg3dPYQXTEy35Rw/wyf1OX/Dar6F5Hk5qd60ehUaf3dwa/Ml6ZvgTstS23fPbVK4
wNyjIuZzjOAh6bZ0Oav0gKpGPnYSkjEd2WrurOPtL09IMLzj5Mze4HYJ+uwv0H5G
5xlto0YoOxhTqHsmQBAPjNNYgAkJJ/Rd6ZQMzXtDbfWvCMXps/Y=
=FHzZ
-----END PGP SIGNATURE-----

--9KlMvLkSYU5Yj9nU--
