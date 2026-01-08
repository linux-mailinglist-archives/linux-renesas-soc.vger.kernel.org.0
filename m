Return-Path: <linux-renesas-soc+bounces-26401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBC9D03EAA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 16:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BC1D33C7BFB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E358F44CAF4;
	Thu,  8 Jan 2026 10:15:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F262843562B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 10:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867342; cv=none; b=iTAbTXHioUnaZjj0uKZKuzAvKyhxXcJs5YaSE6whJDbQZV+h3dKJTqFwsXJxASfGr8M67RikAsYZU7OnajRzzFfAtU0EUYbdmp8l4tgOqGB8GCqM8uv7cbKciafgsq5dsWTdoDNfRcjQMNDwbjF3hxC7W+Poh/UH6pC2fdRLJeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867342; c=relaxed/simple;
	bh=d8ZtAFuVe/LITa/PF7VOWvCoScLaD9Lr9xCQdDcgF0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sFoeqF9eJDKBBmt+Y/4S1ZvD+0+vyqvVPelZC5una+Liq621OY4Sn0WiBc02W2TMx/z03JV14mhsxgIPNJ9BDtcZsOoL1c0jNeRwM9Su5Evdur9ke6y8UcMKhmJunwVpu74GfHBY0Y5yaxF4Ixnx7tZmKliU/n0cqthMuVpyVnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5598b58d816so2129794e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:15:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767867337; x=1768472137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S97ifOyreHmoTKbfab05cEqNsJtDOZRmWT8CiZyytAg=;
        b=FR4BpbBw22g+Vgd3JIrjSrA0ELHmXpD8Ey0IZAMpMf5a3VF5Cw9+KKMk86qskX6woT
         hngINmrll088oufT/xSADPNCI9He5LKpG016HVOzhWGCD7QxYUF6yuPvz3GGGaDZ61ru
         I3S2Yz551COwB4OHc25hvUruKg+NyxFeFJLnUeLk6t085CxU2OjAKW0ecs6+y+LW/IHd
         Gk3zb9cpu5XWFru3DeroYd4PIagYC2dZuBcjrPKOXNXqDIvTPhiSiHEdul4UpSYdKvru
         3/sT68ewNPHKdsUqnUWR+EUrJY4ZFMizJNY/qfffk/aW+vHaq4z88+XULWQTp9uqIkAE
         e+kw==
X-Forwarded-Encrypted: i=1; AJvYcCUQcqpbRD7U6otrI6VC4B+XpA1Z/a6TCsfNW9baNrrvU0wl1TDPsHE5oTLguAscnzGhPjIjLeOXULXXjeTwvzSFgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXgvUksZ3pRBtX65mDI0y0DXXeuabboo3WDui5X+bdbDdHWcPe
	l5SAAkfq/A3FBMRBV2M5O6GKtNWHqSy9wOndnPg577NY9Yjo1ZX+nZ0CEFQ4C1xF
X-Gm-Gg: AY/fxX6fYBrF2O7TUZLdSYGwD6DOiBnLSy0oYwNFys1EGv0QqVtRNUuFJATxA9JBOA7
	hRz13OfUVNdf6+eXz6/JAlpOoKKHEWnM4qUb7qaXysLRGULaTT8euoPCVSX2BRTzYpucqXis0m9
	s0DfHb3miWquH7ElDbOS3JghVCROHSnnHF3hXKEX60nZYxe2mxdip/iZrvz4Anc3oefF1QxY3ke
	ouRjXvEQ5pmOorZHQUPFt2+bmwNRJg7JzOb6Bvdhv9NG+cCgiTiHTGuwymIRTECzK4cpl+O4GMl
	g7aWG2RYZdONGfOy36YHxKdk8SYX9eBkBheucGVXfjjB9xJvbLCSP/GHUJ1A4PjQGxd20Eq3HIC
	P3BWzjm/+qQqtsGETFwz0mpVcce89Fw0vuGvoJ3ZEGOofieS3DCFRb/TM0vWPmKAp+SlCQi+SgP
	sMQbiMYvagKxzpZWcuWzgT+5W0Q8CD/xR75/pVxCNuFU5DObGOh58d
X-Google-Smtp-Source: AGHT+IFMfa6pN8U4fKeAPsjkKRQT680ymxWeK/HgUD2SCthqrss6BkBZLbfLao+frJggwDeLYso/MA==
X-Received: by 2002:a05:6122:4d03:b0:55b:14ec:6fb9 with SMTP id 71dfb90a1353d-56347fed925mr1561848e0c.14.1767867336732;
        Thu, 08 Jan 2026 02:15:36 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5635bd72c7esm531370e0c.12.2026.01.08.02.15.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 02:15:36 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5598b58d816so2129785e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:15:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKM1F7uqo2OpqJvcGRJ6YVqlXOTASk/pAAD3IWVgBNtcFk0LY5UKZc9xkg9sbNQ5y1eWW+nP4RlO3ZgIQ9xZzJxA==@vger.kernel.org
X-Received: by 2002:a05:6102:4420:b0:5d5:f766:75f1 with SMTP id
 ada2fe7eead31-5ecb68584f8mr2351004137.11.1767867336269; Thu, 08 Jan 2026
 02:15:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251224175204.3400062-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251224175204.3400062-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 11:15:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyJWTWOrXYUHx6buVpz_WsnKXQBqb=N07AAQzPON_6fA@mail.gmail.com>
X-Gm-Features: AQt7F2pAXJN79A3uhID015MPaJdnJs1tcoTCPCU8r0ap1biHyKUGnNh1vBCYDO0
Message-ID: <CAMuHMdXyJWTWOrXYUHx6buVpz_WsnKXQBqb=N07AAQzPON_6fA@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: r9a09g057: Add CANFD node
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
> Add CANFD node to RZ/V2H(P) ("R9A09G057") SoC DTSI.
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

