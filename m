Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69FBA20D1F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2020 20:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729270AbgF2SpR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 14:45:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:35672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729261AbgF2SpP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 14:45:15 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF69B255C2;
        Mon, 29 Jun 2020 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593451613;
        bh=NEhWqT6taQdowOynhDameXkf6905hTNtjqIfzcRYrBc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tRvbZq+V8GAi1XR6fsdfTyZqUnQD6qsLEkSNXClnAsUgl7l7D+dS/4O4i+laHUAry
         hADus1Gr34xID1++4+cU+AQJJBv4+18dKmA8OUSiTYH2Oe4mQkQXUBLrfdkXCd20ja
         PoPEI9G+g1ylnQVzYa511YeI+CvVBjhjOM1pk7z4=
Date:   Mon, 29 Jun 2020 18:26:51 +0100
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
Message-ID: <20200629172651.GG5499@sirena.org.uk>
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1593163942-5087-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200626143914.GE5289@sirena.org.uk>
 <TY2PR01MB3692A3B12CEF7F9708A8A59CD86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200629125756.GC5499@sirena.org.uk>
 <20200629134011.GA23284@bogus>
 <CAMuHMdU81-EAve+jHhL8+ohCd5YXrgLWpMgaCvgXFDLO7p17pQ@mail.gmail.com>
 <20200629150728.GA27911@bogus>
 <20200629161450.GE5499@sirena.org.uk>
 <20200629164207.GB27911@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="B8ONY/mu/bqBak9m"
Content-Disposition: inline
In-Reply-To: <20200629164207.GB27911@bogus>
X-Cookie: Real programs don't eat cache.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--B8ONY/mu/bqBak9m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2020 at 05:42:07PM +0100, Sudeep Holla wrote:
> On Mon, Jun 29, 2020 at 05:14:50PM +0100, Mark Brown wrote:
> > On Mon, Jun 29, 2020 at 04:07:28PM +0100, Sudeep Holla wrote:
> >
> > > The specification states clearly:
> > > "... all devices in the system must be in a state that is compatible
> > > with entry into the system state. These preconditions are beyond the =
scope
> > > of this specification and are therefore not described here."
> > > "Prior to the call, the OS must disable all sources of wakeup other t=
han
> > > those it needs to support for its implementation of suspend to RAM."

> > This gets a bit circular for a generic OS since the OS needs some way to
> > figure out what it's supposed to do on a given platform - for example
> > the OS may be happy to use wakeup sources that the firmware is just
> > going to cut power on.

> While I understand the sentiments here, PSCI is targeted to address CPU
> power state management mainly and system states like suspend/reset and
> poweroff which involves last CPU. This is one of the reason it is out of
> the scope of the specification.

Sure, but as soon as we start talking about the last CPU stuff we're
inevitably talking about the system as a whole.

> Here is my understanding. DT specifies all the wakeup sources. Linux
> can configure those and user may choose to enable a subset of them is
> wakeup. As stated in the spec and also based on what we already do in
> the kernel, we disable all other wakeup sources.

> The PSCI firmware can then either read those from the interrupt controller
> or based on static platform understanding, must not disable those wakeup
> sources.

That bit about static platform understanding isn't super helpful for the
OS, so long as the firmware might do that the OS is pretty much out of
luck. =20

> > > I see nothing has been fixed in the firmware too and we are still
> > > discussing the same after 3 years =F0=9F=98=84. Clearly we should sta=
rt trusting
> > > firmware and built capability to fix and replace it if there are bugs
> > > just like kernel and stop hacking around in the kernel to deal with
> > > just broken platform/psci firmware.

> > This isn't just an issue of buggy firmware as far as I can see, it's
> > also a lack of ability for the OS and firmware to communicate
> > information about their intentions to each other.  As things stand you'd
> > need to put static information in the DT.

> It is easy for DT to get out of sync with firmware unless it is generated
> by the same firmware. That's the reason why I am against such multiple

The ability for things to get out of sync also concerns me as I said
further back in the thread but I'm not sure we have much alternative,
realistically we're going to need some facility to work around firmware
that isn't ideal.

> sources of information. I understand ACPI has more flexibility and I did

ACPI has a much stronger idea of what the system looks like which helps
it a lot here.

> Each device or platform having its specific property in DT is not scalabl=
e.
> Not sure if it is a generic problem. If it is, I would like to understand
> more details on such lack of ability for communtication between OS and
> firmware.

It seems like a generic issue from where I'm sitting.

--B8ONY/mu/bqBak9m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl76JFoACgkQJNaLcl1U
h9ARmAf/eOU+nb6NN4s2U2ScdRWwL/oDde7MOef13lrNOPZdZIqSIdT+sRSnVS8l
SmIj9eQyDbwsJkc0rniYOlKtsW7MJj92RRC5HVokdkpKy73l8MPaoD8V++npPt2H
iAZoW9vmf15vNzxMZ0Hx2SnnZ/GJFKBF8c99NMdAQ9GyImRU9Bxhn/sdUxU8p1It
3v4Gr0a7/RBXnsdBXoKdqfSE5BAdME/jtLsPgQYgb6lp2CDpuh4IW3pEqpuSjKr+
LciDOtHSSjA7grLtjWn0A3zVPwAgxsfr7+eRWo3Qll7xPQSrNx/O3aa8PFxAuym6
m3fRJ9QVFfGPQoMokOTqE5HnGMI9ag==
=qpfT
-----END PGP SIGNATURE-----

--B8ONY/mu/bqBak9m--
