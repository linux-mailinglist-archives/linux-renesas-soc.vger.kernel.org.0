Return-Path: <linux-renesas-soc+bounces-12630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DDEA208BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 420991888493
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB7B19DF4B;
	Tue, 28 Jan 2025 10:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XRXzL/Hy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC40719CD01
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 10:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738060870; cv=none; b=PFmaKkop8zFMzt6dyFzy/5ShQXWSFgW52cV9V37T8NSq40oqMOPV52RrGlLCCSKrxuZQvLDhNsnXmpXPDpjZ/H/jaSFE2z18VE7KeiYb8Z9T9LnkaZB4sR/4VfBDGmuT8ZZcst2d3Up9piTYUUQz9+z/jvb/bAFdk2Qq7S245Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738060870; c=relaxed/simple;
	bh=uqbXo75GN05HAp7+Vw6uD19Imfs93nKWFSAJaU5jdkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSnO/rks05qpasZpLSHgPLYT/0nDpTG6k9XYDw7WzLokARmFHRA4JaV/DH2riwWOAT3/r6VOOCX/9kgDjVXV/hP4cD7yhJfNC5vloFz/hCBLXhlbp26SqKf8ybVF5yraTXc8OVIt4R0ghbLRE+724HhzBm07C3kK/h/qRkJ1FCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XRXzL/Hy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738060866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOl+eQpwIrdLHBYKF3lTvbfellXfiEJhREFnwjWw0M4=;
	b=XRXzL/HyXrnzfWKY4HtkxMCi4cbA+x6UIfQxeXpNTXIxw/jJIKHWUj+hEGfjw3Bk9qo5Y2
	+dDaSJjyRbC56N1zE32iny9kdDkh13uxupbjJ/wNF9BvjfSLkFD1y2Iz4ynmf11728MDbj
	ZQDjI0hmCHbceXJ0B2fmbpbsG9m8l/w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-rbgNATxpMIuqS3mgXz_V6g-1; Tue, 28 Jan 2025 05:41:04 -0500
X-MC-Unique: rbgNATxpMIuqS3mgXz_V6g-1
X-Mimecast-MFC-AGG-ID: rbgNATxpMIuqS3mgXz_V6g
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4361fc2b2d6so31198905e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 02:41:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738060863; x=1738665663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOl+eQpwIrdLHBYKF3lTvbfellXfiEJhREFnwjWw0M4=;
        b=HL9mv7mRTIX6JDDR21/49gOx+5bs3t6Q0q/FUCUmkQnzR9bCWlh+hC/8xZm2X64F81
         bPqnZcIBRuFlGLVbBEZmFwTMhjkcIDmeqMVQVoMexnkA2SuhaU8V1+KecQgtumkWyuk/
         VsKAvZ2hx1cG6B/VWUD363BzM72Zt90rOyGkwZiAI4dygNo6QKA0awBmMsR+nW/YdU45
         2GHTJglvHQ7w8c1k3cUCMaV+w3N7fTmua/mlWJJYnx+6LTuZXyGID7dt2smWXeB0rrti
         UHWTMS3oA38p9y3X5rI7CGboYeNACF4GZGv822V30eBUy+hqSSqSvHHsX+G3dwYEh5xG
         3o9A==
X-Forwarded-Encrypted: i=1; AJvYcCVlnJaukvRfuINEXR4I3xlb4GRbTr+S4Mga0J7WyeLTy/nQrye8+gg6J4KX91eeWIdjwPSLKHTbyUweGA3LwwSt9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHQ82oimi0n2hwHDcDFRNuEXfzFrxd5sLirIv0arFI/6Nf7FsR
	wyadAulwdp7Aiu49nE8vTbFj85uwaAVptL3j2UJBd2m6RG+qguWRc2dEAbpMVUIHiTG+sTTBPKv
	THSRmKOMm/hG7ZIIq6rmYZKug2xzExRGBPP23lsSxh1CZL7FOSWB1lVPjwjkZwq2tAB6E
X-Gm-Gg: ASbGncvkua80JewiO17G2cF2uC23jEeZ1Xplgdp+UxbnTPk04sxEW+vUNiY4/Fm34Mm
	mMhP6xCToXKjAwfRQ+1H7hkemK7EN3ZDsuDnBPhurVkkqP1AIbRRPjxkbOwy2ZqHVS9M/TcAxCu
	ipmjOU4TNYxqf8hUCTnVwDvc08JztFF3KjQVNwbB0jA/LRsbRyHkkkjY9yQh2nF7cxLjHz64+we
	bddZhXW/kG0QBmudWz8KDxU1mGXf6+4Q/omYSBEt3YcmGMFSaw4T2hKr10gG3P9xZbaTm/O9u4h
	cg==
X-Received: by 2002:a5d:64a1:0:b0:385:df84:8496 with SMTP id ffacd0b85a97d-38bf56555cfmr41944331f8f.3.1738060863419;
        Tue, 28 Jan 2025 02:41:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhAGXomgjS5oC2hRgWmOZgruVAFJJ6uLnpnviIihUjKOIMMVZQTuHLNhTQFbcQClr3d9yJWw==
X-Received: by 2002:a5d:64a1:0:b0:385:df84:8496 with SMTP id ffacd0b85a97d-38bf56555cfmr41944304f8f.3.1738060862996;
        Tue, 28 Jan 2025 02:41:02 -0800 (PST)
Received: from localhost ([195.166.127.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bbd93sm13793498f8f.76.2025.01.28.02.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 02:41:02 -0800 (PST)
Date: Tue, 28 Jan 2025 11:41:00 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update drm/rcar-du maintainers
Message-ID: <yvdba4secotjc4xvyophckuroywx6nv35kusdj3off3dsrnxr4@7buakt7wvten>
References: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fmcip3tqxlxceqwp"
Content-Disposition: inline
In-Reply-To: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>


--fmcip3tqxlxceqwp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MAINTAINERS: Update drm/rcar-du maintainers
MIME-Version: 1.0

On Tue, Jan 28, 2025 at 12:28:48PM +0200, Tomi Valkeinen wrote:
> Add myself as drm/rcar-du maintainer. Switch Kieran from a maintainer to
> reviewer.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ed86d884ee0d..5b1bf5fd56fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7760,7 +7760,8 @@ F:	include/uapi/drm/tegra_drm.h
> =20
>  DRM DRIVERS FOR RENESAS R-CAR
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> -M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> +M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> +R:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>  L:	dri-devel@lists.freedesktop.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported

If I understood right that email
https://lore.kernel.org/dri-devel/096e85a5-30d9-4b53-bdcd-a70cde6baa4f@idea=
sonboard.com/

rcar-du is now de-facto under the drm-misc umbrella. It should be documente=
d as well.

Maxime

--fmcip3tqxlxceqwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5i0PAAKCRAnX84Zoj2+
djKLAYDWB0cOYJctbYZ69P0K6ttt8S4aQT2ykugYrOrdCCC1E8UI0imexRac/X/O
k6UO5E0BfR2bwQaSeFTD1qEBvWRdrlCjlFFSTO/xW2xr3J6qQU4PLWUsC9iPeITU
s+/XFRAeeQ==
=ZfXR
-----END PGP SIGNATURE-----

--fmcip3tqxlxceqwp--


