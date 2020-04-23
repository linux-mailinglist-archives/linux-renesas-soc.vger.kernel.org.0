Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C096C1B5BBB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2020 14:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgDWMsq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Apr 2020 08:48:46 -0400
Received: from sauhun.de ([88.99.104.3]:34088 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726444AbgDWMsq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Apr 2020 08:48:46 -0400
Received: from localhost (p5486CE55.dip0.t-ipconnect.de [84.134.206.85])
        by pokefinder.org (Postfix) with ESMTPSA id 1FB8B2C1F65;
        Thu, 23 Apr 2020 14:48:45 +0200 (CEST)
Date:   Thu, 23 Apr 2020 14:48:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2 1/2] mmc: renesas_sdhi: handle M3-N ES1.2 and 1.3
 revisions
Message-ID: <20200423124844.GC1130@ninjato>
References: <20200423122448.8099-1-wsa+renesas@sang-engineering.com>
 <20200423122448.8099-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdW0OuHy4ikQz3oY+koqLskXtcXJkUVLZYqsW+niT1pLDQ@mail.gmail.com>
 <20200423123955.GB1130@ninjato>
 <CAMuHMdUC2w_7sBHUDQ5CHioqNbcc8CgedPzEJF2QgFo6dLF7vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUC2w_7sBHUDQ5CHioqNbcc8CgedPzEJF2QgFo6dLF7vw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> OK, that changes my point of view, as M3-W is also at ES3.0 (aka M3-W+ ;-),
> so using "ES1.*" is fine.

I agree. So, only $subject is wrong. Will fix!


--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6hjqwACgkQFA3kzBSg
Kbbdtw//VvezGQYcz17kOtposqLtC2eOlLkj5Xjo66zW+bM/T5qnjoJsqQBwv/1G
fnau2PhalnpJ9VL0NyOg5XwgoNyrO6MVBj9ErkVhkbNt0sbFMEwxb/XtvrGhV99z
iZWOeRyEtQ+RxLlWdtcUMyB0mxvD+6/m1bj/PXes/p/569fF0ekj4IbgGEns+agD
86J3KYwGZp/SiEDoTpF3HjRaza+BkC+RKh6JJDXAWgPeg+RXkSySJnjY1pq1V8v5
blsLhwcssvSrbkA1q4oS+BPoKy6UrF5roEXOhuOr/MzzhvYt/ZhBSbh+P459cPjH
yuJ4CQd1+ZabZZRf/nzoR6+cF3+/fu6at6DYkBpIDraKOZhJSTjpNooCf2EvuFpe
Ky9c4kLyh9wl+ylmsqvRk0Gs6V9GNnnl5vAAQb1hhVYiY2YaZ7yyCLDqQm8TX8GB
rK8xMiPaP+DG9kSLHwKN4CZdEwNMIok0JywypzwFc6En0/ZFUUDQR9ZdbrjJ6dEQ
YEqgNNAMgvONBPA18+2YHrmJ+/w+ZkYbrJwwYuVF5OY96gdmfYzhWavgEMCpylm6
YphDTDACH0TryQMiGe4n69SXf4TlxJr1ix1/Qe1TGR3eDuI9lFvFxBNON6Rb4Sej
E1slqD///EELrt2Jv88YuVTcs1NZkFoK7+UbsayNUBhTO+5ZXdo=
=3yGX
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--
