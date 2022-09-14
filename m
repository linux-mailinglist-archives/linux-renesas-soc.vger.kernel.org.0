Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE6D85B909F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Sep 2022 00:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiINWxI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Sep 2022 18:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiINWxH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2022 18:53:07 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5907823D
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2022 15:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=wQXjBzdg41KdPR4FAisMwEL9Z7vR
        HYCLO5o4inc0Lz0=; b=cnzYtuCo85EKaAZM6q6PcHl90eQJbL8R74zDY1cn8flJ
        ukMkjYAy+3eT/v5OtZdfqQrCPAvoemzqyqGdaA1myZ7iP7Y12M2Uf4P6rwtMoCDk
        C11tjTjC/IEcS9FoVi0A3tBidWMbyKqakdEF0cOHpFTeW5mT0mb7DybTCaUuilU=
Received: (qmail 2747360 invoked from network); 15 Sep 2022 00:53:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Sep 2022 00:53:03 +0200
X-UD-Smtp-Session: l3s3148p1@FyPG/arojp1ScWNM
Date:   Wed, 14 Sep 2022 23:53:02 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: renesas: Fix USB PHY device and child node
 names
Message-ID: <YyJbTm6pON02tOry@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <6442b4042e26537abc8632c4772f8201685f1f1f.1663165098.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fkCufnkvT+8tYsdC"
Content-Disposition: inline
In-Reply-To: <6442b4042e26537abc8632c4772f8201685f1f1f.1663165098.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--fkCufnkvT+8tYsdC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2022 at 04:21:54PM +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
>=20
>     usb-phy@e6590100: '#phy-cells' is a required property
> 	    From schema: dtschema/schemas/phy/phy-provider.yaml
>=20
> The R-Car Gen2 USB PHY device nodes do not represent USB PHYs
> theirselves, and thus do not have "#phy-cells" properties.  Fix the
> warning by renaming them from "usb-phy" to "usb-phy-controller".
> Rename their child nodes from "usb-channel" to "usb-phy", as these do
> represent USB PHYs.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> See also "[PATCH v2] dt-bindings: phy: renesas,rcar-gen2-usb-phy:
> Convert to json-schema"
> https://lore.kernel.org/r/dbdcffd009302734fe2fb895ce04b72fa1ea4355.166316=
5000.git.geert+renesas@glider.be

Awesome that this is finally solved \o/


--fkCufnkvT+8tYsdC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMiW04ACgkQFA3kzBSg
KbbFOg//YLYRmLyD1sSfxAA87sWQxJjMFK6qUZLTOxyoDrNAODZyatZh2E8viqbu
Z7XQ/n+yTCy/5WePm1Zy4kzP+w2zeI3l3q+PN67SV3CuVZSzoLQmOTvthiaorMRA
GMK0KcSPFVEIaSr0fOpjVCe0LzGE5kM0lHLwj7zI8e3DwpzTjfHC1GN5/6be1CBJ
idVnsmw8GZyyooNC+oP4wvFw/dBcNB4ekj3hdms8mKLw+8UwyhYWlmYKbtKuI7+x
/tV7LHwbrfsUvzCIorU+4oDKckOp8+PY9m2qMpshNTY9SQixtboipIj3/1BYK/ee
rIqWCf7e1dFDTwrsMBlh1841Q2dEsW9qiywU186OU7z6IVXALqZB6QJeBMvZDIFt
svSvOgG84N1S7UW20zgsBTlb2yMYCZkWffk7XCU4b9P3w22wGryRpVUDN9vnoV4e
v+b9vzSjXiR84uYTbxpzlJfBgqe4mALqYfB92UDHnYxVQYFuX6/RO3s9OhuUdsOk
xO+awiHd2CGhM0tMbBTWXDp/oKL3wG7k3y6GL51Rud+QiSsARMFzVMBkrRAnCSOY
Ao7PUFTIOQHXdJzJCfhyUJygBvTHDFZwUTXaxTwmLNZ4+ngPTjRe3zmX/n2m5jE2
rUv2LzsGstDojJmm6vuCwV1mXJVcKskkq5CEtdQchOOY5O576Xo=
=Q61F
-----END PGP SIGNATURE-----

--fkCufnkvT+8tYsdC--
