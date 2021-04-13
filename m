Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D15B35D99A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Apr 2021 10:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240662AbhDMIHo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Apr 2021 04:07:44 -0400
Received: from www.zeus03.de ([194.117.254.33]:44128 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240470AbhDMIHk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Apr 2021 04:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=PRkAqqvq9gX2fgFvlOoCgI6udgLI
        BKM/mICyZyOut3g=; b=0fl0m2CmfnS8IYtybdYONw1vFF35E7/eeGlo+WSozx5l
        1SU9XBNJgK3+TkqzOd4fqspbWMo/aDQYP0qYagU0k8KnDi4QtVuEmdTXkvi5W/z2
        pyMrdLR4H0tzP9IgT/H/QEaDcX9BwiOj2M1TsZ3HkIeUMs8uZ+UyY3bX698XcMk=
Received: (qmail 871690 invoked from network); 13 Apr 2021 10:07:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Apr 2021 10:07:12 +0200
X-UD-Smtp-Session: l3s3148p1@+tLsHda/MLogARa4RdeBASWYxunz7zkl
Date:   Tue, 13 Apr 2021 10:07:08 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH RFC/RFT] mmc: tmio: always restore irq register
Message-ID: <20210413080708.GA1026@ninjato>
References: <20210407153126.37285-1-wsa+renesas@sang-engineering.com>
 <TY2PR01MB3692C98A87BA89D0E910807ED8739@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB3692C98A87BA89D0E910807ED8739@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shimoda-san,

> This code could not resolve my concern. This code still read
> CTL_IRQ_MASK at first. So, if the register value is incorrect
> (when "host->reset" didn't exist), the sdcard_irq_mask value
> will be not expected value.

Geez, I forgot (again) that SD_RESET will not reset the irq register :(
I will initialize the register and the cache variable in reset() and
will resend in a few minutes after the tests.

Thanks!

   Wolfram

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB1USgACgkQFA3kzBSg
KbYbLw/+LPdEMD8Ssu1iQ4hJE3V5BvTUAPVGs/x6OF6W3V4h2fzutv4AVULDOlds
DDjlszUfyZQLa0t0zJjCF95iqppbN/ECu2E4LRMUGBjwhGayJ3WiUlu9aPg9KBs5
kYDzGRQUyWNQ0bBNXjQmreSLYhwxHcvttVubD2/EODl5vX24dUQTgX8IGz/6cidp
QhsxbpU/ulgMPpPVAyA6BEdcerZnGzC0F8bhrOnAcu4bCi7lGS5GB2dPHqgLip5p
Mtmslst2w6kbrbuk4pxk2hGJeGqmZfRETM6TVCpUSF2LZdb/UmFQaLBAsfk2r3py
aQzY/B57+KwR4JdE3ydoSwLAHzNa/VOtdmu31fJ7HNuzOxwGyyocPbbu0pD3kHzI
qELAhGwfHzZF0k7gFQG119NuxZA5PV4CKOBtN6tg0AVKfXTnIYBhD/CtLV5LHSMm
Opv+Z+a0e2d31wIOGc8J0LpfWVYv6z4um16uZgNIiCOTukGf2K0jcMH+DU0eUo5c
VN2flzzmqHOgHJQV1NNSXDaDFuk3BpDrdWhKdCotbPHDoXNb51Dys8niTgggAsi/
80gKNnCDpfC84fQC55rLfYNJLcD4Fisp9sJi8gm4hrg4G7rceFuEWv8Wlg+GP8/E
MXLXBHsQuC86uiJs0hVh6zAqZMDEMoutsuGN+eAKYrkv+JVTkJo=
=6IoS
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
