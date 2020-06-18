Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9751FEB0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2020 07:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgFRFjr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jun 2020 01:39:47 -0400
Received: from www.zeus03.de ([194.117.254.33]:34434 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725953AbgFRFjr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jun 2020 01:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=iC83Ym0C/HcbMWo3LBEpygjGUIdB
        H1z0NWt2TnOqP/s=; b=3ed8SRquexMZOZiguMZtrKLFd2qQ4W6z1oZR7ho7MbBU
        0REIXH999WFxMCYDqC2X0zf7+itqLl/Uh9VwqdLP3737aSPMkYUI2iDa+iyk98pO
        1+SSNwenlHKU0Han7+1NRiyetm9eWZZ5saFDJoImYZ92zBavzuxgp1RlNprOlyk=
Received: (qmail 2040142 invoked from network); 18 Jun 2020 07:39:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jun 2020 07:39:44 +0200
X-UD-Smtp-Session: l3s3148p1@wVcyNFWojswgAwDPXwquAEh09UUtPuGD
Date:   Thu, 18 Jun 2020 07:39:44 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 0/2] mmc: renesas_sdhi: support manual calibration
Message-ID: <20200618053944.GA1121@ninjato>
References: <20200605101222.10783-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFrZHYeUa9ryen_F0uyrvvEDr_W+Q5xyOKt_YwyiaM+6cQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <CAPDyKFrZHYeUa9ryen_F0uyrvvEDr_W+Q5xyOKt_YwyiaM+6cQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=09
> I tried applying this, but got some conflict. I guess you have based
> this on some of the other series that's in the pipe. Maybe you can
> give me some advice about the order or how to apply things?

Sorry, this depends on the stalled SCC patchset and I need to send a
second version of that (hopefully next week). Should have mentioned it
here, mea culpa! So, this needs to wait a little.


--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7q/hwACgkQFA3kzBSg
KbZ/Iw/+NBjnWSJurj0Qbr0KXH3/l3uIKDXIwiV0SBvDuTZNCiQx9wmiQBea6zux
CcpBUCTagJPDTlUebxe67QWibEwToFuU4IGKhuw4I+qqmNBiKKl1AH5Mf+l7RFZ6
tWnn1Um2IPw9NsoHuN1+Qe3UTbbODVM58G9jVqN4XvPdCpgvFUXb7Qsf5055DFSD
iXgE5y6bGIjfucjIU4fXnHtYGCl4P4sYLRUuB8kX6nB8LhOo6Q9rf6jbXGHAKP//
NR1OtQavJNAtpnF7k8BCvRZyLJDVnpu2aP4RJSSDJF4WDgr4HbNvSFPhm5J3cpT4
t5rsLyThdvaxwrpL0hQL4TJopSy3kFb93SP4w6QyDLs3JVHcKdaSiO2iMdnv1ZKq
3DgIPNhTJ91D3qVtQOOaVvHFtZvJhOYzNK8lMwS+L4RhWnKzef+wsyD2cUJpizLN
B8nrWLnzmhUsDJhG2xzx5ELTzvIcOS/Lg8x8YKeA7wL2FHSz4HdONL89V+pu+4GQ
ApaWJO8zYIGD6cPlpDZ4qqrXdLCnWWAHs12tJk/Iru47FenZBhfXhUKtUSWYTZO5
+PLup9UC+IwV4ALTtE7p1Qob30zOJJzPUBTt1ld/g+yy5xVdyGplQXSCU4X8+tMx
GuGwl1c1tXEusE4044wBBIeNpPSb9Fzu2T6CtqXwMgg7Xm0UOnM=
=W5kf
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
