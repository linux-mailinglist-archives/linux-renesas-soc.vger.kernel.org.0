Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C38D3AFE49
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 09:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhFVHtz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 03:49:55 -0400
Received: from www.zeus03.de ([194.117.254.33]:43942 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230481AbhFVHty (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 03:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=XmH2j7pggYs4YEXyqrjyv4sVnx8W
        2DZpqhAPPW+51rw=; b=QqYImV8Up/AEkuXQXkYPqjPx9nhuCG8DeduCMNlJ8Jo/
        FMnkwGZVmnUu67E30hLQNuRnq3hkQ5HKkHzkgwgscZ+NSJa39gaCEahsZx5mklq8
        tEONbExCEskUrHjIti+5+VkQ3xnOppG56g+Dthp430NSUjR9Yesa4C+5AE2lX+M=
Received: (qmail 2139775 invoked from network); 22 Jun 2021 09:47:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jun 2021 09:47:37 +0200
X-UD-Smtp-Session: l3s3148p1@RAXqAFbFsKkgARa4RYg6AcaF9vCOUtT0
Date:   Tue, 22 Jun 2021 09:47:36 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] mmc: renesas_sdhi: sys_dmac: abort DMA synced to avoid
 timeouts
Message-ID: <YNGVmDOzFzA9MMZU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210621070009.13655-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdULBPfd97xqDaFOTmj-B2pBA=wSKz3iep6ujx47j1zyPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SfZT8+tHQGZ/bghR"
Content-Disposition: inline
In-Reply-To: <CAMuHMdULBPfd97xqDaFOTmj-B2pBA=wSKz3iep6ujx47j1zyPg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--SfZT8+tHQGZ/bghR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


While the patch does not fix the timeout issue (also verified using an
Alt board), it does fix this follow-up issue here:

[  191.485194] ------------[ cut here ]------------
[  191.490296] WARNING: CPU: 0 PID: 698 at kernel/dma/debug.c:498 add_dma_entry+0x158/0x180
[  191.499397] DMA-API: exceeded 7 overlapping mappings of cacheline 0x0117cc3a

So, I think we want this patch nonetheless but I need to rephrase the
commit message.


--SfZT8+tHQGZ/bghR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDRlZQACgkQFA3kzBSg
Kba59BAAgINGXbyn81hRTvY6MmSfNQMwXGVB5AGcBxsKh4uzg3rAaGoYWyZAs0ug
H1QqL4SCvirD+rsepyEkEmwBzuQdK2c4g2rq2bby2lskjcTd4IK/xb+WSuCOi2/u
RelREXxiPoYylNZxHSfBUmrbWxyxRz53i10OlCtslAkjtPrVyyMnIYP6925u3N/3
IHYAXZIc9vmVi6uRIxHxxyJ1tdwhbYpamp/mQc+ajOKYGQDFuhKMLlO1mNpCkDL7
WymowyFDSR1FoJBCF7yZvwZ2DoqLpOROy7Fj0XyA7c30H7xleuWS0oJQGhSghZaI
OJf6Iy0aNxpfrCdtx6qB91oyBns13Ib0t/fHCUvrtIJ5RKdBTGqlZMwxqHkD+Bh2
sBjxXlVzgLsNl09veMP6fgwzr0yKdyss9XY+/f6SYQjP+0W9ahkztEdoKWi32dNy
1Epglb1imY6Myz8Ayx4BYKCKd5N3LrJNvkZOxItuzCp4i3XtmgFswxO1b/GSxrX2
RDnGR/DVsjUhvxQB+mXrhWdTMX/E6+gm7+nj12qv/F5AhClXYmli1V9yzeUCGyzj
gO+mKeNNjRVlstOdFpWYJFyKDf3vsGaE/h79G/YcV33+xJrpJ/k1JFQljHC26SaW
7RDmzGwx6Q2E6NHbmXmFcYNpL+Zn4DYhuO7OcHMI0cYa9qtgdM4=
=fdA/
-----END PGP SIGNATURE-----

--SfZT8+tHQGZ/bghR--
