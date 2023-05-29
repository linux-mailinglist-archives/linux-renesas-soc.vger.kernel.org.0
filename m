Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7678714F67
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 May 2023 20:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjE2SgL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 May 2023 14:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjE2SgL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 May 2023 14:36:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB384C4;
        Mon, 29 May 2023 11:36:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 532A962769;
        Mon, 29 May 2023 18:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCECC433D2;
        Mon, 29 May 2023 18:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685385368;
        bh=lkTfNrYOzCpI6SoJNVwaVPp2FKlAnmBT7ORl+lXnr8k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PtFPe3kDIykYxjwzabBZHJtnv4O8hLCMDBeWrQClthr/SU4D1WMpa7v6pkwJ/a70E
         nH4QeRLPkjUnu7qq5LXJh/sFyvz8nqwGSTqnBvlxByRTK6TyrJczkIBqJTNC3U7iuw
         ujFSGtyg7bYwhwKAz/tU5jA86PcqCvRc4lsQs+4hfZCfBhdexJfzlsx0S49jVLaOcA
         lOMO0xXJY9KKjb+2Q5Faa5kxxpkAqMidCaQOMxit47KIOz0dTqzDkmsop89Jf1mMDv
         8BoGWF6zJUQvcUorlTYmxHs17s/syiEM7Xzo23vBnVIYCUAT9ioIxhfx4fqaUr1KZ3
         xSNYp7O7WxZkw==
Date:   Mon, 29 May 2023 19:36:03 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next 1/5] dt-bindings: net: r8a779f0-ether-switch:
 Add ACLK
Message-ID: <20230529-cassette-carnivore-4109a31ccd11@spud>
References: <20230529080840.1156458-1-yoshihiro.shimoda.uh@renesas.com>
 <20230529080840.1156458-2-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8OwMbtV6y5wx6lrz"
Content-Disposition: inline
In-Reply-To: <20230529080840.1156458-2-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--8OwMbtV6y5wx6lrz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Mon, May 29, 2023 at 05:08:36PM +0900, Yoshihiro Shimoda wrote:
> Add ACLK of GWCA which needs to calculate registers' values for
> rate limiter feature.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../bindings/net/renesas,r8a779f0-ether-switch.yaml    | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether=
-switch.yaml b/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether=
-switch.yaml
> index e933a1e48d67..cbe05fdcadaf 100644
> --- a/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch=
=2Eyaml
> @@ -75,7 +75,12 @@ properties:
>        - const: rmac2_phy
> =20
>    clocks:
> -    maxItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: fck
> +      - const: aclk

Since having both clocks is now required, please add some detail in the
commit message about why that is the case. Reading it sounds like this
is an optional new feature & not something that is required.

Thanks,
Conor.

> =20
>    resets:
>      maxItems: 1
> @@ -221,7 +226,8 @@ examples:
>                            "rmac2_mdio",
>                            "rmac0_phy", "rmac1_phy",
>                            "rmac2_phy";
> -        clocks =3D <&cpg CPG_MOD 1505>;
> +        clocks =3D <&cpg CPG_MOD 1505>, <&cpg CPG_CORE R8A779F0_CLK_S0D2=
_HSC>;
> +        clock-names =3D "fck", "aclk";
>          power-domains =3D <&sysc R8A779F0_PD_ALWAYS_ON>;
>          resets =3D <&cpg 1505>;
> =20
> --=20
> 2.25.1
>=20

--8OwMbtV6y5wx6lrz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHTwkwAKCRB4tDGHoIJi
0ioFAP99inWrlxukmjHpvT9VUVemMgcZA3zU47zhjrwDpVsQDwEAwLykfanYED3H
ymxwPcszUZKtk/BEKJfD1oEUiQLfpgg=
=le1N
-----END PGP SIGNATURE-----

--8OwMbtV6y5wx6lrz--
