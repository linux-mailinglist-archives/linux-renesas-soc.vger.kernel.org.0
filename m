Return-Path: <linux-renesas-soc+bounces-26396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7986D0239B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 11:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 383D7304487E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 10:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A7242A12D;
	Thu,  8 Jan 2026 10:10:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1986540B6C7
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 10:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867013; cv=none; b=jo5ypGQ6LTvhRr32iS4QxX0ZBOfEnw0DV31zTlgL4qhrGz7wgh6WXQocHjOfcZB5x7CfT8T9Z1Dwt/DIR+cgcOJ473afWvo8HTkmcGnHKnGdjDXiaw6IqqIn6DdySNSB2tYnCNXZy0RLhyPrVa6juDpiYlFruZpBjMWKG1GODQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867013; c=relaxed/simple;
	bh=0Qoyg6zJTiDIb6UdJA4hodeaRzpEp1Nh0FPVN+IVrds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Llo61gsIeWoAdeap65nSoZHkOqTcEGMgLV5I2/KkVujlh8epYMPIllGSpEQfDnn1+0nrveNS6dEc8QhIkUn1JAQ8AqB0me5pfBJBXpanpzWKctfeIEqzDlU4WrXiJTQg0NKfFxGSr/98hianInlBgDu8qxgSCGaS1BLwdx8Z1Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55982d04792so2160448e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:10:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767867009; x=1768471809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeKGajEqxk3IRl+qaAEOKYHPYyjFHsiFRTDk6Rz2dpk=;
        b=GDWG6ZOkLxyyiC0k+i4CgB8eXglK2K8YtLH/I6fpw1lxF1bbVs520Ryx0Dz+kTVFNw
         yb+pGp67fAtxm+lvUTvEpiOwv6rJh6M37ETsi1bP6aR0GC5u/39XZst3ihCfF7qujFRs
         Au/CKyqzpyYHEShvrny+wr2ht7kCQDDtDFgsUGnNr5HN1auYQdBRNjZxRLrBx4Z1fpvb
         QgSxY1XBq5vWsgQKaR724FBNpdKh89q+5ZimADQM11u4OmcQ7zTO0acKsgLknase1YWe
         ovNgYP7pO2hahtUQClbqCFOZwt+xkOAlwSprIs8wTmfuiWjXdz30qXBC3qP6fLA7gK1W
         LfCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWaR3CWV4LqMSQ/dNtElIm8aj6YbkVNITPNXMW3A9rb06zoRcV+EcYi6aYeup038GSsQadCETZh1nRDonmrEfAdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcBplsG2CEzD4y0fifJ1dTUy4Ic9ztSd1uQpV4AZfHPeF3U79r
	C5nzPowQ9wf1yiULnjNWShF9eqL/jbwaoqy4BFTO1ae4vn2Cn6nZISzxxPRSGm61
X-Gm-Gg: AY/fxX7njYovN9UiSQmfItEn2H4YxoSH4JPgDY9RHfJvPNM4Q15HkVXsGARS1KURqG7
	LYaJy3lYQKSXgg+HNcVbUleXvta+KGrlVfyWv/zct/BWhXnvPPfIFVYHiUR5sD0PYUVvCOHEIn+
	mhztv++57+Q6JSWGKh53TQgZUbzZcq+2Ye3/zBUNKhupkFGmDsW2lQTaB901D4SyCAsAuHySf0D
	5+eXAKKzZgpkO+ALuo1lv9q27gk1LABBD6kjiWqgZ82K1vFMJjF29wkOwRTXArz5SkH4syMBt9G
	KY+RlivD+c5h1I02hcuIMgzHX1XOyOcvJvOjYO+kLdOtCLVg2+cVg3/bcdquYGscCR0bmYiYPhy
	TsnJcPYa3wQwW2gp7bC0aNAHY6uZam8ChgwWAmBDgrLWEw9/UgK2q1nXk4AuinkxmG2pd2aeArN
	PZkxIG3Ayhn5foNP7JICoVLxOxV15SOzwGjxJkI/8sWYQH00sawcmo
X-Google-Smtp-Source: AGHT+IEBSWejj2PSARJC+o/YrWBNxfF0VLtV4vA5Tj7tDc1q/34kTjYCLFkYo/iWxe1ChremIqbR3Q==
X-Received: by 2002:a05:6122:208a:b0:55a:be72:7588 with SMTP id 71dfb90a1353d-56347fc9897mr1913001e0c.11.1767867008714;
        Thu, 08 Jan 2026 02:10:08 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a1ea48bsm5623392e0c.3.2026.01.08.02.10.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 02:10:08 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5634feea416so958820e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:10:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWM51+MKE7cO48EJyQU5UiMAb3Nv1sNywwuz4DAptBpC1/8hsoC49RjJUSoAP4XjnBFA/vZEEIBLAzkAp1v24C1FA==@vger.kernel.org
X-Received: by 2002:a05:6122:421b:b0:54a:992c:815e with SMTP id
 71dfb90a1353d-56347d7096amr1637864e0c.8.1767867008306; Thu, 08 Jan 2026
 02:10:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251224175204.3400062-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251224175204.3400062-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 11:09:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWzypRKtdnWKO5iA3eHBr5dmP3ad4qCVK+h+JebqsfNCw@mail.gmail.com>
X-Gm-Features: AQt7F2qond9IwDeaTsZ0UoAL7PnIQMXQXYC2yxlGKQfALMGZUMy1_0YpeTthHy4
Message-ID: <CAMuHMdWzypRKtdnWKO5iA3eHBr5dmP3ad4qCVK+h+JebqsfNCw@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r9a09g087: Add CANFD node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Dec 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for the CANFD controller on the Renesas RZ/N2H Soc.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

