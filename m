Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D369177BAA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2020 17:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729961AbgCCQN6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Mar 2020 11:13:58 -0500
Received: from sauhun.de ([88.99.104.3]:51282 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729960AbgCCQN6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Mar 2020 11:13:58 -0500
Received: from localhost (p54B3308A.dip0.t-ipconnect.de [84.179.48.138])
        by pokefinder.org (Postfix) with ESMTPSA id AD7642C0872;
        Tue,  3 Mar 2020 17:13:56 +0100 (CET)
Date:   Tue, 3 Mar 2020 17:13:54 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        fabrizio.castro@bp.renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com, magnus.damm@gmail.com
Subject: Re: [PATCH 01/11] clk: renesas: cpg-mssr: add support for
 ignore-unused clocks
Message-ID: <20200303161354.GB3683@ninjato>
References: <1582748897-17374-1-git-send-email-uli+renesas@fpond.eu>
 <1582748897-17374-2-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline
In-Reply-To: <1582748897-17374-2-git-send-email-uli+renesas@fpond.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	for (i = 0; i < info->num_used_mod_clks; i++)

I think the naming of 'used' is a bit unfortunate because the flag is
'unused'. The most readable would be 'ignore_unused_mod_clks' probably?
But this is kinda long. 'kept_mod_clks'? I really don't want to
bikeshed over this, but maybe we can lower the potential confusion here?

> +		if (id == info->used_mod_clks[i]) {
> +			dev_dbg(dev, "MSTP %s setting CLK_IGNORE_UNUSED\n",
> +				mod->name);

Can we remove this? We can check this easily in debugfs/clk. Yes, I know
CLK_CRITICAL has it, too. Maybe we can remove it there, too. Or just
move it to the final dev_dbg before the function leaves?


--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5egkIACgkQFA3kzBSg
KbZ4QA/9FbMAKwGlbV/8uT/T/6N/ZfTQ1lHwP3FVqAmeqCpo6WPFMO7wRxypGXt5
k40WNMkQTosqYdtpYOgm8/zZotw78qBtKbHGzWtDKOtOoHDEXcpTvuqg2QuHM4ry
9Wfe2fWpLQKbh5PQsIgjzjZR0ABHp+dHoY19V5+5qrE+zcfZqG8NGIkwO6jQiqCv
Yo4fVfP3zbGH7RdchlngYTIp6FTVEYsdR2GpYvcKJtQ5RPcur2fGMPjFq9+uSeSm
r0+WlmM/h0YB5Ai2hzV4yDEJZqmE9Nfk/eJUGa49hgcnxnMHiyYWAcBiCc2B/rAO
joG+5mIEAGRc/qyEOECIgL0u4rAFGcK3nZCtGORa5sAqtkIbseBw4vUjgptaX+RN
5rWLDSDulqynPlZYay1jue+4WupsbcXPx98nePBOswHxa4PvZ/ihd29+5Fr3TwIm
xbRmvs+LEthqAPV0UKVxSb1nfzlTrDufqXeLVLQkkkOk9QfvZCl3Qnf5Ie+EVeCS
9026xAOeBsOPJ5/MM9+qMJRpCEK+Xwmk+I4Yp2hVezxW7vm0FXP6rgtOHJhnJwr1
w6SiN/VVLBlIy1RgCQiomT/4RD5ShBpz0Oqn2uZ3FEhzdEw710jhA/hHfKef5GFH
zGfQ8J8TCEgiskrdVzYqcnXQRMAqDEwfLvSPrb4TDb7vjNkFipM=
=gvPE
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
