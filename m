Return-Path: <linux-renesas-soc+bounces-12655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A041A20A0A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 12:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D982E1668C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18DF1A23AA;
	Tue, 28 Jan 2025 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W6HZNEKS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69AD1A2381
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738065504; cv=none; b=iab7UrtRlwZzenr9wHKru2LYhL7JU5wtYfiKWeuCw8j7uHrLExswcPcd5NVSUWrp7vRC1P3nsniIPjbcf4vgAJesMNPRa2oCbthzJrO7kg7qziNFTbQE1tnzczK1BTC9GKX1RdMtOpMCAHD1KqtKwEMNS//7tBanx6k7ImXI7zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738065504; c=relaxed/simple;
	bh=oHF1yy1ScUA/CZTbQyrukrGw/VmrpeDHVmihSnV69NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mmfbjBqKf+CpBc/+a33yd0jrBfP5NYo5Q1x02S8KQbEk778/TBZSfkp1CVn06um/wZodEhLUQo8r2d0U94jmNY10XnODQq0HXjbzVCukp6SDRGtKj51RGPWxP6zG4fi/TiMQvxCuvWGdvPKe0gr+rq9ppzjXH4eu9qp1KNLopoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W6HZNEKS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738065501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=58JOKwE3B4ptPErvwF68tQ+YT/gMYrRZ8LTZTTrEboE=;
	b=W6HZNEKS0cXGIyyydE/LvfPbqjHVwcwSMwMfxc+X3TdTqr0EcDj1VU7XXHO3kl06/fYKzr
	GLG58xPYF/LJPrCRlFS9a9/wDhCsRq6rpECsJm8WAkZbG6jAFYsKJN08b9+FkG7McCKGQT
	JDsl3k7bVzoDndav8WejOnKpw18kCHg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-4m8gMA4OPRy-w0T5tDjJ_g-1; Tue, 28 Jan 2025 06:58:18 -0500
X-MC-Unique: 4m8gMA4OPRy-w0T5tDjJ_g-1
X-Mimecast-MFC-AGG-ID: 4m8gMA4OPRy-w0T5tDjJ_g
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467b5861766so108545981cf.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 03:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738065497; x=1738670297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58JOKwE3B4ptPErvwF68tQ+YT/gMYrRZ8LTZTTrEboE=;
        b=BAh6QiSVth8RZrqtFry3XfJHEBWq1mBMi8v1BYZ4Aif2DKtrlfnipjotTYItiqmtux
         lVEYIW1hNjXjp9pFR8fzcETe81iamjVvWQBSZG15wSIyhB5+bOeXUXooGWs1bAUYsgKq
         jeYiRWnzLFrnZwXUWVQ1+6DGLpbVZPsYkJVkX7qKHG6+pjvSsM5Rk8JLDzCClySVuDTk
         amBxFC1E64bMHQXIVWl6Cy40qTKYCubIOc3ArbnW3+pOD7RRokbCOZYabALe3dkoOkOG
         zPij1pOOgvOIWFcU8FwyAw9QSLCRIMHLQfD5pFP6VA30Xko0YgNfsOPk/W34IEKGp+OP
         ZHHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVARpKidRDK/uzaf4VvbxoUKFUYnI5CcCVbQzWwYjCI2Fx5D8BZLlWyAaXi5D9tfj0IrGmlmiDdDspc8G5izpcxnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW1oMO/CWD72/RKkawjMbmd42xRsERCMxMieHoQl4I5iAwOfEN
	VrG1a+dnyzLqaSx5KFZo0yhs0k74Q9ppHK+OMssDZbenWJplyNBe5uuucxxJ0rim6cF5P0WH6C2
	EZq2Z3ZCo0gexXGF+m7MNMVXSeAIHUKVhrSQOx1+EZ23Q7LFaStvJz/d+k+7DvM+S1ZChCFQHi4
	w1T/9xug==
X-Gm-Gg: ASbGncuUrEwu1+GnMMntOur4Tt86bn7NqDqf0wwV1CWSON/2dqbuzYqfvAG0hDA8mTn
	ExS9WnwjD/wJ76YMC4uoB0Wp4gW15f2bKQlaoIwSWlmdrbQhl/kHMGjqiOHQy6S+ECjqoNqF6/Q
	wabTMb/tc0tDrKWRq5Cxqvxj/Jqxjf8++XT5eFd8bqntzMJoXjY8sxuhvFMGXEWfNzKg1OGWfAK
	+yrxssOFqCQjUNxCxIsT1vXRGnxtR2GVUj0Q0LLjdvFG4LfObVDzmKW6SHDnYSaXLcFFIFn1RYC
	KA==
