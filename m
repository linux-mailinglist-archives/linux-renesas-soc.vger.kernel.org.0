Return-Path: <linux-renesas-soc+bounces-23497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 19141C00F98
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 14:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DD97E4F0DBF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 12:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D44F30DD19;
	Thu, 23 Oct 2025 12:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m1Pm6e72"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4272C2363
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 12:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221111; cv=none; b=oUzCGMJlavzP2pgoWg0mwVSMdl1RnB781eMkQBEDnXVnmxD8+UgCfsydoLlCZdZyXPuDH/mX0o2VKNtCeIVhA8a3RCJVY1MzrNSKXX5FHYol8kFM18rO3DbEYSVQ6BFx9drxEYjBblrO4R1PLs1rKl7219TL5FfaHjS4dKk4IyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221111; c=relaxed/simple;
	bh=WpzVhlH6L5AkRapx+eMs89/euds3JYyN+OBht8HURKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iKd9x41SF3WY6sczbRssGNsjaHyMFdVS4evlK0bfCIlY0XXx+E6tjOxT/0rDwl1h2ZMa0RkrKKMccE/5uSOLYgsaUj+etBfrKI1n2kjSNqOOmy1F9bYEuUX+2k1Dl6sDmdZ0XcdlKEXRRDRVbRQkahIGzKsG56iQn9QQ0a/BMrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m1Pm6e72; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so907838e87.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 05:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761221106; x=1761825906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpzVhlH6L5AkRapx+eMs89/euds3JYyN+OBht8HURKg=;
        b=m1Pm6e72lHEvj03b+lJz7MncyfSnipL7Zcdpyq77BN542VN19vrtcKanYLH0HgxMDR
         hS+bmx0Tul+6AGYPuowW4G+0axnFcfSWv7Y6hGI3fAc5FVQ2/PWD44FZD+MMBhhaJ01z
         JhifW6XhrfnZ8pRQdJntviXoTbX117KsMttH8TtbEAzRLSeIE+fOW5qndq255w5j1G72
         YlzO5bY9QZnF9BvILiH4RirC+3nSZZFDMFve0Y0vII0mJ5vWqHRop1He0IxqDl0HUg2+
         JCdQz6c8yy00bsN/zxJRL50OkXr15CjTW9oYjM8YIQQbxapE3E1WQnEIM6ehQ7pIYAxF
         9N1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221106; x=1761825906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpzVhlH6L5AkRapx+eMs89/euds3JYyN+OBht8HURKg=;
        b=TTkxZBE4YoKsEFKq75+S4U7t1vYLjrcLl8J0AYNekfyfc2p5WnMAEh6pepCaOHP8lX
         IXI7ZI8i2zdJq7HTWyLrKIlshnpijDKW2JjoW71GAWGRc/SK5PGAaz6t2LHvA+BIRmeX
         rNIU9tzDy8uMGMeMZdo5dIPElfiJElVV9G65itf21nQPjv3NjfWaM46Ota0loGEy7hzk
         YqyTzgeCRO9iitb0+XTdAKQ2iSfLKgMYqkGjJ10ZOns00FQum3lySS/1BCrIph7s/7Cn
         mqSotzmRAxjHGpDOs+FPqGJYk5mhYXe7U74PEwZaoKm95etnC9WfhL2W3vFTyX6IFeY3
         NmMw==
X-Forwarded-Encrypted: i=1; AJvYcCW1GjQznNIL5PC6iTC9fKIbZotk7COI9/J1xtMCGg4hCR69Paz+R5u265l2X/TZpEWnBzcAmUmY+XojD2qaBwf78g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuS2whnhJUaI/e6Q7d+xbVaAhdeSb8Ww90iOyfFOm3cVTf68o5
	5HVKCZ3aaIcwcMj+Mlx9QMWjw3Hr0BTlHTsW7AfZhaCgOggGdypxBXr54bcQ7UVCi4zk7EUY8FD
	CYlm2FAGiok+f67dSi1AoYK1i25g14sJZjuq2h4PV+wYy/QWn/tt4tPE=
X-Gm-Gg: ASbGncs1apE3nBUEqm2h0ppEi3whNn3RXEjrTMRkC2moFb9ZKS5Fr9JayZuiwL5s0kM
	ElWG4IZjEGhQUCuCFVOY1X8gNkezTHMc+RHNB17CC/3n8bNYXmHLVwRUDgBp1hqLlK/Q04Gc3Yp
	EKC4T/G+8JXymBK86a78pJQoxUD0r/bWELdLyGK4f6x+J0D8H4Zt+XFLoL+lwVtgiMoqh4rX8J+
	0rkIhIMasCSt76d3LF6ZaKXwmPw8ZyxILg8ULU4CasXIL6naA8vAyI2NmvmJz9Kah/ahFk5CGj4
	JOk53TzLL9ZQjnY=
X-Google-Smtp-Source: AGHT+IGlzLnIdBxYP5gkrUBr0y+WXdWx3RC6UOujYySjsBNEN0SUYLkItuLvZ+pLZ3k3ctKUbha66ijMjfariFR2N0I=
X-Received: by 2002:a05:6512:3e29:b0:570:8bc4:9549 with SMTP id
 2adb3069b0e04-591d855a889mr6716233e87.27.1761221106288; Thu, 23 Oct 2025
 05:05:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdXqHncXxBZ00mxV=pzdgQEU4ju2F9XMejnibbu=QnLfDg@mail.gmail.com>
 <aPEAx8ZGHBcWZKJF@shikoro> <CAMRc=McsbAirEYjoo455mbKU495VEvPmMEqBmZCq2hw113YHOg@mail.gmail.com>
 <aPIfF-3SgzW5V_gs@shikoro> <CAMRc=MfVPO292xmnXBWJzWuhNADA_u1yvpJ4kkK8TgZyQgaP+A@mail.gmail.com>
 <aPInv9NELU7N9QDn@shikoro> <CAMRc=MdWS2OSeJAkTRnAFMtXcVukwQ=JAWwJ3OHxogmgZnan6g@mail.gmail.com>
 <5c9761d5a6a14d4c250df6cc4201bca72d963133.camel@pengutronix.de>
 <aPnz6U-fcodRoobU@shikoro> <CAMRc=MejA6DsnOW3hS+aFtecXn38UypJU2TUrAWPoo9Ly341uw@mail.gmail.com>
 <aPoPGauSQCoaonl8@shikoro>
In-Reply-To: <aPoPGauSQCoaonl8@shikoro>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Oct 2025 14:04:53 +0200
X-Gm-Features: AS18NWAA79R1X5Xxu7QaJvk3bQaFzhvQoUsFM7Nqc6jJMQESUruL6wkYpjE2WHc
Message-ID: <CAMRc=MeOsUOJTx1-UVdQQzxk=KWyOoO7NwfAhrNDJmUv7kOScw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] reset: always include RESET_GPIO driver if possible
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-renesas-soc@vger.kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 1:18=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> > > I see. That kind of spoils my assumption that it is a fallback suppor=
ted
> > > by the core. Darn, I would still like to have it, but it seems more
> > > complicated than I have time for it :(
> > >
> >
> > As soon as my two other reset series land in next, I will finish my
> > work on converting the reset core to fwnode which should help.
>
> Cool! Then you bring back my argument, that it should be always compiled
> in because it is a core feature ;)
>

No, I still think it should be a module by default with an option to
build it in if the platform demands it. Just like 95% of the drivers
out there.

Bartosz

