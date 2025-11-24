Return-Path: <linux-renesas-soc+bounces-25075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC26C80D95
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 14:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5472E3A5AA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 13:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1076C30B515;
	Mon, 24 Nov 2025 13:51:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8166926FDB2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763992303; cv=none; b=RjQm7qUGqs60LrThxS6BDtnnSqfhLEna/QI9z2OzBJe0ZAhUAjIMnhUmv5pL6PBOW1C9rBePRt+vouf5EkZB4Ojqr5NVb+m/hMIJtu1xxkBJruvCxKXGSflgqXWw8coXX34DnXn3Ofzgf+AQCqZUunw6VoLDStFrIKidX2ksT+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763992303; c=relaxed/simple;
	bh=L4xbkeE7UPG5KnFGPHerRul+9Nt17tb8BTLuMDQbiCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NF0ydgs22k7bS3WmRa4JNz69cfPsmG/yYb+azCpOQfEsDeZcD91Dw4gnAB0tGRap5+JVpZCfORb1ooVz1Zzu7SW/iO7r1t3wfY/KDZ3XZsM/COyG0qmPEzu/umE0qvGZMypLwhaEHpDsfdA0R+GUFFXSxpV/Sqr7YYt+LlA5hH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-559712e8914so2710428e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 05:51:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763992300; x=1764597100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MfH7R9idAwqHoO5PfKbF+ncopsgX2gAzjEnJxQnpKE=;
        b=NSH5dCJUfst+2iRK2WCIWOtCFwK4x7F/dz6/4plIwvJqfv85HjvndxxIfHQDzxtSOF
         S5Km0XyNQip+M1SQyd8o2fg6050NUIFnIZxQAQRoY3DngEruVNRhJPsRdP2w7O98G+Lh
         xMyeuGKDnictmPwEAssG9U3EGl9147UqK5dLdBG0O4QD4XlqK9COaI0MIh73a1SFPVL6
         Zm2DpIC+m/bd6MKyZcKq4h8IUWCjtEO3CNHRc/5h1v0A7O2kjLxaCXi8/nprRcevt8Yh
         iHsUV7jegkTmep/+p+Z6SYa/8qkfORBKVFk2VCRfr6eehVoaKb/Xesvf+1Wf/ZhLiIaT
         6U6A==
X-Forwarded-Encrypted: i=1; AJvYcCWI/hBhpLaEhfxA961YZt869culXUrEfx8vuvVaRAbWsnnergSp9GXa2G9RqSY72baqGNsjq/3SlDWJr0unvjn6qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJWg6fBPHZbVogjwcahinoP/FKauhsYmcyJURkSgObU7yXcIrm
	KvKLKHXQgt0jDKR4EczMijQIBbhFVnvmzwVNCeJE7Snh+BKWorSECYM7VDdXu4gb
X-Gm-Gg: ASbGnctYYBBnKJw4ZApwxzUsl9suwx3WgDNbP1R/9mTVqMicIY0/A+aQHmwNhHpNSaf
	PmdMfVUJ6vbSRDeoAqO2B+RXo1xr1dQy8bAxRFHch399rkd15f6UB9hd1VV/F/TeOmLCs0eZVDe
	Mr+XS0EOdhnKVxDHfT1NjiZIlbn9u+9O55PosQm5rkW46yrMYs/TnxTeG+jOaRTTQOWs99QhGya
	176oDJAzwlImxKgloxquX1t9iHXZEfz3jqgSB3PKBgg8UrenOjnpNcZG0ajk5y0F4WT0+GtA6Dv
	02yhJcbmQ6nT6+CNBf4zOfYCj6kUx4N6SCf9BLTxa8bIFLz1cEmHtT4MQwdc+ZpxenJweNv+CJl
	fWDDhd/akpWH9/kEkLorac7QNhuP74EdOEYNy+cOEgaGF4rge/EO6s3jRPTPt5vaEScoTodpXQ2
	CSUNUVYszOfvSsGUF3cqvjHPzZC0FtIH+/ANCG8Pu7svgV0ZYseH1Pd073utc=
X-Google-Smtp-Source: AGHT+IFCHA+7flnScm1mVFYCcluUMHvQ2gESx8ROFl295NvFfJ9lfNXkt6CL4s9wGe6VR0xgf3Scng==
X-Received: by 2002:a05:6122:ecc:b0:55b:745e:5458 with SMTP id 71dfb90a1353d-55b8d7bd901mr3688636e0c.19.1763992300310;
        Mon, 24 Nov 2025 05:51:40 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f7d462fsm5759249e0c.21.2025.11.24.05.51.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:51:39 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93720298f86so2548792241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 05:51:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrzdcs6Jpu+E3fLTzrdk0tBouU1IBitzP5i7eVcXBWrQUtDBQ4WLH9s0BM1rp0VxeAZ4fh9DW/YWet1r9EcLxKkw==@vger.kernel.org
X-Received: by 2002:a05:6102:5a8f:b0:5df:b8a2:6ae8 with SMTP id
 ada2fe7eead31-5e1de494836mr3871925137.45.1763992298716; Mon, 24 Nov 2025
 05:51:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119110505.100253-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251119110505.100253-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251119110505.100253-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 14:51:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU9QGjAgJ-nFhkwwz+dQkLGeNfOESiqFJ28SMsjp0yy4A@mail.gmail.com>
X-Gm-Features: AWmQ_bmPbp3WmYY3bjONnytlO4-zQK26WKCMV2xGP8kqV-xAXNaBMUHNkMBzRLA
Message-ID: <CAMuHMdU9QGjAgJ-nFhkwwz+dQkLGeNfOESiqFJ28SMsjp0yy4A@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r9a09g057: Add USB3 PHY/Host nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Nov 2025 at 12:05, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add USB3 PHY/Host nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
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

