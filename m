Return-Path: <linux-renesas-soc+bounces-25227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E100AC8BF5E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 22:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B09C14ED3A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 20:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E17E340A6A;
	Wed, 26 Nov 2025 20:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IpK+g51g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DEE2FC00F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 20:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764190688; cv=none; b=SbnO9a+ZYVtsUFmN6DGhtyEKM5+Ct3rnpYmYAwd536/tTkAZKzR2kIOzvfd0IXHB5UDPM0+pKqgsT39bSU8ydU73WdmQnTDFnCoVBV74PBfs0f3AsKmTzlOwBWZ1FV5kPvBlArmV6hdIkK+9ui8mZk/2BiTQ1RdHblUPqhRi4kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764190688; c=relaxed/simple;
	bh=bp+AeCgB9K3mP47leB73mFZ3KDshygl/ANaoJfeBOXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OL0Wu8xA2qat3jpAuxVxRdu2JJefdXisKOK3pY23IJiZlYgZqYsl9r8ggkMyN7A14uUK3jhox0vSw7EJ9pXySs0GKHinOozsJptRBKlOJmYuPIVP0q9Ao1wVepjPH1JLhtUkmxdybmpvJep2tefm8kFPSKSnGgnkACnOYKiilWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IpK+g51g; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-594285c6509so253392e87.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 12:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764190684; x=1764795484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bp+AeCgB9K3mP47leB73mFZ3KDshygl/ANaoJfeBOXk=;
        b=IpK+g51gsL6vCfOsk/B/kcsMOVldoVGTjOt5EikvCiScdbKcwy7vmnI94jcD2mTxol
         r7VOYKYVcRfnLDHPZSFmAMEmbXRNswHWbuoqiMFa13PVIbufKQwOqUL24wQUrigyncv0
         pnZEIjialBefX6HDaP6l66bscC6POQJ2l6QK0rGXtIlw3gv5Fz/7GUeuspIfsVB7Rp3R
         BKOrgPKro+gkWS3qPIw64E3s+4nCCLYQV4aLLJmtek1lh9z1l9GDIxSx37tiZ7+VMGg2
         HpB4lZhEaDMB3bjapqytks1bjFDeTnOIGpjazDCJjBAAHvFcQT9tHbe9RuSR44e2f628
         +5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764190684; x=1764795484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bp+AeCgB9K3mP47leB73mFZ3KDshygl/ANaoJfeBOXk=;
        b=b60BsZVseXWw5ja1gI403s94ZKJ2ODHyWT8UzEwCZxBvrgjKa96sk4GH+DXLBxGsvf
         XONsLU3905DVKgqohsNr+kMubS+BGy0t/IJJfiZPHdQVynab8OpeUBgrdfKfMx1VZuGj
         o2KtW2zd3nam7D8SXxHIqID08fVUcgnbXrClYThVZUQ7Mft5vnx9Ay2nmtbFNzPSxJNY
         ECia9upr5/wKNmDktujO0+b0V/mH3L4ALTWpVJa79ggPUXkSrf8fzzVmVVqtEc44hwZ6
         AJRUvFj8Pi0X8OxLnHqdGh4waMZS2mt5+Rc5Dtv9ynkZt+N1lj3F3HsyIt2Dej8plh7N
         3Mdg==
X-Forwarded-Encrypted: i=1; AJvYcCWA964JcUVMKEQR10MIMpSf4bo1cDoHGvO417UfnXpnr7JIPRnSHn3ErPQEg//xMcQthkA8nQFwwjZu36JdU2qL8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrKPH4XCsdZQ+1kNkgTkf2AeTE0xKkdhoXykqQFa/oVBln345f
	DKVlNkdZgYz8sQRxfmrCoPHS4f3Vos7y7NalqbhZojxs2h2up68rm4emORYp2tre4ZDa+iBDZ1p
	kDXac+kiR+4B1rhUWS2G/y4Fg+wzgXfJ39c9ExhIc9Q==
X-Gm-Gg: ASbGncuIcJwMuqr+QXwmwr5Iwj5Ky8mhFT1QzH2DkzDuchAH21FH0JAIQZ07A2BrcHm
	3MPMHEFjPYri1GVdAy2HinNQtHqGLmn15+ZVFVm+Pa58QpBZTRWkjG1jaIt9Z3dFm6wEjpq/mpC
	CI6xjdOpbPQIvh1QmVDeJ6IZ7GgQhRg9tbiOSceNfpRfAliex2/cOGeBOA7MuRUWAh1XYSrpN2P
	bQr9Kdlem1e0EoBgJLQoh7bazJetBaRJdsbyz9MFI89Z9Ft2q5rGxlNuPF6pCpZMX2RyUo=
X-Google-Smtp-Source: AGHT+IGANFGykQra3mrG/jIG++VEU1OKyTNwQKchnOrcz9qhr4m3VxShVINsfb6z2II+SA5qvLPDZJREDU7hJSYP5r0=
X-Received: by 2002:ac2:4f03:0:b0:595:9152:b920 with SMTP id
 2adb3069b0e04-596a3ee0480mr5703006e87.39.1764190684280; Wed, 26 Nov 2025
 12:58:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
 <CAD++jL=_wTX6H1uKEHRf7Ud1EKUEhTxmTRqZtUKZzergx-8knw@mail.gmail.com> <198ea639-1129-4ba4-9a1f-129c8ac076e3@ideasonboard.com>
In-Reply-To: <198ea639-1129-4ba4-9a1f-129c8ac076e3@ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Nov 2025 21:57:52 +0100
X-Gm-Features: AWmQ_bm_9BpZCLQHMvXs0bAxo5aZEoA6CYEVsk8_K5fIwaR_V99BRvA8sCtfK3Y
Message-ID: <CACRpkdaisC0=0_wEe2Trhi6EHw_=xcw=RUTBS=YN=Bp-0na5Eg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Linus Walleij <linusw@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 12:08=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> > I am happy to develop a fifth version using the approach outlined by
> > Tomi (special codepaths in the helpers) if there is some consensus
> > that this is better in the long run.
>
> I'm ok with this, it looks quite clean solution to a messy problem. My
> only comment was about the missing kernel docs.

It will become a rather big linecount set for a regression fix, but
OK!

Yours,
Linus Walleij

