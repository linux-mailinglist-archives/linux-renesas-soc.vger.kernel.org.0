Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF15520E4F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 00:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbgF2VbJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 17:31:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:60658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728804AbgF2SlS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 14:41:18 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C6B325587;
        Mon, 29 Jun 2020 16:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593447293;
        bh=i3XF3hOBLFwb0NzPxlALfSrDzl4dgkIr0XA+m7+JoC8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X+SIl8ZxkoXoG+sr41c2HNEnAyjfyK1CY3DA9icEyBQ+PEswOA8VF0ZeBwHmyoaxQ
         eAllUfzRvyXPv1+0n0a0Y83PLyxT/SowR4vO1gl3gFkVw3NnVmu9y4mTdHddlP87K0
         33omSROIgfdIPoK7+55i1Fm9buHYzrVyNTQwjTME=
Date:   Mon, 29 Jun 2020 17:14:50 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH/RFC v4 2/4] regulator: fixed: add regulator_ops members
 for suspend/resume
Message-ID: <20200629161450.GE5499@sirena.org.uk>
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1593163942-5087-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200626143914.GE5289@sirena.org.uk>
 <TY2PR01MB3692A3B12CEF7F9708A8A59CD86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200629125756.GC5499@sirena.org.uk>
 <20200629134011.GA23284@bogus>
 <CAMuHMdU81-EAve+jHhL8+ohCd5YXrgLWpMgaCvgXFDLO7p17pQ@mail.gmail.com>
 <20200629150728.GA27911@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9crTWz/Z+Zyzu20v"
Content-Disposition: inline
In-Reply-To: <20200629150728.GA27911@bogus>
X-Cookie: Real programs don't eat cache.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--9crTWz/Z+Zyzu20v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2020 at 04:07:28PM +0100, Sudeep Holla wrote:
> On Mon, Jun 29, 2020 at 04:15:39PM +0200, Geert Uytterhoeven wrote:

> > This is all about how to know what exactly PSCI is powering down during
> > SYSTEM_SUSPEND.  In this specific case, it is about knowing if the eMMC
> > is powered down or not, as Linux should follow a specific procedure to
> > prepare the eMMC for that, and Linux should not if that isn't the case.

> OK, unless you are optimising, you shouldn't care then what PSCI does.
> If you don't need eMMC, just suspend/power it off before you enter system/
> psci suspend.

That only works if the power off procedure doesn't require that power be
removed as part of the procedure.  There's a reasonable argument that
specs that have such requirements are unhelpful but that doesn't mean
that nobody will make hardware with such requrements which creates
problems for generic code that needs to control that hardware if it
can't discover the power state over suspend.

> > I had a quick look at the latest revision of the PSCI specification, and
> > it doesn't look like anything has changed in that area since my old pat=
ch
> > series from 2017.  So it still boils down to: we don't know what a
> > specific PSCI implementation will do, as basically anything is
> > compliant, so the only safe thing is to assume the worst.

> The specification states clearly:
> "... all devices in the system must be in a state that is compatible
> with entry into the system state. These preconditions are beyond the scope
> of this specification and are therefore not described here."
> "Prior to the call, the OS must disable all sources of wakeup other than
> those it needs to support for its implementation of suspend to RAM."

This gets a bit circular for a generic OS since the OS needs some way to
figure out what it's supposed to do on a given platform - for example
the OS may be happy to use wakeup sources that the firmware is just
going to cut power on.

> I see nothing has been fixed in the firmware too and we are still
> discussing the same after 3 years =F0=9F=98=84. Clearly we should start t=
rusting
> firmware and built capability to fix and replace it if there are bugs
> just like kernel and stop hacking around in the kernel to deal with
> just broken platform/psci firmware.

This isn't just an issue of buggy firmware as far as I can see, it's
also a lack of ability for the OS and firmware to communicate
information about their intentions to each other.  As things stand you'd
need to put static information in the DT.

--9crTWz/Z+Zyzu20v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl76E3kACgkQJNaLcl1U
h9CVZQf/b/5Ry1gGVzgtNgFJSdZbuHAxc/M3ISHQRVcymW1iEZfglFzYYPbztCAh
Z9wvSSL2wdE5QIn3fiCogRWEYZ00MRWYaGEkejEVuGiX37nlPtjvrnuk0jU892SI
mE0lbSPO8fWuF625sxNgUqVVtEX1rYzLY/cQm1OGqADIv2Vu2UsxkotYJ1GogT2N
D2Uar5ao+JY3t4DkbNw0vL6bnem2tPcQh94HbNR8E/yf+c1dcosKS4nTXQkzzFcK
pTbtsakKpe+sNs/BXSDOH2Nq00O3LHIrAUEUfx/dl6MyXg5SCHlwmek300usG/8y
BuBF13l/Vd3ujNfSFazfX8dpElQDQQ==
=TKQb
-----END PGP SIGNATURE-----

--9crTWz/Z+Zyzu20v--
