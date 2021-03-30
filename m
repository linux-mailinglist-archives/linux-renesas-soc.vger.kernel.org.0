Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C756134E48D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Mar 2021 11:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbhC3Jfp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Mar 2021 05:35:45 -0400
Received: from www.zeus03.de ([194.117.254.33]:57808 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231640AbhC3Jf3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Mar 2021 05:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:mime-version:content-type; s=
        k1; bh=IV7Ws7dPVcQ5J4xI5nJoTp3eLthM5QLiWll0OxoYMRQ=; b=pNEPmPzXs
        YHUIE7c1GobvnFgBEMbOqj9s3uikOH4rVVYdNNFtmHy2/6tG5MohNdIRVcu8bAyT
        lzTaFH53ZsXhPB6+du5vUFSBVozfXz+Pls5X9/U+VaCfeZ1zL4xhZ1XYNrftHCp1
        xDWf/qLU/6n7Ynr5cPiWjsM8RAOanCQs8o=
Received: (qmail 156313 invoked from network); 30 Mar 2021 11:35:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2021 11:35:28 +0200
X-UD-Smtp-Session: l3s3148p1@vB35t72+9NMgARa4RV5TAXqFgB02ZUaY
Date:   Tue, 30 Mar 2021 11:35:28 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PULL REQUEST] renesas/logic-analyzer-for-geert for renesas drivers
Message-ID: <20210330093528.GA13903@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is the GPIO logic analyzer for renesas-drivers. I left out the DTS
patch for Salvator-XS because it makes no sense in your repo.

Please pull.

Kind regards,

   Wolfram


The following changes since commit a5e13c6df0e41702d2b2c77c8ad41677ebb065b3:

  Linux 5.12-rc5 (2021-03-28 15:48:16 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/logic-analyzer-for-geert

for you to fetch changes up to 1c8e77fc124170235027221a6ade3989134f06d7:

  misc: add simple logic analyzer using polling (2021-03-30 11:31:31 +0200)

----------------------------------------------------------------
Wolfram Sang (1):
      misc: add simple logic analyzer using polling

 Documentation/dev-tools/gpio-logic-analyzer.rst    |  63 ++++
 Documentation/dev-tools/index.rst                  |   1 +
 .../bindings/misc/gpio-logic-analyzer.yaml         |  40 +++
 drivers/misc/Kconfig                               |  12 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/gpio-logic-analyzer.c                 | 355 +++++++++++++++++++++
 tools/debugging/gpio-logic-analyzer                | 156 +++++++++
 7 files changed, 628 insertions(+)
 create mode 100644 Documentation/dev-tools/gpio-logic-analyzer.rst
 create mode 100644 Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml
 create mode 100644 drivers/misc/gpio-logic-analyzer.c
 create mode 100755 tools/debugging/gpio-logic-analyzer

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBi8NsACgkQFA3kzBSg
KbZcmA/6AjKs6NpqXC8BcMY/Bf+Vzq9j8mpXN0fv+qnhQjGwzkvrfCuWfbPzrdjR
qXH8XJO0Eu1edvzfXwIxcT3QbjcTWxpefdxNyGC0DKDNIgorqwI9eeRAHT9qzzpu
CNepNIcCqGCvUhXgroKuma8Sp7TCAAN1WzIY4K/XE4y7JKIy/qsM2JdEHBPZDhVc
VE+CSqojholaqjOibUxNFmtn6MfX+S6zugbYto2qsIxGUd4BQs04BxNaGM7eV2PF
D+p79JhePShsrqJhAWnjRvPaRcq+Tw4UJpSEIcYQoTZa6KXgDj+sdn35e9ZgS7G4
faUyayFHIfHZs5TAI15ZFkiCmtgi4mVzSVUPXXK60O19fl8XNzM34WIxWjmjWZqN
zouoHnG5wN4evdgB1wmJDRW2LqCwE4+yPs1ThOwBvTWBPPpcZoXFSM5LNXmz4YJ7
cqQD4E9oRs0x91m3m/txnmtTpkMPgdxeFewZHlpBdRHlwDeqZGqLOCp7KfwafCxG
t5lL8Joe72z1X2Zy+g87O224zw+ET5YDbEdkkgXZrbs6Ipco62NI9c7T0KtIQlnO
YXGbbQwXJr2Y+J4L4peEdvcQyd9C7VfqYDcB3MCXY/Di0AiMmxdD1bNCVJxSVLeG
5yUTB28fD8+1e8YlJw+NKnJ6CE5frQRNa1hZ7exh7YFFkria7tY=
=2wnb
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
