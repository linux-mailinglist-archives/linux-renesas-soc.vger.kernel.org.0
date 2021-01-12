Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 147D32F32F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 15:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730466AbhALO3O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 09:29:14 -0500
Received: from www.zeus03.de ([194.117.254.33]:59974 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726546AbhALO3O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 09:29:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=KAQHmQ1LgTod0o0SSNeIdVcY3K1q
        bJ0cV/hGHTftq5U=; b=MfouD1RycVIBILjWWqTNginBeN4njDnBxZrx4Mvk/uYi
        wfuN3FVsVLFOi9AeTexssbQBRhXGjysetI+vQl6IkGdJXuI+ChgH9XlhO5KonFlR
        5K5udKDmnjnl/lRxCYArih5Ow0g8aGtiDJ2N1SPQZ8eJKXnWNEtMRd3goVRUB1Q=
Received: (qmail 2772388 invoked from network); 12 Jan 2021 15:28:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jan 2021 15:28:31 +0100
X-UD-Smtp-Session: l3s3148p1@HMk31rS48LwgAwDPXwxzAXsl+VVkdePs
Date:   Tue, 12 Jan 2021 15:28:30 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: add grace period when rebooting
Message-ID: <20210112142830.GA42688@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org
References: <20201219143648.56217-1-wsa+renesas@sang-engineering.com>
 <20201219143648.56217-2-wsa+renesas@sang-engineering.com>
 <20210112135534.GA9277@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <20210112135534.GA9277@willie-the-truck>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

> Ideally, the mdelay() would live in some code that knows about the watchdog,
> and therefore can choose the appropriate delay.

Agreed. I'll put the delay into the watchdog driver.

Thanks,

   Wolfram


--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/9sgoACgkQFA3kzBSg
KbZHtA/+KseZZszhJNWlDyDtUKSZNk3T3+GR0fmAdM4YIoU5u7lHGQNEKdwABGSH
QDYuIAsNBAZUNXU7omTPWGpqug6+xEb0hpca06ADv8f/hkYHhlkB5BpPRZJf3fU9
wOHIx7BJ88VpKKmWBu0lEgxLRYas8qxbkQGxWhZrErqhsORZjgODoFiN5Va3q8zK
0S1lp2RqAhfYZ+ICm8IgEn7tw5suG1RQyc0wByEhBVcH+59BwjTgVqStXAPxox5/
6m/knyAYyek+r4eNC+/Ho5ltskW4yBaRYfNn3kHJgsJPOSXtB+nxB2fgrjZoNXbN
kro1wppIim4Ng6KbXaq+PJ6uLhousw0/CIfLddd0QlIFx9JWZx1zl8ZhU0POzQZW
JwsUeatWvJSf032jREvw8bF2bO45f2xadUhh1jI+s8bJ4wRrJrHC7MjedLa7MINT
fMYN4kNWDcoRPfAxk4oX9a3Dv9KzcvLcbniNrmAE2rW7LWFaQGKM7U+VoOmvMtu4
o5wCD6WXak/Hvn0/uhDFCTx8UFmZl5XFCNWf3/afIEp5E89Y6Vu2Ylh5Shpc01qp
DDQI1fQ+BTX5Mk00zfCSYFZw1BbPNmbsfFTZ171GgOxz4eTD/Micr6XcgRjDv018
VZWUgJV3tctwlNuBUUN1NKftdfElIWigHTVfQ/4ZYEeMgvlUFRA=
=6rKt
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
