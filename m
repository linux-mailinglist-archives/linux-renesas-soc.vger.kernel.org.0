Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1CE032ECED
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 15:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbhCEOQR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 09:16:17 -0500
Received: from www.zeus03.de ([194.117.254.33]:34612 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231151AbhCEOPp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 09:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=l+NCnkmBW6GUHne74p++MuxOz+5D
        xZBxL3e3nPiwtms=; b=rIKVyKH3Bq62aYGC2FdhEUwQ4/mIxTcIR0dSKePya7MM
        NXGp3jgLNTpfMu79KThaCPWTghhPrjrC8I/Ek7ZCFyzNeYRditt1x9zzneTF0r90
        Fd+osSd5CvVpfVS7eCYPZiZGqkbzg6XtmoEBRhpAAAlPd6pbC/Bx82I7Rq2oNWQ=
Received: (qmail 2247248 invoked from network); 5 Mar 2021 15:15:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2021 15:15:43 +0100
X-UD-Smtp-Session: l3s3148p1@EPcxuMq8VplN91Vm
Date:   Fri, 5 Mar 2021 15:15:43 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: dts: renesas: falcon: Add I2C EEPROMs and
 sub-boards
Message-ID: <20210305141543.GB1312@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20210304153257.4059277-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Content-Disposition: inline
In-Reply-To: <20210304153257.4059277-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 04, 2021 at 04:32:54PM +0100, Geert Uytterhoeven wrote:
> 	Hi all,
>=20
> This patch series adds the device nodes for all I2C EEPROMs in the
> Falcon board stack.  As some EEPROMs are located on sub-boards,
> it also introduces individual .dtsi files for these sub-boards.
> Note that (for now) these sub-boards don't have compatible values or
> model strings, as I think this needs more discussion.
>=20
> This has been tested on the Falcon boards in Magnus' and Kieran's farms.
> The EEPROM on the CPU board in Magnus' farm contains some data.
> All other EEPROMs are present, but in pristine state (all ones).
>=20
> Changes compared to v1:
>   - Move EEPROMs in sub-boards to separate .dtsi files and patches.
>=20

Checked the datasheets and tested, too, so:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

One minor question is: why do the labels in patches 2+3 have the "-id"
suffix and patch 1 does not? Don't we want consistency here?


--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBCPQ8ACgkQFA3kzBSg
KbbZiw/7B5Oc+BXTdoAgF3/MDzjhNCKKHa6IUQF9j8fnTep2l5tL1t33xUN9GMxw
I0nOXQ1WJ96STgAOArStQhUH/0PdhQ/AGpOSD7Iz7xz8giGePfRkRUR3oPjRJOym
P8kxiI9qGkWP06D2JFfngoRaGmtGezD4Xa35PjiREVOCdYq74/f4M2Dif/TwpgvT
4jFf6+3pF+3Tn1ciNzXRXW2OzvG+hI4wIH3kyykMYdFor3rNbxo0K/BL7b90uApU
XTpXQK5MnFU2TM88O9okGVcOoE1bDUo+tvGgQt+ZrvKe2AKv9Uo9DZI1cY8/2AvY
F6sdeLqR3GOUybRX5+g5U1htIlUqS3NBpqOYYQ5Tx8vUgqRCJGl9jt1UaRFKVhYG
hCOYMknp8kvoZNhGOH2ciNg2r4lE10/tIx55WpIFOGXAOIvKJF+jsm7aKqGju7ac
pF0dYThf5AjU9wV+1b+OyyjqTLg1CdAVClwFrAmwfIulL8yfTmN7/ANblYKHztNu
Xk7NGK0ibwhNLjJaxsY1VSNANj+lHIo1eGkU5OQrF0exFXl5e+JiKSYbM/z9G0Rx
GDLc+Dl1Nh3SUh4JGmgfGcZ5dhk/p5ir8tSB/GejiKwO+7cegIzIBGoUs03VXYg8
mIDsmNr9+mkkv2f868kRJwLkHdWkeLWYOhODa2FmxVO7N6rkd+E=
=EK0H
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
