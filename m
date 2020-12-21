Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 881A42DFD0B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 15:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbgLUOwc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 09:52:32 -0500
Received: from www.zeus03.de ([194.117.254.33]:56342 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726848AbgLUOwc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 09:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=vJdxuZga1Antqxavromd5prZHeSB
        Nup8FYJ2dVFwB9E=; b=FUltQ97tb2G9LffXGwsaxjArZQPENGj2MOguniUtH+5Q
        Oxvq9AlC5+WF0TiQbKu0J7OhZqtNB+KpgLUA+skCgYBgouqTBLvF0mtlLt87OCEk
        PvHsdpjqRsRVQWpV4LAVjmUWIOtb0wLxc9jZSMLPizeWjk4QYxky9Xie1x5Td9A=
Received: (qmail 537972 invoked from network); 21 Dec 2020 15:51:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Dec 2020 15:51:49 +0100
X-UD-Smtp-Session: l3s3148p1@KWcAmfq2tskgAwDPXwIpAOUwDQytQs2L
Date:   Mon, 21 Dec 2020 15:51:48 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r8a779a0: Add RWDT node
Message-ID: <20201221145148.GA2585@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201218173731.12839-1-wsa+renesas@sang-engineering.com>
 <20201218173731.12839-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <20201218173731.12839-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +			reg = <0 0xe6020000 0 0x0c>;

I just understood that we sort by reg value and not by name. So, this
needs to be moved to another place then.



--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/gtoAACgkQFA3kzBSg
KbYzkQ//XyZ5EqE1iTWBixhRqcLIJc451x45aLhPSeuRU5+fp3sDUkHcRf9xsXmz
jxCzxyz0+ZEKVDeSX28Ye8CTYmlXf5XtMRLlGJ7RTsgAUudycijKWfgBhF3kOB8f
c1UftJyyovz6XCTyeoRxSnSDL2jpFG+kUX0l3ELfaLOqyw8n2SRezOmszq6fU4W+
3kCpZrnfVi4IuDTpsAlYIY4O0wjDpiIa+yt0Hf3jbKYxM0bnkXMgFsvZLYDqtRQh
axiXpj0YDSJa6e03RVDCKXBeRxcn+v0Tjbw2LSkKPySZ8hQ++c9p2vCyUdE9n2mJ
Oqbx3up5kwoROyukMx8agMTzhd/meLRNCplIWcTs6yfAnd8S/YilqhdaVsUrruGG
T9s/W3y4W6RzAq3xLhngxOtzpYW5d2VhKflo9rPHVXkph5MPi7OMu0+v7vtda+rc
tN1wtQynAPHxleI8X2xFGu5Xbsh2QKvct82MoLMPdP2OY+DgrUfXsYmBZWF2KetT
DWRkceD0G0sYHUrZDGl6i460hDZxH75D2HbEyAV18/JhgMotQWzcSwdhHs993qTw
n0NyB8obOoD/81jCCWZkrboLocV22/ohpgArCQFwJt6ote/MTR+wndDLrvnqIzoR
qg+JCXDw8++VNYSI46VwSzL7jMg07CQy9nN27UN5yGSQn2xqZnw=
=sReO
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
