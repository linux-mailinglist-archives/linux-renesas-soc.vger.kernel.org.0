Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EED4171F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 14:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245760AbhIXMin (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 08:38:43 -0400
Received: from www.zeus03.de ([194.117.254.33]:50632 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245757AbhIXMim (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 08:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=UtLoSjZtV/2lGEgwKxNrRZUajG+V
        u7zQzKKFLDDkatM=; b=X2gM015DULaFbhKvthpDpQ3XrSe27bmIEsKjxhf6+Xn3
        A99cCp/ue/Q4SvKrbJyjuUvoXTQJDmI2zOUtWAnSx7Z621JltJxWqyQuv3Yho9L7
        +nGDq6xDeFA9YkjVrDd1pFqyfVaEdv4dpSfN++hGrQtLzEmm4qvNjqWamOi0F8E=
Received: (qmail 4024972 invoked from network); 24 Sep 2021 14:37:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Sep 2021 14:37:08 +0200
X-UD-Smtp-Session: l3s3148p1@035nAb3MZq8gAwDPXw1LAJ+FoAZ06vRo
Date:   Fri, 24 Sep 2021 14:37:07 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andrew Gabbasov <andrew_gabbasov@mentor.com>
Cc:     'Krzysztof Kozlowski' <krzysztof.kozlowski@canonical.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] memory: renesas-rpc-if: Avoid unaligned bus access for
 HyperFlash
Message-ID: <YU3Gc7isBqLzldRr@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski@canonical.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210922184830.29147-1-andrew_gabbasov@mentor.com>
 <c6de6ec0-fd06-14bc-c483-52a2d0a4590a@canonical.com>
 <000001d7b140$91e0a180$b5a1e480$@mentor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="j7Q9VpYJCTyd3NVu"
Content-Disposition: inline
In-Reply-To: <000001d7b140$91e0a180$b5a1e480$@mentor.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--j7Q9VpYJCTyd3NVu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> If I correctly understand, the underlying issue looks similar (improperly aligned
> memory/register accesses), but the affected areas are different, even non-intersecting:
> Wolfram fixes register access, affecting manual mode reads/writes, having problems
> with QSPI devices, while my fix is related to external address space reads (mapped
> memory access) with Hyperflash devices.

Ack.


--j7Q9VpYJCTyd3NVu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFNxnMACgkQFA3kzBSg
KbbE4A/8CEW8crNHXZP8zL2GCwXHLLFRr0PeqRnVOLxC5CiOxNuJfF+/pRazZHyN
0ckvfxf5fRtA5oQOLNLkwvdKoEttkNn7CBB07ay6LyzaI7oSm+tVmXT9V8MzPblH
QXNXk+OHPUz6bNJj2pgsOgLHeCAbV81KK65fFOoyAoky5sSDRE83MvgZRdLN7Shc
Dn2BtAgrs6mW5MUvqMLDgWFlWgAAdRJKAb/jHDZnGQ8eyWS21kHPB47JYD5AjfbL
DAY0fJevVRJXE6ZacAkQyysSIgrGLB/53Y5U66OId4AbmRhfeBAiFcbiXBkJIVBC
gLirOT3x88jt0KWsuPiKG4HvxPSrDodZtHC2gA+tMZPM+QJrQFs8ZEczGwns4DHn
d+q3afgyOAdMq4J666GhDks2HypwRYEiHrmHL0tPuw1IEMuQjd9ALcxxpyNhwJLT
ZB8MR+eK79YPBp4QTXU1/O3Tl6wv014Wf/2gDMtM31nSh68CfPKRvY1pJ+V1HsC8
UPZK0KhDWUMz3jciglrdhTEQy4igQNjnKnbUIsagCGRzwLXJycWNh1Kl5moob5qa
aA3LdVl2hFfjwwBLZ9Orp4Ky956BWKoHjCFZhqIMPEBA7QLuo28lLRsNqmJjvC8c
h1MTAQm3FkC2AhadhW4Tuf3omzT4iL/rEAetgHKqvzEq3wXemoQ=
=j5GU
-----END PGP SIGNATURE-----

--j7Q9VpYJCTyd3NVu--
