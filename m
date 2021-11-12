Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF5344E799
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbhKLNn4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:43:56 -0500
Received: from www.zeus03.de ([194.117.254.33]:37340 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231436AbhKLNnz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=7evMkvgcnS0WHy2iZIZTybCuOKTB
        zfHMH8VRm70oK5Q=; b=kQuZQPb1IYZJuUpBHUoBJsfv8PDKWIfFOV+cophUYkKo
        o/K4ygFz9lVGQ2M+aMx6iLfruNYR4oj3Em3vnxDwdGTF1O/xHm+rRidbmQttNqOh
        tOxYW3vtogeVcDcPytLozU7qog0kzXnAjhtZiNcT+1R1nH1YUq75pL3U8nTf4mE=
Received: (qmail 1386690 invoked from network); 12 Nov 2021 14:41:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Nov 2021 14:41:03 +0100
X-UD-Smtp-Session: l3s3148p1@jF0+nJfQQNAgAQnoAFqiAcAEyXqBia2a
Date:   Fri, 12 Nov 2021 14:41:03 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [RFC PATCH v2 08/21] arm64: dts: reneas: r8a774a1: add SDnH
 clocks
Message-ID: <YY5u770TU6/RcFLs@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
 <20211110191610.5664-9-wsa+renesas@sang-engineering.com>
 <CAMuHMdX_xXb0t5g8t9Pmc9LLGUhD0FA9R7NonF-92a2M556pYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bY8wj9Vy/qP3ij7/"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX_xXb0t5g8t9Pmc9LLGUhD0FA9R7NonF-92a2M556pYg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--bY8wj9Vy/qP3ij7/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> If you don't mind, I'll squash all RZ/G2 DTS patches into a single commit?

I don't mind. It was easier for developing and thought it was easier for
review as well. In the tree, one commit should be enough, true.


--bY8wj9Vy/qP3ij7/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGObusACgkQFA3kzBSg
KbZPKA/+KeRv2/JEQ+jtLiLJQ5+TKta/TBhmZCuwGKc4nPBProQUvazFR8edjmb5
sVMBSMw5qOtD9CjhKigT7fkBPmJQYzL8W1lDgC0XZ7AdGbQwvJvU/xUA13qyqntH
0dNtA8GArTiD+NKe9wBkB4AzmNkDvMfnbi8RKe8KBXXLeReM8N3q2wPSYxgl1a0v
by8GQWdpJj4QpR7MNo9SVMMi7/70E5gSOz/1wfv0Y4tQktsAylSyYPLUldLkX5Oh
WYs3PKsHbNLBFWollD4xFX7IZ5ItyeP88E6/hb+C8w1/qREH0ftWld6V+Zy0Zb9X
UobYOzWTk9nvBgxe0E1ku4CUZnZ19dZ1M6zqfY/3iac3xJUzdiW02V9KLckLh85Y
a9EHB5ZdfQb+HU7NZIE2G2jQuho+iTzZvX1fqfERGLhusXD5lASEBeKW7mHeKpAy
o3gMQyOti4pn2gR5eHUQ1pM3yMi+u6wlobOPtaqKWeCRdOgcmsrcbmc8Ql9SNjbL
9/KkA3eAASJ1weZaKgDxotrXDXx23mLTAFG7fQVGJmjLex1nJZTi14VjlW9UYY7/
nDz8rUVmf16Fwn+rlvXf/WAlD6KZDbFpm7gcE84mKjiGhR9wK2B2sMplvhOFbP/4
Fbs7t/gMsJTl9OEmFAsjwa3bXGZRruqgImhN+TSlMZZpnGCR7eY=
=0nSm
-----END PGP SIGNATURE-----

--bY8wj9Vy/qP3ij7/--
