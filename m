Return-Path: <linux-renesas-soc+bounces-16491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59772AA437E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 09:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E954E1BC55C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 07:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C078E1EB1AC;
	Wed, 30 Apr 2025 07:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0WKkgxv1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB2E1E9B3D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 07:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996690; cv=none; b=Y5viaDKWRo1OmRfe+1YrlIjWJVGWygpxHRqECbYz9Vo0VjmxjFOqT2hgc3VqzER4njp8mXHcbhw0nIVZAKESPhHRLmxiPpRA71CTUzjYGuxYohxbvr30b8cxTXN9zEGmbWTqBRcDOy7KxKaodFzXGyXqMVW9j0cpKY9SCv3pLy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996690; c=relaxed/simple;
	bh=DliDBaPwfXozR9TCYVsi8CN51+E1M7iE6MLi1rF3GZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QunZo6CzTyksHbRISPHIPdlLRtNGFQmp5Hz3mt6TL4WwAeF2fZoMtZ09+mzhkKO14b7SYavCbpcLBeDuVOs+GjooveGhyuw3R0YMZ4SZbrPCOPyPuJ6ffxtwIskmSwNVShtPprWGOr8fvBfNFp1iVUFnqDMQkicObNwEmC9Zxuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0WKkgxv1; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2aeada833so126839866b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 00:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745996685; x=1746601485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DliDBaPwfXozR9TCYVsi8CN51+E1M7iE6MLi1rF3GZA=;
        b=0WKkgxv14Zcl8y37utgeLeiT0Xvo0SV5PePR/CHTXPeNl+ccDnH8iUFdLjrHApJs6w
         K1E4KDwunE4Oa1YLu1Lzdb9Y6dOClmsXhk2Ih2fWek06BgL6fvb0z2r5ICVX9Z0jehD1
         4Z0kvDZAVojGLEeIk9XXmZ3OS42a7tf+7Ok/45YLlCaY5KBzftGXfE77bTbVb3hG1jK4
         MMztDa2Iy4/+M3vSGOWvJqKpzK0LwcxmAqGqj4DJ76Qzfo1JjhLtwEp7exX8psM+JN2V
         lUZZohnFhqUnsW2Afjez4M1OnX+CW/WyFVTU8rh2cGebRhVWwXnASoG4lnib9qb2TABi
         omUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996685; x=1746601485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DliDBaPwfXozR9TCYVsi8CN51+E1M7iE6MLi1rF3GZA=;
        b=W0NUkYifokhNU0kTCdZXtwO4n2mIDMH6CBt8Zr3v+fkTxJAf+7oE3XLh/KH8I2u5Ob
         mIs7gzWitZMecJzDABiLeVzcvrl+xljObDBR0NtU/XCBzqDXDHniZCt66zSeSruqaTp/
         BfPlo2pqLEtFxPPju0oMBM7n5Ozz5SCzeWR5SbuGtpNloMWq7crkHu8GqvhV7zBubjq+
         sjoPP2ffbVtDXhdnfXzdHplMDwaAyoOl3hgXWVG8s8TDxct93jcF8B9H7IK/ulR2UUTh
         ddPzl/HrggLavUslBtCr7TK4eqDPN7WUUjEV/7Wd3rsRTbH86E11IiEMujLjU+8ZRvpU
         NNSw==
X-Forwarded-Encrypted: i=1; AJvYcCWWq3bg+46fCR8jesYWRkd8aLoeO6PfePyRZckovazdqjkiuF+bUxZ4O1ekTHn6XGzi2pP+RrPKs2VUDMVXpCoCnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgoEuGFFjS5JR1/M3N8URuYw1JyrDeuediXd4jUP5xh/fdqNcJ
	KW8/vf+M5crDYwafHjTTlWwvYrJG48yFsZRKcUjlkMsRs4vdk/jUbL35wvTCSsk=
X-Gm-Gg: ASbGncs9fCP/pFV92GDd0OgGqKp7p2aSe+Tv6SWU02U9VZILbqk2CGVPg98GnBRTTCk
	FIvWBQyPiwlumcjZJtVX1iFh4x+2JZSGPYTJkjhG2P6iaKjjAMZpsSftDCCfS1nv1DxV196iHH2
	FouGFYCJRjUgG+A86Tuo4cvF9ezNAglmgnPfxz2Muek6yER/J7XfBqteMdlHup8PClfbyrPzZZw
	nIR1vlEd9HL56NSlGI4WBC3G8R0tsza+4LyoPvJKp34HXDC0tls/6hDLQiDzhcnbElGdCAmxv+P
	AwOS0b/B+0y6ygnhw1K691z6FJCbxuHfCcoN91oyCELMKQ==
X-Google-Smtp-Source: AGHT+IF5UaKQoZiFL7ypbKizIsAV1ViA8f4uPncCqiHK6CsFx8TsrrGdOLE9wJ3L9yBLAnTQKJpNLw==
X-Received: by 2002:a17:907:7ba8:b0:aca:d276:fa5 with SMTP id a640c23a62f3a-acedf349707mr166476066b.0.1745996684937;
        Wed, 30 Apr 2025 00:04:44 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6ed72826sm879848966b.154.2025.04.30.00.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:04:44 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:04:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] pwm: rzg2l-gpt: Accept requests for too high period
 length
Message-ID: <3rew4duwpd3wnmnkbbhcebe6jat44gpqfv4vnsrvunksujq4b4@k3hgsr5douiw>
References: <20250423095715.2952692-2-u.kleine-koenig@baylibre.com>
 <TY3PR01MB11346A3CC284B74692130149686852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oy5vvrpaw4d56eyr"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346A3CC284B74692130149686852@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--oy5vvrpaw4d56eyr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: rzg2l-gpt: Accept requests for too high period
 length
MIME-Version: 1.0

Hello Biju,

On Thu, Apr 24, 2025 at 05:45:32AM +0000, Biju Das wrote:
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> > ---
> > Hello Biju,
> >=20
> > here comes the patch that I promised when I applied your driver patch.
> >=20
> > This aligns the period setting to the usual procedure. Obviously only c=
ompile tested.
>=20
> It is tested with [1]
>=20
> [1] https://lore.kernel.org/all/20250424054050.28310-1-biju.das.jz@bp.ren=
esas.com/

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
with your Tested-by: tag.

Thanks
Uwe

--oy5vvrpaw4d56eyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgRy4gACgkQj4D7WH0S
/k792Qf/VV3Xal+1tsQNf0Fn01SeeWBS9bht0ZsCnLj2VcKubf/CUBiES+jF0Hw8
dK/azyRrgYGf2PvzwvCWf/yGjngIuFExHxn6r70cX0U3WoOQk85I0CL1l73U2exP
uZIDd8ngJhxes3yeirVXU+Pk6wXhBqx1d4iaRCxy5cEVpb9JXM4VnWX3ph2Mb0Uv
r3pcQ0of5S5DZyxy4EpjFA3KDXtz34J18zjYMGFZuV3TV1AnNUE/8zvJs+8DaLsB
P1FHVyQV9cf0J4kI+f3l2yH+zDOIR/hDwQfPUiMt2UHz/YOfqE1rLQsR0T8Pzyy6
LcXi2oAqObavOi9yd/8XX1GnDLhSIA==
=MNCz
-----END PGP SIGNATURE-----

--oy5vvrpaw4d56eyr--

