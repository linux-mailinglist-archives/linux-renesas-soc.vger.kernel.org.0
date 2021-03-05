Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7DE32ECB1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 15:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbhCEOBI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 09:01:08 -0500
Received: from www.zeus03.de ([194.117.254.33]:54630 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229737AbhCEOA7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 09:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=SedvOmZ/4Nj6S/FF98vAzoVhHMZ3
        GhtoPjB7FcPqxtw=; b=hZremNIilIBx1d8gn4coGWRwOwnYYHj2y9cH+deotMaT
        8c3SX0VBXwhcsa/jSQYmJ+OsQwQUtNqegJPqm0N7xAcMWbQM6AlIhiXXeZbR4ru2
        JUDglHiD9Wg9U+z2+1ed0Geum1pEnk6Lv0Io050/q990FN52QzrdfVLTsiYEs2o=
Received: (qmail 2243062 invoked from network); 5 Mar 2021 15:00:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2021 15:00:58 +0100
X-UD-Smtp-Session: l3s3148p1@SOlrg8q8UJlN91Vm
Date:   Fri, 5 Mar 2021 15:00:57 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] dt-bindings: timer: renesas,cmt: add r8a779a0 CMT support
Message-ID: <20210305140057.GA1312@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
References: <20210305135603.1227-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <20210305135603.1227-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 05, 2021 at 02:56:03PM +0100, Wolfram Sang wrote:
> CMT passed the testsuite fine, so let's add it.

Eeks, I mixed something up. It was TMU which passed the suite. Sorry for
the noise!


--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBCOZUACgkQFA3kzBSg
KbZ2vA/+N6ouGxyWbnxO2odDVWoz1ZuF7orXdQHiEatA7fsQ80d+eW1BFDjhjVSI
nl62YF6Pdef/m7eUCDzrS/vcBpt1HuzSqHjdnLSr7ExZXrO7F27LS4coWg4CVf1G
xdYV+CGBLLW1mlhrxZ5Elb8rYNaAMvIrPhEVcYT00VhgJDDK4kFJzr4gG7ySaPOK
V0agiy5kMTGbjO/aq3UeC2TKinmZmhw25C3ip9miU9z/7435udNLhHhTOAkobc9D
eaAoH0McfJgI1E73r9Pf1YKdvjUwzIYOS6N6aMhP8VhA6yXV9VzasjQoFq5KoEgh
B7DtxBJITFvtdIQVmpwXSbqSzJeGReQdB9vra+RxEmli7Ea3Sj7ahbdbYZG7LFz9
jQ0nivnw4avCJmcfwXGua9WiQ+rRxuXDR4JjVvX8ILBQAbaFgv48pPEFHKe1tZg/
JPCgtPRq5mkQNH4Gk4k/WGIDmALVVuhDuOJ9omizdb0bdiQdFzzZ0zAHlJT6z+Uh
do7aLjGPlMXkfWG0ZVJ4DQQpSmaqRZ3DDONot744NEthiEscYEvalj/CepC0GxHJ
9kFg62zEjOnAAgqV73zSNBpiyw5w8L72eRpypiefJZwsRjHqdWnbgf33Lva477Df
+D4Nglot/QIX+uHK457LvQc2CUTFeLyXP/665WmMI6kyovEPhxo=
=BL0s
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
