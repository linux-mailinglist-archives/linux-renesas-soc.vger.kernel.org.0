Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5811D105121
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2019 12:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfKULK1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Nov 2019 06:10:27 -0500
Received: from sauhun.de ([88.99.104.3]:59166 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbfKULK1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 06:10:27 -0500
Received: from localhost (p54B33AAB.dip0.t-ipconnect.de [84.179.58.171])
        by pokefinder.org (Postfix) with ESMTPSA id 7FFCC2C044D;
        Thu, 21 Nov 2019 12:10:25 +0100 (CET)
Date:   Thu, 21 Nov 2019 12:10:25 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mmc: tmio: remove workaround for NON_REMOVABLE
Message-ID: <20191121111025.GB1184@ninjato>
References: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVYYveVeF4+16vi8zk+0yVZMMJnMvKbLms7CbQ6w00uVg@mail.gmail.com>
 <20191119204725.GA1454@kunai>
 <CAMuHMdV+W62MkSRuYZNT0ezOt_KkyStfoeZohu7m1pOP=4a0HQ@mail.gmail.com>
 <20191121085702.GA1184@ninjato>
 <CAMuHMdVHN_wVuqFn3UcbFWxGPLxc5TfbMBRAWpptdt9M36JRHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVHN_wVuqFn3UcbFWxGPLxc5TfbMBRAWpptdt9M36JRHQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> As I managed to bisect it, it was fairly reproducible for me. Just checkout
> commit 7a7dab237027939c ("mmc: tmio: remove workaround for NON_REMOVABLE"),
> or use renesas-drivers.

That didn't work for me until I used renesas_defconfig with
renesas-drivers. Obviously (by now) the issue depends on the kernel
config. I don't know what I changed so I couldn't trigger the bug
anymore. However, I know have the issue highly reproducible with
renesas_defconfig and renesas-drivers. Good!

> But as it looks to be timing-related, and E3 has different/less CPU cores,
> it may still be affected.

I'll check my Ebisu later, too. Couldn't get the kernel to run on the
first try. Probably PEBKAC.


--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3WcJ0ACgkQFA3kzBSg
KbbygRAAgXT6ufpMG7fnIRFDnp5EGHa7ylGjbjpsbb7RtI/+/tqp4qEss3rJekVR
nZqDDSroPT0WYTJ40M6m+hAn6ssw3R638nDG2JjWS7TGFatobHVgMEtzvdqUjW6h
j0iChPiKmHX26LHVamVBkJxO8r9XSv3ZuK7Lcq8B5Q8HmNjJ4iOUvRxc5ijkuj5d
rp9eES3pFSbOqyHgDMB9wwWcrjIYJBOHFEJA831ng1tF/CTj+/JlqbprAWIkyV2f
R0YpLb6vNfvLkgPdqcscffYWrUhyukC4fOsfbEuUuuWXHsBwKySzPuOj23rpC0uj
j4Ps+qzBr56E+KiqNk6zzXYFGNyOXDMivQkhwKM8uofXFSvmflSjEyHClZaxP8pH
JIvYivwEATW9P4l/umIs6M7zUW7XntDgobYmR0rYcchIs+r/F1X5Fq6ZMuPLBMoO
IhJxXRfvP6RVq+ClPuif1TxrVUTOok7ZFzM0ZpyC5/hKPLP+JAecAuezdIkS16wT
S9Vf61ahgfDsOx9suMlzqOqFfB1gKynD/2epRfGrpP47ZTlDStDAee7DdpLbYz1U
xXgk01o8ib9lGR3GKfVJfKjv7itaWe5b7uTTtZyGXpmFNfvWm5IfJfouFcKGo3Rs
XZYqoVM10/PfMXrHKXEOr35cpJVwqa8MqSubocjdy2dbyf8Q4SI=
=xNjm
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
