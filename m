Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8A3351007
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Apr 2021 09:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233470AbhDAHWb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Apr 2021 03:22:31 -0400
Received: from www.zeus03.de ([194.117.254.33]:47020 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233620AbhDAHWL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Apr 2021 03:22:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=mnMIfumYMh8F0hw7EyjgC4+Z+Ouw
        nM7eCOyDSjI8KYM=; b=2gVj55noXndvsPq79WweMvWuNwJG3C8R8QGDDEaMwD9J
        3GVHt9VOpoEYdVWWQ2H1w/+WG78kv8LoHJ4fLu99ZYdWRUPz78YIcGk/ORybsvN1
        9I9FcHI0RDlVAYrvI2myk+fjPyb7J8yxveyhCM0U12bSn2TJWOxPtS6LTpR42iE=
Received: (qmail 858078 invoked from network); 1 Apr 2021 09:22:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2021 09:22:06 +0200
X-UD-Smtp-Session: l3s3148p1@sga5FuS+qKsgARa4RS5gAQuD4qucpEC3
Date:   Thu, 1 Apr 2021 09:22:06 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        linux-renesas-soc@vger.kernel.org, yusuke.goda.sx@renesas.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: net: can: rcar_can: Document
 r8a77961 support
Message-ID: <20210401072206.GB1036@ninjato>
References: <20210312095030.534957-1-yoshihiro.shimoda.uh@renesas.com>
 <20210312095030.534957-2-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline
In-Reply-To: <20210312095030.534957-2-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 06:50:29PM +0900, Yoshihiro Shimoda wrote:
> Document SoC specific bindings for R-Car M3-W+ (r8a77961) SoC.
>=20
> Also as R8A7796 is now called R8A77960 so that update those
> references.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBldJUACgkQFA3kzBSg
KbbUWg/+I1VDzyQOsART5FVrr0CqDTqQ/e3p6bewYBRK0datAAEIFA+i+h/XOmGC
FKSWMymc/7oXfXdlnY8+vy8tE3DGIVnJl7ZN/DVS5DosVlw5AV+O107NMifiHzUQ
BhvFgOxTW0E2hqoAVCMU+//GUzrSkZLlDvzIWrHPkvt5sTVBfnu20LCFDJnCKQn3
VqbHuAuuR6HoOIj/vQwygJa9kpC8RUYT46uPCwooz3vUP+VESAOZAppIFpxL0WnM
/WF87DH9Fwx3ZJSnp0zPMun7EYLDTt/+Vmx9xPu+fEGt9CXkIvTXwZGV59mg8AtB
3wciX2cJwmJw9RL0mFKNd2oJL6z36VMhvFdb5YycrJ1Ib394LAkO5rmA7yrsqMq1
PGJrlwPj6BFPxic5tjXpJz1Rhz3JvmiCYjFVeHDi/F0ZgEfK9J0CuU7BAS0mxnwq
djqZfZsvIJsQEwH6p6WG+H9yegjoU6IYkugc7QUiHtxAldM5un/fZwUMJ0FTJjqV
aI6dgPyp9+qNlSasz/1PiX9AT8RvIBoD29ZGFQTOJ3RXVsGLyzQGgUpRZNw44Wt5
be9lThvOuvErRyZCVBQ5+Zxkkis7VpQgIwaPPNK+P+t9H11BA9qDwoCoERFDTld7
vABEuLh2m6IpGmAnDp+Rc1sInW5US0ZnOcnq9ythgRdsycfX9DE=
=YeJB
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
