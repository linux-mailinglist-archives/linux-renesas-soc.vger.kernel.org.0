Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C09AB422D1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 17:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234539AbhJEP6l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Oct 2021 11:58:41 -0400
Received: from www.zeus03.de ([194.117.254.33]:59470 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233913AbhJEP6k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 11:58:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=FJS7SPvRvF3PdPjZSbpmIydWilie
        fMdIsZln6Wmnq3k=; b=R2+eL99TBC+Q4iA1cEl90W14Y8DmRpQmcCWYYknL2u70
        hwDZ0eIBlFnd3oHpmObK8pQDwPbmelJ/VwYAJK6fF0+aEEEww+q4hVx2RIz/22Z2
        ZrVUSk/bRN7CZNoqggjTCoaBd/r4QDNu4afzYa+dMobDma4S2tmAL+4irWuOnvw=
Received: (qmail 3867808 invoked from network); 5 Oct 2021 17:56:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Oct 2021 17:56:46 +0200
X-UD-Smtp-Session: l3s3148p1@yIqhE53NZosgAwDPXw1kABtQsg8UzxVo
Date:   Tue, 5 Oct 2021 17:56:46 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: RENESAS_RPCIF should select RESET_CONTROLLER
Message-ID: <YVx1vhvtN7dFKbEl@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <d4383bd1a97c0490c0bdc9dae5695f4230d4a420.1633447185.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5qWqAgTZuFQeFEgJ"
Content-Disposition: inline
In-Reply-To: <d4383bd1a97c0490c0bdc9dae5695f4230d4a420.1633447185.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--5qWqAgTZuFQeFEgJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 05:23:02PM +0200, Geert Uytterhoeven wrote:
> The Renesas RPC-IF driver calls devm_reset_control_get_exclusive(),
> which returns -ENOTSUPP if CONFIG_RESET_CONTROLLER is not enabled.
> Even if this error is ignored, later calls to reset_control_reset() will
> fail with a scary WARN_ON() backtrace.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Yes, it is required. With the latter paragraph in the commit message
removed:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--5qWqAgTZuFQeFEgJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFcdboACgkQFA3kzBSg
KbalLhAAsBLI1H6ydrMltgltKwq5sdezuKDBDfB09gNwCkQeTUIQDSwzhgSk1pDp
1Sw8Dot8JWbUXDBZJ7HJJsZLU/tQtS/uIzzjQZkouax2j2QnW/7LaNtcEOkoi3Pt
0RLFDrO/SUStqETLP1z5e0JnW8Waiws4nPeR7jmymTNX0DqxsTtDF3fekhrx1BGE
PlVKOo9a/zeOPLSK8kX7Z9coMPk5e/dGH/xZ0rukk6HBnZbRlwQcXZfFgNn+2rF+
dhYUV3AGSW2U0FHU6O7hZ8Ep5XY9F5YIhdoHBnrxSfn6kZRwQ7sVfcdiqqGjpNvA
2nMtFK8dXTZW1b6re9v16GaqqOBnqha1dTSIz0QqFufytpn+dYGy2jRYk87CaJ+Q
BdMQjKU+qN4x8XwkP5kwkR2Tni+FJNyFXE55OG3r2nXas9srwCoGvUvmf+71lUlj
2YXvuIHFa7yYPt4LSGk0n/NRJbdff2twTpzpkdtGMJ6QKS29+ElKgwlYQ3jIzIIo
Q7GZ7OtNSnuzoN6cs19EboRteq0vtr6I2lSJpmsqkljqfzalPB8YySPTcOGhkAze
2DAQfKLyF3twnuP6IkOtoIveg9+xJAqJjendXjGDrPT7xYNkrqhdtZUl7LlG18nv
KglT2ZQ38KgBrV4+7fBgOxuZKGlDk5gFHrH6OxsWgrKeXYtolvs=
=wDgE
-----END PGP SIGNATURE-----

--5qWqAgTZuFQeFEgJ--
