Return-Path: <linux-renesas-soc+bounces-25751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9743CBD17E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 10:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7A4D3017F32
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 09:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08671329E7E;
	Mon, 15 Dec 2025 09:02:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BB52D7801
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765789352; cv=none; b=JrPamvYDL2Bi5kb6GIA0sn58WvgNDHix675kKG4GVHn4PP5ck+5HjmUKOBAoI1W9i76EeFfBAhJ7doVu9Tm6dl38KgfmgX7AIrPmblY0QIEhd/g1XNW1RVdF/X5vOrzRhxIB1MP+JmaUBSNqZfJyprKFmNkHsvHbGMOe6QHQdRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765789352; c=relaxed/simple;
	bh=ECGqeXvLKgl0QjAOaEVwq3b0lTlh02jcGCeWyK10tNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oJMp0C21vROFNlHFtI5pG+qM9BfcRon005kx7AxV8wSJ3u7OUiPAJgJ8NsMWGFqAlkPNj7j+Xus4WJRKmUVpJ38QVA6Hm1sc9YeLAy2JAEpTaUcEVz1wkct5gDKer+BHBdyuxzJhm539l9J0aPrNdvuAKrJ1wnraTXLetGwgak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-55ffbb44b96so134373e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 01:02:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765789349; x=1766394149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+q6sfnDIaClHIsjp+iDQU58TQ/QlAPQO+CWmDHAVua0=;
        b=g4RrooAiFXxDnBSKNacU2KQYe9nOOS6cGmT8Jt3+2hrPsC8bqAmh0PvL/3IqKqDDQt
         Ug5hHZ2Hr3Ec1osE12e3tnU5TfASNbAxADDicSJJ6TQJhz2Rbff04hwuHeG1huVH0+PT
         D9v2C0uqgelr9r7mjBw/A0BYVw4Xhid22zcFdP0SIXevK/7L0QUYvu9oW2v/vCok4WOO
         +MHOpl5Qcc14DB9fY+LRsFrVUIcA3FqflpdXQNu5sJtqOcRda0a2G1BSGMHdqfXCu82d
         p0m8tiKsTzS64L5RxhJEaQm0sEvp2/Lm30NY0iTkQdXxB6aoeRhjXA6vXuk+7DdIQV7S
         mpOA==
X-Forwarded-Encrypted: i=1; AJvYcCX8Kdy+HQS+PzHyjCT+sFtgQ5k0YBHFt7jwa1Ig/sL7+7lTcko/l41FUoylQOl2STAG82yNI8yynQZ9srik2SEmJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzItPaXPSo3BezT1iYyb31pGDk74T+Jj7Ox1zwrVUsckUKydJr5
	LQGS2ifnBwRODSQW99tAcEeEEIu2WQAqB8x/qu29GqIol16px9h/ND62KGGW7EaYzlA=
X-Gm-Gg: AY/fxX7bya65yF5UT/uRvxkOJxO6EySXRwVDzycHncuJsb6dQYF3bZYM/2j+0ct9aTJ
	z5NtCislO+0+P507OFcy/QEAODp01UxooOUNy2eJVGeSkXbY+8oa/b5A7JSIxWtIUg3XmsKBdmF
	wu0B+jBKyWNEr9ibXerpj9h7msg6b/N6hrHIfAXsUyVlbTDsa9dfVJcloWzcE0MXKin0aEAPxNR
	MJWNjY9UVe9NHuSBFil0xPwt8+gg098XhBMtjyGvwOqhpl1aUYIdEQlYQmZpwqSxVCGN8xLhdOY
	W9eckrBadyis8QYBsKxosvAtXdaB58uMjwoNRJmI7UWgCZuMYrdbN3RfkZxEGaD72Z7ktYI97p7
	TvyKaHXblrjuasuRsbeeKRY1Bst955k8kYFYskfjCcTZFpXDz4ECXJPfSt92tXk6MbsleHfQhZU
	0swi/e1OE6xAthO2lhAQE8MMj4R5fz1/NeP3HE61nZbA7hiRxMWmD7
X-Google-Smtp-Source: AGHT+IEvGbvAH0NrGyLJmNGWHMZx5pxBUTXE2j7IQCOfBWKtDTnHs0c4stC+5rSNjUwnWK9fzozUMA==
X-Received: by 2002:a05:6122:4faa:b0:55e:64d7:ae76 with SMTP id 71dfb90a1353d-55fed66949bmr2977579e0c.20.1765789349221;
        Mon, 15 Dec 2025 01:02:29 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93f5acacc12sm4941433241.1.2025.12.15.01.02.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 01:02:29 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-55b2a09ff61so674804e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 01:02:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJsQmJ0HvOrVr0CuNzSPVSEKSWjupkuS16cZy+iJbUhpQBJvwTH175D7BqViT00kPqCfYNCiP9vAtoQ+de9y7XJw==@vger.kernel.org
X-Received: by 2002:a05:6122:3c8f:b0:556:e951:b544 with SMTP id
 71dfb90a1353d-55fed5ab84cmr2733651e0c.9.1765789348760; Mon, 15 Dec 2025
 01:02:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212203226.458694-1-robh@kernel.org> <20251213062037.GA30577@pendragon.ideasonboard.com>
In-Reply-To: <20251213062037.GA30577@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Dec 2025 10:02:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU3xB4sU2tb9B9Pt+D2E_ZNEyRd0e=vQr8fBgOaa7AuNQ@mail.gmail.com>
X-Gm-Features: AQt7F2pKIQSC9djCWI697SgpJ0ztNjq9qn8waQDpTdHD4WHkLGPfNdqDrGxQRDM
Message-ID: <CAMuHMdU3xB4sU2tb9B9Pt+D2E_ZNEyRd0e=vQr8fBgOaa7AuNQ@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: renesas: Drop unused .dtsi
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Sat, 13 Dec 2025 at 07:20, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Dec 12, 2025 at 02:32:07PM -0600, Rob Herring (Arm) wrote:
> > These .dtsi files are not included anywhere in the tree and can't be
> > tested.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for your patch!

> >  arch/arm64/boot/dts/renesas/r8a779m0.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r8a779m2.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r8a779m4.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r8a779m6.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r8a779m7.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r8a779m8.dtsi     |  17 -
> >  arch/arm64/boot/dts/renesas/r8a779mb.dtsi     |  12 -
> >  arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi  |  25 --
> >  arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi  |  18 -
> >  arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi  |  18 -
> >  arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi |  18 -
>
> I'll let Geert comment on this :-)

While I do understand your point, these might be used by customers of
the SoCs.  Hence they can be considered part of the "stable DT ABI",
and removing them can cause issues downstream.

At least for the r8a779m* parts, I do have local patches in my tree,
so I would notice any future build breakages (most files are rather
simple, so unlikely to break, though).
Shall we just upstream .dts files using these .dtsi files (cfr. the
existing arch/arm64/boot/dts/renesas/r8a779m*dts)? AFAIK none of
the missing board/SoC-combos actually exist as products, but someone
might create one locally by replacing the SoC on an existing board,
as they are pin-compatible variants.

There is a similar story for the r9a0* parts: they are variants with
less CPU cores, which may end up in actual products.  We could add
.dts files using them, to make sure no build breakage is introduced.

Please let me know how you would like to proceed.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

