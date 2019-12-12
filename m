Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6C111D2B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2019 17:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729894AbfLLQtj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Dec 2019 11:49:39 -0500
Received: from foss.arm.com ([217.140.110.172]:53228 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729762AbfLLQtj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 11:49:39 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D760130E;
        Thu, 12 Dec 2019 08:49:38 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5777F3F6CF;
        Thu, 12 Dec 2019 08:49:38 -0800 (PST)
Date:   Thu, 12 Dec 2019 16:49:36 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Subject: Re: Regulator probe on demand (or circular dependencies)
Message-ID: <20191212164936.GI4310@sirena.org.uk>
References: <23236201-a387-7257-35a4-ee4ed2f6bfd0@ideasonboard.com>
 <20191209163755.GF5483@sirena.org.uk>
 <fb87c957-40e8-587e-5789-33b740f8326d@ideasonboard.com>
 <20191212155656.GE4310@sirena.org.uk>
 <CAMuHMdXwNPKfL5Xijtb2RFvf5MDEuiqUZ9DOdWdWxD=RRhScwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ev7mvGV+3JQuI2Eo"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXwNPKfL5Xijtb2RFvf5MDEuiqUZ9DOdWdWxD=RRhScwQ@mail.gmail.com>
X-Cookie: We have DIFFERENT amounts of HAIR --
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ev7mvGV+3JQuI2Eo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 12, 2019 at 05:18:43PM +0100, Geert Uytterhoeven wrote:
> On Thu, Dec 12, 2019 at 4:57 PM Mark Brown <broonie@kernel.org> wrote:

> > In theory someone could try to do some sort of sorting with the DT
> > graph, people keep talking about it but nobody's done anything that I'm
> > aware of.

> "of_devlink" has landed in v5.5-rc1, cfr. commit a3e1d1a7f5fcccaf ("of:
> property: Add functional dependency link from DT bindings").

> I gave it a try on some boards lately.  It improved the deferral situation on
> Koelsch, but made it worse on Salvator-XS.

Ah, nice.  It's at least a start on that, that's good.

--ev7mvGV+3JQuI2Eo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3yb6AACgkQJNaLcl1U
h9CLfwf+OAU/ea7UJ6vHvXERuvufBK30An3dBf8rNAW4VU0uM8CREyiUfVQEtdEL
bS5y/7f8wHfDkN6G7WS3+5MXAnPs4Vvtl2fjgEqWqGVTQeVTewokEfQrP2kozlpc
hEBftKAWvW+Aziiqqf5kNiZMO4nRdrHR2LWYCggB8h4DD6cJtjx/GGRzsnK7ZWu/
EwZi/l8b83GTE8zRrlkNgaTX/fAtEsRf4NqjOnxf4m2ZcFEnOW4QrXFwfqPencAR
IeVyO/04Md1gDul/D3ptMskjRhVvfRnKFMghZolfskYJqZZmQPdyT4hV0HzqSmS5
EqDDFpefLtIMsGz9yMRVlFJP0xkguw==
=H+lB
-----END PGP SIGNATURE-----

--ev7mvGV+3JQuI2Eo--
