Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54397189D41
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2020 14:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgCRNrb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Mar 2020 09:47:31 -0400
Received: from sauhun.de ([88.99.104.3]:47910 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726757AbgCRNrb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Mar 2020 09:47:31 -0400
Received: from localhost (p54B333FA.dip0.t-ipconnect.de [84.179.51.250])
        by pokefinder.org (Postfix) with ESMTPSA id 809522C097D;
        Wed, 18 Mar 2020 14:47:29 +0100 (CET)
Date:   Wed, 18 Mar 2020 14:47:26 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        fabrizio.castro@bp.renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com, magnus.damm@gmail.com
Subject: Re: [PATCH v2 0/3] clk: renesas: cpg-mssr: add ignore-unused option
Message-ID: <20200318134726.GA8300@ninjato>
References: <1584376479-25258-1-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline
In-Reply-To: <1584376479-25258-1-git-send-email-uli+renesas@fpond.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This revision renames the data structure holding the ignore-unused clocks to
> something hopefully less confusing, squashes the changes for R-Car Gen3 and
> RZ/G2 into one patch each and removes redundant debug output. Functionally,
> nothing has changed. Thanks to Wolfram and Geert for the review!

Thanks for the update! Looks good from a visual review. I will do some
testing with the bootloader handover patch later and then give the
apropriate tags. Looking forward to have this topic finally solved :)


--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5yJmoACgkQFA3kzBSg
Kbb+NA//cDOl2F7OD6Tkj/xDGcQWKZMrS2I0jAK5y4rLnt/IT/RL3tzdVhOsNP95
P93b34hpo6psufE67R3efncGQxHdW0fch8J/mlNHzJl1W60//j/LVIoH9hCuaUbo
6fiS3KX3xBF2UACWr6pYcHE6hQI15j8zYKa+0+k9abD27UUW4HHQXquKCT3JjpTU
bdN3C2tgeTTFqs+3k5tnxmDi5Sc7JPk/NDkFTbYRLmVL5Z7rvVP0D6CNJJSEbkue
7oWSnuZ9qcYttOUJTJzMd/l+n+2N7c6SUDAq89JTw/19FOaCsIe7PohcuGdkAfaP
GY9hQ4jJ4nR/IEanUxRNMFjX9XuOLRXwGCIqXNarKWYQKrkHW6d8cgD6XAbqGTw+
oYXgVgdaCA/3JZAbBJfcFXlZLI1MbK2dWGAzP8ZOqppoAm4mv1NzipCTWGtqC8a2
WLCkfptmj8E2gofwEXVb6Zcg0lZe4HWidOiixtQ9U6gHzS+8epIjwRSI18Ou5rir
AMFDYKvs+F4cLc8ue604PAcJbncfyP7hJED2TMyBcXQAOaWe1YPBS0WDpki7Wdo5
gTF6Gh/LgFdKpqp6ywLjmc97ufr+y/YnrMGxfX7P4th9X3L4WOfveEWkhd5Rd9UD
NHu9m+gJegMf0ANPKgY+K50oEuVt27G6NiB2fVQkIeMLffP3NAw=
=eq+b
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
