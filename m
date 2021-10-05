Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 218C7422D1E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 17:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236078AbhJEP7L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Oct 2021 11:59:11 -0400
Received: from www.zeus03.de ([194.117.254.33]:59666 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235588AbhJEP7K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 11:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=6D7xAcU+9XD8GiwFGhWCi7z/piL/
        wDKzxQ92voaJ0GI=; b=aW3VsmEt63iOTsF8qmIJI7TdckcuFpIFbE1RsDgT/0Vn
        XrAH2WVtJsw8VzmKUG7sCA1c5J9fmShwAiMgCm2jhKYZGier2QbXSKSpeb17KKku
        BGlEPjzo9v9Usr6akr2/vWiSvRBgXzWNZkODeYU60AIUayTThnKZS07c6Uniglc=
Received: (qmail 3867955 invoked from network); 5 Oct 2021 17:57:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Oct 2021 17:57:18 +0200
X-UD-Smtp-Session: l3s3148p1@PlWHFZ3NaIsgAwDPXw1kABtQsg8UzxVo
Date:   Tue, 5 Oct 2021 17:57:18 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] memory: RENESAS_RPCIF should select RESET_CONTROLLER
Message-ID: <YVx13p7H4ZM3EmTO@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <e443aa66d146da5646b7ebece8876545b8621063.1633447756.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="19Etcq4SFU7QSapd"
Content-Disposition: inline
In-Reply-To: <e443aa66d146da5646b7ebece8876545b8621063.1633447756.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--19Etcq4SFU7QSapd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 05:29:22PM +0200, Geert Uytterhoeven wrote:
> The Renesas RPC-IF driver calls devm_reset_control_get_exclusive(),
> which returns -ENOTSUPP if CONFIG_RESET_CONTROLLER is not enabled.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Ah, here is the updated version :)

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--19Etcq4SFU7QSapd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFcdd4ACgkQFA3kzBSg
KbZWTQ/8DevB9zinqcEb4SyLwJA94cmX1MxW4QzGRFQDvv1xLZZPkkiLeQlEILe9
EusQMGOKnrUAEgyBlhzL4Efpckvaf35G0kxa059d/72N2TyMHLLcKYtFtGAMas9y
1SSvetkWyo90UsXD7QFtS7iS1/8JOgCfCmENL7uz6LXNM3FJep+Kt8gFHm/rNS6f
r5ffoGAWoRwHtXDGJDWcYQsIy1UpcYHmIvUw/4R82z8FyvHgvhi9i4qnRfP9qe9F
uzZL+Agu39PG4fQ+bLAmvYVs9IL1yyeaOiIzcR3HdtxUgYLFznEC4qj+/rSx35bC
h/rdjKD8m3PExrTL8EItaENlSt0yb3DeM+oDrK/vHCijbxPKeilWAqgpdE3q1/pF
itztzNiGGpU/zRJogqyGnSwiyKhpO3ImGBJZ67qR0Pqe7fYu6zzh85v2ER2ZvRjl
T3GadLa/C1qf78CY4BAJqXIsxnKzwOTZYP2mOhBXokass5K+cBAsqs6S17wn4Cv7
HHswYbDqCvHaU1nIBfa7DqnGYbvMgRF4xZzmPBTtwbB9ZZEILi0MI/UH0YgEP9b5
KUUeeDqeJ64euiVuw8UyviA8XBnwjLFhVBbhZABKJDgOx5zo99cFVdbqUtebM5LY
2trv44IrbmisWYdX39r2ic7+0+69yFhLlQXPn7VlPou4zqV9Sew=
=ic4m
-----END PGP SIGNATURE-----

--19Etcq4SFU7QSapd--
