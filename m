Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22E8D4689D1
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Dec 2021 08:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbhLEHUU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 5 Dec 2021 02:20:20 -0500
Received: from www.zeus03.de ([194.117.254.33]:45882 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232047AbhLEHUU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Dec 2021 02:20:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=HtsW4E+/ajnnVW4bbcq/TTkm7C7V
        pYt4J63kkT4Uhqo=; b=OPlFCNfR9tcFGv9+G+yOL0PAe7bIXGZdrhP/B6+fBAQn
        kfpsXWKRCzP4V9Yy79anVtSoI7QTnxWL5qc51trB/bOZDvz4Mj1Klih4pAViH2WK
        KyXPBrEP9bFaMYU9YO77sQhRbdP9IjDHM/PsYBsmUEzHO/fdm9wBqs9KmvY8irg=
Received: (qmail 1396915 invoked from network); 5 Dec 2021 08:16:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Dec 2021 08:16:51 +0100
X-UD-Smtp-Session: l3s3148p1@estp7GDSJt4gAwDPXzGeAHQi3f7V+bw6
Date:   Sun, 5 Dec 2021 08:16:48 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Magnus Damm <damm@opensource.se>, linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        jirislaby@kernel.org
Subject: Re: [PATCH] serial: sh-sci: Use dev_dbg() for frame and parity errors
Message-ID: <YaxnYDO0IS1uAm6Q@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm@opensource.se>, linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        jirislaby@kernel.org
References: <163862557847.23421.1243156045279776895.sendpatchset@octo>
 <YauJlvC7CbCxAhU2@kunai>
 <CANqRtoQ1et2TRHc9GhWEn3D-Bf8U6wWZ+qWbHPRTe30qTsmvDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lETtYqfypwtFSWLn"
Content-Disposition: inline
In-Reply-To: <CANqRtoQ1et2TRHc9GhWEn3D-Bf8U6wWZ+qWbHPRTe30qTsmvDA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--lETtYqfypwtFSWLn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Magnus,

> Sure, overrun and break also have counters so I'll prepare a patch
> removing all four if you don't mind.

Good idea!

All the best,

   Wolfram


--lETtYqfypwtFSWLn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGsZ1wACgkQFA3kzBSg
KbaG2xAAh8oQd9d10wf8aS+LpAC/2CU5FEbGqVgi/A8c11XRifqDgnLFt8XmuIUU
vY+LHsV+N26XRJUKWxCFI5hhK5y7H1RAo5tqlyZlBL3JPdj6NDpY2J4QEwUBmvyf
QGplD+dN3KyVqHYvCZC6iKaOOMjrBFOEcIzCbocrQDcsHbD0mfEIusNrd4hdvkft
w2/ZfzmC8eGQCNglCcd2TDo4cp2UTokIWDQdV0WfTx4UWYnLHXM1VNNreAsqqQ8z
PWvZu5ZmnN8tihG9i/D+1ZjiuFb4ZSO1TTbXjQ6ex1WIs4eYl8LIY6mdy/Em6IZP
4/uzSq/zTAP333DdVOLzXENs+HReFCUs7rasG+GlNiNveCZ8A9OVyD0LlT3x4mzZ
IpbV60oC7HOjjmtYAAqvlMacjDkwcJ/M003jSzi4Y9+ld5Ox0hQ1xcm/UqzkMi3v
iHzFbpTuqQfXR132BmbF6hDgeQMk8EyufasNHLtc6bO2t80PV3EADTxVR+gpwEAt
pKJOPX/1k8ctVAyk7DGD9nB+U0gTQ0B6VUG4QktNWWbtnwnITJFLSjmWWk4prMVl
MFiuyZYWmAuVFGKr39q2f4i57tEJntMCxWMUD8iT3oB+0SOYwOtelPeYwoWd/nBT
qhUpbeZqWaZ7B+ZIXxBxW+c25VY3w7WfanlN5H1MryESyM0sFXI=
=5Ddt
-----END PGP SIGNATURE-----

--lETtYqfypwtFSWLn--
