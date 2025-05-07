Return-Path: <linux-renesas-soc+bounces-16764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EA7AAE59E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 17:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82CC51BC1074
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 15:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45AB28B7EF;
	Wed,  7 May 2025 15:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQZ4yLPG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3DA19CC0A;
	Wed,  7 May 2025 15:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633246; cv=none; b=QQSHd5boAKaYJ9rZqGSFcFybJ23KBjn0ZaBSxCnlFtSydCnm3mV4XS6TpSisnhRIcpbc0s9eCeJGFACNvepU7XJY3VCPn74cLeQ7GNAcgKnbOV4uuGgfMDJiul5mGXMIQpEMjBiPHl/9tSnZeKNIGDCBol9bdLMZx61DoXUNt9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633246; c=relaxed/simple;
	bh=FiJHAfZ+yVpim75R36uyuFbuufLfv59D0x+Co4bmIII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8coSvgRQpj48fDzQJPD5miTVT1f7vDwTRJa47CTbOQby6EkIgoXlKiK4V61z+t0Q8ru222/P9IQggdkSLa8l5oDM+Fwl2Jf+NdSPsEaL3nLCQaZ0ftc8B3RGkGMQc3mstREcYr7yjfDHiqQ0KKfwFqvRtNlr18t6Di8WT7vZXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQZ4yLPG; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso94973b3a.2;
        Wed, 07 May 2025 08:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746633245; x=1747238045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PwsuT0/5Q10KQpJ5EjKI4law/hPOTFepZtSDV4Bjl3A=;
        b=cQZ4yLPGq1whCr0w/c0dqBclrgSI6GKs4W2f680UfE5N1OVzg67o+XGRyaXzEbix2y
         kBwdjB1aLOSK0/YYPXjj9CUftTDtlwMm7L7bJm7Ehul50YEVmX0VkmynAcW1hWST+9rG
         15f3Xt4WnH/C0KAxtq50diuB428HMGvDnxzPZ9vOEX5m6G5ED9SRVrLchmfDxtaYPZ/i
         bHl+ru9n1vMHuFGrqzEkSVGwSe1UzNw0BtIukTQBnSNrZxyBA1WMWiZd06Beum5HepmT
         Atkyo2FmwISMi8+r7eFEs1V/eVW49Z4vQ7Jc1s+Go/1DHzMcLElGdIJ0o+sXjIMiYtMK
         nGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633245; x=1747238045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwsuT0/5Q10KQpJ5EjKI4law/hPOTFepZtSDV4Bjl3A=;
        b=jA52E8LSG7U02ea47CWfsTc33Yb5YVwvgwlln5GxQ5RhX3VVQhrvIU9pqToXOyoN21
         O4SzOyNUX1cw2l45pUKqSCk60sSgCyPqgXNaM72YzCYDufelxEGDjRRUiXyTKh6t0OlG
         tyR/9xnKbJHdHPnu0cW6tTCC7q6vRwNeRyh4ysU+UHV89X0cKK8qBkxWgtkBXbrbV0t2
         08Lmrlu+fEp+bE24O+UK1C+R9SwNlL1e9p6TOFIwNRycdZbAydKwFQ/hyzF3ZvuSf9IG
         Cfs38ZzvGW+OXd18EEmYLLwOQkBmzZ2Hbo4cjllafovY0AaCRm1ZlSDgNUMQ9P14Gyxq
         7D3A==
X-Forwarded-Encrypted: i=1; AJvYcCVhAMqetMFkgrJjh02NYoe2KQuzCY1nU9n1DzGARD4Dt+sQMg/FHJRKdNtqx+EX3YYAWVM/lC/azG1WT90=@vger.kernel.org, AJvYcCWcuRs2FPtDBWDSka1GR8e1W7Ecqh47nsnttvwZolZDQNxvgxSYLVfJA/SytuKkPiOChvmFDAN9jVkDnkceYyQnqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyMBk4ykXiK6ODJ++cLbRp6unFnwpiSYHtqPDj58U/9GMZKrZb
	o6MBjdjO05K1chdU2DvOva1s3TvW9z4r8qSlPulkNthSo1PNnxYG