X-Received: by 2002:ac8:5746:0:b0:466:99a9:c354 with SMTP id d75a77b69052e-46e12a96f59mr584717011cf.22.1738065497385;
        Tue, 28 Jan 2025 03:58:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKTSZUkwKgOmc86HrQqzorzRgdDmzYgCb/05m4RKf7CKbWvot+1cHZpQJRxGbwHDuwrI8kug==
X-Received: by 2002:ac8:5746:0:b0:466:99a9:c354 with SMTP id d75a77b69052e-46e12a96f59mr584716841cf.22.1738065497043;
        Tue, 28 Jan 2025 03:58:17 -0800 (PST)
Received: from localhost ([195.166.127.210])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2051362b1sm44408026d6.19.2025.01.28.03.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 03:58:16 -0800 (PST)
Date: Tue, 28 Jan 2025 12:58:13 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update drm/rcar-du maintainers
Message-ID: <wodib3ste3l7lsgjur4i4q6is6eoxxu4jazb7pern5yenwsyw4@np6ad5p5ofbp>
References: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>
 <yvdba4secotjc4xvyophckuroywx6nv35kusdj3off3dsrnxr4@7buakt7wvten>
 <e92601be-a9c9-4aa7-a250-4e3514202e7b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="nz4qsc4lc5t6os55"
Content-Disposition: inline
In-Reply-To: <e92601be-a9c9-4aa7-a250-4e3514202e7b@ideasonboard.com>


--nz4qsc4lc5t6os55
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MAINTAINERS: Update drm/rcar-du maintainers
MIME-Version: 1.0

On Tue, Jan 28, 2025 at 12:50:18PM +0200, Tomi Valkeinen wrote:
> Hi,
>=20
> On 28/01/2025 12:41, Maxime Ripard wrote:
> > On Tue, Jan 28, 2025 at 12:28:48PM +0200, Tomi Valkeinen wrote:
> > > Add myself as drm/rcar-du maintainer. Switch Kieran from a maintainer=
 to
> > > reviewer.
> > >=20
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > > ---
> > >   MAINTAINERS | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index ed86d884ee0d..5b1bf5fd56fd 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -7760,7 +7760,8 @@ F:	include/uapi/drm/tegra_drm.h
> > >   DRM DRIVERS FOR RENESAS R-CAR
> > >   M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > -M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > +M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > +R:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >   L:	dri-devel@lists.freedesktop.org
> > >   L:	linux-renesas-soc@vger.kernel.org
> > >   S:	Supported
> >=20
> > If I understood right that email
> > https://lore.kernel.org/dri-devel/096e85a5-30d9-4b53-bdcd-a70cde6baa4f@=
ideasonboard.com/
> >=20
> > rcar-du is now de-facto under the drm-misc umbrella. It should be docum=
ented as well.
>=20
> Good point. I believe this should be enough?
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b1bf5fd56fd..16af21c3a48a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7604,7 +7604,6 @@ X:        drivers/gpu/drm/mediatek/
>  X:     drivers/gpu/drm/msm/
>  X:     drivers/gpu/drm/nouveau/
>  X:     drivers/gpu/drm/radeon/
> -X:     drivers/gpu/drm/renesas/rcar-du/
>  X:     drivers/gpu/drm/tegra/
>=20
>  DRM DRIVERS FOR ALLWINNER A10
> @@ -7765,7 +7764,7 @@ R:        Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com>
>  L:     dri-devel@lists.freedesktop.org
>  L:     linux-renesas-soc@vger.kernel.org
>  S:     Supported
> -T:     git git://linuxtv.org/pinchartl/media drm/du/next
> +T:     git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:
> Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>  F: Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
>  F:     Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml

Yep, looks good

Maxime

--nz4qsc4lc5t6os55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5jGVQAKCRAnX84Zoj2+
dhmNAYDI5MP+ScIvUhwMsGGqQWPQyGu/TzTWDO0PMsojy0wyohVcLHkHCJMy2ubD
7qFod+8Bf0q0Wzr/F5h8mMzRx+KPNI5I84PVhUnR5j/zNQGxPwevlLAWxrIh4u8E
jiv9JJ1+5g==
=CMv+
-----END PGP SIGNATURE-----

--nz4qsc4lc5t6os55--


