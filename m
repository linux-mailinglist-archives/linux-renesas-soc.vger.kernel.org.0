Return-Path: <linux-renesas-soc+bounces-19528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D25ECB02BB4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Jul 2025 17:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B9BB4A0361
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Jul 2025 15:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD647523A;
	Sat, 12 Jul 2025 15:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwAalHwO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41754A24
	for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Jul 2025 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752334245; cv=none; b=OlJLCigMIUFMeKmYw7GVjEx9v7jISJskMSZXDI9Jg4kOn4DA7AULNMelJv2gZMpLS+jQfGJhtTY/jo9a2t5kvDn43ZULVIgSh1mBVLwWfP07A1hEgO7UgTf95iANMFzpQc1a38EPCbCTe2eUA/RDDE7IzK3/60PwfXMGrwMZZYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752334245; c=relaxed/simple;
	bh=JuMA6stv8WOjoulAGI4qFia8JUQsC6U4tVlCU02J/nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=K569WPfKMwCITO9OnhK8P+WQQ5p5j8kfSEPfI8ZHig+iNU1beAL8nusZ6lUglVBZ7nZ9ZozX4D9a37yIvAfFSty8iirj6taa7S+9iMIpfktaPsacIttDYTw41+3TNNDsdUweyrLCxdIUSt881CsOrVKVGUMo3dIHu7u141XOMyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwAalHwO; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e81826d5b72so2635991276.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Jul 2025 08:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752334241; x=1752939041; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuMA6stv8WOjoulAGI4qFia8JUQsC6U4tVlCU02J/nk=;
        b=VwAalHwOpAS/vJe1jU4uwVWKAWQ5hUhO5oEyMhIboyw7hdYsGY2JX9mnLkkUXLJFn0
         caQwLeKQVXmho2uAXToa75rIqrM8oFgqBTPT0VbNgBFFxzmSYBB/1PBBklZUDGf3ntDj
         25zWHcbXUt71tysTSj90BLc+btEw2+tDAI/QqTU1X00yc41jLx4qno67K93Hy75nWyT0
         w6V+vmCJA0zJL/ihJh1RfMe75LVtBu3vURzB3nsuQuQBSsr6TI3d2DehGwd+LmZC2g85
         lEjc3s3OFdjy0oL6H0Py+XwiXF9in26iTHuICkVabuMP3Ij5VwLOOxjboLB4y9q4dyIA
         H3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752334241; x=1752939041;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuMA6stv8WOjoulAGI4qFia8JUQsC6U4tVlCU02J/nk=;
        b=hOevOayaXYZGK1KElV3a0p9cXgOTBFCASWVorGNo++kFU56uNrwEot01qWhJ0w5eXo
         gRvtsemVyqb0CPk3jc1Ew7Kvrt0CCQhZVJrbHztAroOVrGy7i+DXLAqZnUPkr1LfDYY4
         iEtWRuhFhupe+a2t+y55KopQnOIuLtWMlp8j8wI5KAfntLxqcpy0DtnEqbPIFw9mMh4r
         yQTRTHiivqTRicVJqGn3f6FPOgnZI4hVY+5Uh45YcQeW40/C+JAETGR73BSEiFz6RvA1
         E5/tSPzeSjYFS+6bU9T9Z3NNGI0nExzL/lFS4/tIlr+LOczKhA2vMRlyBZ2RuULBv/SJ
         MM4A==
X-Forwarded-Encrypted: i=1; AJvYcCUXe8CWDoxH4z1aw27CeS/89ReaVDvDII4UGlM/xXguGODQG4Fhpm78hx7R2Cva37pmNk/19pUzAJof9WrAMGXrYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzafakeSiNgG1zR3wRxoq/qflFfKL3EPiHVWDBxFxcojk+ieqUR
	mxaP8IeQ0bGgUI5dB79LSF4CELgmyGDDRvgw4z0ZerrD3nt4kPj1aXwlGwjbdyQS4MPiUXkyeKV
	leA9s+Dmsgb10JEeveLZuorjLCcGpx2dZHWMnbAU=
X-Gm-Gg: ASbGncsQqfr9UGlCdsOTymcL0PorWAbk0ol58Sxvhteh+d2b0TAXugZLfAW41eNwjt8
	ha8egQoJWmYKnxDl8y0RXK+JUna+wN0bxxX0Deoz94MSUuCDuvWVrHyhco9i4HNSKSG/HXcpbrR
	Gzumvv9aVpD8OqJJ1iioW0YPPLgCo1sbqVLe72VrsraJvJJw4zhYgW7RN+X0EsxGnC2NDvGCXkc
	rCXRZSOMQq9TmMe
X-Google-Smtp-Source: AGHT+IGkM5vNTw/Rmz8Y7CJY1TpfaXzfl43aGdULpbAkp4q0xh3hkHDVdgpXRbJwNLjyeHujxvSOf1Lw1CQZ9vyxqoU=
X-Received: by 2002:a05:690c:3391:b0:714:691:6d1d with SMTP id
 00721157ae682-717d5dc7c9emr110475627b3.24.1752334241306; Sat, 12 Jul 2025
 08:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <175109918476.52629.8694334943062364426.sendpatchset@1.0.0.127.in-addr.arpa>
 <aGjPcpFJo0kdNgoH@ninjato>
In-Reply-To: <aGjPcpFJo0kdNgoH@ninjato>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Sat, 12 Jul 2025 17:30:30 +0200
X-Gm-Features: Ac12FXyfI3jGsJ1w05MUu4EnBCZo7UnkpvX4jti_f4_-R_lyZerQop9J_VkFO5Y
Message-ID: <CANqRtoTkn7C9wC-hGT0Ejxy==JadLHfuSS_HzUR+jk=jo4EyHA@mail.gmail.com>
Subject: Re: [PATCH] Update r7s72100 Genmai DTS to include NOR Flash pinctrl
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <damm@opensource.se>, 
	geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Sat, Jul 5, 2025 at 9:15=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Wow, Magnus!
>
> On Sat, Jun 28, 2025 at 10:26:24AM +0200, Magnus Damm wrote:
> > From: Magnus Damm <damm@opensource.se>
> >
> > Add pinctrl configuration to the Genmai board for the NOR Flash on CS0 =
and CS1.
>
> Very glad to see you again! Took a while to get my Genmai out of a far
> away drawer, but now I set it up again.

Thank you.

> My board won't boot with this patch, though. I assume this is because
> the address and data lines are shared with SDRAM and playing with those
> while using them is not going to work?

Yes, I think you are right. Before sending out I made the mistake to
only test with the pinctrl driver in U-Boot, sorry.

I've now written some code for the Linux pinctrl driver that makes the
DT modifications in this patch to start working. Please search for:
[PATCH] pinctrl: renesas: rza1: Check pin state before configuring

Cheers,

Magnus

