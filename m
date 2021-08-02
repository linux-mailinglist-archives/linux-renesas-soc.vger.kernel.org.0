Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519D03DD60A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Aug 2021 14:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbhHBMxg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Aug 2021 08:53:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:52776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232629AbhHBMxg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Aug 2021 08:53:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3607360E09;
        Mon,  2 Aug 2021 12:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627908806;
        bh=GcQHVX9MpJk/NoGMBhgpyQ7PsIRfzxzlKp8boQsYP2k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OL1LRp8xMFAcQj0YErtiY2IA1NYlDM+6/9120lS6JCHbZBHkUI2Pz7S4JcOaJzo0+
         oU1WN9zQWttKbOqzHa+dO3zlW0rW+rjIMAg3L5iOvTtbjeCFYUe5CnooZAiA6wDnr1
         PYQopvQYL9YwNjCkKFah5NWzUOUb16DvVdZCz3X6+xKn3bkMJ78YbvoXTMX/oQqb09
         mUJbOJZOeoCZis7WqVoPMMN95mppqvIOEkFqIFgmWn2dX4LZLSVH3Vx1R4I3ACL/xn
         SffsHoT1DEPoCfzEdr9Qc3jPr1UDSYun/MBijfdsf02hh/0KjviCa8RBQZEKEHTKQj
         xnswSG++ymqXw==
Date:   Mon, 2 Aug 2021 14:53:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
Subject: Re: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency limit
Message-ID: <YQfqwyL4TGoFHisp@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
References: <20210514155318.16812-1-uli+renesas@fpond.eu>
 <YQQah2Q8qmQPEl7F@ninjato>
 <TY2PR01MB3692486033934E1C007EBF6AD8EF9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="O1ZL0pJ7Xg0h4bFF"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB3692486033934E1C007EBF6AD8EF9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--O1ZL0pJ7Xg0h4bFF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Would you know how to measure the latencies?

I didn't measure the latencies itself. I just checked 'clk_summary' in
debugfs and verified that finally clocks are disabled by RPM. Because
only with this patch, clk_enable-cnt goes to zero when SD card is
removed or eMMC has no activity.


--O1ZL0pJ7Xg0h4bFF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEH6r8ACgkQFA3kzBSg
KbZGtQ//XEa/C64nefchG3vnSmJRK7vL5laBvuOumUqZNoChH0mAJAY3NZC4cnto
rIXi6opx7w0F+LplpaQnVXgkpjL3EqJNuyJW6gklNFnhWE27q5HNTsnmgvRwZhdi
7ofmS2pvi/CLdqzU0vhqlG10aWMMEnFVvYU5P8fOz7U9ikgGHHzQG062rUzDUyAr
hirmUm45bkHofOHIfdK2mIokIVckTb1AzUOqWh31zqP89HmintWXChb3OfvhB/dB
knpOrsU0xp/vNU9YYfG4B1RN3r30GfHy638ZWY2DsYeBtDAw0oEJeZwSn1fCutXy
tu8gCiKS8WRJdq4qWIM5Jm/wNAYmKYlvr2WYV7BdH6p0upQguazXAe11W6MXSL1u
Ugunf+VgxMpWzksuwKNYuZutTbd0NzAIqGtQEJJFP5xKJMfGQ+46U4VtYzTEJAZN
Kf2XGLmb7u+rKVcsnBcnlPBUK+BHKa7gu005y24O5iMg53Mmq65rls9VS+zhrZ6g
4XTIsOiB9/Af8w+cFt+bJUpLZlqglWI8ix4GP5h2vt+NEPjOVuLMikEWy3h9ViuO
QzNuyccVWMIfSIopP/6YX8DXUkRiISXyBaGkqc71z0nCWVVnlO3lksbudKWj1UzI
/AZqMOgcCUHLHLT0/wdC+M7zLR1Db2QJzsdMaOatXhvSUA8kn7Q=
=HOC4
-----END PGP SIGNATURE-----

--O1ZL0pJ7Xg0h4bFF--
