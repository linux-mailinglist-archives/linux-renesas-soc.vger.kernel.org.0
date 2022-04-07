Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE7AB4F76D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Apr 2022 09:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240393AbiDGHKi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Apr 2022 03:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240506AbiDGHKh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 03:10:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F12192AB
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 00:08:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7A6B3B826B6
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 07:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3093C385A9;
        Thu,  7 Apr 2022 07:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649315315;
        bh=2c2eyw7DUMmBiMEQMt3eEJaR4tFkgib1ae7UBHno+08=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sxSNFQFpy10IxPKGpZ0oDA4iJJj6RwBvDeDrmXAhNwoPiPryu3q2FPO8hEC0DJ29R
         iRvYFnkq1t2ShoR2mJpmqk/Fp7Dl4Ce4vPXbSl5pbxBFByP3OdK0To8sPrfwhsDjdg
         ogAjjs2/Z0wmHx2FFrK/kSLH+dvv7I6fJ9NTERUYyYReLpN2GjAD9l8NqPaT2iA1h0
         t9CjdeKJ8qg5h02OUz+WAtYjHI2+zJHPXKbZd7p+v+yPoPmNHCU11xbW8pViHPZKcL
         QVSLLQ96Cu7iw7D5LBO5ug4uY2JA5uBsvnjQWvMo5d2JrbiwVo5MzFpX4KlzJ/r7AJ
         nDlfQJkEFRWTg==
Date:   Thu, 7 Apr 2022 09:08:32 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/5] arm64: dts: renesas: salvator-common: Add RPC
 HyperFlash device node
Message-ID: <Yk6N8L6UdZNRhvrD@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1648548339.git.geert+renesas@glider.be>
 <cfc6af8a4c42febcc405b7356c38448eec8e29b0.1648548339.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8TOhF5EuLr7c90ur"
Content-Disposition: inline
In-Reply-To: <cfc6af8a4c42febcc405b7356c38448eec8e29b0.1648548339.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--8TOhF5EuLr7c90ur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 02:20:04PM +0200, Geert Uytterhoeven wrote:
> Add the RPC HyperFlash device node along with its partitions to the
> common Salvator-X(S) board DTS file.
>=20
> Based on a patch in the BSP by Valentine Barshak.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

No pinctrl settings for patch 4+5?


--8TOhF5EuLr7c90ur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJOjewACgkQFA3kzBSg
KbaBQA//SsTN3XoK/cXBmlpx9kPjv0uSX3TfY8L1jwMZnyszqbNQcg+bnkzdVfaq
EILZquA30I3Md1uV37u5ix1AdSzQffmEHQd5JawmjjUbtW4tDLD8oho/b6UKNeb1
tSBi08RcoCaOaubwmmIgulsclZxfVQyazq/3oIhSEV0ncV2wzBF11MtSeTaVA0sg
mEoOnHMdOadZeQK9M8shSjOGOod4duebU9slNkRJo2tLc4exxYJ3mF7v4OdqHdcA
DfluW6XyBOtfAoAR4ALtNz2FOmUz4le+YmEyH9IvpjSjLyfKgTA3VD7VlRINDdAs
aTkvwWWLoG9/SaUITc5f/pHJXTq/jefhPadzRBb/+OM3oZ8q1V0W19+wWNx02p4F
rCaJE0t4j2te6LFVJItMHJDIRRpqrEFnhXImlRsH6JHN0LAFNKt/SKuEzyxqmQFv
/lOtUZ4lLhMkYp7o8F86vuMwW7Y7TBNx9mJrDAwP7H1sLwnWk7Ywvi5jfVUCKUsZ
DzYcggT0P5zfaMQ7awVzrbjsJZTeMaZB0KhOl+4/fJCRizqlYs6cgr6+IaLU4Bta
liccu0476cSykVHDVXehcfovsxfaae51T8lPhgdr32iWeTJUBK0d1nB+bYokQASN
WKNKL1TQ+xBIWU8r3PHhfA1039lFBxw+BqaymJALc9IQbxVVjNg=
=mKav
-----END PGP SIGNATURE-----

--8TOhF5EuLr7c90ur--
