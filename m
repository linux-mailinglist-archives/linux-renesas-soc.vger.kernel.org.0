Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A61352E23
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Apr 2021 19:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235914AbhDBRTh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Apr 2021 13:19:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:41510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234759AbhDBRTg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Apr 2021 13:19:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 350776113D;
        Fri,  2 Apr 2021 17:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617383974;
        bh=P2zH/du5jReZXeZcZQqR61TTW1xTRDLCK42dgOIUlak=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h+m9fM6FC2q2AapWB46bOZroJ6+6cQ5OgXlXhTCRaiBNI6m4dZRgIyFPfmN3JaJhV
         /Vl9Bzcqg8tdapppDxP3UTO8zxHp6eXYQryY8GQBoV3s3J/eQdQY3b6AJqpO8oaQxM
         vKOKe4qtRG8Kpz6d7st4T+EYzLYBbSoSv62Dj8zRLVRpkBa9E2u2liGGWebxF5tuXm
         leGBX3FuRMbdCW+eChYvAzZ+n1KOs+1lHH2yaLbdNytp+bek+rgUPgyqFJUTKNkPI8
         6YzFEcYCIvHYx16ggUdj2vqjtG6thhlVq9eJ39wK1YbB5JuSaYonyxSx7klUEeJ3lU
         /b20fkRT17z5w==
Date:   Fri, 2 Apr 2021 18:19:20 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v3 7/7] regulator: bd9576: Fix the driver name in id
 table
Message-ID: <20210402171920.GD5402@sirena.org.uk>
References: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
 <9fd467d447cd2e002fa218a065cd0674614b435f.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bjuZg6miEcdLYP6q"
Content-Disposition: inline
In-Reply-To: <9fd467d447cd2e002fa218a065cd0674614b435f.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
X-Cookie: Dammit Jim, I'm an actor, not a doctor.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--bjuZg6miEcdLYP6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 11, 2021 at 12:24:29PM +0200, Matti Vaittinen wrote:
> Driver name was changed in MFD cell:
> https://lore.kernel.org/lkml/560b9748094392493ebf7af11b6cc558776c4fd5.1613031055.git.matti.vaittinen@fi.rohmeurope.com/
> Fix the ID table to match this.

This looks unrelated to the rest of the series?

--bjuZg6miEcdLYP6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBnUhgACgkQJNaLcl1U
h9DuIAf/UIC1KPzcaWO7LP1ED7tbfR0r0LY5xFKl/WZ/96m2DUbAgiB8+m3Ruxmo
wgVajYhKudcqqlFlbHh9L41Tg1WNeScSMw9GoUnvNtB+jZhXudG1dw4zVmdWYOby
XV6sg9JPCxgdeKMcEB+FhIx8jn3aI/sR2X3rouF6J2uyNuehwfS2wml54v4MW6G5
d8CbJvRBA8GS5QWBqNNSIomr0I5z9n3H7iUa+k2Ziq/1I3iCpTl7mkbMB25OM5w7
QtPjxtsmrEIOhr+4iFjc3iPLjkrKnW2EsJOaSo+nXz3rJ8D5rNiaAy/f73iFXzfL
4oNhkyhgLUGQscCp5dKk4OPRAYa5UA==
=gMe9
-----END PGP SIGNATURE-----

--bjuZg6miEcdLYP6q--
