Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDAFA7AAA6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Sep 2023 09:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbjIVHik (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Sep 2023 03:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjIVHij (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Sep 2023 03:38:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C6AF7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Sep 2023 00:38:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7347FC433C8;
        Fri, 22 Sep 2023 07:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695368313;
        bh=xqJRYJ65z8ZCEW/tkOSG2viZcuPAtzTx2CRy/CMNdRE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XxYSXbjWUAASSBuRVGA0KOx0PbBxsXC/m9qqmFggy3rqTVKjShXOOpOjJJF1D9tl9
         iyQ28LsxGOgidhKDcfITcBx9QXD7LDAu7tvOf1cJL0VbD5svULHfZVV4RvCwVkLAWp
         oTwrFvU6w9DgzpgTNcqhLnLmUx4IPJu/0hsBcgKMxj9f1t9ykk8vVpaLKS9cMtwH6S
         SgeskXBAh9ZmWkEFuOhD6XhNNpyMnF/o86jZ56thB5ut692NtK77QHIcZS/LS9jmI9
         kwMS7NV20DTNrB2UWAMVoKz7mIkdpKylp8L7t7hh+ipBJdHOLDiKRoyjxXU7dTMmQ2
         bW0ZVveJyLRPw==
Date:   Fri, 22 Sep 2023 08:38:27 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Chen Wang <unicorn_wang@outlook.com>
Cc:     linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jisheng Zhang <jszhang@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v1 1/6] riscv: dts: microchip: convert isa detection to new
 properties
Message-ID: <20230922-ruined-deplored-a4c5b5866ad2@spud>
References: <20230921095723.26456-1-conor@kernel.org>
 <20230921095723.26456-2-conor@kernel.org>
 <MA0P287MB033245E15897C496789A0979FEFFA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="whMU1h3Bx3QRMe1H"
Content-Disposition: inline
In-Reply-To: <MA0P287MB033245E15897C496789A0979FEFFA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--whMU1h3Bx3QRMe1H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 03:33:13PM +0800, Chen Wang wrote:
> =E5=9C=A8 2023/9/21 17:57, Conor Dooley =E5=86=99=E9=81=93:

> > +			riscv,base-isa =3D "rv64i";

> should be "isa-base". This applies everywhere.

Yeah, I was expecting exactly something like this to go wrong given the
limited environment! Thanks for pointing that out, I'll fix it up when I
am back up and running.

Cheers,
Conor.

--whMU1h3Bx3QRMe1H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ1EcwAKCRB4tDGHoIJi
0knQAQDmHSJ0t81Lx1txBho+/P6JM6zJKeSXcYFtPiTtZSZYXQD/cU3exXwYZvy5
K17M7n0PpNtl8Gs9h8jhmv8p3ieyngU=
=PPuZ
-----END PGP SIGNATURE-----

--whMU1h3Bx3QRMe1H--
