Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6230C303E01
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 14:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391769AbhAZNDi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 08:03:38 -0500
Received: from www.zeus03.de ([194.117.254.33]:56214 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392388AbhAZND2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 08:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=OXxuBB+uonFFfiiqu3sIMkGZ4ODC
        F6W949PQcK+5J/0=; b=j8e74OLV25WH52PTkrwGGcT7j59MWHDPOrdtzNXA+D9s
        kr6pIB2MOirRPQBsIASLVtPnGvOdmZ9Kj9l19EMp8odnV7Scr+WPjiMEKKOzMKFK
        +XSqBLYrJwVYBKC6JhR7x6sYhg3mmnndN+18+7OkST3B6qcOw1OUEVbKYKfI2sE=
Received: (qmail 3724474 invoked from network); 26 Jan 2021 14:02:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jan 2021 14:02:44 +0100
X-UD-Smtp-Session: l3s3148p1@2VQCRc25EOsgAwDPXw95ATgah4/slKgO
Date:   Tue, 26 Jan 2021 14:02:40 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm: smp: remove unused variable
Message-ID: <20210126130240.GA2413@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201228120147.59387-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWD-8YxdrTmaTW7YTOFj+8hHM5LvegnC274QOTOO_gXcg@mail.gmail.com>
 <20210126104155.GF1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <20210126104155.GF1551@shell.armlinux.org.uk>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Russell,

> Those who cause breakage really should be the ones to look at patches
> that fix their breakage.

Does it mean you want an explicit ack from Thomas or that it should go
via his tree?

> The way patches get applied is if they end up in my patch system... if
> they don't make it there, they don't get applied.

The patch itself is here:

https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9047/1

All the best,

   Wolfram


--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAQEuwACgkQFA3kzBSg
KbZAIBAAr63yxTapO/ktMY97kQJP0fLoFybC1wXuKNntVBxv+EKRJouOkJ0MSsM0
FJyFgwQUlL2a/zdza9kb/+9nrC9jYT2GMmbN4nGxZnu8VhwT4L4d/AOZy+0u03VG
ZQ0KRqjKpy08BtXgf9nC1nU21wGPyCs1gXVf0cHj9GupA0QN1jz1v+AZk1+s4JHe
vAIDnM8naaV/a3uSMBhfREnKkpBicIZ/kAhscutw3SV8dRW+y5N4UPpkLmnfOTEE
BJJOOgeb3a+bUV4ICoCz9P2F2Lmrn73g9pJDajaDlV0TzKn4DTb/mwes4Y/f4eaf
h2do84ZEPJellS8J+b5TsiKlACSMV9a4y7l1gK+HRDqmNIxqroVEo6Kq5cUFM3fg
gfB5w3s9fk/9Fvf1RcSbKxCQRYiEzRL1mZdgNLrxKn0fnyuMcyrP+ZygHFoicU+C
nl0Z9oOpQd72+CZyz7dYBcpr7h8D6NZBKCyrjf+MTX4wnmFLqJBN/6wy+dGCQSJ/
PZ8CBZKbtsruCw5+0DeZ+0Uwjhf8dC5EkVIjqDCtpY/hDl7ytB73Ilh2IaeX+2GT
HA8IsAZfFupWUJeMcS7oZg3k5N8YNAqeNxvpMcWYpEf0gq67dM+HEqJ8KdCpqWx7
np++lpuXpOM7GCq4+YQCKZpKQPuhxE531KXZRlXGZaHBYD8Nrq4=
=K4YT
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
