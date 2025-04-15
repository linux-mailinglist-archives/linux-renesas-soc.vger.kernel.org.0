Return-Path: <linux-renesas-soc+bounces-16012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF899A8A01A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 15:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC10E3B8DC3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 13:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67DD1917C2;
	Tue, 15 Apr 2025 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmwheYuV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0778F13C8EA;
	Tue, 15 Apr 2025 13:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725177; cv=none; b=hBv8sPmca7vacmnM1zY1zxjfw5ZF0d63K7xcRW7yowfrT3YBaheBctxaPKp7ynkE0quGDWUfkPqH/n2yiv/vS2AOvGRQilN8ulUaaf5fVA8wRHfStzgY6bXchb68pKlNxG6SkfiJSC7IBi+piJutlz7YCsjs2Tdf2ExZrCU5lt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725177; c=relaxed/simple;
	bh=ENRqfqGuVy+bkDKYMYO5JKLL1z9uiCfJpBqOTrbE9Bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLLLhldBfkCoi6EFqwzzy64WWktgeaw7pC9kmMNdHXRb9UqkJsrcOWoh78gznQYk7Cv/lLfgzU81Cm8aW9Xd4tQXwrTxVR7t4of7dQsRwpIfZOHEbFha5MCIaUbIjgsEc1nZ0dMxkLfaDv8iBsYTdVP6HqRXBKkCTBiQVYIBryA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmwheYuV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso5292920f8f.2;
        Tue, 15 Apr 2025 06:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744725174; x=1745329974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TwZ3MTtKiM7l1EeKd00zGsHBWMHnKmuqThclAOg/Kg=;
        b=hmwheYuVpy22zMZ/DoQVZveajuZsKkeSZKZwr5OiKwye1oxlsOtVDM8PhFKaWE3qlQ
         1D/rh1to7gaLAm4wpITaPha5kN4u6pQpNJf3gxrgh0pWKyFcyU2kzeK94Bhgs4gNMuZd
         NAqz+heIwqskrbzzJlGUORFtJnfNUpwLhrQE3T+wYDIqyIUI0t92d+qiIoC/jFfHxVdU
         uLfIJHt5NuqADinUwemMVGBVWS2pY3Py4GQIbD844jMS80s4QPbbF6fE92QFZErtEuRa
         BN8NVDdCr6UlfaiYRPWnbDS6r5W4mPlNsdFQukkoxkZSAbwEFLw/YLlEJMH+goOZhRtC
         qclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725174; x=1745329974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TwZ3MTtKiM7l1EeKd00zGsHBWMHnKmuqThclAOg/Kg=;
        b=hBFFKLMiCT6jqqfgzBt8koUbLOrZMgJ0YEWbn27s3x3Zg+EXWOdAcDndFxi/KrVfXz
         VUHcsN+xsj4/uUYKMx38YdUzlGqNMiw9U50Wi1Got5KtNdF5BGRSWSpkIHEJlsvwUGIE
         jXzoMuP4i5NFw7cmHqozP8Xpez+FoZ77TLkP7tZ7637Q7ucjY0/KvZZetLXqRVGto7k5
         2FsugSF0Sm855lx0PWAzmVqr/EdoVy/1f5dlbQr2tV010uGl2Xr86W0WsKtzj1y+8/1X
         +opbOHje5b9efNYEtKuuSoMmj72IYRvOyO0cUJKCOjP8V32hu1c+JURRovL+kQ3GB3nJ
         DrZw==
X-Forwarded-Encrypted: i=1; AJvYcCU6tVaDWg1QHzILB+xC2xyiSk/58o4GVuJg9mWQSqIkNSlYTQ1zePn05+hN6hyOjHz4dcXgX9ca4ToN0zGyN8yj7n0=@vger.kernel.org, AJvYcCU87+dvssu0nDPsFUxWcRDc9E06WM0wF4pxtk6uQTF5jkNrRd7xk4BdF/BnlY01n06JNB7RoUNm@vger.kernel.org, AJvYcCWIIh4hoFaBzlLNEzLiqHrzp78FSdAo87+GJA3nUpHLjojdGm4Jtb4tsvSewkN5v3HgatXlDtZqL2ur@vger.kernel.org, AJvYcCWN2VocoTM+gUMzCEP/EXcQECIwfrKbAwzy5Axv+b6O+kjI3167jdZ+XSD9GSMg7aRQuCRe2geq+OIaQhiT@vger.kernel.org
X-Gm-Message-State: AOJu0YyUAmPztUmr1k1DKlENgKHwcxtnAavgMJcupLWvbtGKkIcvYKIQ
	Zgwn++LxdYPaOcXTZd8RUmfMXeO15XpBy0ufrdnStd6SJzo/QcC+ZDvDfiusstDa/kWdB4q3pxf
	BzGYOVBfdp3IcjCfKDTuPY+boul0=
X-Gm-Gg: ASbGncvJ0gDsn27w/xthZEvJNlIg8lJTxES4sBJl435CGpjHSaWt99fjFQnAhlno3Pf
	m/ZGr2B3udbSa/WKWMksLtkNJ0hHEZgFGpkmDJXSi1pReU+KPePdihJsx+oYoVkV/yJp24jtU5m
	UdKHuIYld5QO0KOtPyHeVTOkcyzw69vGZZ281gjEG0CUxtq0CtBTbId5WatXeEndaI
X-Google-Smtp-Source: AGHT+IHK+m8VrLrlFlxV6nZ8ThujVJZ2WLpJFiDSDa8zctkcFlgA9baoyjBybS2403268oDSkrugum4D+6yxW9qAQH4=
X-Received: by 2002:a05:6000:2905:b0:39c:2688:612b with SMTP id
 ffacd0b85a97d-39ea51ee489mr13637534f8f.7.1744725174186; Tue, 15 Apr 2025
 06:52:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250415125642.241427-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z_5hc151mud_UM1C@shell.armlinux.org.uk>
In-Reply-To: <Z_5hc151mud_UM1C@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Apr 2025 14:52:27 +0100
X-Gm-Features: ATxdqUGwNzRsl8J8RvInaxREfU9EplttUyDfCX4lENAuX3MnWfvUzlpS2hWxJag
Message-ID: <CA+V-a8sTN_vUDxL7V_64U3hs2-AB2Go66_gELe4Bkx0po2734Q@mail.gmail.com>
Subject: Re: [PATCH net-next v6 3/4] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Tue, Apr 15, 2025 at 2:39=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Apr 15, 2025 at 01:56:41PM +0100, Prabhakar wrote:
> > Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P=
)
> > SoC.
>
> I think we're almost there, but now that the trees have parted, we can
> start seeing other bits of wood :)
>
:)

> > +struct renesas_gbeth {
> > +     struct plat_stmmacenet_data *plat_dat;
> > +     struct reset_control *rstc;
> > +     struct device *dev;
> > +     void __iomem *regs;
>
> This appears to be only written, never read. Do you need it?
>
No, I can get rid of it.

> I think that's the last thing I can spot in this driver, so with that
> fixed, please add:
>
Thanks, along with this I'll fold renesas_gbeth_clks_config() contents
into renesas_gbeth_init/exit() as suggested by Philipp.

> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>
Cheers,
Prabhakar

