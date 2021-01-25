Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B79F1303445
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 06:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbhAZFVj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 00:21:39 -0500
Received: from www.zeus03.de ([194.117.254.33]:48310 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726367AbhAYJVe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 04:21:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=9sHmtqFRu8cQg+O8KYpb+upLmAfb
        cLQw8KL7nMTDl7g=; b=krv1HCEdTj5I9lNmyzMTT63IznbOvifEpEDU5vdcocIz
        LvYd9vI0KIfiVGQoI6cTccByXVePG95Wg3p9uJMIGSFzEnaBBsmWASVj8UGEs18I
        KnjNHujgsoWzGH2d9f4QXhcFJ6l1RsTwCUWzTIfoaJ17Oolqfp1TK2e1TOvsof8=
Received: (qmail 3263528 invoked from network); 25 Jan 2021 09:53:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2021 09:53:22 +0100
X-UD-Smtp-Session: l3s3148p1@cO+Tq7W5lNRUhs5S
Date:   Mon, 25 Jan 2021 09:53:22 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: falcon: Enable MMC
Message-ID: <20210125085322.GB895@ninjato>
References: <20210125075845.3864-1-wsa+renesas@sang-engineering.com>
 <20210125075845.3864-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdWDo5NGOi-r=N9iULmxR1NOOBjTFbHxzD99WL5HuUjRMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWDo5NGOi-r=N9iULmxR1NOOBjTFbHxzD99WL5HuUjRMA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thx, will queue in renesas-devel for v5.12.

Yay, glad it will also make it into 5.12! That will be a nice release
for V3U :)


--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAOhv4ACgkQFA3kzBSg
KbbG4Q/9Hqqmx9fGS5OfJTlBvPy1mozjxclrrQwp1aCB2HGyOTx+rSkA7IJIj0Fm
5k5v+lz9lfPX79aPnx13p/yaK3G0t32/1h9mASqOdrQL2YbdXsMLP973EowFgv/g
E7qz1iUw7MrTfeShRqEBCykqBDme2xokgVTaIs+yoqgWUydpAb2rket1AbYEvooj
QRNn4J8Bfklj9MxAyff6WDIbS4AjL9alX9hHvkUnl+O+ppSuD0GUEJt9D7Bcc7IS
jWUa2R5ZBoINc6pjzqJLhZZ7taEVU66+VJjLBo1/m6Y1ipdydp3SCx5YL1XeAjIE
3N6goMJTYuZzYYSWHhxI7IP9yOAl+aM2mWXs2w760VYDSUpZ7+S1fVWxAFchP0sL
MjosjEs/Kb5UNQ/2Fa4EszUrHBpvBuOnBg62DcZWoqklMXEtTMKyoUy5h0ZNBed5
NxHNdboacZQvMpKOHkfiHKfrTWATR14dZC1u9Zy3WvTCvLS8K5V6sMlt7JRg+oBI
ACaHM8ZeCV3msFWzAIu+sGBX3Kk59eBpUhQUHv1nxqjGZX4bPCccIbMsRUJFYXdL
a39ci0A11nA1J436TxOHx3MmJPL2Hy6f14Z80RzYMUJ+GwSeRoa8KluxSF2CxWlg
QhBu+yDLvHMWKv/DUXw3tfEWA9O9sGkYVgpuNati67VMdAjZCRA=
=fWjw
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
