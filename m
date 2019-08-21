Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4121C97719
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 12:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbfHUK0Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 06:26:16 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:38873 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbfHUK0Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 06:26:16 -0400
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id EDA95200012;
        Wed, 21 Aug 2019 10:26:13 +0000 (UTC)
Date:   Wed, 21 Aug 2019 12:27:43 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2]   arm64: dts: renesas: r8a77965-salvator-x: enable
 HDMI sound
Message-ID: <20190821102743.tlsa57lxilpwaydj@uno.localdomain>
References: <87pnrdsum0.wl-kuninori.morimoto.gx@renesas.com>
 <20190227113020.byiwz4dpmn2s35hn@verge.net.au>
 <87y35zbfp6.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vic64wk3bojlb3qo"
Content-Disposition: inline
In-Reply-To: <87y35zbfp6.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vic64wk3bojlb3qo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Simon, Morimoto-san,

On Fri, Mar 01, 2019 at 09:41:01AM +0900, Kuninori Morimoto wrote:
>
> Hi Simon
>
> > > These are HDMI sound support for r8a77965.
> > > I didn't/can't test these.
> >
> > Thanks Morimoto-san,
> >
> > Is this because of lack of hardware or some deeper reason?
>
> Beause, I don't have such hardware

Tested on Salvator-XS M3-N.

Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

>
> Best regards
> ---
> Kuninori Morimoto

--vic64wk3bojlb3qo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1dHJ4ACgkQcjQGjxah
VjxBFhAAlCa7OEdCoGVczdHdY3wWbhazT5vK/9YDHrevwCkk3kbWLViyItwCdsLV
6/j7mE4ELt68PdiKdjH6kGoT/J5DgpQvQ3lug7su5Cl1uiQIWx/uXyLXEMoI7CGV
CtcbhPuLDYhTDXc9yoKxrsYoTndlpS8lDbGi5ZxFH71Tz2DeQFJqOgntZqszxF6z
Dm1oCfbprnCwucJVC47sbTNWEgYS/UA9ZbQfzUBf7u8ZTySBYTF/K80YRNyfkizU
RCcO2YL6eeAA+Oa/6N1sFAnRufcnp8MgndOGkLaQoaIvvZ7Q2OSWSVDSlnNdSSeZ
COoMYkrpkxnlVMmiQYoWqTYklAUOr5vbdoB4ilWdSC4o8ZU1iSHUS6KpQGl4uXnu
5FylifWCAwbs1pncUVuB641R3eYqW5LrNGs/YU/0Kwc62hb8coxdCtzXIVreGK1Z
kQQQ9JftHq0+HoT2HSug+FSiJhfBMZme/gCgsXbllOw8MT8ppFCtAxxPtfnWysA1
Xk1l7RJCV3hlFqTkBIwBMxCdznwI6eidDa27IK+pfurok/1gRHW+5DaJb6VTRzcQ
SkVUtkPlfeNkVMMLbvxXL2nnO3Yu2XBgbr1TiOynvp1DAnO6ru8HsRbH+QKfuU5g
kUjhwSDNDpoPlEN0/XN5dS0MfqvxhbTCEPsceCd4IMV24is6b54=
=l3Az
-----END PGP SIGNATURE-----

--vic64wk3bojlb3qo--
