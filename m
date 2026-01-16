Return-Path: <linux-renesas-soc+bounces-26902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9915AD2AB80
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 04:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C70DA3002956
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 03:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DAB341650;
	Fri, 16 Jan 2026 03:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMN+Vh2r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC02D338594
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 03:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768534015; cv=none; b=oC/MJFPa4A6uSut0+doYEUN7VX5GH9+fkKZnq2xYkFtmI9l0S+hbF5mnNlYrtuhBX8Zy+DjHKS4FG+KprCWiOloIafAbDA0irP6YPkRrB+z5neeu5XXD6jFtyE/S0OjuC67FpwUG5gXy1SieAyxz3DnpooaSzAOFth45VNz7zP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768534015; c=relaxed/simple;
	bh=fL5JEUdugUywOgfF3xS/1Yv5nBNWIwQ+xgwU4aZe6jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bs/9jFa/8l5znHuiuJs9leaUputsRBJZs0WqOn+SpxR7125uw04r6nUXA0VGmWba26wmm6cyz7exVkPLxSX/aR0zZuUyGAHfkyerjYqMAXh3qm0c7YcG7sJyHybplvzypUCgmmPwwlfhNvLEnYqP6awW6S0kgeFtC23hlnsWlPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMN+Vh2r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4BAC2BCB3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 03:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768534015;
	bh=fL5JEUdugUywOgfF3xS/1Yv5nBNWIwQ+xgwU4aZe6jw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IMN+Vh2rcuaRuzVSTA/fpzdCaDamxcHLJsq2vUF1GBizZflEBpSxLusCzExokoxLB
	 N3uGszAg1JvlIQPhxmv5aKNlx7FPly+tGJleQjRABIu+1TETR5otFEugenRNkQ5K3Q
	 sxcwh4HlomHuV85WZaBREVI2JtT/29DBrc6lM++RdyOJIwoVG0D/S2ANGPR2x/AdL+
	 8P6Ij27fveW2b2NRpDVUjRq7u1nb9Y71V1YoSB6KtsAV2Y22nmo57mBPlwOOwdwIxM
	 /jiH+9a3OjtuQIpWK8wBPPlSZ8mE0gpjv9u6SCEV5lDpSaIoI/XCGLDhonIVnEYquy
	 TRayhdVDfrxNg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so2630405a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 19:26:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwswv8M5aJCBuV+VC0wAMYcc2eY2HqH8qVWnWnXLNQInVHjURzpv7CR51UfTr7Hp9ZgEMZrWHhN80oxC1BOvN3lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC0oQrYSmM/kuMc3s0aCXWp4KmMqP9hVG/1F3RLNlYBPGzGPKy
	FuzceerFbnlorZV1jwmtGzOw4VsWIz/ZcBK7Uon2Uc1PB+mSguU/akHAMhmVhgRdZyDyCYHY0F1
	g3HP+zfFbo0/WtMx9pIsqt+LeTMdVWQ==
X-Received: by 2002:a05:6402:358b:b0:64d:1762:9ba2 with SMTP id
 4fb4d7f45d1cf-654526c8fdemr1205981a12.13.1768534014112; Thu, 15 Jan 2026
 19:26:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
 <20260115174047.GA930768-robh@kernel.org> <85ff0eb2-d942-4f85-8f1d-c5982bd31bec@mailbox.org>
In-Reply-To: <85ff0eb2-d942-4f85-8f1d-c5982bd31bec@mailbox.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Jan 2026 21:26:42 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+ELqDhPHeSL=Hybaihmj3QbXt3VmrJ2tC8iXvdoVFNfQ@mail.gmail.com>
X-Gm-Features: AZwV_QgG6kq5B06g-etlYhXpjQuBrn8cB9pNEEXLMMNB0ZA-HxranZ5k8pyuI0Y
Message-ID: <CAL_Jsq+ELqDhPHeSL=Hybaihmj3QbXt3VmrJ2tC8iXvdoVFNfQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 1:20=E2=80=AFPM Marek Vasut <marek.vasut@mailbox.or=
g> wrote:
>
> On 1/15/26 6:40 PM, Rob Herring wrote:
> > On Tue, Jan 13, 2026 at 01:05:30AM +0100, Marek Vasut wrote:
> >> Move the Waveshare panels description into separate document, so they
> >> can be properly described with compatible =3D "waveshare,...", "panel-=
dpi"
> >> and attached to "waveshare,dsi2dpi" bridge.
> >
> > But why do we need "panel-dpi"? Adding that requires changing a DT.
> > Can't you make the kernel handle these compatible strings as a
> > "panel-dpi" without the compatible?
> I can, but wouldn't we then miss the more specific compatible strings in
> the DT ?
>
> compatible =3D "waveshare,13.3inch-panel", "panel-dpi";
>               ^^^^^^^^^^^^^^^^^^^^^^^^^^
>               this ... would be removed. Do we want that ?

No, drop "panel-dpi". Or really, don't add it.

>
> The other option would be to add the timings into panel-simple driver,
> then we wouldn't have to change the bindings at all. Maybe that would be
> preferable ?

Why can't the "panel-dpi" driver match to"waveshare,13.3inch-panel"?

Rob

