Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4AD22937A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jul 2020 10:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgGVI2r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jul 2020 04:28:47 -0400
Received: from www.zeus03.de ([194.117.254.33]:57620 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbgGVI2r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jul 2020 04:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=266j9uSGuops7z9kBpXvluHoDZQ0
        lpxa+TIc+bVOiu4=; b=Ai29aWaZRz7LOom1jLQTCBXiBMYO4Ygq+U3mK7pIcmUk
        4z3eeqidKHGvc6Kxya+fDo4jVt9QrljB0FPJZgmUoZ1iJZFwXE6jDtiuYxsAa4dE
        p2v4q45pImUdLZtgJgaaVLHq4FIItXmfjmbFddE2QO4j6vZL5ww/wGJHjzCpWLk=
Received: (qmail 2973143 invoked from network); 22 Jul 2020 10:28:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2020 10:28:45 +0200
X-UD-Smtp-Session: l3s3148p1@4BM7hwOr2NQgAwDPXwY8AL9PxqFiRnVq
Date:   Wed, 22 Jul 2020 10:28:45 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     kishon@ti.com, vkoul@kernel.org, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] phy: renesas: rcar-gen3-usb2: exit if
 request_irq() failed
Message-ID: <20200722082845.GB1030@ninjato>
References: <1594986297-12434-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1594986297-12434-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
In-Reply-To: <1594986297-12434-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2020 at 08:44:57PM +0900, Yoshihiro Shimoda wrote:
> To avoid unexpected behaviors, it's better to exit if request_irq()
> failed.
>=20
> Suggested-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Makes sense to me.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8X+L0ACgkQFA3kzBSg
KbbciA//fMAool2PdEJqf3rxrNzqqzPYYgMjFQmxW46mh71RAsjEvlIKNcwHPUiH
LcSTZt33k2Ef5kfE/ByxiHCzxZEncMtPqjjfsx5wsxU930K5Cm+uTR1hjOYHkjfC
oedk1vKAhQJB02UtrlNa8ahdkJGvXM8BQ+vBqjxuyFpowfHmRuCB2bUepqFKbY3h
PqfYurpytpIv+8LJHpnAgbzOKanzYPS3TcHZ99TCxSBK8c8sp/s0+P09qI5PNMn+
RTJjfHEbUef8O6q06P+ag4BfRGQ0SY0GrZR32G3vKnT1SL2A02ZB85dxHJAYSu6h
8zeKYDm9kpoayIQdHw3b+zcq+KMoBBwezrUbxnntiWTQK/2r741kOJ++RlU8fXqW
fmCatT+S2MO/KPP3YeT6gJoKY0l8VhxIRPr57Jhbl4vKqBYRSwHrrOtvz8Ue4P01
mhcawkYSjKJuFu6skzlQ06WfZYgy/HJGIpMmaMmjj8UzoEKwEih92NiL9mbe0AG6
RMPflXX/RaH1HoeVlqYKnzCCGNc7UXRvxDi+SPPa0F+OwGTkNByfVPgCny+JogQw
nwA9jXj8mppzEboYBz4ro3nx8DYVHA629o/dVsgMrz8j26PW1SKaE8SXm7q4aJJA
heW3POM/i6ruHJ1HmxH9QFNYu7mLM8myz+Mf407ajWXxgzh9fQE=
=7PRm
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
