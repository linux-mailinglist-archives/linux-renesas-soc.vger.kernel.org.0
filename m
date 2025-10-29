Return-Path: <linux-renesas-soc+bounces-23856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED7FC1BBB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 16:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D45A55624CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69215263F44;
	Wed, 29 Oct 2025 14:21:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9513CB67E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747685; cv=none; b=BhWHVjpyfy5Mrei1v4J1dBf4S6YG7rZB0SDzGnRI2LP+UBzguHgeoQhCHxJjhJjhDM4Gz+tfa/HbFzZX1CI920dU3yQL7V+Ba1e/viLbDrSROZfnf1vwTEbzTs7RAkpjTMlTxcimBrgI26Sl8GZBDLAQdsf6D1ToDwe5gf4LyUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747685; c=relaxed/simple;
	bh=ibKGRxpsOOl2loLMD6bCBKnAklZf3fN8KaAmPERTqpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PjhB7rbJvH2b3YfOzOyxLb9jpB1NqEzI73+GoyjTlRogC8jNJxcXii2ewpkDllnBAA/i/FSqU5kuHSgzxsGxo5gpD86obzBTfclb1PVb0nPC4tvAPPjG5z8MunWbuCVA9LGomjB03u7S95fYR9UmDCCf1ximIhbOBWpquXuz0pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5db385e07a6so2813758137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747682; x=1762352482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyBzuS5uu50decQRlhVuBsPB9Un8V1UaO7gxw+OVEYo=;
        b=VngWVwRVWST6Zg0dRxx9m9Jb74bPDp8uVtNbfJZsnL2d/B6WU4yv6wJY/wr4mrp3+r
         WDwYQtLD1XnfVl2K37VsJjZe9HhkGww0IlcDGGOSt/bkvVOERIdo5X+/v6Ylv60CIPvI
         biaIvCaX2nknTBqe1+KTNQrr2uaiDP3is9SegVpN/vSLcie1rQ3O4gH9l6U/yc1Pcvmq
         PVqafaMX3vi+4/OchZs7/DNWZHvc9cSH2RAgC4hkEGTNh6Ipm30d/DxBm9oEqcE3Cik+
         DyQWppUHqb20NBP/xOPSCVyBjhgc/SgBZVLphPTRviIo3I4ZgBk3/lCeVpomQ5AQYNRn
         P43g==
X-Forwarded-Encrypted: i=1; AJvYcCVZvs3x4shfNEmvIiHXDBkjnQ29++9DoOkeQKG7obprXv6Po2e+EfAmeIUe+IvVbfCfRnHVz/2ylpQwxfywheSWZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVYbYVzMQTO/1ukxMQdUcI2dh4BB2G6OTvjI20zZzc6MXEu6us
	eKn4F+ouG9dnGFdm8c5IKecRRlo1jSgmuHX8wFUiGnqap2b1KfFRfDLaYgkPUjiQ
X-Gm-Gg: ASbGncuusTqp6J9LzKyiIDnllGHKiOupgilpmzrGAJWG74l4+boukxb42TCaJmKyirE
	BM5u0/MkGF84aEo4l9pgGdcFffsu8d4vs4UEHCUiY6o62+cu+lGQEXbbwNoAt5+JiT/KGugDnYR
	HrIbE6wgh6Xdd8zh1z6qbEicpacbKNPQDJkH9naR03hcxu0opMzC7ipK5O7n2dZOt6YTEGTKB1b
	79RWeURyK3PAx2r2B/pIvULf+R2fBXY3jYwxGgb27JwGYkPCqbI9OzlY4Fweq2jmwVLAC0frDsJ
	gkaw3o3BfSfSu/vUhOQchi3vL3d5YeaPdW3ssP2dFUOqP8OOVx2dkrlXhtsn2zJdw6lullLnwg/
	HkEcAgYVQXZI5SRufwuv6aP9KLidhc+kDShmx3colxV0U0NLn3j8E+nSK7juI+HuSJ2Z+oEgWmz
	f5TODwszwQh0jXSpEAHPWCf+l1tHpVYgHirDWHCo/q8A==
X-Google-Smtp-Source: AGHT+IEYAbgD40cxPUx4qO792EZuG+7D6lQ6ER9qm2Pq4iPH2m5EMCvUHwSfpZxRjnBsUVyqvjS7iQ==
X-Received: by 2002:a05:6102:809f:b0:5db:350f:2c6b with SMTP id ada2fe7eead31-5db90698d8amr964713137.38.1761747682253;
        Wed, 29 Oct 2025 07:21:22 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934c3ed019fsm5223089241.2.2025.10.29.07.21.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:21:21 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-89018e97232so2056603241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:21:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVx0ImG4RetHO5gSgLDq28cadxVubUixZs8APeK6IBRQFQZP6zlCvLkTqzuOd1KTphRzkIRUqusKk8TYVX2gzNddw==@vger.kernel.org
X-Received: by 2002:a05:6102:2926:b0:5db:33f9:adce with SMTP id
 ada2fe7eead31-5db9069da51mr902689137.41.1761747681523; Wed, 29 Oct 2025
 07:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027184604.34550-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027184604.34550-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:21:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW2sn09MQoV6ktBwd+JF-5M_c7jdW_e68xEGYsovqOr+A@mail.gmail.com>
X-Gm-Features: AWmQ_blJcp5ae8kH23TjMg-NYbqTJRrYgHltFldOLdMifDYWeLy3Gz7jK56UcE0
Message-ID: <CAMuHMdW2sn09MQoV6ktBwd+JF-5M_c7jdW_e68xEGYsovqOr+A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Fix full-size DP
 connector node name and labels
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Oct 2025 at 19:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The DisplayPort connector on Retronix R-Car V4H Sparrow Hawk board
> is a full-size DisplayPort connector. Fix the copy-paste error and
> update the DT node name and labels accordingly. No functional change.
>
> Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

