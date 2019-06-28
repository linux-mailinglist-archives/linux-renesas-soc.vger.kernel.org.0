Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 375335A2C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2019 19:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbfF1RwB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jun 2019 13:52:01 -0400
Received: from sauhun.de ([88.99.104.3]:52960 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726408AbfF1RwB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jun 2019 13:52:01 -0400
Received: from localhost (p54B332FA.dip0.t-ipconnect.de [84.179.50.250])
        by pokefinder.org (Postfix) with ESMTPSA id C14152C35BF;
        Fri, 28 Jun 2019 19:51:59 +0200 (CEST)
Date:   Fri, 28 Jun 2019 19:51:56 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/sdhi-manual-calib for renesas drivers
Message-ID: <20190628175144.GA1043@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is a topic branch for renesas-drivers. It was developed against
mmc/next because there were some patches in there I needed. I know that
-next branches are not good for renesas-drivers, so rebased to v5.2-rc6
and cherry-picked what I needed. Further comments from the cover-letter:

===

The patches were developed against mmc/next. However, the above branch
is based on v5.2-rc6 with some cherry-picked patches from mmc/next, so
Geert can consume it easier for his renesas-drivers branch. There are
two more patches in that branch worth mentioning. A clk driver WIP patch
which I needed to get HS400 on my M3-N working at all. We are discussing
this patch internally right now and its upstreaming is a seperate issue.

Also, there is a debug patch on top. I can't test that the manual fixup
values improve HS400 because the actual issue only shows with
temperatures I can't (and don't want to) provide here in my office.
So, the debug patches add some trace_printk to demonstrate the functions
are called and the outputs match the intended state machine.

===

Please let me know if you can pull this branch or if adjustments are
needed.

Kind regards,

   Wolfram


The following changes since commit 4b972a01a7da614b4796475f933094751a295a2f:

  Linux 5.2-rc6 (2019-06-22 16:01:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-manual-calib

for you to fetch changes up to a0b577d9d1154c48757da9a09c18056946832bd7:

  DEBUG: mmc: renesas_sdhi: add debug to verify manual calibration fix (2019-06-28 13:44:45 +0200)

----------------------------------------------------------------
Niklas S??derlund (1):
      mmc: tmio: move runtime PM enablement to the driver implementations

Wolfram Sang (8):
      mmc: sdhi: improve quirk descriptions
      mmc: sdhi: remove unneeded initialization
      WIP: clk: renesas: rcar-gen3: enable SDnH clk for HS modes
      mmc: renesas_sdhi: keep sorting
      mmc: tmio: add generic hook to fixup after a completed request
      mmc: renesas_sdhi: make quirks info accessible outside probe()
      mmc: renesas_sdhi: support manual calibration
      DEBUG: mmc: renesas_sdhi: add debug to verify manual calibration fix

Yoshihiro Shimoda (1):
      mmc: tmio: Use dma_max_mapping_size() instead of a workaround

 drivers/clk/renesas/rcar-gen3-cpg.c  |   2 +-
 drivers/mmc/host/renesas_sdhi.h      |   9 +++
 drivers/mmc/host/renesas_sdhi_core.c | 151 ++++++++++++++++++++++++++++++++---
 drivers/mmc/host/tmio_mmc.c          |   5 ++
 drivers/mmc/host/tmio_mmc.h          |   1 +
 drivers/mmc/host/tmio_mmc_core.c     |  32 ++++----
 drivers/mmc/host/uniphier-sd.c       |   3 +
 7 files changed, 173 insertions(+), 30 deletions(-)

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0WU6wACgkQFA3kzBSg
KbbN2w//aZvJwl93nlIGjLt8ln/DHqBOx8sHQTgbvl9URoLZQeHmgKpxN43py+ao
Wwpen8x3yftM/Z1OUDYAnt5XLo7ZLu0T65SificaxEZPOmOrynVKznfFqgxJ3OCH
8zctWVS4xkUlpsmsY3lRa7386WFLVfyDOE5JG8ztxMzQ7wf4rTcanTsZNYURUAU3
q8eN/AXLIvOwBN9NuHVEFN0RU9DONT809OGFIj8FbsUtf112s3VtBhInHtPLgMJp
zGrvcqIXNvQPOpFCVpD9xQ5wox5OsC1gETaxgrXK/ttv7ojJt5Q3Ne2dlil6TKaY
flQgRX0k1YZ+zkoQ17+NAqti3Vi1RPh89SuAtXXU8Bp/pQ4S10Ha4OKVk+M9zm/6
M8prQ/IJrDmbndrJLO1cURrpP6l8Vb/8q8QAOVthEKhxnvCm9uSny9WZiF1p8WK7
rcXI6DGVFMssAMq5k9qqNxhQ3fA9a8/vb1XXEtQGQd3ZH9e2YTQ7Ligki11Yvl2x
0gQvmrOwJ83a3JCUaA01qjNwPBjnCckhadDrsFb8ly7qZVksUBG7FsZ4R7OLwbaS
a/GQYJ15QmomEjkQtfImr0MlYjIz36UENg6WbBbA3m8gl/a17GuUD4oUzl+D6Dze
3nlCVDzFvvy4l3I9/4h3PF7dqbgk3rmJoTo8ssCUjhvoIvykDec=
=S5Y7
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
