Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48762158F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 16:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729272AbgGFOAL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 10:00:11 -0400
Received: from www.zeus03.de ([194.117.254.33]:49666 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728961AbgGFOAL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 10:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=F8sgZ83kOxVB0Cfmp14WdTt3DZ1I
        s0B4KV0bxn64gps=; b=B3Fw72KkTbNaqMej50LS7FJtAqvpfnJlzFO+jhJRbdrp
        a8TzvItCildyW/B5GSg3d1EtefdkP6X/IEevIWYTtNAhg2t67g3j8xfi9hWo+Utj
        Phk6Mn5VIIIXu9snJKUoAw6NkNd/kl0JOdaf/vI2nVYmzQ2J3zosSR2ULb3FSmU=
Received: (qmail 2117203 invoked from network); 6 Jul 2020 16:00:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2020 16:00:09 +0200
X-UD-Smtp-Session: l3s3148p1@l3TuSsapFoggAwDPXwSPAD3C42NrtmEM
Date:   Mon, 6 Jul 2020 16:00:08 +0200
From:   "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/3] mmc: tmio and renesas_sdhi_internal_dmac: fix dma
 unmapping
Message-ID: <20200706140008.GD1046@ninjato>
References: <1590044466-28372-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB36921D805C79B829563698D6D8B70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200602125131.GA1318@ninjato>
 <TY2PR01MB36926A830866FEA2C49735E0D8890@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAPDyKFpzZG-LFbCDZYZx7J9sH536dcyHvoatCD4F-AvzM1kaZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u65IjBhB3TIa72Vp"
Content-Disposition: inline
In-Reply-To: <CAPDyKFpzZG-LFbCDZYZx7J9sH536dcyHvoatCD4F-AvzM1kaZw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Just wanted to check if this is ready to go or more tests are needed?

=46rom my tests, this patch series fixes the issue. I'd just like to avoid
the extra callback. However, my tries to do that failed so far. And now
I'll be away for two weeks.

Dunno, maybe we merge the series and if I come up with something else
that works, we can add it incrementally?


--u65IjBhB3TIa72Vp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8DLmQACgkQFA3kzBSg
Kbbr4g//Su+yBQs/aWjB5AgZDz17kiqtJYGlnvgwt1U8mUO+dRemvEWV+DW7U0Hh
krQpNmPxfyVJc6vynvWOl/rOc4BIiPo2sgHAJz+jH9FUypCPisJywMHLlNyx2qb7
nZe/dQwDAYrhh3c6dn8iBJpBDNHGp++5VsCgTaQ4tuZEuwV+JHk1b9Ws1agklj58
0Ru7gIq0zNnJX1mnz5uLy3tdYcdH6AtsjZFWiO70uRS2fohCguZp8vAi8VTiTBfN
RLR6BKvSjt1ms7rstqcWwJAo9ElEsTwfEq01OSebckLfq/KDU/DmQtGqSZhehA3u
MvQIE7Sw4reG2B9ubfKRutjpz0/VRQAeZvk+boRKZaWocUhcIpDUmEsr0VjdPPuO
3HxqpgDBT55LBz5l2pGFH3aDCMlM30CzXMrN1nOUruIWTbkk01spO+CruSmwszEF
M1Q4ua0emyLyvTXwN+1W4rEx0DH71uA8n65ZoH1M46df05GCVglMjJxY8oD2yMLA
5O4u+zdIl85tJnvlq6pVC2cHe/jPc74groKjYL1+IJy3OsbTpE3VreKEsTVEOgwk
ktosueyozMd0teZgW6K4w7ELMUdfjcSy9IZRrLOW9UaCSrzUS4OKQqEa6PiJYPFr
el67alb1/mM/K/PYIHSr6Z8z6hrFhvK2oyE5swQXDFU5FmHrt9k=
=madU
-----END PGP SIGNATURE-----

--u65IjBhB3TIa72Vp--
