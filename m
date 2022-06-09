Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 980EC54448E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 09:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbiFIHQC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 03:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbiFIHQB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 03:16:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCAED5A0AE
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 00:16:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5E5E161DDF
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 07:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2A9C34114;
        Thu,  9 Jun 2022 07:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654758959;
        bh=NG/eabw9jVj7x05YQvBzlCpyI4tsFerhEKbMqoDpfsM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ewziE96mdeiMcGiruA/M9JegVbCJTTSt56rB8qTdKDDbdWJgWxprp1wLyzcWXGf+r
         OGJM0YuwEP3lKN0HkZeweN/JcS/y6xGLE3dwewS7mYsiNe8Cq51qsDDbV7lzZ8B6l6
         eaBYWuRW0kk8Slzq+4NNf66ImBfdfzjgsU83VcOkn6SvcEXu4Tc/+kndT6w8W6xRwA
         ZNxHfNb7BFWhu9Q8rOzvQocmIiB5WJXrEG2TzbUjrx+IQ73dvGBiCXP34Yu0QtEiJW
         74BdZjJ8nJvSVBj76SzkB28SDtbMY6JQIfgm249zDFwVZljEtFaEPHFJuhRapNjGyG
         WELlVcItHczpg==
Date:   Thu, 9 Jun 2022 09:15:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: renesas: rcar-sysc: Optimize rcar_sysc_area struct
 sizes
Message-ID: <YqGeK5/iEt2kqiL9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cbbc8f464743d636895c048de61aa610d75392de.1654701156.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p6QiIvsSY5cZUmZV"
Content-Disposition: inline
In-Reply-To: <cbbc8f464743d636895c048de61aa610d75392de.1654701156.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--p6QiIvsSY5cZUmZV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 05:14:21PM +0200, Geert Uytterhoeven wrote:
> Reduce the sizes of the rcar_sysc_area and rcar_gen4_sysc_area
> structures:
>   - parent is in the range [-1..32] or [-1..64], so s8 is sufficient,
>   - flags needs just 3 bits (for now), so u8 is plenty.
>=20
> This reduces kernel size by:
>   - 288 bytes for an R-Car Gen1+Gen2 kernel (arm32),
>   - 1772 bytes for an R-Car Gen3+Gen4 kernel (arm64).
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Nice! Dunno how to verify the parent ranges, but my Spider board boots
fine with it. So

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--p6QiIvsSY5cZUmZV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhnisACgkQFA3kzBSg
KbYMhw//QxAZd7geaCkPGtKubdmMVvAROBna1EXyRtTOL5CDRk0mo6It+3kzXCOY
k9GJ7dOkoQqs9vjslaFERUd6FRi2rtWDn3SkaxGN9xyHqJosQg7OykVR7iqFoEyC
NogL3P8yscuvuwvfI+acrNq3h/7POMY6rciq6ZvED3LzyrJ5OJe7XqiwtFvkYNlW
L6SDz/9XvetdNTm+am639Ws29Dnbwqgo5qeqZXvZq26k6gJRqZHoREd/B8zjSFQJ
zm6CENMKGtOHlBojbAkhaPuak/C+iGXQblSivnR8EkDuACX1g0ZPJ5bhzfRqs0Kg
a1u7S/r8u0Vh+OWb4MPW8LSANPqcOfSsd48DJKd/HxF73lDHpbIJ032SLVzVffcC
n17OMHMRi3M3u5aNR9EbaxQQA43/X1N2+Lebck8pQh3IaQiwD32xyl2cEH8bBBn2
dCgFL6q94Ajd53+c6uadTSH0IzJp5V3984gk4GXtZYOp5kEbShQK2ftsyoJzuAcG
TqBJJhXZgiI5NkevXu7ATz0d70Mgqm7iNv+6XngTtB/N+1Orkt+1p4i78rY1GKwA
MSs16oeYIUQYurjs5P8Ece13kvsqYY+mDkD/cWCbAdIZdz9y+EHidSt0rFQlgEQ0
+m08SlZ/E3512QAjQ0ZMRbjDi7HoKkfJ11EjCBgwoEQL+yE1GSQ=
=0F6x
-----END PGP SIGNATURE-----

--p6QiIvsSY5cZUmZV--
