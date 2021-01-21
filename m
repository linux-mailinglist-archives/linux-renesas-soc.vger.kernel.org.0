Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E2B2FE7F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 11:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728660AbhAUKsq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 05:48:46 -0500
Received: from www.zeus03.de ([194.117.254.33]:59106 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729765AbhAUKr7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 05:47:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=o70t88LDGMvmpgqdCk0T19YtNOSo
        Vzw6kJEyC/1uDlA=; b=JsD7UF/b2Yntw4ZRaBta4Ds08ikOQVU/KIR5cAE77lq3
        OKE4Nor7zt0wMewVRC88e2EEq1ecc4zqiIhz2o2ZT/IgpDJ1UVjBqxLcMqHN8ovi
        bunvy1UtU5RZ676Po6zz4QCilCTk/ssUDyKPYwyQ6XaQPsm0GECQ4RGVK46h5m8=
Received: (qmail 1809551 invoked from network); 21 Jan 2021 11:47:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 11:47:15 +0100
X-UD-Smtp-Session: l3s3148p1@SyNoy2a59L4gAwDPXyX1ACWcscxtZ2TX
Date:   Thu, 21 Jan 2021 11:47:13 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] v3u: add support for SDHI
Message-ID: <20210121104713.GA1401@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
References: <20210121103830.9575-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
In-Reply-To: <20210121103830.9575-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 21, 2021 at 11:38:28AM +0100, Wolfram Sang wrote:
> Here is the updated series to enable SDHI on V3U. Please check the
> individual patches for updates.

Should be all "PATCH V2", of course. I am sorry that it slipped through.


--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAJW60ACgkQFA3kzBSg
KbbF/A/7BODbXe006/xVopNQoZdz7iqz587yVpYmJl/PU8vNfWy2mcRsX/g+VJZ0
EC9kbeZZgKui7KwwA7AzvaZs9qZNIVd+CJSRZQqT76NlFbh3rFCmDW+SAgvInt4X
zOBq/idcSt4/gIVDtSfwr1jXoE7jv2AMixgWix0XdyLRBa7K/6iJDR6w57q1e1LK
PITbliT0F9ydtFdWfLPfvKFOGC+r9iQJCzwaj9SP+BIA+YCnL9Ea8RVlvJCLj9Fc
bQtBBI4nK1r/1yVn49uewCnTd7iNZ6XSUBUPXa5JonISiudRZ9d8hDWRQ7LGXtIS
SK6DobcVmltxpAb6U33CZUb469I6/aBGTZNXIhCBVxun5vGcUIEyfUhsm7gk43yl
dpZlS+Hue71Ynm9fm2aF6WXtYggqlrREqYHkJ3U3GU0xnZnP2GYMdyRhrnD8CEgM
WHkE14f01z/Xa28s5P6zcpdpFf/DLfWhLOg2xYseOEo7ZBdwUKICrdgeRqSAI+Ss
SttzdTBc9SDMHikwu7UlyLemp0N/Gup1SkZ+CpExlYzch5dbsM7NG4qxxKfiDvCx
2Kpi+ms8qC/NZGE/g9+zQvvnAooPgDPHDAC8nJE95KCDWx/xnNWa1NQPLz8uhdVD
lsuZAGD6ogBuHY0P33217xOOyEXUC6s26nVyx8Iid1yVRyv9gEI=
=DUDu
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
