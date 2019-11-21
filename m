Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 853DA10512C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2019 12:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfKULMG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Nov 2019 06:12:06 -0500
Received: from sauhun.de ([88.99.104.3]:59198 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbfKULMG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 06:12:06 -0500
Received: from localhost (p54B33AAB.dip0.t-ipconnect.de [84.179.58.171])
        by pokefinder.org (Postfix) with ESMTPSA id 844702C044D;
        Thu, 21 Nov 2019 12:12:04 +0100 (CET)
Date:   Thu, 21 Nov 2019 12:12:03 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mmc: tmio: remove workaround for NON_REMOVABLE
Message-ID: <20191121111203.GC1184@ninjato>
References: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVYYveVeF4+16vi8zk+0yVZMMJnMvKbLms7CbQ6w00uVg@mail.gmail.com>
 <20191119204725.GA1454@kunai>
 <CAMuHMdV+W62MkSRuYZNT0ezOt_KkyStfoeZohu7m1pOP=4a0HQ@mail.gmail.com>
 <20191121085702.GA1184@ninjato>
 <CAMuHMdVHN_wVuqFn3UcbFWxGPLxc5TfbMBRAWpptdt9M36JRHQ@mail.gmail.com>
 <CAPDyKFq0WySphCKJwJuxydiBJ+9ustV8=83cMKnCp0+aVZWF3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HG+GLK89HZ1zG0kk"
Content-Disposition: inline
In-Reply-To: <CAPDyKFq0WySphCKJwJuxydiBJ+9ustV8=83cMKnCp0+aVZWF3A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--HG+GLK89HZ1zG0kk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> If you haven't noticed, we have also managed to replace the call with
> pm_runtime_get_sync() with a call to dev_pm_domain_start(), to
> simplify the code. The point is, these changes are queued via Rafael's
> pm-tree for v5.5.

I'll have a look at those already. I had them in mind, too, once we
discovered that it is still RPM related.

> So, perhaps at this point we should simply drop the offending commit
> and revisit this once v5.5-rc1 is out?

Yes, this was my suggestion, too. I'll send a patch.


--HG+GLK89HZ1zG0kk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3WcQMACgkQFA3kzBSg
KbZJLA/+MrO81ZI/6jG3J3z4IgB3igl49M3J8jE54WtBuDbvbjoHn1dNdHi6TIfH
eOCUvlfptsST7XIxwHklwryxjC6FDWjOaQymPwLyyo340kNv6Rtg6rPr9T1yGSTI
bcmEYCoZskhWVodXGKrPBxPHzAAzqsGcOVwH9KdEn753CH/Cf7iFRHiipVVzjM8Q
3Rh8Gl0013WnNaCZ5GU+L0eXPIDs03XbZruY9JIqKuJwc+nvkwT4wYFW3uMjK9hi
K+saHy3e3z5FCSoLsotH44FaDijTfpX0frJoZJp6bXDWUewVnoCBqzV7TFsCXHFL
UrnxLDUOTlH4TEYvyHWcd6X3p8IhTGha1FMhIVnefLUwGysT5BcTPcPIYGz/A/Ny
90ZhbSUL+p7a2ky7XfIhtS2dCbjIw2wqYQdmaWnSFnI1oCzP+Kk5HhKo1pzKWR5W
OWQpjPoJjR6aRWPK+RVSWfuhtcofFSsZMvsScAmk09V+ytezzLkcuenMLIDWb27j
WUZXNOgKRbHIv/RqmSd24wkKvlARhoNRw5JZM0TE5+ZHww94ia+ltFsG4TL7bbsr
Mb1dv5RAUuREMY1X2vYsfRQvxu7eQtGnsjYAFPn4SYrJkK+JhYFd3VJ1v0Dufl+Z
CjcK9u/MKuGcPOLSB+wcL/HpQkbA96v1PbH3tIvdiYgWLkXVUh0=
=NExF
-----END PGP SIGNATURE-----

--HG+GLK89HZ1zG0kk--
