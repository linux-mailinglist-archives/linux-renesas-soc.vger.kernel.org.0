Return-Path: <linux-renesas-soc+bounces-23332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC289BF29BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 19:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15E833AEF64
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 17:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1085627A462;
	Mon, 20 Oct 2025 17:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lbda9/2P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C9A17A2F0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 17:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760980012; cv=none; b=cbPGB5WXq3Bh7PG7Hdq2DaFDP80zqx8IbvUAfffHrGgfWGEPT+Vcr3cKc7vAkC6M4Lg3xWT1u+aZRFxhd7i+4WrnVV+8dehzeCZNJHRkJsdsc1FhfJFuobfgVabSrmJAntvuAkEUvQp30PtHk92tG20M7NidHUxgZtbsvwc4Mk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760980012; c=relaxed/simple;
	bh=SdTVhIypZQSLmzRemXZyCRh1Vyw5Q92t90ned3hjN7g=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=e7zkN1Xi+SfwdMa1HtXqoHbEOcFUA0JP6UK66XPCylJxd27qoQRfMinXg1a5kCFPL0OUGyUt1ETlbLh/9JJTUblOG+ZoJNfPlzNZgAZvQOo+ssBMQePgzpcxN8ZdWuqemT/t0Cu3dU0Oy3VvH1Dz5clzPf/Y3DIAES6XdzMPU0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Lbda9/2P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 902D9E01;
	Mon, 20 Oct 2025 19:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760979904;
	bh=SdTVhIypZQSLmzRemXZyCRh1Vyw5Q92t90ned3hjN7g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Lbda9/2P/UYvKmQybXSnc09/ONOUE04oF2ttWQxtML4FABex2HNExGFlyVer33PXR
	 wuxv7us13oBixh1+N061X+xtgJ9dtQJmPf4omA0+bHZnYBw5GRWIf/wdbCzxNdVwMz
	 nCZVC/4E+Tg4vZ8+ca0dDv2cu3BJ5QEs7JlUZoA4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251017191634.1454201-1-alok.a.tiwari@oracle.com>
References: <20251017191634.1454201-1-alok.a.tiwari@oracle.com>
Subject: Re: [PATCH next] drm: rcar-du: fix incorrect return in rcar_du_crtc_cleanup()
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: alok.a.tiwarilinux@gmail.com
To: airlied@gmail.com, alok.a.tiwari@oracle.com, dri-devel@lists.freedesktop.org, geert+renesas@glider.be, laurent.pinchart+renesas@ideasonboard.com, linux-renesas-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com, magnus.damm@gmail.com, mripard@kernel.org, simona@ffwll.ch, tomi.valkeinen+renesas@ideasonboard.com, tzimmermann@suse.de
Date: Mon, 20 Oct 2025 18:06:44 +0100
Message-ID: <176098000464.199266.533603860929790380@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Alok Tiwari (2025-10-17 20:16:21)
> The rcar_du_crtc_cleanup() function has a void return type, but
> incorrectly uses a return statement with a call to drm_crtc_cleanup(),
> which also returns void.
>=20
> Remove the return statement to ensure proper function semantics.
> No functional change intended.
>=20
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu=
/drm/renesas/rcar-du/rcar_du_crtc.c
> index 7e175dbfd892..22bcd7db4195 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
> @@ -993,7 +993,7 @@ static void rcar_du_crtc_cleanup(struct drm_crtc *crt=
c)

This cleanup is called through .destroy which is:
	void (*destroy)(struct drm_crtc *crtc);

>         rcar_du_crtc_crc_cleanup(rcrtc);
> =20
> -       return drm_crtc_cleanup(crtc);
> +       drm_crtc_cleanup(crtc);

and drm_crtc_cleanup is:
	void drm_crtc_cleanup(struct drm_crtc *crtc)

So it certainly can't return anything:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>



>  }
> =20
>  static void rcar_du_crtc_reset(struct drm_crtc *crtc)
> --=20
> 2.50.1
>

