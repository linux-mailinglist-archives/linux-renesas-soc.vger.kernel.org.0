Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87609C38CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 17:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfJAPUh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 11:20:37 -0400
Received: from sauhun.de ([88.99.104.3]:48926 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726079AbfJAPUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 11:20:37 -0400
Received: from localhost (p54B330B7.dip0.t-ipconnect.de [84.179.48.183])
        by pokefinder.org (Postfix) with ESMTPSA id 0D2192C001C;
        Tue,  1 Oct 2019 17:20:35 +0200 (CEST)
Date:   Tue, 1 Oct 2019 17:20:34 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PULL REQUEST] renesas/topic/sdhi-manual-calib for renesas
 drivers
Message-ID: <20191001152034.GA4377@kunai>
References: <20190628175144.GA1043@ninjato>
 <CAMuHMdWVsgdsd4=NBfgCt3CUNgQvmBa0T4E1DtW8YApN3XS_AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWVsgdsd4=NBfgCt3CUNgQvmBa0T4E1DtW8YApN3XS_AQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> I'm dropping this for today's release, as it contains a commit that has been
> reverted in mainline:

This is fine. The rest of the patches are on hold anyhow because of
Renesas internal SDHI investigations.

Thanks,

   Wolfram


--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2Tbr4ACgkQFA3kzBSg
KbZxVg/+KhHGxYiJ5zxrKjAEqR2EI+eRXAy64mqqoac0rsiSG3ZV+7q63XYgN3Zc
99jfgB5/mE28lp39/jEoxvKpROfnQBchbURaH9WeLv0s2tCVl8mhX92Gs48+hte3
ZZw0dbmlB1L62eHTlU6rCftSNhtzJF85X8XNjo8uFn1K7VK2w4RCH0EbFXqkpaB4
R2+5aTM6jscWRtqrxjqyXiiU1MqnUoWKWFvFXEO8kJwYeRPpfmM56dk4tmJcypsz
4o6XWDD1ww620pVW4WmvDVKKQa/FT2kkzqPqLs+pYkDMHFc75XiUa9PkneAGjDSC
MA0rxzZgcjG07ggBJ1tPSeKAoTQigejDhtp5VvZqPxPC3CZTDNeVIdeDI72ovWyW
7ChMT3F8XaYciQjWTDkrreaK0wYiZd2wb53l3J9D2Fg0nokXR1LyUtpzq75Rbb0C
uYqBtIrxK58wD/QXdhCdNpBhoIYhdAHSga5ED9dFkpyq60dvMxRhic+Ao7qo74T1
O3XkRIjC1kUV1HyuHNbMEfH4vcP5RceMOHcyNp5JVlYyAHxzqakl8dhS6gogSwr0
BLd/ttFNaYhXFCSJFXol+p4g8ecY92qqaqJlTd4wF+dtGGHVUL3cvMPPreFRb56k
/fh96vynSAMBf4CaCnTS1JdV1U0ouawRRMDfSidGJq9O3vW02Dc=
=SFVf
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
