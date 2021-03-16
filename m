Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B7E33D9F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 17:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236835AbhCPQ70 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 12:59:26 -0400
Received: from www.zeus03.de ([194.117.254.33]:34346 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236945AbhCPQ7O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 12:59:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=xnxLRviNEsqm+L6ZnN3FkL7WoprQ
        smCN698dwCFC6JE=; b=pB1DhcvSvPEMjUd5EePpf07+VnXV1BEgoDjUEZXUAI3R
        JbJkVRmRbSdjSOohUj2LkBvnrIs0YDu+0QW7+3EDK0AlJ5p83xQvwkR3aw+ppdwR
        O4ZaJ+jWEsONUVswejZaegqpP/xhcpRwDRptx/+otgCz8Pfvzq4XHz9iziy1XAk=
Received: (qmail 1856560 invoked from network); 16 Mar 2021 17:59:12 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Mar 2021 17:59:12 +0100
X-UD-Smtp-Session: l3s3148p1@xOq2SKq9UOAgAwDPXwSnAAL15/1zCkoV
Date:   Tue, 16 Mar 2021 17:59:05 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2 3/3] mmc: renesas_sdhi: do hard reset if possible
Message-ID: <20210316165758.GA1110@ninjato>
References: <20210315145938.58565-1-wsa+renesas@sang-engineering.com>
 <20210315145938.58565-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdUw8wWh3ybsFUopKGMw-Zbcqr9bJBEGHAerL-Y226A0=w@mail.gmail.com>
 <20210316125709.GE1031@ninjato>
 <CAMuHMdUm=h4MRfJUdZwBwfr2PxvB1Zk5PioBdq+9b_JjcR6U_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUm=h4MRfJUdZwBwfr2PxvB1Zk5PioBdq+9b_JjcR6U_g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Enabling RESET_CONTROLLER on SH increases kernel size by ca. 4 KiB.

Well, I read this as "I insist on ARCH_RENESAS" ;) Will resend later or
tomorrow.


--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBQ49kACgkQFA3kzBSg
KbamvRAAkYvxG8D4CeqaUEk7NFe7KDkv7NVbYxQuTCcFt+UZIJERZzuhaavAHdas
97VBaET7bhwaFYxeDACQ5OLAEAMdJeTLHOWVv0BKgrogxG40WQnYreG4GzLX68hN
EzycFTDkuG7FPefuAP77+TNqOaMP33VlQlnnKHpYwlBUjhdK2+A+tWN07yZ/rxgd
RAXbp1fv9YbD9qWbKXoOuIQung7b4exEqfPX4SKZs3D0aAp9fxi+zKnYiSdC7dO1
sn7htm9TUSkLGTzRzCzsmIpQp7wNGAmWB/JgFnwTnFugeEA5H2kjH9jcJcevYV0f
F3yqku3vM0Pf2wNLmbm5GuA4LZ1BsfKtBVPzpUWFe31UhlyqgZPmaPvfPjCyn7Fj
ARblHhmqU31uxv9QI8OoTsX7IKhGH6zgACITXdXSfnq9Dg4iek3hljFtY3Ku7dPm
c97C5awi7lKZTB+tMp3ms4nh7g3RhX+vVdXuaVrswLqwn/qj5xah6HPNhx1RFe3Y
IEdEkUS6j47RHBqiAQmYxAgP9EFNm8B5Up5IhcTKxgaQeWObQlOSI9SSw9rZXN12
QE5hGVs0D9ENlWvoOYlRiZ15zeYXUn/mKzodfgSOOkjD4DF8zrnW+IAJHqe2lARh
Wx5y62jiNQxnG/xhd/jbHL0/jnnvG/iHoWe4TSwoE0peoT63vVI=
=t3Ab
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
