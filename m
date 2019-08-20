Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E834595C8E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 12:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729485AbfHTKsu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 06:48:50 -0400
Received: from sauhun.de ([88.99.104.3]:35146 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728842AbfHTKsu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 06:48:50 -0400
Received: from localhost (p54B333DC.dip0.t-ipconnect.de [84.179.51.220])
        by pokefinder.org (Postfix) with ESMTPSA id 85C512C3014;
        Tue, 20 Aug 2019 12:48:48 +0200 (CEST)
Date:   Tue, 20 Aug 2019 12:48:48 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: host: renesas_sdhi_sys_dmac: Remove all R-Car Gen3
 SoCs
Message-ID: <20190820104848.GC1007@ninjato>
References: <1566290590-2841-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0lnxQi9hkpPO77W3"
Content-Disposition: inline
In-Reply-To: <1566290590-2841-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--0lnxQi9hkpPO77W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2019 at 05:43:10PM +0900, Yoshihiro Shimoda wrote:
> All R-Car Gen3 SoCs with any ES version cannot use this DMAC actually.
> So, this patch removes the compatibles of R-Car Gen3 SoCs from
> renesas_sdhi_sys_dmac_of_match. Since the previous code has
> an empty whitelist to prevent probing of R-Car Gen3 SoCs,
> no behavior changes.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

No regressions on my Salvator-XS with a M3N SoC:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--0lnxQi9hkpPO77W3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1b0AsACgkQFA3kzBSg
KbavLRAAtTYxRrLWJ4R2VlhC0ozKhMYR0hKzOtMxUzo1jQtCCZgSkcs1ttAVq3nN
CikT5eFvrKYCplcHVU2Kdwa84zbmQ+HpbFa/pnTYQhL/PQOqW397D2luI0TgNrbr
gq5B03hgBCiOEF2RYxa4tnEyUL0BgytPo82+CGBhVVcguo4RDvy6FN1qEkdoSW5i
w7UMwRY5njR5ZOsDJpC11qaaUEWbkHKMjFy643ysHwRGVKzKsllCxIFusLLS4Ia3
IYROd34ouGQpTOgjtky0L9OevQjTZSY0J5SYyhFsaDlUmqHcQPNHyUidI+GblB/A
sQYFyX8rIhAIlDhkuxHAa7ZheSg7tSGQL0pjgmhClP+W8h/PWdZc6JJzrmZDupuF
YbrkGpCos9M7LULX/+IJRmumvgS95lVp8oVEEiH+861mhg7b7C9RvqxsB/WRXiZR
1HLe3wx3ytcoZ6t8FUqIsgUJ9rg0oLUhO5TE6H1xF29pzjjafyrluX3FnCXpyKc0
330TD78Xr0blxwdbn7o+MSEo9nkSkskXLRDSBtLN63xWIU5hpf9EJgAbommwHzKi
msUZsni1fFQV+XbZR9PzEU+lU7CLt/JxneI9xbBHHP0szUl4IJ5YhgK8djeGV+G6
98C0tyI30hFXkfiOFYK96kK17lkrrMFyZOXUhMSk+V94b1dhYGg=
=eZyF
-----END PGP SIGNATURE-----

--0lnxQi9hkpPO77W3--
