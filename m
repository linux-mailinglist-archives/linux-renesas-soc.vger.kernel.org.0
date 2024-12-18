Return-Path: <linux-renesas-soc+bounces-11534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A159F6682
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 14:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67AB41894043
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 13:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5521B0434;
	Wed, 18 Dec 2024 13:07:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FF61B040F;
	Wed, 18 Dec 2024 13:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734527222; cv=none; b=FzXqMXZ1CXv02lwpqaet79RT333wC4aRc4JueU4qn5eJcKvZG8COATdlP2UGu0UDg2INZWPxyAn+vZSi8H478wOoTO4cARECRkL9H8yGXYqxLHKX/4z1+HjNq+Dddi0swRGiUaATce3BEJ+c4dcogyS8grz3QgHrvWk03hAEDU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734527222; c=relaxed/simple;
	bh=+ZF7wQyhQtfuCHs4tBTeUgZCdP0pgSRTO6FBlVgoGZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RalO2N6mGz3veoIo8HeCjhFdCewaahGx0kjaZXNAVnmGd+GEKRIEanFfnNWuuZBrXlJ2mOw3XmmWcmNfWklUCAmn833QtUM1MFmFr/TYzLZf+/5ZSITlXP2S9hdGkiQlt9fqTb6Ok4vGl/quA1OyABuDuB0C/kdnhk6XlAOIGCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b6e5ee6ac7so505124685a.0;
        Wed, 18 Dec 2024 05:06:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734527218; x=1735132018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyG0OlwA80Ue0XDd0uvh97I/Gjt2Iwe143kBuuzRShQ=;
        b=cyNJymnGfntpd5GHTTSFByO6blfWx7x+kGk7RpJKpQmpoO9eHQSSQ0uLyjUSmaqhW7
         XdYynNxpuhFfv4xL/KYYrCIbG5OgzOueoXOcl3XgVsZ7KH5WN2Gr1+rV66zFbXpYYCVP
         7dw804tBWgMbwin6dYfw+7uh3fVc3qUR5JXBOcniq9IlS6/AgtYZCpdjCj2/dosBqxXv
         cNfpbUiY9swVCLcbcmCVN5t5HbKTjeQ9Lzcl4wNdxJAo9+YUbHzGaC3cbfkYL1dlVmEH
         sUDpUHWYDKVb5kMLjbF+cOta4QGd4ZAyE4nrKM3/6jnF3FYYHhk3ouvWqHvWPfqmDxlY
         2aiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSDtGDXBSzJlw5QqOxiNlWHFV+UvX3iAkR3q8sui+gKrlJA9QT/31S2X5nuSn2bvpc1RmdRhi8VX7Wbpqf2CTwOTw=@vger.kernel.org, AJvYcCWCD8MrHKjLbEnCraZkkMxwP3Gq1yOGGfbQq0/oZ9wU4I6CqRZTGhERBpM3rt3IfX9UBpjVa1yrtaTM@vger.kernel.org, AJvYcCXPhneZHwJR74ILTFHqVvknAOBFKP5TFwpBkhXPAlez8D85HXsNPd76CVTowaJigcH8t094vxfU2m02bOo8@vger.kernel.org, AJvYcCXWkYXaYaBcuPuHlzrqCQmkt6SycT8vFxauYvlqmGBR7RpC4iYNOORTgEQyg6Yb18JRQ1AMlJWAEzjv@vger.kernel.org
X-Gm-Message-State: AOJu0YyybLa6ko6zQkR2AHi/0jr17A7fQQerKvPA36Jvny6Ky4FHptjt
	ztA3aAvkT3bBxcbRKNyBrWdBv9TKm/EFvlkyrSjnUsqPkWYCrfdo8zTfnW7V
X-Gm-Gg: ASbGncv7z9IWyisVEGrIW512s7IrJX5JQGDi4CHKwUMBgVHZrgUR+Xu53/FQDIyvEdv
	tz5mUNeAXT9+LK4hnTIkuv77S7MMxY6Ai+zGIFBRmr7whv5icOrCLFsuBZJM/NnKiok3niNZ44a
	HSftHJiBjkEKqXq/FKZFysS0XdoGXymikG0QXTRH05NSecTTndIECOogP+xlP8eGLzYk1+yqaQY
	7cNa9mqRK9jnXw3a97kCNkVQ2HM0bTIMZRDo4inMH2ZtUliRr4gqeqVtA60ubQ7wrnZbx/Rb8PQ
	dLW96L5QbzLUuOXHF6y39EE=
X-Google-Smtp-Source: AGHT+IGfnSUYc5HhM6fBgiFJJWKLUAv2iBgNxrmcekkh8B8A+9FTBt0qu4yG8TnD43qFjR2hZ5QqZw==
X-Received: by 2002:a05:620a:4014:b0:7b6:c92e:2e6f with SMTP id af79cd13be357-7b863720420mr445177385a.22.1734527218541;
        Wed, 18 Dec 2024 05:06:58 -0800 (PST)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7048bb8cfsm420200085a.76.2024.12.18.05.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 05:06:58 -0800 (PST)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6e9db19c8so438114985a.3;
        Wed, 18 Dec 2024 05:06:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8lhGPWoUlKO3kNDGHpNPwBtP+1gNW6WibJmBQT7lEqh8GWkonDiCNgyfMZkREBhxb8SKqNAcXkLwquWhd@vger.kernel.org, AJvYcCWd0blur1XBamnpOdPefYJ2otodEXDmHzyLATauVLZLYD2/uBXb1L2yFVPFiNzcifs21HgeqbMKY14+@vger.kernel.org, AJvYcCWmwIXPE6GRXd0E4R6eoIayrgu/M8cJK0y+yxRJN+ozC4YpTZMjH/GZIaSbb0/19DhvQUtE8jsCK1U8@vger.kernel.org, AJvYcCXS4//NCmEO4zx7/cmwSUU/WIhD2ZP8KOqOB+JhkNncXIC4F0sADOGd5d+xlwmPSHiLpXRcNyOJl9qwxhw3M0gOazo=@vger.kernel.org
X-Received: by 2002:a05:620a:4706:b0:7b7:5d6:37fa with SMTP id
 af79cd13be357-7b8637b1763mr380167185a.41.1734527218052; Wed, 18 Dec 2024
 05:06:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218-rcar-v4h-vspx-v2-0-c673647d96e1@ideasonboard.com> <20241218-rcar-v4h-vspx-v2-3-c673647d96e1@ideasonboard.com>
In-Reply-To: <20241218-rcar-v4h-vspx-v2-3-c673647d96e1@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Dec 2024 14:06:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQCtvpXLho5wWfW3Bv7nQ_aBzs3AZUjgsOHpTXHye5xw@mail.gmail.com>
Message-ID: <CAMuHMdVQCtvpXLho5wWfW3Bv7nQ_aBzs3AZUjgsOHpTXHye5xw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: renesas: r8a779g0: Add VSPX clocks
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 10:06=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> Add the VSPX modules clock for Renesas R-Car V4H (R8A779G0) SoC.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

