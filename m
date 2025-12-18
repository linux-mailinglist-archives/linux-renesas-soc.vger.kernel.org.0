Return-Path: <linux-renesas-soc+bounces-25894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E27CCC75F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 16:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A69930502D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 15:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81C928B415;
	Thu, 18 Dec 2025 15:29:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13138314A74
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071738; cv=none; b=IgbEX/Qk2Q+lKpU+LoIxH2SLePWyHrS5eNDIB8uQds+YOg7fJ2xcPvH8yxCDkhtn2o0TGr7FAOIe8r61Ow9U3gxUwFnHyfnpFzwrqC9HUFudprRziWWL8v2HNYnrM/ZKGo/GShg5uMHrlu7LnQZ4CsyLedTgYikNZKugGBmnGMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071738; c=relaxed/simple;
	bh=azzl09Wx7rt0wPbIl6zF794mRt/KoBI4Cg5cx5Yj+oY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rDosy7LQrH2ndcs5DyafiH0QkTtlZLrmx4cc6e6rpwHC8KxOTD60rz4U66rRqwzbXSOL730LVqJifhdmYQ0+IDLK+jMLpCZu6f92p2uSxbYgWSKgZWcIX5BrRuUEsH7tWIGRMF7AJcyudW7onMxCIMhoGteaZs8zpInq8NCz2qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5e55bd6f5bbso493781137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 07:28:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766071732; x=1766676532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXHlTDVJTF5vvWPU3rkwyK6a19VuMS7dqDcJr9Xe7V4=;
        b=DkBkE0GBxBcJiaQC6aZVyBsvaEDeoWn0YbVFXizD1NfKjrJBAk6/52woiXNHTeCyFf
         lj80/Lyk1tC3m1CFl1g2lZYE1/RHwzdMn4YRyB9GLR5WocPHOUi6HV1De3xKFUkRIqIo
         5sqWSMKE2JqwwIWOYsqBOE2iuiDFrD6pkXW+iVdTZUwdKr+G/a/byFB5cQZa8TsgWjyS
         MzEFZR/T2Ci+a7h4szCy8blpFzt2kFjWH8G24YXMGAYxl/J8KRvJp1PAA2yNLtK9iQ8j
         8Kv3JP3+7JzXXrKnBIs9mSb+YkRZQ9W10MIJgGRMN/+Jw66NWzHb0QJO2H5iE0V/zmht
         TQwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9Z9gjltMvA52P6TcIA0vIkCK3iFBCvYf9MagkB6mTHd+nF5xXYhs8xQaBri0d+80Y/Yf9cT/1OTIDPgL2ADrtvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5OynviVA/qX9Qerq5tn2rNkKBQ+pHfrrhSw2vV+5fm/XVyJGy
	yt6VdGVq/XUh0u1t0KmJ679E2evVV61K2oHr/HoleLnQ4xDzlncEdY+viwCJXSRr
X-Gm-Gg: AY/fxX6fpYLNKn0sQreTlSZrsJS+hH9ZSKlofR7MJkKfBmpLeKU9Y4pA2AKz9AfEhlB
	60K4pGBCWwlMtpGj0DJwjfAojYBRqS8g/5880BgxFdMvUG2PxcBX8f6CEV5F5+j9pomJIlNYJaT
	OiBzAdtBBc7h0jeYQepmznb/adMLQt1c7XtgNshdalLJxPeylc4fFU3a59rKNsUsANVsW1JlyZN
	fk3lhSXnEWL7x4BRf17e/akim4zh+6cskEceyoED2AKPu4PrjhBQNYOim91MzpihSQu+2iAteD9
	3dC/okeSlRiKbL75mppNwNfMtyWhn0UIkjKWJX0NQrYLrkYrrheryxoMRwvVzbK6nBl/T1dSZ97
	3ZNlTbqs9uKMzey7S+hePfdlMgM/Zm/IP++d/4KSVuec6eImzMBFVTeMY1/vHCG605d5WTtqWJC
	hCdumw4EykL8rCJ4R8XL9a/q0LwpCIuPF6QmQgdOYqLSs4bTYiNZj8AeD16vw=
X-Google-Smtp-Source: AGHT+IGxnRnH16RcWNKAPjdp5EuQAjaH189Kr6MlFspqbwCz9lfw7s9qhBY6FnD9P0mJGBuT0lDGlA==
X-Received: by 2002:a05:6102:3fa8:b0:5e5:63e3:ebbb with SMTP id ada2fe7eead31-5e827866d24mr8314124137.42.1766071732370;
        Thu, 18 Dec 2025 07:28:52 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-943313c0b08sm985014241.11.2025.12.18.07.28.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 07:28:51 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94120e0acbeso444598241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 07:28:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViEMrXbe25VQHoOYnp4o2OT+8bh3PdC5ZttM0PTeIHvKtizpRWLLBmHEwttzjHsgVVTpbQ0bZchTHh+drVhwd25A==@vger.kernel.org
X-Received: by 2002:a05:6102:14a1:b0:5df:af0f:308c with SMTP id
 ada2fe7eead31-5e827854ca8mr8511390137.38.1766071730637; Thu, 18 Dec 2025
 07:28:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Dec 2025 16:28:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
X-Gm-Features: AQt7F2qLc82Kbfmr6BXfh2mc72SoQ2IFZ770WV9-Gsf5ezj4RJc3ZYutw9_Yvk4
Message-ID: <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Support TQMa8QM
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
	Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

On Thu, 18 Dec 2025 at 16:22, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> this series adds support for TQ's TQMa8QM. The first 3 patches are prepatory:
> 1. Add support for clock-output-names for clk-renesas-pcie. This is necessary
> as clk-imx8qxp-lpcg.c (driver for phyx1 phyx2 clock gating) reqiures that
> property on the parent clock.

Hmm, clock consumers should have no business with the names used by
clock providers, even less so whether those names are specified in DT
or not.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

