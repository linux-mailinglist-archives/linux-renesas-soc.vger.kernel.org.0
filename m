Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57845119C56
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2019 23:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfLJW2q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Dec 2019 17:28:46 -0500
Received: from sauhun.de ([88.99.104.3]:42872 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726062AbfLJW2q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Dec 2019 17:28:46 -0500
Received: from localhost (p54B330BE.dip0.t-ipconnect.de [84.179.48.190])
        by pokefinder.org (Postfix) with ESMTPSA id D30092C0616;
        Tue, 10 Dec 2019 23:28:44 +0100 (CET)
Date:   Tue, 10 Dec 2019 23:28:44 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [RFC PATCH 1/2] mmc: renesas_sdhi: Add manual correction
Message-ID: <20191210222844.GD8683@kunai>
References: <20191203203301.2202-1-wsa+renesas@sang-engineering.com>
 <20191203203301.2202-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUnC=PM0iM7NwoeVLb2v=r4g-uUU3h4dBn9-St75fLyAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUnC=PM0iM7NwoeVLb2v=r4g-uUU3h4dBn9-St75fLyAw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> BTW, why is tap_set unsigned long instead of unsigned int?

Because we use bitmap functions on it, and those have all unsigned long
as arguments.

> And perhaps it should be moved from host to priv?

That would be great, but other tap_* variables are still used in
tmio_mmc_core.c. We maybe can refactor all tap handling into
renesas_sdhi_core.c meanwhile, but this is a seperate issue.


--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3wHBwACgkQFA3kzBSg
KbbuKRAAqfD3i7udERBXmVc3CyprYC/uqLNmwwL9pFIQ+3FhIVEZSam41jBmp4xR
Bu+ae4mCq4g3MMG8YhLq4q8rlUEBYwQTzu6xVQUy1JevmLliCcOwg++O0vwvyAtH
u5CBp7nz8QkGrJzW+wwLI/4fXBm+RuxJMd+sOwi1Y7K0I0yCh4U3EADfoSLPVJSO
BZ3myw/tzx0aMLzOHnb/SOcp9z0MGL2iP0LuV0h90eMlX9tVpcG5qTEcI+4p3TLN
Qpe9Ido5ibp1bX3PNwNZRfPgrXuCWeXMbaVv+AqwyNul17R5RsObI3vBhas4vVAQ
3qeBSs2WrLxBQE1UUICzK+R4xyNkm8D+Pa8SouVzZYDAh7VhKfuBJKihzWP208uq
TVDFYdz8lO2KXwvffMuGXGaj057N6uUrr/NWkBPLNBjpbOnM8OkkCiJMoM4uIYLP
7z1S/fMGJq1ZIor4VlfJMoxQB/3yvv/omne4PGBL//PFVU4zM4UrIU4h9cFSAjiW
UKweT4ejPLZJvt5BRLTgAYh5emkzK6o6xCQ0tHd/UMZmASYlzH+YFOsV5LwLhf1d
oXvA54HgoTwYutGudvXN/7dGzRlg2vzudhvP3ZFthd70IZkhFI2Li8e2TcBTND5G
FBSYoqOlnxkVny6D7+VlA9iRi63JXB7/qFtvd3ksvjZlbjN7Img=
=2Qi1
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--
