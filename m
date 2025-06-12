Return-Path: <linux-renesas-soc+bounces-18191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE4AAD73DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 16:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7065A168846
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCB6221FAA;
	Thu, 12 Jun 2025 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0T+YGRO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE333221F24;
	Thu, 12 Jun 2025 14:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749738640; cv=none; b=TnQWEkFdY0Os0Hs9f+VvmHHrMpxhlyOP7Hf9XFIb5v+/Jv24RWtO8JIhsOFv+mTsIWYD6u/hYGhiUDdbGo31uqBPw9qdMZSMyF4kJHyAGMhe0ONC18hKCYzZ1wylXhZ8HD3ww6Zxkb6QgyTjrHMKbNzopPpHQzna1EFTew+htyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749738640; c=relaxed/simple;
	bh=k4uWzVdRYDMdBZiiRrvwlRqvPSWr6hYaKWzQ4Km8QcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCznEx8zQf49eyPTrLMyLidF0CiEWRGNowPZjE9kbabRerRsbsb/CdJB93ukFxW9Qi+chCIMm17mtrlkYMlnEVKDf1/KpM2g4Qcq5BfQEU6gGXqtnPqtXiy0w535LTAsEutAt4wTwIbgqTnVRwGLgtPwL334EMiY0XSYHdeJ0F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0T+YGRO; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so891491f8f.2;
        Thu, 12 Jun 2025 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749738636; x=1750343436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=icfnPJxQK+6jhDwUzz9Y3fm8tV+truVzDKj2VhFlMo8=;
        b=J0T+YGROwy4u5hMG75Hgx+ukfGNM6v0AXFn4ev3CltjYCijuY2BlLVoD08RShpFzaS
         wv/C0QTVP6+eObaSzxrNH3TIx/AgZ+wtK51cycTrXa1oND788jlRIuBZf6O+13RNqNeB
         R+3gfBDjlR8sK5qYHMhAXJgB0ZaZocKi3OlCEovnedj1zyy9l7+ciY30HYU9+FVWEb8G
         zfoqjV2KLj+m5+AX6pwOZqd4bm0mIzPJA1IOL6eBSu79jtQWVl/xniV7CwbV0/3EKqa5
         lX58QBPbuTEByZdfrN4BGPQlc5UNOlZR3N3TREaI9/pZcnr01RrmMuF2jc9oOEn1LTDi
         OopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749738636; x=1750343436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icfnPJxQK+6jhDwUzz9Y3fm8tV+truVzDKj2VhFlMo8=;
        b=lzwWYBi3OW2X5pzoptlnW6cZ7NLZaxE8dWqS5SaJAn+DpTIYcuTL1cZVMSg1g1iXun
         S0U9f6r+1rdzt/RKs2Gdq/l2bX9nQzwtDwXKi1AeFfnMA3V6091KJyItaeGmL4JnoSzi
         mJK1K118Gtg1O6uVU2ahDuuPwReFHgIAJFOPqieJxJyLugb+5Kh//5quHD4x3NFI358H
         BOipLj8x3x+5bB32QmVV2CEBsVCY4KAWx7MpGLXvcIS1O8Hya8UnDFqhZzonIbUc/4Hl
         Hb6Ik+oX2mthD19EkKlXdFu0NutQIEZ+pM39tlwLtNyNT0ZIX8barbKRFebggdPfLlNS
         uc0w==
X-Forwarded-Encrypted: i=1; AJvYcCUYLjHImXWcJI0qIkGkg8Ii5WmvAxjsgrmoiDlc93Pz3mumRtlxugr8Beo0Yr2WjmWvjziePRm4UgivPINH93ueuOY=@vger.kernel.org, AJvYcCUwrDebA5bdHr9qHOIUAQbkLq5OFP0yTYIm8ySUt7WOpYM8gbfMA2/NNZH2bzoIP1NsTZs5GvYfAXTMV9c=@vger.kernel.org, AJvYcCVTKpwOzKgyvMrQYrfWmbDAyuU1YAVZ4+ulZUFA1FDexAQGkl+8DA852HxO8SQat8TnPSK+jzvJX8Vw5ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRrSEuXimByQer/y0tmjeiZ21rwEWRJf8sxVItrNtUR+s0gLGR
	Uhnh0nhX8XDAOLNEPEV3tWQGOLzJuZY2iMVcC5khCEMCvNjV54iNdgi6
