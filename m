Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D591F453AF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 21:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhKPUcX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 15:32:23 -0500
Received: from www.zeus03.de ([194.117.254.33]:56744 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229733AbhKPUcW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 15:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=40pq/ORfvP9TRj4WAbZ3d6ZBDxsm
        ffhemiObAO70O1I=; b=jLKuK+/a5qWwMPwEVC/6TX3anvP2DrtCJwtlgNGs6a/6
        z9rkvSPbcOJc+mab1D6aSKG6LP/KmBq5KW7yNw6epoGHMiZkDPYxJ8KKwJGNcSun
        5fO9T7VntDxYA7tjALr/mTt+tLS4jzPc5PqDCaigjWXTVvDHclLUSA7znmNZmIo=
Received: (qmail 2864458 invoked from network); 16 Nov 2021 21:29:23 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2021 21:29:23 +0100
X-UD-Smtp-Session: l3s3148p1@nADix+3QuJQgAwDPXw8LABHxMEpbPi3w
Date:   Tue, 16 Nov 2021 21:29:22 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
 clock
Message-ID: <YZQUorBpiPS+qaLw@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
References: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
 <OS0PR01MB59220D97CD59F44918DE4FA586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YZKz/ptgPfzqGfeq@kunai>
 <OS0PR01MB592241C04F5CDDB94D850FFA86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUm2EG3Yi+eTZA0E9tZOT71ewkbx=yh8sVOnL207Od3Rw@mail.gmail.com>
 <OS0PR01MB5922A978B55C09B9E754DBD486999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWVB_7U0R5hkO7eEkzdkmhwCEFstskvXJgO-dU1hog=+A@mail.gmail.com>
 <OS0PR01MB59220069B3113A206F31305286999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592210D033924785A1C33A3386999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NsDqTRx1wreXgdgo"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592210D033924785A1C33A3386999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--NsDqTRx1wreXgdgo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Biju,

> Please let me know, if you want me to do this changes as separate patch(binding + dtsi) or
> Will you take care this? Both are ok to me.

I think it is better if you do it. You can do testing of these patches.
I'll happily review it, of course.

All the best,

   Wolfram


--NsDqTRx1wreXgdgo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGUFJsACgkQFA3kzBSg
KbYPiQ/+LDpriUuUZTC7uzrUWAnbsb+cGPkbhFCcr+HNrqKIffkZyj+MNOkeM5OS
9mT8EV8stUMhvjQm7PCQZoO8baceHYzC3g/GK0tzTJTjW/M3rq3YR35Jx3ssthLg
sKjEdjb8Y6fI7ni1f8BkPL3IokwYRiIatUEIDUqkA4M9WChyK3WyLYXSDcRF9VXv
3lOoWplqIDKbDPBectry7N+epnL/ldTF5rED+bvANAOdQK3I3Et5IbNiy/9U/tHK
5SlsIzwXPpWq5IPSyqpi61NXcFp9EwV8LMya7KMLAysYyctP9hFdLktQ8E2nTErd
njAKoJQOhhSxEF9MEUo3XrICwPemovO/kB1v5JQ8ZQXkTVv9+JtSzT3V/jrXB/TG
AMvSdKx28AgaobKHVLMcKMlIkTdN3uome2tzIra2i+8EZV6tjOjLJdYyf1yBeCx5
EG93DXQGQVtx51sOnWQ2RC+WgiNPu7+NXLDOJ9xmIsxICnXk60H1IwPd1/qYmKvl
gBciCYO1lr5InS5Av65bYQhL/HCN6mhvArWrzFy6JQngoAi5hPlawegMo7GtX+Zo
+defFvqi5uEnIuGxdDoPQiA6cgw0w0xqxwXCdNl2VeUD60grDDG7Qn0YOrK9v3uF
lb7lRVGq45Sk1odhmgUOr920j+qTjyUxF1HPERMQOdZlzrl20po=
=JRQP
-----END PGP SIGNATURE-----

--NsDqTRx1wreXgdgo--
