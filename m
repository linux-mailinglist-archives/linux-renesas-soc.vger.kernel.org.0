Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0538540579F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Sep 2021 15:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355568AbhIINis (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Sep 2021 09:38:48 -0400
Received: from www.zeus03.de ([194.117.254.33]:38718 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353547AbhIIM4d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Sep 2021 08:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=XqAtNsBZ4C4DiXhT9Zk6+YP3jU9K
        i13XAZDm4rf8Go0=; b=c/+UU55eCtaagTybWycgcVSuTsFl7N/ZsFJ05Aw9C/KZ
        oJ/+ur41e2w8+WVVstzqgWO2QMSs1qlW3SHtVAEHHnIczIsUBKA0ltihmJ++4N+e
        tNaXbnE0aGuHSFPe8Ao/wU1P303NKnUzBkxta8OA0N1yCgTYYC8Ox+N1qJVCMg0=
Received: (qmail 1570580 invoked from network); 9 Sep 2021 14:55:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2021 14:55:21 +0200
X-UD-Smtp-Session: l3s3148p1@Zf7Sgo/L5skgARa4Rc+IAenyySDM4eeF
Date:   Thu, 9 Sep 2021 14:55:18 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old
 SDHIs
Message-ID: <YToENjbbb2cJFJnF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210826082107.47299-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUXc0oSCXJ-5QmPJz0VkX1Aib+ZAv8K2LN_fT1+5mocqw@mail.gmail.com>
 <CAMuHMdUuqQe6cM-Zt1GWq6xgydv1po8FOOW9qWe+5hK=ZRqE+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Z/PAnSo1uqyldHPW"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUuqQe6cM-Zt1GWq6xgydv1po8FOOW9qWe+5hK=ZRqE+w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Z/PAnSo1uqyldHPW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> From my limited collection of logs of booting on these boards, ee100000.mmc on
>   - gose worked in v4.15, and is broken since at least v4.17,

Okay, so this is clearly not related to b4d86f37eacb. I don't have a
Gose but there might be one in a remote lab. I will test when time
permits.

>   - alt worked in v5.1-rc6, and is broken now.

So, this is also not related to b4d86f37eacb. I have an Alt board here
and will double check. IIRC it worked for me(tm).

> SD cards might have been changed in the meantime, though.

Hmm, that might make a difference.

Thanks for the report. Still, the patch Ulf applied is good to have.

Happy hacking,

   Wolfram


--Z/PAnSo1uqyldHPW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmE6BDIACgkQFA3kzBSg
KbY0Ig/9Hgok3GkkeW7zUzHztYu8Y/m7eYkuqlPDQ4rpMQBh31H1F9xOqM6P0a7s
oXFUWy4+eDZOyLjtlUozhV3lpcBnzIuEQkb0lS43hlnmX4PMjcrBexhPhxWPzNRq
tCtxiRf8uslqkFdaPe2fiF+ZHQ5khl4T6FYzS1yQbqh6AlU0U2NiGpm40WGd/X1D
rqcbFhA92RNuSlwB/D/az7V6JEvki+NmgkZxvEr/YRLJ3cHvp5IScOQuE+jR2WbD
/bdkMK0mlW10I9o/ZF1gCwgxrXo+1YdRqIvQv1HHhlt6ypVr5Fp3s6Zx7TSj4el2
qAswNntfQpVmUaJmnE3IMvSEy96Z6d5d8HJXm5vHNOsxFLEH2hASBM3MIh4ZIyut
j2nNbaPNaP6qROmleZtDtCAEi/X/6gog+e6KXWWAI49pvGATejS7tw97uwJwgdf4
50Bt7ZM7YG/Py5jvkvYU0ZNe9fwGCWMR7rhMXRcCdM5pMSfoe+B9VfzW/w32KTjv
toLZKctobu8YQJmcRcNk1DJ92Hsa3VIVtWdG9vU+3kzyaBO5HK1pKnAHa/juNNM1
IXRjy1bv8o6sfHstaLGo9RkFcgGMQ8ZRP/7AiSzvMllo0hIwpw8pShCBoYv0OJz1
ZgjszTelhACm9wIpVx5KtIurEYZvSyINd0Xx9CiDsIK9LGGfdl8=
=Ln7H
-----END PGP SIGNATURE-----

--Z/PAnSo1uqyldHPW--