X-Gm-Gg: ASbGncu5QCeHXT/Fv4krAgANWDLbIV9qUAeJPQcjMuWWt+i81yqcHR6sOn+d9lIKMFe
	Jkd1Bm4cVz+9Rc1i0OVmCGj+ZbacWKJPidOsr8a/JlzpIa/VLn/2iKap6MnXShHrkJ1rLDTMvju
	B8gMME/NrTu9TgwBZWfnq25d7LwdifrtK0aeOEBN9lmYCwbuoWhfF4jEYNQEct6TvW5fsTNJdca
	dnf8HW8FVZ/a3ySyVEpvDKRswuAnt8QnJBPForiJZk4cH04KRRHr4vFb/idCf/iHhUP2kHAnYFY
	Bah1okG/Pi/mBISbcVgEPRtMiR18XbskVHOwRfqWkoSbq/8VhB0mXQWU8VevQ5Mrb/WyqtHOcca
	5Z72rUZ+tU7lugJd9sbPUUAT6VQ8vSp4e8EBObP5UZ2sXgKdB8Sj0Bo+lBLs=
X-Google-Smtp-Source: AGHT+IGxvolHiwOg3aDkzQdAyMUz7W4ExlIeoU65YP9vh/gmeQMHftNhAqlS1vFT6yBh4YZN7vBDHg==
X-Received: by 2002:a05:6000:248a:b0:3a4:dc2a:924e with SMTP id ffacd0b85a97d-3a5606a3e80mr2745067f8f.6.1749738635664;
        Thu, 12 Jun 2025 07:30:35 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3cdb4sm2156646f8f.54.2025.06.12.07.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:30:34 -0700 (PDT)
Date: Thu, 12 Jun 2025 16:30:32 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
Message-ID: <kjotbgwqlvl4uv4bcynqsiynf4dsoplw3szaqlcfd7rm7k633p@64c552v3llz2>
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWhwJTbJOBhKmC9YUaSebBg-9m7euqmxqJLCXdr6++siA@mail.gmail.com>
 <bdd989b4-a572-44c2-ae7b-2c445c09fd7a@linaro.org>
 <d05f2c03-fa86-4fc6-9b81-1a7b5592c2e8@nvidia.com>
 <CAMuHMdX9NzFvsOv9eT0t4KVNufHSqVEht7yRbrt0qE49WgHpGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dkf5kmp4veftageg"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX9NzFvsOv9eT0t4KVNufHSqVEht7yRbrt0qE49WgHpGg@mail.gmail.com>


--dkf5kmp4veftageg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
MIME-Version: 1.0

On Thu, Jun 12, 2025 at 02:34:32PM +0200, Geert Uytterhoeven wrote:
> Hi Jon,
>=20
> CC Arnd
>=20
> On Thu, 12 Jun 2025 at 14:20, Jon Hunter <jonathanh@nvidia.com> wrote:
> > On 23/05/2025 12:54, Krzysztof Kozlowski wrote:
> > > On 23/05/2025 13:39, Geert Uytterhoeven wrote:
> > >> On Tue, 6 May 2025 at 12:47, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >>>
> > >>> Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`=
m`) to
> > >>> ensure the Ethernet driver is available early in the boot process. =
This
> > >>> is necessary for platforms mounting the root filesystem via NFS, as=
 the
