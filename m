Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D212C331
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 11:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfE1J1n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 05:27:43 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:35819 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726888AbfE1J1n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 05:27:43 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 49BAF20010;
        Tue, 28 May 2019 09:27:38 +0000 (UTC)
Date:   Tue, 28 May 2019 11:28:47 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 04/10] dt-bindings: display: renesas: lvds: Add
 renesas,companion property
Message-ID: <20190528092847.kxhhq7hevforddb6@uno.localdomain>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190511210702.18394-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="o263536bpxeaqxlm"
Content-Disposition: inline
In-Reply-To: <20190511210702.18394-5-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--o263536bpxeaqxlm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Sun, May 12, 2019 at 12:06:56AM +0300, Laurent Pinchart wrote:
> Add a new optional renesas,companion property to point to the companion
> LVDS encoder. This is used to support dual-link operation where the main
> LVDS encoder splits even-numbered and odd-numbered pixels between the
> two LVDS encoders.
>
> The new property doesn't control the mode of operation, it only
> describes the relationship between the master and companion LVDS
> encoders.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
>
> - Fixed typo
> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.txt     | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> index 900a884ad9f5..f2cc01d54cbd 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -45,6 +45,12 @@ OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
>
>  Each port shall have a single endpoint.
>
> +Optional properties:
> +
> +- renesas,companion : phandle to the companion LVDS encoder. This property is
> +  valid for the first LVDS encoder on D3 and E3 SoCs only, and points to the
> +  second encoder to be used as a companion in dual-link mode.
> +

If I got this right, the property does not enable dual-link
operations by itself, but it needs the next bridge to be operating in
dual link mode (ie. has both LVDS0 and LVDS1 output connected to its
input ports). Is it worth describing it here (or at least clarify the
the property alone does not enable dual link operations).

Apart from that
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j


>
>  Example:
>
> --
> Regards,
>
> Laurent Pinchart
>

--o263536bpxeaqxlm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlzs/08ACgkQcjQGjxah
VjwbRg//Xq8IhU73P6ciYEg0LzEj7uZQhWGQW8t5c0/ccUU/Db+fzYvMxaW2UwFl
wEv8PPxfmBUkObeu5hKRXFi1NoZuOx7fXYQFloMIzkDZTq/6cSfOqO1SHhg+n9QP
Gms+aJ8bmU9epGw5jHt6PvUvAmO//X7VSgzocvIOG9YnWA15bBw3HkjiH9gsmUTl
54/YaRKbdTEk9zgEvDvYkal+fz2l27P/askcy9yN35wKkIhxGWeQOTXt3RnoT289
yP7gOUBnk9PB4bct2IOh3LwMQaH1OIqn5eIfbL/5FotnsGfiYNHu+mbFLcH+K67x
RWlC++O/j6DjGtQ2k33068GaIfMcgDDhVwgUHGKxt0JNoovsdeUwq8Wy7HZjhrHs
UzDSPIgtQ5zrq0hyNJYjQ7QbENwTUxplGWX5fd6QAz+A+YHMRCjZvS/kkzqKucb2
hf3gIkWQDVSgYzxAp7pmZT5xKt61IbHpqhBdJVPduzifjGRLL20NbPXxGr5igWFC
eHCeVvjohdj9mDAlTmFJ3/Yunbe8T6STHFRrtqEodDComF6XQZSc5nG8ejD6lKTi
SfpQq+2HCjmN/M9Vfyrg0bfi/vmXDOihxY+4M0PX8Qe37B6iwvogX9cFDOC55Tqu
eEGJAKW6y+jFDWI//qswELADsN7nqa0Ik5//ZQF2/Y7vgwn1S2s=
=j2sp
-----END PGP SIGNATURE-----

--o263536bpxeaqxlm--
