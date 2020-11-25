Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9F412C49F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 22:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731057AbgKYVcE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 16:32:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:57610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729371AbgKYVcE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 16:32:04 -0500
Received: from localhost (p54b331e1.dip0.t-ipconnect.de [84.179.49.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D023206E0;
        Wed, 25 Nov 2020 21:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606339923;
        bh=mniWtMtAvRH6VagEPZskf5opXqZXSa/Gpz7mtgf/MUE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XivMvT88x+OBdHA+VRD3R026OiTP4trjz9O3+zOUyIiYWimN/2Xm9BRYSAc7yUe2n
         09PiLfO6YK3jlz8EgqzV/CSwcHAckBxW4FTWzIVLlgfABaKgDSDc7k9Q52oRxiZQFJ
         A9ib0uPqyz2s0GQTMF9N7BM30c2aGqCLxK6KWWlo=
Date:   Wed, 25 Nov 2020 22:32:00 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 3/3] mmc: renesas_sdhi: populate hook for longer busy_wait
Message-ID: <20201125213200.GA14913@ninjato>
References: <20201125213001.15003-1-wsa+renesas@sang-engineering.com>
 <20201125213001.15003-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <20201125213001.15003-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 10:30:01PM +0100, Wolfram Sang wrote:
> From: Wolfram Sang <wsa@kernel.org>

Eeks, this should have been:

=46rom: Wolfram Sang <wsa+renesas@sang-engineering.com>

Please let me know if I should resend.


--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl++zUwACgkQFA3kzBSg
KbZiVQ/+MJbFzqxIXQTLG/AtIflWqw5YnTKoq9yitEtRwIJqbrRqepzwNgBCnAKM
PYdUFVwOIEUOo6tNMPxNKcKZGhgnf5Ei4EUA+qU6pcnLCuBTqjpU5yHOgXNhKljp
tSqC0/NQ+ojXP5Z+536GamJWIsKj3IHHKVkzViakjuTJqhWPwbXsAX7pI5acFlYF
c/YNHC4heI44jbqte86iiMtUSDgS1aoM/5y1nw5BbWP1iG3F0aPfAnbPShZEKHAn
6saI8ikJXy08mdudGVLsLrlXfP7kSnJX1yQyPPbtFs4ayQBWhkG4UQSb/vhJYXWj
KO1C7yQxR5NIoutHk1GVDqLse54tW9hHzE7ymChUtYr9NVgtO9G+LSjvvFOlVIGK
gTtWMPiSTTaiRVNq++b6WUoYHuo9T1HJA+ZHvHtha3PMKvOFW5YnppbPoih+4xsc
W/ErxSgqlTJiZX28tGleE/UaAyi87zX1+Rgi56CIGa9RPFY1xWLZCwMFgWYn2cYN
mtsMkoDChObbgjBWkZr2jqU7DOe/8MFRjK/h/oov0HvyBZOWDtxDgXuzAV2T99A2
+JTCYpW7K9bHW43habh9cmTg0K0r+sWjG0OXOA69a50lKEubItipXvAbXuT+9dUt
RbkPDaalvGcLEWlGclp5Mxubrt9PLTxev7Ngbv77qyRHA1pNL3w=
=XMQL
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
