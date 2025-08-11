Return-Path: <linux-renesas-soc+bounces-20238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B51B20A5F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 15:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E45212A5092
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 13:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD3D2DECBF;
	Mon, 11 Aug 2025 13:35:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0449F2DECB9;
	Mon, 11 Aug 2025 13:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754919317; cv=none; b=BL/wDm1um1GDDjQlyKA7ElzpBmAPRBCeWFSDcFd4mgLo9LAdFlu26x4pBDnDKA/3JrtXee/GZlq9w/8H10bApUkkHsgnYsFc9ajXJJ9KvkiYAfxVdP9w16HCzmOV16EOj8VZaOEe9btV6cBns4QCzPtHQ3jGAnrDk17nSaruVZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754919317; c=relaxed/simple;
	bh=2By3DXjOpyWC6A0/Io5OyiKxzRwNwLBN4nfDfSv/IMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=leNlpaVS2zF8NVO1ogVozGVyiIDWfPBEihw03xNbb5Xm2AjNsOnPFg2EIVqinosquYa/5imzm6KtqijEzSGdHh4ALCfm+scj4XFqzk3DyMbW5KGg4NMbQczxYs89gfNxIf1LlvNR0Kr3pPO/mZD/wwRGEJdb2M0UjqJRNi/bNDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4fe234cf176so2033981137.2;
        Mon, 11 Aug 2025 06:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754919314; x=1755524114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZT4bJb4w3zFZE2I1irZKM1rEMcPNOhmCHPvkSE90D4=;
        b=NtwICyr+CbdGrBHkYiOrn9p0Grt1HW/+ztgovXE1Kg+7uVxpgKrb/+akUyqVgpCwH1
         +uE90o0lDt55dzohEWee5DE+gw18He9VA+Q13SXVaSIXAgciZhdRfgmuhQLw9e8SfIhP
         zcVL//rA72GzVApd04rvDXaKzECCjalzffjlnCt32GMpbovPveRe2imzosxDTWEoDZ0a
         myNMEs+sHY9ixSZjF2FB3FM25uaFLeFM++L4UEe+gewOBZz2OTd8TUPue3GVQez1sl/G
         eb59zLM4aoWV5y6982Fg4Q9NRgbj61PTyk96khY9xUG3i+w3Y1SRAyEPZDWe/D+LNtwA
         t6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCU7P4JSkkAfaba+gkHUaImoodRbHkSha/Ajgn9Cq0nUwUXI5EuWjbpu5fjZeZO1zivXGp7j1eSP5dbY@vger.kernel.org, AJvYcCUDSCTXe9cIM0LzgX6pPOW4zwX5Gn1Uz6WVOGcKOOpcrcVKLv/j4cBK4L8qY7TMgEzwVoVs4+WryN/I@vger.kernel.org, AJvYcCWfmLrDW8FP1MxUyAxRA8AgvqMiyDdo0/CLy5+VbrIrqypxIbWRPohHO7Y0aSseRO0aL7n7VDJZI/X40RCCSJYxqMQ=@vger.kernel.org, AJvYcCXOot2TTQFda3UKEJYJJbIo7Tdivd5UUcirJChWicMqZJlXXluYf79b0Kk5p+GvsRtN+n8glCog54fcmWbU@vger.kernel.org
X-Gm-Message-State: AOJu0YyMjhy+ebtXJGBCboy8FiYUp4T/N9Y1hovHGzt9RMSKAICAmjN6
	eN+4cSSW1CNHO4ojUoJGtH7pauoQVGJnqzo4hvLG3UXdMY5Dy9XX3cSVflW9yrUw
X-Gm-Gg: ASbGncsI950aGKSLv8XyuRaNxMaLXxqhgKmfAHWKu68nWiAUPeSh5VmUx1MwaZXQ4Rg
	D98j3ThWt8Emq8CGDk83Rr3n1EWIyfTAwvNtpltlqyNKntGlEYOYYusz/dRM+LFOMlERwEAcJM1
	040XXhvWSk+hDIpKgke/inbjIjqnIn/yEM75+eiimchZ69m3+SgOFf4sjL6C6D4ugdBGyXHYmlq
	liMPKcw6lC7O5BkAmxqtQ7K98VYniv2p9CRBIpovnadStmUHaF4+qyYHUqYVuMkh3g1IXxZ19LT
	QbhQInJuMk+pLN9FqQ1aB8wbnSlycq5iPCe4W0p64vPYdK/rNn/I1aZYpy2+sY0mWcgsLX6zo2n
	aju5wEGyRrv//7jfUW3Hyq9jhcmKlFF+WsSHWiJThmP7Skh3k6rMarkMWvxJPOUIL+HdF+Uw=
X-Google-Smtp-Source: AGHT+IFKXm48s/eMtpKkN2DOf0+xz0KeCJOjO3vbx8jMh6DxcyfBMexKj6+iFwL9sFdwWL/DhNX/sA==
X-Received: by 2002:a05:6102:e10:b0:4e9:9659:3a5f with SMTP id ada2fe7eead31-5060e1fc261mr4482122137.10.1754919314245;
        Mon, 11 Aug 2025 06:35:14 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-50629ae5cdfsm1777050137.6.2025.08.11.06.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 06:35:13 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4fe234cf176so2033968137.2;
        Mon, 11 Aug 2025 06:35:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEr0MFM/CIzN3rfKOSGdH5638v40BvS6e7TXc1nERfhAFuQzrHjcSP4vpnI54XS0E2gOv2pk4FRXJEhSdI@vger.kernel.org, AJvYcCVr3qy0SiUDFU+CEv5TV2pFZb7x4QP2D/+KE915BEwAKeuvjmE457pwo7nPbifw35KQPSWxArm43Kmue+74hDp7sCg=@vger.kernel.org, AJvYcCXAFaFQ+L7jecurt7AtDFuQkMirRyFSFygxwx8hKZi5w8na4HcmIxEUo8zAPocZhTB+s98dEKgHqFnS@vger.kernel.org, AJvYcCXPqipV5TA7Ool8Pwm7FVEs9a69qp7pAQPJ9rhxedQm0yWC1g0WWtX9yygemusL0Q2IK3vG8LV/fJLj@vger.kernel.org
X-Received: by 2002:a05:6102:3707:b0:4fb:fa39:d303 with SMTP id
 ada2fe7eead31-5060ffad642mr4106208137.21.1754919313669; Mon, 11 Aug 2025
 06:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804202643.3967484-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250804202643.3967484-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250804202643.3967484-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Aug 2025 15:35:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_BSGPfm82q6LRzd94yC9GnjTJn=CJ8FJE0OgLESq5iQ@mail.gmail.com>
X-Gm-Features: Ac12FXxKTAOrLzKUsRUaFMiV_w-B8p4kHpIBpfDsVjZyFeEl8slQLOm6ps31UGo
Message-ID: <CAMuHMdU_BSGPfm82q6LRzd94yC9GnjTJn=CJ8FJE0OgLESq5iQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add USB_CLK
 clock ID
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Aug 2025 at 22:27, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add USB clock (USB_CLK) definition for the Renesas RZ/T2H (R9A09G077)
> and RZ/N2H (R9A09G087) SoCs. USB_CLK is used as the reference clock for
> USB PHY layer.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue for v6.18 in a branch shared by clock and DT source code.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

