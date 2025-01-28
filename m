Return-Path: <linux-renesas-soc+bounces-12660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB8CA20AE2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 14:03:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EAAF3A8A71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 13:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BB21A3BC0;
	Tue, 28 Jan 2025 13:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c1HZ53Yn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7653F19F104
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738069373; cv=none; b=TJw62/rThyM87sZ5qAwy7njbQWdqG0ArNNo+5CDdFzbOvymKdwUkuIZD+T9fCFZU7w0BuaByN9/F/xgNxwsxnuVXrqZtIFGVDEMnpZBI8J/CI8PIoTLJIFw7F+qXF060O7b4tWySdhHe5R4Z7M1kulq5BblA4ylauZsfnba7p8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738069373; c=relaxed/simple;
	bh=oodYKvxUNFsCTFAanBPwxkTbixj54TmcCinXiwdG1sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFgTJ7yKN1ozrluFBazp2KXDUIdUv04l4pZMxTND4++kQJvlFj+WENRCL1XnYQFdimWOJQFxAH8tXFYmUkp9ELqd0Fmb4VsiJmwO6T6PMPZMfJ1tL9wmydTGu6tZ5nRuBBXNENmsoqRQbnhmXxi9HUG3HPB5N+B5N1SJrRpVbZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c1HZ53Yn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738069369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oodYKvxUNFsCTFAanBPwxkTbixj54TmcCinXiwdG1sc=;
	b=c1HZ53YnxuFC9h0OSoToSjbYQcayLDzyGWis1SCA4f10QSvzht7UyUURskOPveL0uMVVfd
	ZIH1vi/ehjsIm5lPuI0nq62Rzn/4Qs53pCN/o+9/7+i8F5Ru7bFAyI5kwV8eaItXvTNKo6
	Mz3dzh8MTwA0YtB6KAlOSZkgs9Wiu18=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-YwLsP8y2NaS6wqK3cHkAtA-1; Tue, 28 Jan 2025 08:02:46 -0500
X-MC-Unique: YwLsP8y2NaS6wqK3cHkAtA-1
X-Mimecast-MFC-AGG-ID: YwLsP8y2NaS6wqK3cHkAtA
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8f6903d2eso95275346d6.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 05:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738069366; x=1738674166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oodYKvxUNFsCTFAanBPwxkTbixj54TmcCinXiwdG1sc=;
        b=c4LFNc6Y2afZUs2kD/84F5n4dNES8ovb5muKp0o6oSnwmLtgT1qe/R8h040G5BNwoR
         +1bbdvfNx0lvm6/duIBVbs+YoFNR4duWmYJRFYgwTgJGJN5DUdMWZLrdX8gE5MVaRUNh
         AlEsMN8ECrVymxli36eQqFS9cxX/xPUP6GjQ/ugXQdXgXwjTH+sXZs2vbqbIXjC/qm16
         SKI3II7YMbaBV0UK2ckagGTZVnIV1cIr+V9qYgKZQFc8O1U8xaFg7CPJzXs8bZ0SFB2W
         nmSRDPAlLy6R3HUrubA3K4bq6mZ790IcK9COvi3cqN6KdcGKQkNdHYbjmo9q3SlSnRm2
         6kqw==
X-Forwarded-Encrypted: i=1; AJvYcCV5OASRMPYX8x8JX7jLysU9Fw6R1LWrHD0ipmWMEzCfC6YjNbbaEyaAQtijjj/kgDLb4hUxomvRp+U/6NJBYNroKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbu1j+wcS/wARj6gb6vbiUFqC5vIuhm2FvMkve44JvQdiXvZRU
	4rRR6TYecNBTY7eyHvYTR29eMoTAlXIOaID3TusgoDvr0OX2cL3c0bRMTl+uxrhVLFyHRK6KwUg
	swg81o+l/LeVEWurUuvN8rkBdkEsr6P/mk1X++AXlulHKNQ5Tu30AmGUiAusWKuFJVDL3
X-Gm-Gg: ASbGncsVJTqf/cxoKAon/TE2xT1ojS/Rt6Uq0tkmNeMbclvA2YSPWn3WlBsiMTu/PoW
	p6I4Uem/1vUZK/HOtjx+/bBxtf+my/bDRafD91zfUvwuBl9QKMvIjJcaSyg18b4oa411Wrfpe5q
	af5ujAwjmmkAXWqUDiqPySeXG7SI08+9jGSvloYoOVOWUJv+qYX5SLaK9J16JDdD6dyjX93m66L
	NPfkfUrMrTGsTCg9gbdo6R7IHhZzDdmQIFsYmWR8e2raIgcdX+XmICbD/Eiq4rnfIDOvvCW+sut
	7w==
X-Received: by 2002:a05:6214:1312:b0:6d3:f1ff:f8d6 with SMTP id 6a1803df08f44-6e1b21dd1a8mr515957566d6.40.1738069365965;
        Tue, 28 Jan 2025 05:02:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG74qMxHmpqIvfDEvBlHr0mowM+wIcCWTJFUEyHI9MoT/uQSWKb7Lkr30VZvE8sk2nB6SFvBw==
X-Received: by 2002:a05:6214:1312:b0:6d3:f1ff:f8d6 with SMTP id 6a1803df08f44-6e1b21dd1a8mr515957046d6.40.1738069365497;
        Tue, 28 Jan 2025 05:02:45 -0800 (PST)
Received: from localhost ([195.166.127.210])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e20525e3dbsm45169586d6.67.2025.01.28.05.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 05:02:44 -0800 (PST)
Date: Tue, 28 Jan 2025 14:02:42 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2] MAINTAINERS: Update drm/rcar-du maintainers
Message-ID: <b7ifg5jr5bsuj4dfcgyx4a2oaub4hxq5picxbho7bbl5634woe@wfwyd6k7eacd>
References: <20250128-rcar-du-maintainers-v2-1-4a3860a3e1ef@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="j3flvmbnmk55qa6y"
Content-Disposition: inline
In-Reply-To: <20250128-rcar-du-maintainers-v2-1-4a3860a3e1ef@ideasonboard.com>


--j3flvmbnmk55qa6y
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] MAINTAINERS: Update drm/rcar-du maintainers
MIME-Version: 1.0

On Tue, Jan 28, 2025 at 02:14:43PM +0200, Tomi Valkeinen wrote:
> Update drm/rcar-du maintainer entries:
>=20
> * Add myself as drm/rcar-du maintainer.
> * Update Laurent's email to include +renesas.
> * Switch Kieran from a maintainer to reviewer.
> * Change rcar-du to be under drm-misc umbrella.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--j3flvmbnmk55qa6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5jVcgAKCRAnX84Zoj2+
dlO7AYCQZDiLhoNK3olJFcuMqvlmcf39WDuiq/0soxNhjEQWggrdFC4ibJiPYnJd
V730Z5YBfjvjqXXr1B9GqU1iXVyEMNTNMydLfYoZkXalkLxWKpfWzHh4eMKMFT3+
C0fJxPgEgg==
=wc4o
-----END PGP SIGNATURE-----

--j3flvmbnmk55qa6y--


