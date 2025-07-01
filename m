Return-Path: <linux-renesas-soc+bounces-18976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6207BAEF8E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 14:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4283A7AEBCB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 12:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87192741B3;
	Tue,  1 Jul 2025 12:40:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFAC273D71;
	Tue,  1 Jul 2025 12:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373619; cv=none; b=rd6DloN3lLr/6JFO6J3D48tC3PN1Oug2rUHYUC28COOgHv09HCkryQx6+JsZJguU8sgXS3Me4dZFC3m+QWo0V+jlG9K/ZBECDqfsluAsxJWyGGTGiFPLWZWNXNhffKOqpdZxC0cz4UaAzpopnrmBwBmsosGBwAoJEv42xdXCvrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373619; c=relaxed/simple;
	bh=M65puCm4vW9nJWFshqQYMEIAY3sSiI/i+1OCms03Cgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=raHXL1JzPuwjlztMVBQgRzdDxFwbupmDx5LjEpdWsjvKryXDMU4EFjp5fNsk5pPVQNY5uQjm1O0B1uWt1+dyA5Qc8S4xeN8E0UVu6bMEb4+gt0tQcf04ib9EnyF8uJb6jIZQggFXxqCPjEOwa7KqCUhH3UURM0pwjchR9O87Wbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5316a5e4c6cso1785107e0c.1;
        Tue, 01 Jul 2025 05:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373617; x=1751978417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7Eejxj1soWFWlrepxnm7X8hD9dfehl8KgAO32kH8B4=;
        b=PxTH3hJ9MAqV7qRCO+Aqf1jF6G3KZVd+TLmfE3gmS5gln3+ZHchZZFH4j9LnRLHzvM
         hvL+G2a1/YPOJA+6cFSDjd2rtFe5QlcU2804WgKwvikTFI8I+DFePM+kpFZrXUuKbwSY
         im1r4LdyZBR3Bz1FsxWDlLxTRvo0LDgw5cwy8OmudRzmS2Uq17RN/OWUFnWrbK9gPW9w
         rQvRMJVctGfpi60HDsdAa+1DD9/5Ig4aUiVvu7Kwt1lNCH8jvXQmLa8Erv2h6PnZ7wfR
         wGaRJnVNLdn0fxuxOikUZkttndDqnn56FR9s+A3a9J/6+aRAMMbrI+dQUOR2hmZCdgct
         kc3g==
X-Forwarded-Encrypted: i=1; AJvYcCU4VpRFob0q3oJ1X45J5lUBi9c9PeYxYPZyVSgJ+ztFdrRfxQ5KCvdU3GVe1ebTKQKhuurmn6VTRUgp@vger.kernel.org, AJvYcCVkEXuml6ugIighniyvUERfmhwbqF/2he7mMOZUGLdRPrk37Sn5A3HX2mEdRaEWxjhCiQUyz3L/zv92EgX/Zfi96TY=@vger.kernel.org, AJvYcCXDxDalV5Xh723k+97GcDCSkD2DfPYHQCyV4fz/LgYoQoATgY6qsS1qAtX56mQaIjv39l7rq+s5rXPt@vger.kernel.org, AJvYcCXH2yc6G5JukzTUIA79UczgHpyl8x2YQGfUNtEk9XIG9Oso3FnxqMHwnLqN/DBYkAAgs5jyvTcuJuutC9Y+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/FP8TkJ4SFnDnqOii0/CllfOjHPIv+VQGDcAj3TLPkJLb9Q3Y
	EojBMYDKnCj/Ko2mJ3B6zB+Qc4bj7AprzRhmkFs0Ukk3EF1JVK/9IjSl38QYx3Jf
X-Gm-Gg: ASbGnctSLkEfphWQ4CzwQSGycwbTt1rZVTYmOLwG6118C1P/QzvIb8qOS91cw8aRqDp
	p7L1GgRM1t3TmNCqcFs3AefjW/f4jPt9mOy9fFEW5CGSEX09AZ+zBFQK5ljwi39f45CSYL4vfzL
	DckZewKgPQhW4ZkrCnMfbdm6NkDRr4TgiG3+n0wN31Rqs06I6M2bxCup1dAEKXo9CH+MWndxTlh
	p2F8nSB/4wHkXbJMfCMplC6M1wIJEwCbj3+/wYSmFkXrBMF4aumfND6/ry1eN9+Qywj1DYU8iM1
	Aa0iLs00KvNIwtWBgjUY6Syn2IBEIwmuXpILwrEqb5YzNes5t7lfH3yxTBi4uHuQIn3NUT/MnaM
	XssIBgbOwIxQMaE/5ubDgf+6c
X-Google-Smtp-Source: AGHT+IElUihhd/l1UvwK44xLVEWPTLcS98iUqgMaDfEHJXA6Xzj5BgdBrVLg71OLkGe3yGcpwKsAPw==
X-Received: by 2002:a05:6122:2a0d:b0:52f:4680:1c75 with SMTP id 71dfb90a1353d-5330bfbe382mr11091775e0c.6.1751373616746;
        Tue, 01 Jul 2025 05:40:16 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-533091bb679sm1687507e0c.25.2025.07.01.05.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:40:16 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e770bb7b45so1582988137.0;
        Tue, 01 Jul 2025 05:40:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7Gk6yySeIW2wTdNfCktijFVHubYjmMRFo1TMZBpdqWKd91oPtsaxQQcJY7O8+55kDagNlwrljNmmTk4UhNQ/FTjY=@vger.kernel.org, AJvYcCV7Mo7KwH1FZC2v9N89ywLOxAX7IOxorYnQC2a6RZUWAZy6WygTzdhckGlm8SXOT0VBM2c2u5eLJyz4@vger.kernel.org, AJvYcCW3p3dVONkN8JWiedZruNVZvSSsWv8FACmgLKQkswcfe1uXpweaQzhnXOKUGE9EZi3LBRC+BiIwFI7/Cnrc@vger.kernel.org, AJvYcCXOxxh0X1xZ2aygMhhRr6BI37ly5+eEQC1M951w+mhSYHtJeKh4VBduaDWSEvTu82cXL5nOSXuBFlOH@vger.kernel.org
X-Received: by 2002:a05:6102:1625:b0:4e5:ac0f:582c with SMTP id
 ada2fe7eead31-4ee4f71513dmr9550102137.13.1751373615728; Tue, 01 Jul 2025
 05:40:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250627204237.214635-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250627204237.214635-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 14:40:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVj8OSF80ZEsif4YYK=hfLHuoYdMAQggvHF2kJMz6gJw@mail.gmail.com>
X-Gm-Features: Ac12FXzp6fbGek5ncRjYkPAHBXcBxz_f2CFRMhvhRMJx3Kgssmhd54oehTr-jTI
Message-ID: <CAMuHMdWVj8OSF80ZEsif4YYK=hfLHuoYdMAQggvHF2kJMz6gJw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] clk: renesas: r9a09g056: Add XSPI clock/reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jun 2025 at 22:42, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add XSPI clock and reset entries.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

