Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8472B49B406
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 13:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379715AbiAYMcK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 07:32:10 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:40870 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1450738AbiAYMaJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 07:30:09 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CF92561045
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 12:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8284C340E8;
        Tue, 25 Jan 2022 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643113808;
        bh=5BLOhuBoRrNeslruIEypVa9te3tBP7XxsC0jTItMN3w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GvL8xgLNPrTAbw04Tkp+YVNCBIfcRp8JyzsJCdRJbeW9+KT13VTnNKHm2HiB9EpkZ
         3woIfni41B3uH/Q13dMnoC0+nYUR1XTHk4GhLXVxh488mlVi9/4h5YzI5NwOLNRO8/
         rUlXJUKsqLZ/6T5dnDJ54v1uN0j9CLwBrBdap8oBb/kApOknvK2sl9uhArRAOfwgys
         RiDa6Ro1ii0n2u5a3HIFA3JtjmLVF4jbS84aCqs351PrahlQLFQkjTFneKtSmC1taJ
         //xfUZgVrt3D/EahxdLUWK9fOKIn7S07Mt3ZH1vfYv7/OONsyiaVjurTGFcmkCYLvR
         p2KbtdgTDr+AQ==
Date:   Tue, 25 Jan 2022 12:30:03 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Pavel Machek <pavel@denx.de>,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 0/5] ASoC: sh: rz-ssi: Code cleanup and fixes
Message-ID: <Ye/tS4CQe0FIl6/k@sirena.org.uk>
References: <20220115012303.29651-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <164310602822.74844.12177586903406990983.b4-ty@kernel.org>
 <CA+V-a8vooHnZqTvuq+qq5u+JLrSirj0vOYnfWXVFB19UhhRdAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2F0+sj2L1ZKCLtaW"
Content-Disposition: inline
In-Reply-To: <CA+V-a8vooHnZqTvuq+qq5u+JLrSirj0vOYnfWXVFB19UhhRdAw@mail.gmail.com>
X-Cookie: The second best policy is dishonesty.
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--2F0+sj2L1ZKCLtaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 25, 2022 at 12:25:32PM +0000, Lad, Prabhakar wrote:

> It looks like you have applied v1 series instead of v2 to your next
> [0] (v2 series [1]). And your comment on your patch 1/5 of not being
> applying isn't true as you have already applied it ;).
> You haven't applied patch 5/5 (this applies cleanly to your -next)

Like I said, please resend.

--2F0+sj2L1ZKCLtaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHv7UoACgkQJNaLcl1U
h9DpVwf/XdODWbotRzIk5FV++sEeJDvNgHujTq/EIB0NGJQw0+CBH6Yy/CKQZgwF
bUNHVqHwVunGJdWaMm3yzB6qrO1TWdNOO8kck4F9cDrldM236ArQdR7YNNLV6Fuz
6YQHqwBmflrQwqn90Oh9gHOQIFQKU8DFL5TCuzpN4PehCsSFNZNMsmiul7J7wneh
fuKJsODM6bagge1MPJSgyYPwlJv3Uy4+ksWD+GMil9F3bK63TJPM6+JWwgFJ4S3J
P6gUQ8ZSb0M8uZDnCPq+qJdclgELJfgBJtNQH9JzaItHJrASaI/bB29tpXxMynNw
OEf/WowS9ETJlmyQpxoclasG0/t6XA==
=1Wh2
-----END PGP SIGNATURE-----

--2F0+sj2L1ZKCLtaW--
