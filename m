Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3DE206BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 14:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfEPMRC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 08:17:02 -0400
Received: from sauhun.de ([88.99.104.3]:41116 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726513AbfEPMRC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 08:17:02 -0400
Received: from localhost (p54B334EA.dip0.t-ipconnect.de [84.179.52.234])
        by pokefinder.org (Postfix) with ESMTPSA id 2232C2C04C2;
        Thu, 16 May 2019 14:17:00 +0200 (CEST)
Date:   Thu, 16 May 2019 14:16:59 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] phy: renesas: phy-rcar-gen2: Fix the array off by one
 warning
Message-ID: <20190516121659.GA2832@kunai>
References: <1557927786-29557-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
In-Reply-To: <1557927786-29557-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

>  		error = of_property_read_u32(np, "reg", &channel_num);
> -		if (error || channel_num > 2) {
> +		if (error || channel_num > data->last_channel) {

Just an idea, I haven't tested it: Couldn't we use
ARRAY_SIZE(data->select_value) to avoid the extra member in the struct?


--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzdVLcACgkQFA3kzBSg
KbaUKhAAmvPUwsL8WzAZDjn3eVUmaEHtbu4Alf2fk/dmbjtw7L5880YLK/o3K11e
YkBX5MK5k1oxJM7EgNKBVpa77lN7pn6et/8cUq8PwVXrtCGEaA8q3zpPr7/c1XT7
rs2ZfaBx5y5c/vRnRCwvBX+dDF+xsZKqY6RZQ6fXv3ZMg/T6mZkAAYDswJhf7Zwv
FxUz6XKHb95PdVKmp4kl6DbGlopBeuOfxRxHPPwSp5Dl1xCbcvZVVL/APivdi3j5
3lAQcW+7acCE1Eh6zqojN3bvJO5lzFyIucygsQuZOXYw5uXBMxyAZpS2hH0oGWly
N4+3Rqo3yK5RNM/l5KQFiH5rjehh5dAXX1VGdrUdahK8ZszJi4aZiJkdX++J3G0T
CHTLtDP0LENSoBUohUz6aRxWn1QcHRsBMSvveRjOlfQJvUSMSAhaEl5c5UfAsRqg
8qbX3p52+kASKX3fDq44frKhCBogP5XAowJ4ulMiok+N374UO3bCKkMVFaElzbYg
/xgL4I57lqj69CLFvZNn39nsyMjIqnOD6Q+zS0XdxeQhZFnXLPRHe9FgILuT9XKH
DGYYxKeoc2uEBMELCAC4mroZnjZDz3xkYIPPPN3/kRlI107J66FvE2eFZH44Fyrx
NPGEkJwpTg9aks2o4vo91jyD1Ltcp20oRjSxllja1uNzc17xB1k=
=wawM
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
