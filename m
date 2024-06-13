Return-Path: <linux-renesas-soc+bounces-6148-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D30906978
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 11:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 930BA1F23761
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 09:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A0E140E5E;
	Thu, 13 Jun 2024 09:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9tYu8Fi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CBA13E036;
	Thu, 13 Jun 2024 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718272665; cv=none; b=ihqNSUbt+G+HozaPS7h8wlk4k2oh/eRvfHhICmwSmYqegRl3H2s+m7r35ng6pnyeNBURfmdIKiv2Siq6ar56JckORYqa44i9Ua6rfuKAc2Hdoo1qo3Kjbp8aNWgLrXROb4TZOB0/HKjAkJWnmmO7t1X2v8hSWnhzIbLYGjK0rKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718272665; c=relaxed/simple;
	bh=zN6eWs4yJyaimrUvyt31VdOl+8W2TcByxEAIv71Dj1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r16qB5t7RfHOH8NCUYWns50GdZTdE5LUoJ9EsLM2uc36mvvlakKdW6izD21k8Im3tbiIS0gukTMi+Im06qZv1sA1TwxVbYpDLE8EPA5rLf2MbFqO689L0R897AM/Dai2bY2KDVl1WrFIyzNtThWErKZRcTSBCHSAhg/6vEMZjOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9tYu8Fi; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4ecf8af13edso248842e0c.0;
        Thu, 13 Jun 2024 02:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718272662; x=1718877462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpMVR8DEDaDijPjWZKbxTVzd755u1YS0zT0nSvsj3Zk=;
        b=i9tYu8FiIloj3a/uXoveFJIbP+oL7qmzctuwV2tdOTK/UmRhkpCrKN6kxkj8qYbJ7G
         lX7BaGEnRtVQ468pI6OAXTblKjH8ltmTL0oudSWQWJVqBbgp3Gy4ILBVOy0bVBIVBmgu
         NWzLCKE0E6ap5LbeRQ9Nm9jQH9nHA/slMbBev9nG5poAOMrH1ig4PKCq33fXxK9S9GI7
         rL9Ub168vzzwxasJ24yuJzezyqQvNKKDJMjewT6tvcCDcEffBwgKS3gVThvaG/VgvkrZ
         9BvNNqZFa4hgmYrDoeDjXyDQWY8sDzQ2Vd+XGmevVcGR/Ixqni2f8ka1zaTnreJa9AnT
         3WdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718272662; x=1718877462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpMVR8DEDaDijPjWZKbxTVzd755u1YS0zT0nSvsj3Zk=;
        b=gGxvzmU2SnL7xwDMB3CJ0K0US81HvW3ZNDfaJnSZBJaAb8LsCiaCIDfC05aP9Y8wRT
         sIESdDaoMZJcqKKSarNfsBcBlv0g/54KCitYwEgusrp0lfaHRTY2a9bB0eN0yV43SvIh
         peHxKbZ/B3htHYPPno+ldoXixCzPM/7vtTIrq+Zd4TGNtdntZuy/qzfNf5zcy9FsvExq
         HVIXwEv90aAKuCz3qSXZWUnyHoqnUkTvBHIbAFY2dzXhKoyAcm9SqOTqbptonNPagfyc
         DEi1J9ApuNTLpCYL2Ard+uAnpTU+o8KC8+HIPClv2eMAu2m5YWBmoDwWZAjSy6vpe598
         3FzA==
X-Forwarded-Encrypted: i=1; AJvYcCWR2NS1ZB+6FvyRMT5v33usWI9dw6fDVCmznO9gxXSnuh2qxERh0p1n9PSfKLh+E+o7lhcYe166R/tgPWN9GHiNw5xynPN0+KDO8FtFf+qh81L6xeeUaCtNdZq8IWoSrT02j7tUG3x8l7vSfRCaJTwlBUsjUdyRF5SCAQNH6UM7MSDMGwIOxEdVLKVwVefAuaEMq+9XdRP6r6mqtlQF4WqsqqizUTtc
X-Gm-Message-State: AOJu0Yw4N1tEfxU6XBeXZajHHOeZtXXvXGrXXJzZr268r0HTdgiklOYm
	P+aQqq63OWU0xvrYIoWFZvgSMgNvMW9vrnt/HusDH/WVzDlNba9Yl6G1HG3T8qGipqoiibCsJ8p
	45haqwmqQJ0B/fji0OQpAgsDFcxg=
X-Google-Smtp-Source: AGHT+IFZDlKXT5ksZr0707o5fDOj0QyVYvY+252Tgpk2oD5G6fsRq1eEvfdsCaiG/u7TKoAitSlR9dKPDqGgpSEfsok=
X-Received: by 2002:a05:6122:2087:b0:4ec:f4e0:c00c with SMTP id
 71dfb90a1353d-4ed07adae82mr5165684e0c.4.1718272662567; Thu, 13 Jun 2024
 02:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240610233221.242749-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <6b3fe242-3733-4f16-b727-494dc1d82002@kernel.org>
In-Reply-To: <6b3fe242-3733-4f16-b727-494dc1d82002@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Jun 2024 10:57:12 +0100
Message-ID: <CA+V-a8vp0qHKqUMvyfy9hQjKyk8Cs0bDTnYh-ChvPi150r5i2g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/4] dt-bindings: clock: Add R9A09G057 core clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

On Tue, Jun 11, 2024 at 7:59=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/06/2024 01:32, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Define RZ/V2H(P) (R9A09G057) Clock Pulse Generator core clocks.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Dropped the module clocks and just added the core clocks
> >
> > Note the core clocks are the once which are listed as part
> > of section 4.4.2 which cannot be controlled by CLKON register.
> > ---
> >  include/dt-bindings/clock/r9a09g057-cpg.h | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >  create mode 100644 include/dt-bindings/clock/r9a09g057-cpg.h
>
> Missing vendor prefix.
>
OK, Is this just for new includes being added, or do you want me to
rename the existing Renesas specific includes in here which dont have
vendor prefix?

> This belongs to the binding patch, so squash it.
>
OK, I will squash it.

Cheers,
Prabhakar

