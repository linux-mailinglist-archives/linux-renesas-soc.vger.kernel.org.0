Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0B972A0BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jun 2023 18:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjFIQ5E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Jun 2023 12:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjFIQ5E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2023 12:57:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C20F3A89
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 09:57:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 10CAE65A23
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 16:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226DDC433D2;
        Fri,  9 Jun 2023 16:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686329822;
        bh=vCL2wjeT5OmNnFfxS1i9xUl9Q/WoLK8T2sKCdVUfO18=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EKpkc+xJQ5zR9VdO/CyoaAntZw3J72Fk+amoqAK/+zfA/uuZR1rGlMJ4FCjl6911a
         VqQcaYqP4rhep+X/OFk+qiQZc5VDFYivJej8YHac9juNE8tSza4GKpNP9dZEeM5apa
         WW0Ul+kLv5K2lCrK7kHjmitxKygh0TtcwlrIB8lmSsYV+JYY8vZc5cQYZAIFB/WHoS
         zeUnSxzfyQHmyGwBMrNDEmdbQF4KIJSUfbR55vAwaW1oqlf/IenWTre7kPTZkZfOpV
         TS1AAqUJdiCCdaBBfyPD+MtBECq6BnbZmOW8+PQpkXIBveUzRm5E4JfWFpBq5NyQ2b
         xc0aMv6j49LeA==
Date:   Fri, 9 Jun 2023 18:56:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 2/3] staging: board: Remove KZM9D board staging code
Message-ID: <ZINZ2zsRiNH2oscn@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org
References: <cover.1686325857.git.geert+renesas@glider.be>
 <ac93c6e1c09decbd7dfd3b78cc6cee88e0c6fd67.1686325857.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kcI20ZwZazurKQTV"
Content-Disposition: inline
In-Reply-To: <ac93c6e1c09decbd7dfd3b78cc6cee88e0c6fd67.1686325857.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--kcI20ZwZazurKQTV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2023 at 06:10:50PM +0200, Geert Uytterhoeven wrote:
> With the EMMA Mobile USB Gadget staging driver removed, there is no
> longer any use for the EMEV2 KZM9D board staging code.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Which is only for the USB gadget code, so:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--kcI20ZwZazurKQTV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSDWdsACgkQFA3kzBSg
KbaL0Q/9HhIamvtOSohoc3p2l7D5LCH5CqyJy5SnPEmhhfHvOAcT2TEBBDIQbSsQ
ZW9UlbmUGe0hrgbp6P2lYqYVr4QSpL33p4dHMYstPKal/SlKnljoXce1w+z7q7T9
jFgImlzkx1QfQ6IvrKuspjQGjdRH+X9/OTV7lJkqF9C8G3jS49ljvDXE2kEeWWjm
+Ct53Uf1kwmspEV00UBt1MX7kde70jmXBhPAZ51ksKLgZ4U/RyctA6uZVrziNq28
Co9opLMOWgqrln1g0yOEtblyT+YBuqCsDIll2xYA+8vPzQpUyu0XolHeXoaMDcmB
gDnzbEw2V6wGaxXjS7TceOcQx/FtYGooqF7s8INQnDnHwylvzoMeJvF5WiQGpDfg
pZwTpvHDllhB2EIgb+fmeV+LPk4N2N7cbpbv/6Svc7g9x7B/7dtapESCbFcS/Yyo
IwZHFBd3j3Y2OSpPnzjqnCpyCH/WF39NSmt9Nfnr9ydXRt4vxR6SwZ5BWj1r/aKi
8ZszoTF+cPhIrVUTCakqxMuTzTwE6kg3BIbIg/3IAtHn4TPq4gMPcnSgSrnhtjNs
Bl0UwoODF+8YOmFr5WTv8F5JUBSphlL2DAoH8KQtIr0uWcdgRPUPZbNQKaxCWIkT
fKSxc/qOl1Zq1/0pQ8SMI3q2934MDMgiN5soz/SFlrWj4r6XDik=
=4Tzk
-----END PGP SIGNATURE-----

--kcI20ZwZazurKQTV--
