Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5544739A4AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jun 2021 17:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhFCPhf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 11:37:35 -0400
Received: from www.zeus03.de ([194.117.254.33]:50152 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229769AbhFCPhe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 11:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=HoO02iAoah4iyPfuEGbKOdaYaZDS
        OmC8gNjkeB5S6cg=; b=yYCCSCNNPUKUIKp0gDtJz11Ls95Avww9BNztv/VjezFT
        h40knpbw5bhPJkrosSzzZX7KdYJ4sXeoJBsQ/dTahCMc6u4L9o7KG68rjBjoHM9H
        1h+SZSfqnYI8y56wInR4iY6sBBIBctFdvYD4pb2O5iu2rdQwp09snUCgeWtJ0tE=
Received: (qmail 1065094 invoked from network); 3 Jun 2021 17:35:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2021 17:35:47 +0200
X-UD-Smtp-Session: l3s3148p1@+undU97DIOogAwDPXwscAYTGTECNYrAp
Date:   Thu, 3 Jun 2021 17:35:39 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs: fault-injection: fix non-working usage of negative
 values
Message-ID: <YLj2jJi/iuskaemH@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20210603125841.27436-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVLzzK-hsaEO4mEkOeCnzKuXgORanB+GGnHZjonwQAD9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xsayXCEajoqZ5ApB"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVLzzK-hsaEO4mEkOeCnzKuXgORanB+GGnHZjonwQAD9w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--xsayXCEajoqZ5ApB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Yeah, I also assume that it used to work at some time. Didn't bother to
investigate, though.

> The code uses debugfs_create_atomic_t(), and atomic_t is signed, so
> I'd expect negative numbers to work.

In debugfs, it is all cast from unsigned long long to something. Check
simple_attr_write() where the value is obtained with kstrtoull. The code
fix would be to not use simple_attr, I think. I opted for the doc fix.


--xsayXCEajoqZ5ApB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC49ssACgkQFA3kzBSg
Kbao8Q/+LF9SZhQeDCn7kYs60anHQ8OFvWFcxW1TpZNY6+NfDLcB1GwBa43FS3Gr
Xr6qgUHLtaHlCP+z4uKa7coDWf4Z1BoWFCsK8xDbOL8qk/NPGc8yBevHQNhz0YQ7
ST68n1cgClfLD0BCFDjE1Kq0j3T5jSI3CbykR546PzLOoEZO9LGKYXjU2FT1+RdU
IyqtKrT8yMeOBKtqNLJoafD59IL173uH2QN7k5QLJkYvliB15TnG/HTSxvJ6KlZx
D1H647iSR3SzaN2wfq+8Sl0fgEC+drGuDg8FJrrBISZ/Kygfyvm95LxGGGJrYC1p
/BrIrO7o4ZCAHtxGdpmO+gdKxwxEWW0LJJofr/9CYZM/Ox5oMrPqZxZWIGkSBpUh
ZtaCEVucILAf8T7ESjxt7hiP9ktcj3WZeVvmnzYEiTFrEnwEfc9EYmD4+RiLp9sf
E9zU6HWizDZar7tZZCSvS1n5g+3cZTC0Nz5ctgcWx6F1ihiay5J8BsrAqkenqnS8
tJAzx63aKMZOQLNh+lCYYGqxkBxT/KJqDBd5aZuOkegv4OMitP8Co772YPMSMEZW
ANnufOcZEa2aCCN7aWj5OCCZTKqlSy52+LdbUNAkLFosQGGNIfcOJXmHlN45xCLC
dirsOkmPOgniSszfGoopiOH7j2u6H5tWuPp3AP0zSuCXTiYxooQ=
=XZA9
-----END PGP SIGNATURE-----

--xsayXCEajoqZ5ApB--
