Return-Path: <linux-renesas-soc+bounces-31928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /x4cBfNU+GmltAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 10:12:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1405D4B9F91
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 10:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 042293004052
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 08:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3C02EBB89;
	Mon,  4 May 2026 08:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kCu5jnFT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C200F26980F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 08:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882288; cv=none; b=KdADtS2xd/W5ANq7bUv/uizDkV61wObmFP9OY5fraMuoSJW9R/qUkhZlOWbSxIFxvussjNdwcRcvXuvAHA4xWax84cXTXX5PpNYlcFrT21NyEAxrEDN0JYRF59Vl1upc7SXQEKqOqek3OlLE8xdYjderz11UeTIuebnod+RvBo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882288; c=relaxed/simple;
	bh=JtkOjmnls2PAluvKuJd5CBs2z7Hy2X6CWIrN7vy4oPA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=EeXk6RGrdjaFwgOV90rO1zedQfhPHEu6f7nMMqwub9mAExrPvkZHkELN0kQm6oWk+ZeNlT0l1T8Gmi+OFY/bTM45CQZy1aiwk+zCDpIHOYrQNuUV9JWHAOOWAH6hO+F06Y2OXezOXefJky95X9Mqfgh53wLzei91+/iI1s4OyZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kCu5jnFT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAA78175;
	Mon,  4 May 2026 10:11:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777882282;
	bh=JtkOjmnls2PAluvKuJd5CBs2z7Hy2X6CWIrN7vy4oPA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kCu5jnFTth3/by1JhqEw8PBNF1u59C+iTkk8XB51Lr+z8MzMUm0lZaM+p0Xiz6Jcl
	 qP6TdRT3OTe11pGve4qxhNRoBtluOZkg9q73cTLKOVSiU0xHckEkghskhV1gi+wv1/
	 fjITDayWkeekLnJCgFFGtqV9Kg3Pna8qNYqAYRo4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <80e30578b6dd86664112320616c460c48dbd79f6.1777881435.git.geert+renesas@glider.be>
References: <80e30578b6dd86664112320616c460c48dbd79f6.1777881435.git.geert+renesas@glider.be>
Subject: Re: [PATCH] drm/rcar-du: Drop superfluous spaces after assignments
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 04 May 2026 09:11:21 +0100
Message-ID: <177788228188.45302.9594019404927871888@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Queue-Id: 1405D4B9F91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31928-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,ideasonboard.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:email,ideasonboard.com:dkim,ideasonboard.com:email]

Quoting Geert Uytterhoeven (2026-05-04 08:58:23)
> There is no need for a double space after an assignment.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Lets stop these copying then:


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> This started with two instances, and got copied each time support for
> a new SoC was added...
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/=
drm/renesas/rcar-du/rcar_du_drv.c
> index 031d07f4508e9762..d9926c24984eb3db 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -137,7 +137,7 @@ static const struct rcar_du_device_info rcar_du_r8a77=
4a1_info =3D {
>         },
>         .num_lvds =3D 1,
>         .num_rpf =3D 5,
> -       .dpll_mask =3D  BIT(1),
> +       .dpll_mask =3D BIT(1),
>  };
> =20
>  static const struct rcar_du_device_info rcar_du_r8a774b1_info =3D {
> @@ -168,7 +168,7 @@ static const struct rcar_du_device_info rcar_du_r8a77=
4b1_info =3D {
>         },
>         .num_lvds =3D 1,
>         .num_rpf =3D 5,
> -       .dpll_mask =3D  BIT(1),
> +       .dpll_mask =3D BIT(1),
>  };
> =20
>  static const struct rcar_du_device_info rcar_du_r8a774c0_info =3D {
> @@ -196,7 +196,7 @@ static const struct rcar_du_device_info rcar_du_r8a77=
4c0_info =3D {
>         },
>         .num_lvds =3D 2,
>         .num_rpf =3D 4,
> -       .lvds_clk_mask =3D  BIT(1) | BIT(0),
> +       .lvds_clk_mask =3D BIT(1) | BIT(0),
>  };
> =20
>  static const struct rcar_du_device_info rcar_du_r8a774e1_info =3D {
> @@ -227,7 +227,7 @@ static const struct rcar_du_device_info rcar_du_r8a77=
4e1_info =3D {
>         },
>         .num_lvds =3D 1,
>         .num_rpf =3D 5,
> -       .dpll_mask =3D  BIT(1),
> +       .dpll_mask =3D BIT(1),
>  };
> =20
>  static const struct rcar_du_device_info rcar_du_r8a7779_info =3D {
> @@ -385,7 +385,7 @@ static const struct rcar_du_device_info rcar_du_r8a77=
95_info =3D {
>         },
>         .num_lvds =3D 1,
>         .num_rpf =3D 5,
> -       .dpll_mask =3D  BIT(2) | BIT(1),
> +       .dpll_mask =3D BIT(2) | BIT(1),
>  };
> =20
>  static const struct rcar_du_device_info rcar_du_r8a7796_info =3D {
> @@ -416,7 +416,7 @@ static const struct rcar_du_device_info rcar_du_r8a77=
96_info =3D {
>         },
>         .num_lvds =3D 1,
>         .num_rpf =3D 5,
> -       .dpll_mask =3D  BIT(1),
> +       .dpll_mask =3D BIT(1),
>  };
> =20
>  static const struct rcar_du_device_info rcar_du_r8a77965_info =3D {
> @@ -447,7 +447,7 @@ static const struct rcar_du_device_info rcar_du_r8a77=
965_info =3D {
>         },
>         .num_lvds =3D 1,
>         .num_rpf =3D 5,
> -       .dpll_mask =3D  BIT(1),
> +       .dpll_mask =3D BIT(1),
>  };
> =20
>  static const struct rcar_du_device_info rcar_du_r8a77970_info =3D {
> @@ -502,7 +502,7 @@ static const struct rcar_du_device_info rcar_du_r8a77=
99x_info =3D {
>         },
>         .num_lvds =3D 2,
>         .num_rpf =3D 5,
> -       .lvds_clk_mask =3D  BIT(1) | BIT(0),
> +       .lvds_clk_mask =3D BIT(1) | BIT(0),
>  };
> =20
>  static const struct rcar_du_device_info rcar_du_r8a779a0_info =3D {
> @@ -523,7 +523,7 @@ static const struct rcar_du_device_info rcar_du_r8a77=
9a0_info =3D {
>                 },
>         },
>         .num_rpf =3D 5,
> -       .dsi_clk_mask =3D  BIT(1) | BIT(0),
> +       .dsi_clk_mask =3D BIT(1) | BIT(0),
>  };
> =20
>  static const struct rcar_du_device_info rcar_du_r8a779g0_info =3D {
> @@ -544,7 +544,7 @@ static const struct rcar_du_device_info rcar_du_r8a77=
9g0_info =3D {
>                 },
>         },
>         .num_rpf =3D 5,
> -       .dsi_clk_mask =3D  BIT(1) | BIT(0),
> +       .dsi_clk_mask =3D BIT(1) | BIT(0),
>  };
> =20
>  static const struct rcar_du_device_info rcar_du_r8a779h0_info =3D {
> --=20
> 2.43.0
>

