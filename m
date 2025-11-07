Return-Path: <linux-renesas-soc+bounces-24299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B019C3F009
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 09:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34B28188CF21
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 08:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A896931077A;
	Fri,  7 Nov 2025 08:44:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF753112B0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 08:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762505085; cv=none; b=PMQmTdYa0YotR8UnRqj+JJ2Q9nNbcoOzPOSO0RIaShqUId7N+da2lhbp45/g1kNpzSDFrAvw+57Mep/X8nZHWUbE69O3BUcpMfaXlIx/msKpPbFpw7bO4kd+gHcKbwBEti0igTny1O65y8fgWFFu7i7VlD3QKI6wOamwraRRF8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762505085; c=relaxed/simple;
	bh=N6xgWoHDs7XMDSylQ0aZJ9sOOduQO7UazwaRI4anKug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WlI1+/qDWfylUlNYrO3DJ/nOM1tfPrgrCWc7CG+Nx0lA0TDAHlPzdmSeoBrdY+kJ8OqoBNtzvsmDKCFnivlhUB1rt6D0JMeINnkwfuIe5PI8N+Zf23FBwnN3bXHv9NgekwLOi7EifUbZC/7YYKrTQ/tbybx8v6UPHEHbLDH6KpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5dbe6be1ac5so201680137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 00:44:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505083; x=1763109883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=67Ay+8Yya5LB9/YiJJ49ptEwAOu7ahTc/J+O60ROzS4=;
        b=eu9zQWJ6Ov5ULY9l+/5gUJdVuIIVCUXweVtBd5WcsvUOe0aEq7ZPP82Fyzw3+RZ1az
         3zXp6ucRvu3SNuqNDj6nzP944FjOCyNeLDqpAjcFMpkGgUuPr1rbQ2QDzONVh9kKdPTx
         /oYYpmJOf9Gy4uetAeZZ9pT1QHRtf5i6BgKyMTbidscYmgi67ZiBnEMA3GlOxoXqAgCL
         No5jKY7uj826DZMej98hTsGjW+3ZGPxy76/16BkjPz/jn4PcjJR4KkUMqs2LKVUmrWqc
         mnZ6wohliXLO6iaWmWYw+/WQuNytxiBT9T1yiGrdFNRvCMIzkFMyZJtv5cGUrl779Te+
         5uCA==
X-Forwarded-Encrypted: i=1; AJvYcCXhqloI1MdJ0OQYFG5RmHh71DZ1shfRDByWO3ZaZRv2/0IurzCUJXFKQPZbqA/0c45VonaQQhpKb/H2iJXF0BZW4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhCdBEojvY2pgdi7PcEuh8tgJgdRqQ7Uqmhw1cYUwAhR3xX+lE
	Mij4XM7bRqJu8giiTPm8D2UEG3rRn9wT1bCD4KyXQQ7YuVzPB2jl+XpSr6e/EFKKRwE=
X-Gm-Gg: ASbGncvXC45zokcAjB71hw0lMvSK4b2QOXclmXvY/qJagdQPY7QYyEc8WCA7z2OLp5u
	E1BcQ8bnJq96WkwHuGv4nE+wFW8P3ltTblNYumAmlkTsXDcFj0+BcW2B/pk1EbYZ7FvqCS08iy3
	Wm7vZ3o9jETrXFIuQSUJcT6m+Y6dFAtCnB801fMNSLOFQepxNGvjS67UhlKQBwxP6MgWTRn9iZE
	LL3LP7DhFvx3tF8KSAUlxjoFNOMuFpHif51hsrxg1XOScZ9U8CbXtQHwlFhs0803fLklmNe+iCs
	sf7RlFkIaah74HGx3zupZySVry9TuxNVV6f+WPB7ZFktrgJUOIClgPrI0eFG/WvJB/VbLCXK2Ri
	e3vC4BI5fXdnEOjzAl0Yo5pwFrG6jtoaTrha8ARDlMFfdeMIEWnZoJS71P2r3qvfLpiTPoJasig
	unMkw/IkCilmQBliZW0yntRc07WmriyuLU4kVeFPOpCJ3lXTLSj/ZL
X-Google-Smtp-Source: AGHT+IEcO63QD88+buUCJKCP1x+IW37Qp5+6VTB7OYi4/r0bYe5ZSjjwPfxbqtwpYStSpSORI83EPQ==
X-Received: by 2002:a05:6102:f0a:b0:5d7:c6c1:8510 with SMTP id ada2fe7eead31-5ddb225654fmr654517137.27.1762505082860;
        Fri, 07 Nov 2025 00:44:42 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dda1d296cfsm2114648137.5.2025.11.07.00.44.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:44:41 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55964d4ccc1so116006e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 00:44:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXK/n5ZdppS0b7mC1uOlJ9c/w595UGSLo448fKeGkrApcxB4ezCgujMUoVFpJE/s6ZpecL3Gf0P2YwemvdNfqQIlA==@vger.kernel.org
X-Received: by 2002:a05:6122:200a:b0:54a:87d3:2f09 with SMTP id
 71dfb90a1353d-559a3a111a3mr827903e0c.2.1762505081472; Fri, 07 Nov 2025
 00:44:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se> <20251106211604.2766465-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251106211604.2766465-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Nov 2025 09:44:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4gFjba2jPEp65HwvvB3OH_jWkXhurTWFYCk6QiA1FJg@mail.gmail.com>
X-Gm-Features: AWmQ_blrrptFzMWpvu6Y-7pL5-tJ_1h0P3WXNduygzU8YG1UWYjXmC7OG5BpV9c
Message-ID: <CAMuHMdV4gFjba2jPEp65HwvvB3OH_jWkXhurTWFYCk6QiA1FJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: r8a779a0: Add ZG core clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Nov 2025 at 22:16, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the core clock used by the GPU on the Renesas R-Car V3U
> (R8A779A0) SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by clock driver and DTS source files.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

