Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74AF072A0B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jun 2023 18:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjFIQzi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Jun 2023 12:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjFIQzi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2023 12:55:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738DD1993
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 09:55:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0B8CC6593B
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 16:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C6CC433D2;
        Fri,  9 Jun 2023 16:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686329736;
        bh=+uK/xRPtx9vOI43Be0DunmnDDnvapRvnqIuCOU0m3uc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ozdt5vpp2k7hHrSyYtFgk8xQtXLjT40+RGNUHiRDU9Xlv+aTG0kXr6NBqM/PjPcoR
         n0+vwLRU0rdGxKTIwjl5hwnsu2uRSnPUkk5ObokVFE7oeqkLRJYeVh4c3YH5B8L36q
         OWgrjjFwKuzzNKiK7iiYHIy9ikDdcYsd/tFQ0VSwlx3YVlHep02fwFoHznO922oUEg
         6pvKed6UQDrf8dgdRFcWpq4q8SrKIHcbCI8KmblyGmYmLnuNvla8Fc+q5nKHHVu0L5
         XHbMgXIU6HUomVsLNfsTqoNAeLZFCef8wL8O8sOk5PnF4tywcWdrU//VCVofK49K7K
         A4ULGh/lLbWZQ==
Date:   Fri, 9 Jun 2023 18:55:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 1/3] staging: emxx_udc: Remove EMMA Mobile USB Gadget
 driver
Message-ID: <ZINZgucFf1rrr5uU@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org
References: <cover.1686325857.git.geert+renesas@glider.be>
 <0216a2e98936995ba8dcc3828a0d2644af4525c3.1686325857.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EKB5gFGarIn8ZIOq"
Content-Disposition: inline
In-Reply-To: <0216a2e98936995ba8dcc3828a0d2644af4525c3.1686325857.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--EKB5gFGarIn8ZIOq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2023 at 06:10:49PM +0200, Geert Uytterhoeven wrote:
> No one stepped up to complete the EMMA Mobile USB Gadget driver, bring
> it up to non-staging standards, and convert it to device tree.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Yes, if someone really wants to, the driver can be found in the history.
Chances are close to 0, though:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--EKB5gFGarIn8ZIOq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSDWX4ACgkQFA3kzBSg
KbaQnQ//aNQL8XQ4Uqvo0rH6VUHVD2aG9cm9gqsshDtqUKdE4VCuoHCIPmAT67no
cnh5jxhmEU82MVVmig86e8W1Ayz958WmSkiEieToAqcDd4CoY6akzwRsDFj77W0R
rMXiIMR9zaZmIr+hy5OP9ytQuOx8KTVrdSoCQVS+FxLS8V+bEgy9G7iji2v7bpOF
qnM/b1ZA4PuvVlPr1WSTFx6xavqqzreIqZ9ESZVo5IkocVia3ElnKZxkUJRlsw/P
tiw4DmrSwdmrXqJ6gb64YGdDxsfOkxbUFh7BcTx0c5yCikD54i8TWps4MUxXhlb3
VPS3PKN+D4oFNYVRAkTEX/RfJnYT99CZPJZlE8NfcaEWSosdoipsClXt5K2MgnYS
bjWUxgoPZKpJI+KxcsQHfhgS357Kn/E2MK9GxGFutZDHOReFBhZhI8QGm49NW2IV
0VS0HWPSBVyM36i2k8ZcTyeFVpzMR/bhxzmcbBz3WBu1hm4H3ZIQOXOIyvfC//Q6
pf+sxqzUOjy1SzN2covpuh0JQmamEBriGmuiCjrBvoxkMpPETAe4f8WS7qu4QUPs
s1CGgz7WlmPmJoJGJy+jU+W0ndGp1Ff0VRmwamxhIummgjiOspNirCtY+pwbLfHE
wh4YHxoccapYoAJo113niAzI9BSaRIDihtiM04Jixzk3fo+nz2M=
=UGC0
-----END PGP SIGNATURE-----

--EKB5gFGarIn8ZIOq--
