Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 075EB33EBA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Mar 2021 09:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhCQIhs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Mar 2021 04:37:48 -0400
Received: from www.zeus03.de ([194.117.254.33]:43410 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229549AbhCQIh1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Mar 2021 04:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=QdI3zpSMeRFsmo0LlaAvMuTE9Dqq
        GGmz+SmLmTIUXDU=; b=1ks7Ed0tcaUkYRy35C6qCxXMXXfgIUx2/rfWyOegg4Vl
        tP7Fq/aQUOxVRGSfAfyZ2lUvP9EZQwebKtE/bV/XD7uNVY3NO05RqD35UT6wz54/
        HEozwUzUS8FLaGANFORM7abU+id8gJgyJN2yEoHXIA/hKbhzWDyrIDfuVVZI8tc=
Received: (qmail 2069730 invoked from network); 17 Mar 2021 09:37:23 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2021 09:37:23 +0100
X-UD-Smtp-Session: l3s3148p1@yNRIZLe9wJEgARa4RUHsAfjwOo+4/zku
Date:   Wed, 17 Mar 2021 09:37:22 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Hoang Vo <hoang.vo.eb@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] arm64: dts: renesas: falcon: Restructuring
Message-ID: <20210317083722.GB1315@ninjato>
References: <20210316154705.2433528-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline
In-Reply-To: <20210316154705.2433528-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 04:47:02PM +0100, Geert Uytterhoeven wrote:
> 	Hi all,
>=20
> This patch series restructures the devices nodes in the Renesas Falcon
> DTS board stack to better match the actual board stack structure.
> The DTB generated after this series is the same as before, according to
> scripts/dtc/dtx_diff.
>=20
> I plan to queue this in renesas-devel for v5.13.
>=20
> Geert Uytterhoeven (3):
>   arm64: dts: renesas: falcon: Move console config to CPU board DTS
>   arm64: dts: renesas: falcon: Move watchdog config to CPU board DTS
>   arm64: dts: renesas: falcon: Move AVB0 to main DTS

Yes, it is better this way:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Console, watchdog and eth0 still work:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>



--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBRv8IACgkQFA3kzBSg
KbZE5g/+O+Z4AjEKDvm2I2EJCTPDTDpvppAcqKt+uJwSU+DHBmpXJcTC9GUpsapf
aH8yiXm0KRuKN4qHY1kH/G/AoTaGQ76isjtvda1WTZDNfp6+zGq9MzMI1HCriNIK
x3Tuoh9QsYMlmE4ugoWy5t0aDt/1ZSkUBhVGUJCeIk0sxswEiitec7O/VRrSusz3
ZWqOtKVBTFyYY924HXMDIQUlbHONZteQGES3h48LYr3sjsftdUBQTgVQ3EFVA4a7
TcyrHPIMyx9w+DPK8mh0Q/2pWzzvKBGZqkPvBDc5Zy8t4nOAvrTIXwLTI7fJI2zG
J3Xjmc6qBwiNIl+Pp/8G5wXHcJnwdYSA2W1RbYUB2vm41KduFhy1dnrM5eSyPcE5
GZmh0xsH3DwAK09PBNu8m2piwAGH+9wWc2bFzGDi4oB7YJo91wveUilLCO6gUybr
VteeApT39+trqnEvIfWxuVAP0K5MNAfHUHOlUOhSnMp2GcSQTzotyfp9WoXbZNFA
+M4YfJQ9efuXCuLf+6FOGJL0TtOz5SCqzaWEE+lv8DYgJN1dwYTucEwFOOPdFxNW
5jb+xce7AcdkLbGyFOJUpWE0eKjGsWnEnNR8PUBw84DqAamdnF2LcSf/h1T3js8W
R5AMowQpKwMfZQPqiGq3EDNmRwiabIFRqlohxfBzFms/X5UkG/I=
=vdCs
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
