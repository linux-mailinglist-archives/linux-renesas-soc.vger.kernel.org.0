Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F204C229373
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jul 2020 10:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgGVI1p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jul 2020 04:27:45 -0400
Received: from www.zeus03.de ([194.117.254.33]:57300 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729901AbgGVI1p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jul 2020 04:27:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=qdG6mhdWKXD9kVvZoeSiOdfJPckl
        iQGrKRssgfMT+QY=; b=XraB9ZxC64QvvgTxkuC0nPYJzqoO6I5l+d0p054/zGex
        95oJ5KHEgrbYvZHbr3TnRteemHgJuLwgIxQU5t1C+WL0Mon0lC9OZM9XPE2jV61A
        Rh16m3UOk/1q/P1BzmAlC3ITOeZOxcGoa0NmszwLpW/jzGSDpgiU5bMHsiLRjQ8=
Received: (qmail 2972779 invoked from network); 22 Jul 2020 10:27:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2020 10:27:42 +0200
X-UD-Smtp-Session: l3s3148p1@k7F8gwOr1tQgAwDPXwY8AL9PxqFiRnVq
Date:   Wed, 22 Jul 2020 10:27:39 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     kishon@ti.com, vkoul@kernel.org, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] phy: renesas: rcar-gen3-usb2: move irq
 registration to init
Message-ID: <20200722082738.GA1030@ninjato>
References: <1594986297-12434-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1594986297-12434-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <1594986297-12434-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2020 at 08:44:56PM +0900, Yoshihiro Shimoda wrote:
> If CONFIG_DEBUG_SHIRQ was enabled, r8a77951-salvator-xs could boot

"could not boot"

> correctly. If we appended "earlycon keep_bootcon" to the kernel
> command like, we could get kernel log like below.
>=20
>     SError Interrupt on CPU0, code 0xbf000002 -- SError
>     CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3-salvator-x-00505-=
g6c843129e6faaf01 #785
>     Hardware name: Renesas Salvator-X 2nd version board based on r8a77951=
 (DT)
>     pstate: 60400085 (nZCv daIf +PAN -UAO BTYPE=3D--)
>     pc : rcar_gen3_phy_usb2_irq+0x14/0x54
>     lr : free_irq+0xf4/0x27c
>=20
> This means free_irq() calls the interrupt handler while PM runtime
> is not getting if DEBUG_SHIRQ is enabled and rcar_gen3_phy_usb2_probe()
> failed. To fix the issue, move the irq registration place to
> rcar_gen3_phy_usb2_init() which is ready to handle the interrupts.
>=20
> Note that after the commit 549b6b55b005 ("phy: renesas: rcar-gen3-usb2:
> enable/disable independent irqs") which is merged into v5.2, since this
> driver creates multiple phy instances, needs to check whether one of
> phy instances is initialized. However, if we backport this patch to v5.1
> or less, we don't need to check it because such kernel have single
> phy instance.
>=20
> Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Fixes: 9f391c574efc ("phy: rcar-gen3-usb2: add runtime ID/VBUS pin detect=
ion")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Yeah, makes my boards boot with CONFIG_DEBUG_SHIRQ!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8X+HcACgkQFA3kzBSg
KbZETRAAl7dF5VEdTxe1lDE0sOfYgIaIhGPjpbmQnpQAgMjtmaWRh17dRsqY8mMO
NkJn2sAJx+kCoMfJM7S2dXFKEKLAU5RDYfqacBNJsaz059wabq/Vt2hCV/gQhYmM
5ScB0UpZ8V3rNVr/Y8vZKxzvnxprjn7yp94ZY1IfPPjaiuz7Oxw1p5FI4X7RuRrW
et+bwSUK9R8EDejID8knGMlFWcy3VSl63XDpAZ1moZMF9BvOKIh+/Yip2J/F6mD9
zJbujJ5HLgJnGs3uxuFH7q+3TDM8K+s91bkMGcvJa0JJ8EZRwafcqd70moIdz/nS
s/hE1Ebicn/2Li/B+WQxM7MrvL0YUTcbGywTqPculK1ZdEmQ+z2mEuHy6LIGcRW3
o//D3/rKaABo9lQskK2Go6czF72HX0ypjJMfnFs0XMSMCqiOxULwWx62RN9x7j70
kUDpD47f4QTC440Kh8JsFFJxMW08Oi3ba2o2d9cAXF9rNB9FBdFO7MIEiE+AQfo/
IikqAPf7z8jc/+6SjvlvNf75EvJ1OtlTitRtEXKkm9KbRAdL/xonJgjHGY9Jz3rp
iWSoLFKu/pIT++ObJ30fRtNogOO+l+K6XlJNYv8MEJs8BHDSiCEe6D7T/lojD9bX
QXTbOYXTe7GKSmjYYjzr1NZwVoeHN/QvZq8YZWpcAgCIVrrvBJ0=
=GT6K
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