> > >>> driver must be available before the root filesystem is accessed.
> > >>>
> > >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >>> ---
> > >>> With this change, the Renesas RZ/V2H EVK board can boot from NFS
> > >>> which has the DWMAC IP.
> > >>
> > >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >> i.e. will queue in renesas-devel for v6.17.
> > >
> > > With my Nacked, please.
> >
> > I was surprised to see this change in -next. We also use NFS for testing
> > and we use the dwmac drivers. To date we are explictly building these
> > drivers into the initramfs but I noticed that that is now failing
> > because this driver is no longer a module by default. This is easy for
>=20
> Oops, sorry for that...
>=20
> > us to fix.
>=20
> Good ;-)
>=20
> > I do agree that if we start to build every networking driver into the
> > kernel it is going to bloat. Yes I do see the kernel image growing
> > regardless of this, but nonetheless it seems better to just build as a
> > module IMO.
>=20
> Not _every_ networking driver, of course.  AFAIK, making network
> drivers built-in for systems where development is done using nfsroot
> has always been acceptable for the arm64 defconfig before.  For things
> not critical for booting, modular is indeed the preferred way.

Last time I tried to merge something like this I was told that we
shouldn't bloat the kernel for everyone just for our own convenience. I
tend to agree with this now. It's trivial to make local adjustments for
things like this. In fact, that's what I do all the time. I will use
defconfig as a base line and if I want the convenience of having network
drivers included because I don't want to update the initramfs every time
I update the kernel, I'll just change the driver to built-in in my local
=2Econfig.

I think of the defconfig as more of a reference for what a typical
development system would need. So it gives you reasonable build coverage
and such for a wide variety of boards.

If we start building too many things into the kernel, then at some point
it's going to become uselessly large for everyone. That's essentially
trading everyone's convenience for your own.

> BTW, we have other low-hanging fruit to fix, though:
>=20
> CONFIG_SOUND=3Dy
> CONFIG_SND=3Dy
> CONFIG_SND_SOC=3Dy
> CONFIG_SND_SOC_SAMSUNG=3Dy (Krzysztof? ;-)
> CONFIG_USB=3Dy

Yeah, there's probably a lot of options that could be changed to modules
to improve things. But perhaps we can start by not making things worse.

Thierry

--dkf5kmp4veftageg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhK5IUACgkQ3SOs138+
s6E0Tg/+IGLRD8EtHHbSTM+B0SarrqyRAXrUqz9kqwBFfy9hmBgPVV77MW1w4S6d
bt5j5/QZyPgujqrjttC7a9q0KkTgI+xlSgd5+3J9Ilp3F3IMsysomotJqRol0xNb
ANq8ob8PBvArENT9WdsTrYq439BaB0H6iCZafvtMwEeSJ/fuLOuOv9gYMHJUyEIm
yLdfUKBkP1kJwc0Ke1YJCDWL12WRSJA2F8ZlqhpL5M9+juNRN0AMwbsPf1w4ZU50
0H2h6Zzdhroe6sdzi1ln8hBYehYJEt073YaN7DYV2tkVmXOlgGwBLox+digiiSZH
rktx5n3f/c9vUco2+omNs4Otj5I4vW3zslU+cf7skWbmEAApgjgrGoSVG/fTk0dO
SNYPTQdCP49eNHmXWYfHnp9xno3ceetfzEGKIShqdqk+IoonBE8VRruZq3l7kFk/
eZ+ZYE4z8oaueb+FQoRdJBkpM+Np/6wvXduH85nlTL253JMScqt5e1q/L0tBPvwa
cpwDkzyyY7756xGD+HW8aSfBwyX8LbkZZXk7G8N056TsrVqIACRRqy19a150G5Nz
ZLL2tMtRuN9FAeZacQNQd8zVnojS+ewm79IyaDl7vN/sxwhQQTdDxiVHa6S57uke
/Vt5CLR2HH86TGWNoQK3afycP0toYFIF6hU+gTTMyrgi9epkZA4=
=Qw4a
-----END PGP SIGNATURE-----

--dkf5kmp4veftageg--

