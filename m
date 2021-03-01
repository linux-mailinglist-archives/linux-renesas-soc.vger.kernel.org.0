Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE8B327D69
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Mar 2021 12:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233730AbhCALiu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Mar 2021 06:38:50 -0500
Received: from www.zeus03.de ([194.117.254.33]:37614 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232547AbhCALiq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 06:38:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=s6Q7T1e7ysHHOjp1MOlbrx5s1BHH
        9Gomdgz0z0sZa/Y=; b=esA2MGJBCaS8WdpovIDXS8o6AOt9MRVcrhZcAk9VM3pL
        ewEp17MwvBh3iM0lv+sfch4SJfuR34rnKJEJVaZyBDNFiClUSKvO7kqgQRWQAGZM
        QhzHvGNTyuOoaLEh8reMwO9iQbc7Xi1545VlBXfjv/kiaX6Kk7Zd0IP731W+Dgo=
Received: (qmail 592598 invoked from network); 1 Mar 2021 12:38:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Mar 2021 12:38:03 +0100
X-UD-Smtp-Session: l3s3148p1@7dPKDHi8Lt0gARa4RQigAZ6WjUy4NkAK
Date:   Mon, 1 Mar 2021 12:37:59 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] dts: remove c6x dts hard link file
Message-ID: <20210301113759.GA1117@ninjato>
References: <20210301061924.103145-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXKF6mn7PC+JX9n2RMafcma6xPqwpTf+7auxrm5hpDaRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXKF6mn7PC+JX9n2RMafcma6xPqwpTf+7auxrm5hpDaRA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> With s/hard/symbolic/ in the oneline-summary:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Mea culpa. I copied $subject from the last patch doing a similar thing.
Will resend.


--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmA80hMACgkQFA3kzBSg
KbbROg/6AraSeuh2yURa5kcFFYdzcGPboLDhDwazXxwU14P1EGJIrQVwK2NDGoYt
xIQYmbLA8SP7AXcnmf5eWnERXbwUFrfWwEakVk0HepheT16Z3IF3PezxCLPyNxos
d81QEhpwFH2K2+U95ysC3ZNgdLPDUR+E4lT8xwEHe/guO1PONdZOH2vvKvNn988s
9NWX+87hJlB8nVVZERtYfC3IMOQBBrmou1LxpHRjlmBCQrIZdTEj5rnSFqio8tN1
Uocxmj9r2tObBC7Eh4y/jTbZgENOuELXykHLhIyX1xH8JuEcHd1yEZANRf5LpUPA
gWQAPEKBRwcXE3X0t3+gohCPtU5PBW/I6MJ4LhTe1BiWImy0w5lKes1E8u4Pabn4
B8rrtUxyj33W9kdtvSiOuTxZK+hDbMA9/sTwaJM96QU0bPYfsNQ82wCmcgzwAaSa
BLTSTNtdRMmXH1WK3tW5DZghW9p5bZJ+BAx/s8W0Drtt6V0U1+W/g7uekUj1+7YF
bgEhuDiDzuVxsEPyG59WLQZyBMfNg5H2QxeyFJ7Su7yfRrjSSRrjHsDqQZB33u0f
mdBttpd2pX2oox43uKjunDXuWdHYBIT6A6OhwxjCW976gddzfdqfIv1ebj/pqqpU
+NqkHHKMj2fQnB9VQOpwE30slGI10SLmUB+RDl5jDCQWIqfUTz4=
=usCV
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
