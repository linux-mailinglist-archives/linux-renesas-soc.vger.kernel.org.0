Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDDA7C5BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 17:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388587AbfGaPJV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 11:09:21 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:36956 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388609AbfGaPJU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 11:09:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=oE86iyCkFuLdAx6C70a2YwJmuXxGxpk5g7N4UAbsvzE=; b=wHDqWLMByHptQ4N7z6SasEO5X
        4copLTwIubUmlYDSJkhfbbEj0sJiRUhf5euHlBGvJm5djjtQV/BBd9X4SFZJgTnbUgeP96ZFhKxgn
        rZ+XLwf992Kb6ujYAe5tL3y1XbkzkTGqFvlzHgSioPn1KYI5ECqmEGj0v+wOUi9o+H5bs=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hsqE3-0002Uq-24; Wed, 31 Jul 2019 15:09:11 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id EB8542742C99; Wed, 31 Jul 2019 16:09:09 +0100 (BST)
Date:   Wed, 31 Jul 2019 16:09:09 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Fix backlight
 regulator name
Message-ID: <20190731150909.GD4369@sirena.org.uk>
References: <20190731073744.13963-1-geert+renesas@glider.be>
 <20190731074801.5706-1-geert+renesas@glider.be>
 <20190731081209.GA5080@pendragon.ideasonboard.com>
 <CAMuHMdV9MEYP97_6RFhmbGGB8uY-Pi8S9q+m+XMmHzKHcibJwQ@mail.gmail.com>
 <CAL_JsqJWJ+o6t2Wb162h7Xz98L=WPSi4une-EC0HfoRiWLmKWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJWJ+o6t2Wb162h7Xz98L=WPSi4une-EC0HfoRiWLmKWA@mail.gmail.com>
X-Cookie: FEELINGS are cascading over me!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 31, 2019 at 08:47:38AM -0600, Rob Herring wrote:

> As long as we have a consistent base name that we can match schema
> with, then I'm happy. But for regulators, we have a lot of node names
> like 'buck1', 'LDO2', etc.

Those are all types of regulator (LDOs and DCDCs are the main types of
voltage regulator, and buck is another term for DCDC).

I'm still not clear what meaningful effect any of this node name stuff
has :(

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1BrxUACgkQJNaLcl1U
h9AL3Af/aUeFtao+e3RZByp0wSj7o2Wf/AP0GdZxNpNL9iEZiwzVlcZd9MsJbVHk
1DP61c59GBTfKy8SkLx9HlcIo7MO2V8WDFeX7Sl3ojtW72ubXNBYtPf5KW6Yfdll
s+16xROordrMpe1Z8P0m7DHBQeAuuipy9nYlXbFpyoBdjNykpxFbmfhTPrAIlql0
I4Q8mXVpT927dY3WbAE0ZiyXJFddNZX+v7hB313W3fJ4a5fsjvLSTblVfEMt2NfN
szEd8oXIFXN1WzyN52COod3M7gUTFQL4eH3l+aEDsppj+gcpFcfkAmtoRACVXKo0
5GJeJci6PurEp+MbiVZw3KNvl/24/A==
=upRn
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--
