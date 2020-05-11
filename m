Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2F6C1CE00D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2020 18:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730486AbgEKQHe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 May 2020 12:07:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:53422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730370AbgEKQHe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 May 2020 12:07:34 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67092206E6;
        Mon, 11 May 2020 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589213254;
        bh=Jw4EUPHyRghQxx0znjPMiNopC/3ADmRdiztkcgJmBRI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u19DzjOEydKdWr79FdACTBtmi9myJlEvJ3UTDk/gm+AK3FSKsJ/1viymQTO+pQyW4
         Q0DJS7SALk25UIf7udXqN/sYlRjXk4b1dD5sKGg3c2YQrI40Fs7KMv1b7bjz0Lt0CP
         YcGbw0dtL6qnXw9WVnUZhZ10eq1K1q+Nqkkvasd8=
Date:   Mon, 11 May 2020 17:07:31 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Yongbo Zhang <giraffesnn123@gmail.com>
Cc:     lgirdwood@gmail.com, Chen Li <licheng0822@thundersoft.com>,
        alsa-devel@alsa-project.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1] ASoC: rsnd: add interrupt support for SSI BUSIF buffer
Message-ID: <20200511160731.GA3618@sirena.org.uk>
References: <20200511100415.12502-1-giraffesnn123@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <20200511100415.12502-1-giraffesnn123@gmail.com>
X-Cookie: Check your local listings.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2020 at 06:04:15PM +0800, Yongbo Zhang wrote:
> SSI BUSIF buffer is possible to overflow or underflow, especially in a
> hypervisor environment. If there is no interrupt support, it will eventually
> lead to errors in pcm data.
> This patch adds overflow and underflow interrupt support for SSI BUSIF buffer.

This introduces loads of build errors on for-5.8 with an x86
allmodconfig:

/mnt/kernel/sound/soc/sh/rcar/ssi.c: In function 'rsnd_ssi_quit':
/mnt/kernel/sound/soc/sh/rcar/ssi.c:596:12: error: invalid storage class for function 'rsnd_ssi_hw_params'
 static int rsnd_ssi_hw_params(struct rsnd_mod *mod,
            ^~~~~~~~~~~~~~~~~~
/mnt/kernel/sound/soc/sh/rcar/ssi.c:596:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
 static int rsnd_ssi_hw_params(struct rsnd_mod *mod,
 ^~~~~~

and so on for ages.  Probably just needs a rebase I guess?

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl65eEIACgkQJNaLcl1U
h9D6tgf7BtkZhzn4Ek9W+lN6u/0eBOTZZhpzgCCjwgdfk+L3YM3ZRQxCA8+WLr21
JZp/URIp4PS2kLFFsD9J3qJyajCCOAsGRHBan0pGUDnfn2bWlqrqmpZXmiI+ttFq
GvCN/AN4Am9i49rQqWzRMu5M5px5H+7AHz9QpM6icZsDNAM3C3sIIXAq9HY+ujEu
3XriJGxE+S3/yZlyUArQrAHgIfk0FHwP2k8yyfN671dMTGNgczArgRXkaCKfPDc2
vKbBSFdEsJ4AoyCLmNaAny5k0qCCmIE/bU/wUGDLRVI88MCULm18qxb15cMJ3vYe
GBoRg4hDXzX1ybIjK7n5QJ1VyWwVFQ==
=OG33
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