X-Gm-Gg: ASbGncvtuz5lOLI01Gzc7d8DQPRoWoj6+ZPW8tnhbhT4Vh48bSPxBkhmCrc0AChWCRr
	MDk329AdHKuRi46FMIW8RopUqpxtz+iYw0UuM9wNxRgPv3TBVXAtQRQayBKL7/laIw/eIF1CKXx
	OOM6zspjGy13bsGy+iGnwFj1YazCxSGkMIT48SeklsfsGOI61PhtUowRCBNvjFWQRkkarsZRLai
	RMchKn6XglWHhkjej20COqb0kYOgrY3eeAwliQW1/RadoWRmBteNAfj8HAc1lxY67BjyEiNgW5S
	93tf+m7K0soMRbOrY2iGt/syK/6qgnOmo8pQRnpDqrDlg7OKis/FzBffZXSFMdtJGhJVYTrcmEh
	EM9219h6aSEmU4GPpJVFLjeIoPSRCkdf5MRCaYA==
X-Google-Smtp-Source: AGHT+IEuvtbD2xrTttYuZK//gpyc/17xsheEv8eARmmN44SmSMU5YmLjVF7lA5+rcn+D30hr+MjJqw==
X-Received: by 2002:a05:6a00:8d8d:b0:740:67ce:1d8b with SMTP id d2e1a72fcca58-7409cf002d4mr5091749b3a.7.1746633244590;
        Wed, 07 May 2025 08:54:04 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020de2sm11735273b3a.103.2025.05.07.08.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:54:03 -0700 (PDT)
Date: Wed, 7 May 2025 17:53:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mark Zhang <markz@nvidia.com>, Dave Airlie <airlied@redhat.com>, 
	Terje Bergstrom <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: rgb: Fix the unbound reference count
Message-ID: <in7leokkxlp35zivwov5wsrnq6ma64y7lz26dqmc33flvnfi5z@e3jhlbaw45sb>
References: <20250205112137.36055-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yk5pmumn2geczhqp"
Content-Disposition: inline
In-Reply-To: <20250205112137.36055-1-biju.das.jz@bp.renesas.com>


--yk5pmumn2geczhqp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: rgb: Fix the unbound reference count
MIME-Version: 1.0

On Wed, Feb 05, 2025 at 11:21:35AM +0000, Biju Das wrote:
> The of_get_child_by_name() increments the refcount in tegra_dc_rgb_probe,
> but the driver does not decrement the refcount during unbind. Fix the
> unbound reference count using devm_add_action_or_reset() helper.
>=20
> Fixes: d8f4a9eda006 ("drm: Add NVIDIA Tegra20 support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/tegra/rgb.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)

Sorry for the delay. Applied now, thanks.

Thierry

--yk5pmumn2geczhqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbgg4ACgkQ3SOs138+
s6ECWQ/8C5jlayoEY2mhnLYUD3/0J8X5SVRkNvansWKAYuO3tgJwdQHGmpwQFQwT
xtTdKlsH/E8Mkk94qm5VxwXzPJrY1mC6xvxSI0J/XSNN+o8bauoRJCipzrcTIv9q
RGSaMk6yFyO32xa4RMDu7GtwaJpGOpPS4V8OPbAxURuKUDX0NFc0YxUb06T9ssJy
Eql9TZu98nWqTrrbHsnHdNkwzQFUalmvE+zuoiMmukwT0oq3k5RKKTJtiAaweWtt
rjNmnIunOKL7GAJ6RKuoSJEs5Bj0/4QR0pTaOL6tJh54YECBS2Lw9k08+mQ6R/8D
67dG1DzHYhUifc/D4RxgTj5TZi5NoP9C0GqE3J3JkNLR/3JGs5vvx4LZsxBC7e+i
qTxv5Ah1N7oj8WIC9h/7MEWtrBWitBkNLz6ujXiFI+REZ42AA/HFDMBPVNNIzFkR
OSE/uu8otOQLhE/gzG2w8rWq0Jri1hm4f0gWvATkt/t91LfF5GkbTQiVxfINf/Zo
P86GIm2wf9TK3n/oTxX0FfdE8NcGCwA0A7JRtIvvD87jBZ5tJZsLclCGFTHEcekL
xfrWKrWFdMIj2WTeEvfA1VxWN29OGOFlI0A0oHsnZsnEtmySmRtvzd5vySUXigW/
EmxyaQVnHdRQAA+0v6l4ddIVflFJgtSV7ejljZ/KkbMZiizofCI=
=KKl+
-----END PGP SIGNATURE-----

--yk5pmumn2geczhqp--

