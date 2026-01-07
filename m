Return-Path: <linux-renesas-soc+bounces-26355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B599CFEAEB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 16:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C43930021E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 15:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E583361DA8;
	Wed,  7 Jan 2026 15:09:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663643612D7
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798583; cv=none; b=kwMwOPvFP/lT7NAh0ZI65lafPBNRdy8qBTXnJiZOMfwZMmlKkkO7Fvi0bSCfux+e6i/EGtlipsctgbDW3FRoKQu6GN6qjruvKFvHzhk+igsepy4cp96nPGjIIXnP34IR5cFEzXhoLOJK1rPadBhx03sNnS/x1+g8eSywBgdKvZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798583; c=relaxed/simple;
	bh=7e5qMhBj9x3w9tILzgbqJvwRYvlcmzRy5BTflJWO5/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swJke5jVEQZNW/8BnY4ecX5tfWiRcqlbSXIKoSe6TV6M9Usdp8zxk4jrDiZKgh7v0GAPd+d/8NUF+3QsIuZ61GsJZy6/DzpZN2XAKgZjN2CTYjrENv4Ub4n4NitAVmn5ZN2eD4jFGlfH8yojGOSNeAX6PNbddPR8llsgqfbFMM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5597330a34fso1466298e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 07:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767798580; x=1768403380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9dOzhpI14IYVqSU7+juMd2iV4APAFjyTw7MRTrqVLc=;
        b=R1PuvdHnOROCZiIncsNH2xuXzXQzUSTLVgd9N21IvAkCU4xpN70RrNhA8GDWDvBSfS
         gwnMrkaGXu7tryFkEYI9tfFK9Pl9R1kzM1uvwD6A4RVMwdGbRaLkXkgDGrGbWC9lLj8N
         kmhFbCIvRv4+Vf99uGH9YAOdQc/I2BiSlpkMsY32fr8Yof4RmGnSeABumDd0p+9+py6E
         TnSjhi0vU51KeAjVg9ZT9tBF/xzew/yB+bt+rle4EONUgyBOSnxRH3/EF+MePoI3Req2
         xcqJyca2K4WfJ0iH4FchTTqhOdMA0qMmpkm9I8TxeweD0c6S7qLNKjQST7wPRu9nrEnb
         N1bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz8bH0VBXlx27aIWTbnRQyTYvXZoEIlHbg4m3VFNcaIL+v9erd195TFUGLUoJwMwhcZPUfoT/9IVJ48WuGBo8zNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMMOJXU8oOXGRSzwOKK4mCG7NoV/z6qcTrM7qsbimSth30D2sb
	KLHAYYAKp6vp9LbaQYba43Z32xBMSYSopkgC1NmXiLyG4GEzcAiW9oUd5FyUlrgy
X-Gm-Gg: AY/fxX4z/+GlbHEiBK4uMVPY8fLeEfvwlJn+HKbyMXcCNwoWynsGN8kSyUSwScdveiv
	TR0DXsMeQ8m9uFrDqt6J+bXQBEBdN1y/nW7ZQZ7qf2IQa+k/+bZYxK6Z6Yc0mDuVDNjFbKmlY/M
	T/w51kBOt+OtFnLdm9Jyc3ozv4PBIX20EfI8dSe/aMNHV4MuM320vrde2TrKPYfv+mkwe41UmYh
	oT3sGkTL0kfFt8Ur31ifzP08EY+cBPQ60ysU4cRnZb89Z7BMTc/TUuLa8nGixxCV0xzvMK7OBsE
	Ai6iVuS8R5dFUZbr3bJM423+B+BvuuaiygdwaMFX2tNI4jiO4O2mX0dKmYeDm5nB8VGvSLrFcKJ
	St/lQco4z2uewURnt85w3LXoQd8p5QNQAn9Q4jSnHJjdRaCe5/ncPZpa08ny52lCMt85bSuHPxO
	33yE/mWzn81sJFrdXJuDqnyg58SMtpqv2EBI35EGR774ov/Q1l1/MMzWXWxgI=
X-Google-Smtp-Source: AGHT+IHAb0nqpCWPmQoZfBCxNCl5tv8h7XN3B8u3Z7Vqf5i3sfa9u/h8L4t9vW3Li12JG6+QSgJiiQ==
X-Received: by 2002:a05:6122:659d:b0:55e:452f:7aee with SMTP id 71dfb90a1353d-56347d76f83mr1110151e0c.6.1767798579977;
        Wed, 07 Jan 2026 07:09:39 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a209b30sm3175946e0c.8.2026.01.07.07.09.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 07:09:39 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ed0a9cbb3fso304685137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 07:09:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXEyoHqEjQiUrJ5Xam1fcYpdpjymUzR84Ad+akX5sKG+C8YI5J0qBP9SMohrlUm1TjbLJ5NcpOc7ZVS+7GuXwG6nA==@vger.kernel.org
X-Received: by 2002:a05:6102:3e82:b0:5eb:fc32:935c with SMTP id
 ada2fe7eead31-5ecb647f1b2mr1034227137.3.1767798578356; Wed, 07 Jan 2026
 07:09:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251224165049.3384870-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251224165049.3384870-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 16:09:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWC_863Fzpo7SstLiFHZYxmomVkbiPWTrhRz6=kzaTPFA@mail.gmail.com>
X-Gm-Features: AQt7F2oYUDXscAVf8azPEwYoK3VQ5BFBsRCCHz5MK4KxGd9dpeXZLz8ZiwfozR0
Message-ID: <CAMuHMdWC_863Fzpo7SstLiFHZYxmomVkbiPWTrhRz6=kzaTPFA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: renesas,r9a09g077/87: Add PCLKCAN ID
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Dec 2025 at 17:51, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add PCLKCAN ID for CANFD to both R9A09G077 and R9A09G087 SoCs. This
> definition is required for describing CANFD device in DT.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-clk and renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

