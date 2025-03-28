Return-Path: <linux-renesas-soc+bounces-15030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FC4A750F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 20:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA6A416B8B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 19:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DF9E545;
	Fri, 28 Mar 2025 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9C/+upz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE69440C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Mar 2025 19:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743190887; cv=none; b=sc/dl0I0p/14SspBLKbWXN/dew8lmcVS6WpYAALG/odV9qiN+YTLpuyW+uVq8xxe1ERh/Bv4GY4XSkgcPIFBl6tajAKDRT98CKC5xwA1JIkCk1aQL91zQBpq8za/yy5n5bjHVP9mjSJaaEV5HZmYFwm3Kn6YSGdF70kAvuuxn7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743190887; c=relaxed/simple;
	bh=45d/1BDMnAJXH6dDxr50zSKQhi23vTgIPjOYno++XN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U7RMawayN/Cq2u89PdsdyrP84cSNFD1iTC7n27B1lzFNhcNSuaHyJ3/VnEgFs5d6BOhhPp8xhsfAgvNVo0+GBja2l1jPSBXhp3kPV9Tq9Yjp04Azhw7VXEUDBeQjIsmMaA/jD8XGCcNMuM5OfKJOr5XLJM9S08ssfqbVpOjogvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9C/+upz; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-523ed8ac2a3so1183709e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Mar 2025 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743190885; x=1743795685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NoPne95PeNRqfSL2kQ5aRNc23KzqX62VCe2+DAeJpo=;
        b=h9C/+upzHy+H9Ne5oyYAJb4wdOH+amZDcy/aMN5403z8K6AL1gyPzfhHHbuJDfPw4h
         ovW2WUDb60ivjP37qx6c5iaNXqkKHxET3oS8R9fZ0UINDzSyddObWWE0OQv0NQenzSno
         lHFhUrmBBFS/VLPkLKWMQdnjGoxZlFnHOyLiKLwgu6+MThAF41dKHyosXqirWiNXbws3
         5F9hvwDhO8YL4NZg84lOeBMNZ+v4PuWxIC2BWN7d3oIcWAKmZCaNUBkrBi3HB0p5PB92
         P8m7puPu/cGZH4yGsDkmGAL5KdFkub4ZhuzbU3sBtmNXdo9PdDznmyZF28g5QObHUS1g
         /WMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743190885; x=1743795685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NoPne95PeNRqfSL2kQ5aRNc23KzqX62VCe2+DAeJpo=;
        b=Eg0vr0GrsgwsPKMGkxsgWOlyLitp6K69dfb0BqX41T8sUpv7uHZ6CrJv6c4o5bSfDN
         9znVC+P/k7CaTqW2o/c/sZRjbyzgMtdkzHJ4KiXh8zZUEOjBaiUOSSt5lBUNZ47TGmlz
         oDhVk9FO1oOa15fWF9uTDA+TpR4uxKsGcgkINqOz5TAOqb3HFTE/b1HluEwk0fQXdsUh
         zy68ZmNMT/hk3F3ZAHbLdHx8b3nJiOoQlObELJnLx5VzzdsARrz0LgamR7FBCz1cRscY
         wy4h3Kulfd/3R1Gyb7UNlFCPAMvSx4wzf1Nf789rkL2yYpHtZ3nWgveUdTJxtIGN1uSC
         VHSg==
X-Forwarded-Encrypted: i=1; AJvYcCUX+mqIKl+KhnBXtpcXvRaA1RhH7a9CcPKaVBUjA/6l2dE1USvEQUS1VSfIZs0yuwkoqYgdLYSGmpO8H2nDYRXb9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPNStumE2Mi8Zv18E/npCc53kIzS6X/HuWRMlaOOLllji3mWkB
	iJarUTZ4w8mSQ4KqhSr5WofBwyPI7MiLKI9wywNHYN930BMqLMPlxlE3+1OLIN4p5VTbev9+f7K
	c6MBhHf8Juvgh8DH2r1OPDJoA098/b0jZmdg=
X-Gm-Gg: ASbGncv8ZcIoqjxP14QEmmixxf4j5nMgsfyP9B+N0Z4rhGAtX7AECqWx2nt0SGCKiz5
	l+gYrVrDMZ2ZiJEZyY1J0DT/l7X21peNtfdi8mJr817xpQOJSgVLGG3EGUDTEb/x2j1GgccV3ii
	zlfTDsDWyBMxd9+tYFk54kZtx7OQ==
X-Google-Smtp-Source: AGHT+IGu/2M/u25bMuHp/7lCn90wiE8VZXQ9xoSz1IRIii6UCJpoMMadrwmisI65aizqNBNXoTvsotIsZHDXeDFJWfY=
X-Received: by 2002:a05:6122:2510:b0:518:7ab7:afbb with SMTP id
 71dfb90a1353d-5261d4abd25mr667685e0c.8.1743190884643; Fri, 28 Mar 2025
 12:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321104615.31809-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20250321104615.31809-1-laurent.pinchart+renesas@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Mar 2025 19:40:56 +0000
X-Gm-Features: AQ5f1JqHesO1v78XwaxcUxGIDj07x9EfJkMKbiIqWamRzhZMu4oJqeTf7G6F1rM
Message-ID: <CA+V-a8ufxNEa416CpDX5+hHyJqC+Bb44Fqr=xzTu4evpCZq55w@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Support dmabuf import
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 10:46=E2=80=AFAM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The rz-du driver uses GEM DMA helpers, but does not implement the
> drm_driver .gem_prime_import_sg_table operation. This  prevents
> importing dmabufs. Fix it by implementing the missing operation using
> the DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE() helper macro.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
> Kieran, would you be able to test this ?
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_du_drv.c
> index cbd9b9841267..5e40f0c1e7b0 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -79,7 +79,7 @@ DEFINE_DRM_GEM_DMA_FOPS(rzg2l_du_fops);
>
>  static const struct drm_driver rzg2l_du_driver =3D {
>         .driver_features        =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_=
ATOMIC,
> -       .dumb_create            =3D rzg2l_du_dumb_create,
> +       DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(rzg2l_du_dumb_create),
>         DRM_FBDEV_DMA_DRIVER_OPS,
>         .fops                   =3D &rzg2l_du_fops,
>         .name                   =3D "rzg2l-du",
>
> base-commit: 9e75b6ef407fee5d4ed8021cd7ddd9d6a8f7b0e8
> --
> Regards,
>
> Laurent Pinchart
>
>

