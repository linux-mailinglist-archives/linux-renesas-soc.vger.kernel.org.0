Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89F1B708836
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 May 2023 21:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbjERTN7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 May 2023 15:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjERTN6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2023 15:13:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014FA118;
        Thu, 18 May 2023 12:13:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7A4E364A1B;
        Thu, 18 May 2023 19:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E17EC433EF;
        Thu, 18 May 2023 19:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684437236;
        bh=PE0fe56Kva53ed/1yp5F5IJgKw/oeCugOYaBl/eSd1Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XJcB/JwLpIJV0ku+8KdpJLf/s/L/oTKEPxztVOyV+8CPW4nsNBo5m3JNsJ0EZdEmk
         oeljQhDDZ6c/pBDQ2UQhtCHU+ySL9a4FRNyXo1M5AAsVNVhqn/FBzqaHB2vviQCs44
         XgzQCQIzJHJj+TFUv4yhq7ZfdcDQ4oShqup5mZjidg/QNUowyU2/unhWkiBmwDcsoQ
         9tn11G3ItOuVn9qSq55KR99qYArC2V4LwblItF/Md2UGoUCkteXyMEbIeVzMvL/5uW
         4G6ur7EgEnvWg2HTZ/hdMvUiMw7fjMYtt8FNHo1gvbmo9TdP/D3U6BSOOKOrg76PYN
         eDk89ZD0kDVyA==
Date:   Thu, 18 May 2023 20:13:51 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas RAA215300
 PMIC bindings
Message-ID: <20230518-prompter-helium-91d0139a61e2@spud>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-10-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1SdGjm/j5jlXZL+a"
Content-Disposition: inline
In-Reply-To: <20230518113643.420806-10-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--1SdGjm/j5jlXZL+a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 12:36:41PM +0100, Biju Das wrote:
> Document Renesas RAA215300 PMIC bindings.
>=20
> The RAA215300 is a high Performance 9-Channel PMIC supporting DDR
> Memory, with Built-In Charger and RTC.
>=20
> It supports DDR3, DDR3L, DDR4, and LPDDR4 memory power requirements.
> The internally compensated regulators, built-in Real-Time Clock (RTC),
> 32kHz crystal oscillator, and coin cell battery charger provide a
> highly integrated, small footprint power solution ideal for
> System-On-Module (SOM) applications. A spread spectrum feature
> provides an ease-of-use solution for noise-sensitive audio or RF
> applications.
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: main
> +      - const: rtc

> +required:
> +  - compatible
> +  - reg
> +  - reg-names

Out of curiosity as much as anything else, why do you need reg-names if
the two registers are always required?

Cheers,
Conor.

--1SdGjm/j5jlXZL+a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGZ47wAKCRB4tDGHoIJi
0nDRAP4zmONYYBOt7kXV3M2v7mVxHqDt/PS5CUfmdcEJ+832ZAD9FyKZ9NF2c61+
eZpN20ORg7YuvFILrRtwvV4ZZT5kewg=
=bEd2
-----END PGP SIGNATURE-----

--1SdGjm/j5jlXZL+a--
