Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC1EA780C90
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Aug 2023 15:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377165AbjHRNfC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Aug 2023 09:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377174AbjHRNeh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 09:34:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 351223AB2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 06:34:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BD8F7630BE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 13:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73ACC433C7;
        Fri, 18 Aug 2023 13:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692365675;
        bh=W+yL6gp1wI1ds4E3GEFhDlEtmdOZ39zZeOTjhL+fP1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aEySzVpocozbC/WrDE6V60vqbpKXkJd7ewiBtQ7qMr4EORAin4bq6219NLkmpEG/A
         G6S/g8NZNXpFG6DLiPznp0iGZaNu0QlMvEP92azXVcucZwPpw7ptpw5cNKKntFN7vx
         aaxkCfND7cHyzJmgajl4KrWL43PijcfzA1jXAUqeqwyS7iL/L95jelkFOwoyQ9VoKe
         A1IFXAfHNsNK/tkVlZCAZcU2cg298Di2f/RXbd0j5uEOMxpoDiBySuaaziB55JlXIW
         yBgBQ4QsWDZBz7prjOcF9PB0PhzoAex3qbVmKmYkrBm4C6+9Z1ZDOF1LRjHTxxXxkP
         jQBsJLGm0b5VQ==
Date:   Fri, 18 Aug 2023 14:34:30 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: raa215300: Change rate from 32000->32768
Message-ID: <c26f9be8-4e7d-46e2-ace6-ffa38c7ee131@sirena.org.uk>
References: <20230818133117.290897-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9e1u9S5feFE/NWSg"
Content-Disposition: inline
In-Reply-To: <20230818133117.290897-1-biju.das.jz@bp.renesas.com>
X-Cookie: Your aim is high and to the right.
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--9e1u9S5feFE/NWSg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 18, 2023 at 02:31:17PM +0100, Biju Das wrote:
> Replace the rate 32000->32768 in devm_clk_hw_register_fixed_rate() as the
> 32kHz frequency mentioned in the hardware manual is actually 32.768kHz.
>=20
> While at it, add the missing space in the comment block and also add
> module description to Kconfig.

These are clearly unrelated changes, the Kconfig change is not even in
the same file, and so should be separate patches as per
submitting-patches.rst.

--9e1u9S5feFE/NWSg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTfc2UACgkQJNaLcl1U
h9DOowf8C2pvp4OKsLkjTGOpJzcfQRrw7mn+qp/slgdnC3qYyaZgAlxtqrks/wVv
yqP1jzDqAtE4Jew3kCvsmuV0njFB4g4VyZSWQLYXzC2HyI0j8p80wpusd4st7sf3
Md26XdfgnIEVNHpUPh3sFecFhnJz+i87aYvdjGyV3yy+WFF8f/KtehXU0qGbult1
EtOtgDeDgW4H6pk9q1sms0AEaBBRXGfr29roEv3/5wvuQb7Q5YqQXWeDVN3dmo81
/j2AlAvgPsmSbN4LwoRnxCxrEmzx3CsR51JbM84Nkbx5jVyEAi1SDXbDrxxL+pcP
F40mApGjGZBRFT6niAF8e6jEa+5Xgg==
=B0IH
-----END PGP SIGNATURE-----

--9e1u9S5feFE/NWSg--
