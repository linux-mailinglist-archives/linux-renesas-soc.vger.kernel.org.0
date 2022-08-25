Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94AD85A08F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Aug 2022 08:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbiHYGhh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Aug 2022 02:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbiHYGhg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2022 02:37:36 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD029E887
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 23:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=8gyh56S0jJ8LLoS1339jRMBclOya
        sljMtl5KEZS7o/0=; b=c3ylfx1lW/nGWWeim7QGDoeA/0UmV58mmX+u7SA8Fk4w
        0u61xFM771ExunkbLfUIGlJoLk75Y57wg66ljx+cdlUHaO/lBlU4xEWcTvtpuA4S
        szVrWg2vZNMq2qUVMFJkDS/AqFMsu1DZoqdgh8PZR9gb6BhjulCN/UliaL9yzkI=
Received: (qmail 2542699 invoked from network); 25 Aug 2022 08:37:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Aug 2022 08:37:30 +0200
X-UD-Smtp-Session: l3s3148p1@MNcXCAvnfLEucrTo
Date:   Thu, 25 Aug 2022 08:37:29 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/5] arm64: dts: renesas: move I2C aliases to board files
Message-ID: <YwcYqbIuwtImOQ7/@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
References: <20220729164425.11062-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWW0kPATT4zGcjcEPw6XO+18MWJAn_HESe3rrtoEoF=FA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vlcxb54n4PfOZJyX"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWW0kPATT4zGcjcEPw6XO+18MWJAn_HESe3rrtoEoF=FA@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vlcxb54n4PfOZJyX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> I have never been a fan of the i2c aliases in the SoC-specific .dtsi file=
s,
> as aliases are typically board-specific.
> We also don't have physical connectors labeled "i2c<N>" on any of
> the affected boards.  But people like the i2c aliases, because i2c

The reasoning here was that the busses were named like this in the
schematics. Debugging was confusing if these numbers were mixed.

> exposes the full buses to userspace, and the aliases fix the userspace
> naming of /dev/i2c-<N> (I believe there is no better way to identify
> i2c buses from userspace?).

The proper way is udev rules.

> So moving the i2c aliases to the board files is definitely a step in
> the good direction.
>=20
> BTW, you missed r8a774a1.dtsi in your update.

Okay, so I will send v2 with the above SoC converted as well?

Thanks for your comments,

   Wolfram


--vlcxb54n4PfOZJyX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMHGKkACgkQFA3kzBSg
KbbaYg//Sxg95wFf1S5jvVkEuTJZAB+hrsrS+2LQJHg+XKkvmWdsFT21ctQaunu5
g43Z9CQ3W0TgLAF8R9jO6tuwRq3og4xcxmvOT2FrGc4ThEOfSmV054yWRrZqZUGm
kvm2nx3bPrsI0rP6Oz7LMX5pWxwoaBZGB1lvlTdc/b6GL+jmlkiRqzKnUXubSgkO
mLnN1960UHrVQuom1nq9k+ysghIhA05vLWeghAa5OVPewmypMytjoazpwGvXp/gN
ITT7AmnHYc1lfLap2gKHbjIZKaZbd/sOy3IpGhl68tX4WmMErjZMMS+Dtl2sBRIz
BtBHU4fJ+xfrv+M2WqMO1+qF62KvBosl+5vrNpq9hcd/VbugSXWZJhl+bm4uZ4Nd
qo6+h4Nopuxls8N+WR3wupB6mBFtXkRm+zXa86pC7y/sWdTjvWx1nw2+/SJa9Ave
BluFnswgcqab7yGpEVOS4wjwNu7C7zFz6mcnhOxZbKv81YnN0ajVYVJSbUuPjrBw
c4Pjyl7TwWTMHJiXX9Ve5uhXjerqPfdJf1gMq3IUHiSc5lczfGeuERxBu1un48Go
8kB7uHxP6YpZ6Tz0C3lFRc5tRrkK2eiRwriuD6ZgMwkppxWKERIZWxsJlF8rYUTf
vAKgGxpfkG/HPZGX5g9rxddKyUhb0bXUNL/3j+0WombKEs+/WFE=
=sJ1X
-----END PGP SIGNATURE-----

--vlcxb54n4PfOZJyX--
