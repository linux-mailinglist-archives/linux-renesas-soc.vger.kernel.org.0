Return-Path: <linux-renesas-soc+bounces-19037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF274AF59BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 15:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A0F54E057F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 13:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88FF26D4FB;
	Wed,  2 Jul 2025 13:38:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239BE210FB;
	Wed,  2 Jul 2025 13:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463511; cv=none; b=A8VHhoYPJFtWglT7AW4zTpoGw0yUWkLrcj3s3J63fqe4jJhVm9FFqpNTSFhShcQ+HPpBFoE1WDtvgLsugyMnKI40KCHGiNiKrsIpYXiAXBJgA8BG6k8Z7WVzaWSobTqVfCyC05on6/XDOVSug6qTH7qjNlqUV4aznL1JqgvEGYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463511; c=relaxed/simple;
	bh=fuOTSmJv7T+0NyENvlRT2dBogIf54mUZAlku7TamFMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bVgojMspSzwYI/ddyu4K59COXI6VQX6NwR7KKVBC2IBky4J/XUD1PNyoWXVvO3pqFLiYiz6oBkvWiTbc34m1+eZlMZRge/TyzLeHWj2ZlWV8pXptTvQRCVe97b/AK6TqiasOtPHiZpXRVKpDjBwayrzKe+svbvv+1hIpivBZsPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-52b2290e28eso1580412e0c.3;
        Wed, 02 Jul 2025 06:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751463507; x=1752068307;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePQG1MsUBShhdoAQGKCKXv0vOZyacAN5Vmj3ODr9rzI=;
        b=dWijLhxYOA9h6N2HrjiVbPiA4CeMc1uubLW/hShhaVT7LJizfGe2Zo+Ix6x16WCjgn
         i7GuztyPsDwRkFZYq4i+Hp1z+2UDvesmNS5juEllvTu/5YbN0WRhiTwLlQDzzO8GgWnM
         NPYG30G03j2y6HrfyFPEB6BwQWpdCNdsnbuWWc5XQlBeSKwiqWGBStutOX4Fr/N3PmG7
         NyR0Sm5VwcwxEeIE0m7kDkx8ns2Knb2WvWea0vN2x3A1WFusgcpw1s1daDbZSUueLteK
         IJCckLF2ssRu1Ai4HKZVw1QiyDBbYg8MGX3wdXE7yxjsgTR44KSHrirmpwJWfHMsGk3b
         K90g==
X-Forwarded-Encrypted: i=1; AJvYcCU+p0jQTOrA143gq5x+FOZecWnSZAMQo63jhAQkY00Y+SGN4PYJ44qo+5LwwYY6IqJAtriQXOlkzsSI+H1b6LkF7Po=@vger.kernel.org, AJvYcCW3Hmu/SfwYNwu4vfSxWwAxDpZ0N82n21NhnJTMWWB01olyS36YthyZpKoxyVDxIiqpct4ZlS5Y+fip@vger.kernel.org, AJvYcCWsa0nfjgkp+ss6tfZ4cmghBzFv+p58F7/85f/kTmcLmL7TkbZEgIeANtp+9UMeL5/lYtbUMMvfjANQ@vger.kernel.org, AJvYcCXtZvWXZh0+JuHQyfoAsdup6zeZotYQyG8K2tVJlOf5Lnn/wDOGSUM8Y6nl25ozEypEDWwVJzDPb7heWZgB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+lIO8L/XLFrLnrFO1eo4OMZy7zRgWLyEGEVxuX4wUlHIe9oAS
	AoYE2q4dX3NdTTS6Jup9K2jNmYJ1mzXrfuTMDuRzSDd+WaBfxK+TjKw+nw0kuO53
X-Gm-Gg: ASbGncsVq7dREnS+/yY3aKgTWUs+uHrVq9d7TJzXlCzFaKvNQ5RlNAsvKdPujCgPMBd
	naUX4CLRhzpm9Fo0Pcg60NYtnpJ9K7CIJvMbSduSHir/dtXecXe0IIDz+/f1strlx7/7NCqB1gt
	lRKXriGf+fucHA69tsPVYSnT3/ScV2bKMk0mo5dBp/j2yHrRioj+7s7fNmGK+twpwycoyzIFyVG
	CbuAwGLD+vQvbs0wnoMpiMJz9xObJILa0bnUYtKjfN6hCASTUqQluFqFPmlnxjq4s3FAa2oBLUc
	3zzbnEBPSBC8T+XAf4pZ1qjgOzckxrO0XEuKmVGetkMStlMi6jbCnJrg9o5A8lX8y0C+zr2+EVC
	9iZgFum7vgLaMi4i4IBXgzE3v
X-Google-Smtp-Source: AGHT+IFdkuGGv6RNbzQx1lUS3R3vP8Lhwi0OtlNirI7EvQ8Qdy4JV559aBIP/OwtLZdNwD2jMCaNTw==
X-Received: by 2002:a05:6122:905:b0:531:188b:c1a9 with SMTP id 71dfb90a1353d-53457c20a73mr1862384e0c.0.1751463507462;
        Wed, 02 Jul 2025 06:38:27 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-533090ba68esm2133233e0c.16.2025.07.02.06.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 06:38:26 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87ec9aee6dbso1489556241.0;
        Wed, 02 Jul 2025 06:38:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNC2DKWrGx2mlKT3gHnYV6epwTkrREiMGFAM94DpTPxf+volCClBeuTBJHDjxVm4KWNcFq5cKZs4BQCimJ@vger.kernel.org, AJvYcCVh8kDVtBDy36A8DtM0vpxK0KXyhS7fF+110ks1mbOHXpr5c6vO4kCgb1UGYRZTCQ75zNK2v7wwbtKLSQYvSoE4KAo=@vger.kernel.org, AJvYcCW5lMpN8bySxaTfNxJiLgBzZ4z3I/6nAD4z+h8YPdnns0Y91xQCYZfS+cv++/JT+754c+SwJC8TMkT/@vger.kernel.org, AJvYcCXfBTc2T6leO7ZBr+mEsWAyZc6g6kQTujhElu5qyC0neUyeAEPho2KyY+RSMGRg0NBiNwMtmo3Hr7NE@vger.kernel.org
X-Received: by 2002:a05:6102:4b0a:b0:4e6:e126:6238 with SMTP id
 ada2fe7eead31-4f1610076c3mr1456363137.3.1751463506197; Wed, 02 Jul 2025
 06:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625141705.151383-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250625141705.151383-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250625141705.151383-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jul 2025 15:38:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpc2asQpmYjhGT3iyu1t8RUtSGNivugncWpK9dmk+VjQ@mail.gmail.com>
X-Gm-Features: Ac12FXxqYAq2Gz5s7j6S5XN9equ44orB6qfa6dbubkHdrjFtiDs4VZ-k5UG_TYs
Message-ID: <CAMuHMdVpc2asQpmYjhGT3iyu1t8RUtSGNivugncWpK9dmk+VjQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r9a09g077-cpg: Add PLL2 and SDHI clock support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Jun 2025 at 16:17, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for PLL2 to the R9A09G077 (RZ/T2H) clock definitions and
> register it as the source for the high-speed SDHI clock (SDHI_CLKHS)
> operating at 800MHz.
>
> Also add fixed-factor clock PCLKAM derived from CLK_PLL4D1, and define
> module clocks for SDHI0 and SDHI1, both of which use PCLKAM as their
> clock source.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

