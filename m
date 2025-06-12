Return-Path: <linux-renesas-soc+bounces-18199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4045BAD74AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 16:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96024188BC70
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9CE1C84C9;
	Thu, 12 Jun 2025 14:49:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF5B19DF9A;
	Thu, 12 Jun 2025 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739772; cv=none; b=TQ5o89py7xDM2rAUH4LpDGR3PCH3vHfvKWjar1fOUBHZSjtxHPSCylXuFeCxKeDcQ55azFblb8t/Jdd1jA2HGdTYB2wbsbmZG1Cca5s492+6WQOekCPADcWptpyXn1QfxCh5FckRNhdwipzVa7G29XXZbiVOyd3C+BnudMf+oeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739772; c=relaxed/simple;
	bh=2ZertXQqA431pXbmfY4GDumWZtR6wULFf8L3AEAO8rM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGROpGplzC5Bfb2EWIazmjqg0KY0wgbUP+BFzj9Sps5z9xNGowYtc4JdeOB9caqWzWyRxS7iRo44vzkO+06y5VgSXYN7EXhtcQ4pcTJSN+Lmaig9VFEWgCYYhJUO+rUT8m4m3KolX9+zsGUTTJcSOb4Q8mhZY3fnwMp+lmYFfpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-531341d339dso178748e0c.0;
        Thu, 12 Jun 2025 07:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749739769; x=1750344569;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBzo5c2eHQJ4UmDLe5XXuGLhcnXVF2196yaOopFMfv0=;
        b=pqNOihS2Pqh/9TRoqV7QbUb+bRiUhtK4KdnHvS03U2t/C6nHnYwkCAYR3IAG8vMEmC
         R8VM5hX6E8VD6W0b2wTjJyHv9OB98p4xTDZMvIZbDmPg/9DI8SdYmUkcNtpMbVVWyPVm
         dfWPNPkYEhWuQagMAv2Lj0Y4V84Zo3mMvF8pbc+xNdynmjoXtv1bMV9cJERMteYO3C4O
         vdGfTtHDAUD7qxeG2T6wUgdetIPvaBdbwmj9ni5goFJz+9j5Kgrw7sz8GVAGFnGb3PV3
         q0ezjG3/MYCKGNhaRw2Mtg+SoFWD+9NwJ2fBLYm+aAGkkF1Rb91qBIlimdCGozimmATS
         5Awg==
X-Forwarded-Encrypted: i=1; AJvYcCUMrZF2cgbbKgpvbamNhk47XeuHW7byFVPWk3ey0zSRRwQdOfa1NnjatSlEdBkQL5kpZ6z4dtdYVNfR@vger.kernel.org, AJvYcCUj2FDy9E7Z//XVgq8TH/6HU4neRyuFXPzZ6sVmaWWSDj7RqztpTjJUvoBIIQqCm8m+ItWtJanEl36NLJiCPxdOFw0=@vger.kernel.org, AJvYcCUlO+b6Qj+PPbAOWUxAxjlMXovuak4mWUgW9aP/N39nxCPUWIKWHk3X1WVeKkgGi/qjPZY/l4EtU4k5ESfE@vger.kernel.org, AJvYcCW7KnSFMKDrLg0kXjbnw9Iy9kiQzZ+QzOIC6McgrvUwa7qVqp3PJv7gFcrdeOPzAXarZeguwoUVjenR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3RnuNSkGNZCSoXQDD20sgon89hqI/kwgGiP3OoJpzK/bYtlhD
	rVO/Aj8fdC0fJFiSnGLCLCbYEA9dgXgh/twxxMLc4ZcnW/r60Ko74ymrSTJtBM0Y
X-Gm-Gg: ASbGncszOk226Xv5biiKojUQhqTOB8yzv4Gi5wqRHP8Bs4Y2Heb3JPpDDxz+0q8Zw60
	q4f09mGqFNPmH1JtuGS9Y1LgaJBFfHwK3W+mwezdu7leLMnnL4LezpYiwCvdxvhLEp4d0aEZZvg
	9jCZtJlxi0LnLB1C5FW+jpM11HuD+qJPLjUGhkwd9TIQ+heGTjcJXxLRsDlY4cuGzH9pvSCS2JR
	5cbDBcv/8kej+4UgYcyixZm/xws7gByinQy6RLFlm4Egb/4rmoRcgk2ylL46tubx/MpcxadePZM
	WJcBFx90CBn1s4tjHDUUzCDuhcg3SEPn9nb8AT3mvrLzviq6KiZD22aQSMCp6ZAGsw5zFjs1+GF
	ztHIf2Ieksdiu9QX+MZ7IXr52HFbb
X-Google-Smtp-Source: AGHT+IG6FCabMPqa5gDFT4SapTYACCrrvG2cjeoN5OVOFPidto9Q5HvhaGYw4d9+mfNfqUjy6UKbBw==
X-Received: by 2002:a05:6122:da9:b0:531:2413:ce62 with SMTP id 71dfb90a1353d-5312cf19905mr4022816e0c.11.1749739769196;
        Thu, 12 Jun 2025 07:49:29 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5312f651547sm312041e0c.22.2025.06.12.07.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:49:29 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-53125ca78b0so363782e0c.1;
        Thu, 12 Jun 2025 07:49:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpY8gNH0tvlUuGQiztU2Y6o840aHcf15/PXi+NuWppKlDz0YqxCeP/PQutbMwfaFme/vfwZp7vRXwXgolKA1IzrRw=@vger.kernel.org, AJvYcCWEafgFeMhYJJ2r2C0InAcHW7wQ8KQmENJUY0mtGkB2I3jj3i7qAwjRhXsymZglaVq5+75hv0kasQCG@vger.kernel.org, AJvYcCWbl6AOjqDjeK9fw9O29Ctspdfe6nFbgITapmrFWuXqH2KEdObdDX5HFeeR8knAoB8CHkOUIumX0y35@vger.kernel.org, AJvYcCXG/2U+1aE8JawFuQ8foGZEfoNRJk9+ttP35UgrmSeFK82lRGjrI+VXychRGNSMkhKjx5JLHIzI5iudJuId@vger.kernel.org
X-Received: by 2002:a05:6122:3093:b0:531:236f:1295 with SMTP id
 71dfb90a1353d-5312cde4b2cmr4126676e0c.5.1749739768831; Thu, 12 Jun 2025
 07:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250609203656.333138-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250609203656.333138-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 16:49:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJvYFrj9ZX4Q-EOAZXC+P=SmNMfMZM9tbebYeiZKQYGA@mail.gmail.com>
X-Gm-Features: AX0GCFt9BGU4-f86W1haNgpSZABnoAaeDYNvqzPOREPZOvb_CkRm3reF840XDAE
Message-ID: <CAMuHMdXJvYFrj9ZX4Q-EOAZXC+P=SmNMfMZM9tbebYeiZKQYGA@mail.gmail.com>
Subject: Re: [PATCH 7/8] arm64: dts: renesas: Add DTSI for R9A09G087M44
 variant of RZ/N2H SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Jun 2025 at 22:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Paul Barker <paul.barker.ct@bp.renesas.com>
>
> Add the device tree source include file for the R9A09G087M44 variant of the
> Renesas RZ/N2H SoC, which features a 4-core configuration.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

