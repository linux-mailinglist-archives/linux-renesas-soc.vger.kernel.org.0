Return-Path: <linux-renesas-soc+bounces-18777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E07B6AE9D5E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 14:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D70C3B26A8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 12:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDDB238C25;
	Thu, 26 Jun 2025 12:21:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465FD171C9;
	Thu, 26 Jun 2025 12:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750940488; cv=none; b=AbPC+yqbnOHLSJhUenFGlMo3XfYDt3QsRa1Us0wkGJKNJqMfRd6x002wSvD62F+ct7Ns2ImKTXZPk75jRdtzqgvKJbGrsILJxkojXs2eD215PTKVhB824oz9drCeH9Uo2D/OODSpVYt5UrmSe/00p/6i46iQXTiSZ82QTH1jtuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750940488; c=relaxed/simple;
	bh=NVPqC7ZvC+Ex7T2KETgjE0zdRyvFNR+xQ/it0q9tRUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNGh0HUHdT8t5b6gsD+XYLfBT74xm8otDDdnn/5IESxX7QRUENAb5NDhDT7XBEA9uyhL2UHPM07kPT8Hjfjg3war8cI1GArx6dxvYOLL0al0je7H3RtoqXi6jAETHV5muzH0O2NJQrA4D5ofaGI4AiGlHmE3jSFjPfwbQV/ck1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86fea8329cdso558950241.1;
        Thu, 26 Jun 2025 05:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750940485; x=1751545285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToKBWO4JB0VT+kUAoa8BorycPTqq1rw+hXPjD6Cs+jo=;
        b=hz4mhqWrd0Hzie0gvPkusgiNnR7fboxn4JGPYnTbAxxD1a/JnMaDdVUBAzf951p/K2
         ZgbPeNwygjPTTIxiLq3jaEA0GFSozfDbVofNSvolwv3arFNUjTVT+2LQFuUwdwNowD+s
         or/nogWonxmGy2QJalVXYss7FNpFYTfzxxZBW0VSaiz5J4wbN/Uxcxhx1TlHa0WhylPz
         P5t9CPT6ALunmrrTH+ejl//rxwrHHFg+nRSOKWaLXyQ6LlrsR9N7TXmvd7+5l6wjRw1k
         X9U4rXLSYQIK3sVNW3NqWsVZEuq4pky+PMrj8R2szx/hlEqg3HD1Yp3Z25NaYHqAGJGS
         PF3w==
X-Forwarded-Encrypted: i=1; AJvYcCUFx/buoqghdPdWPYD+DA4plrl9051IxxuxRIYTtCpGfd2hnn/d9vpNS5y8oY1Q5am2AhGjk76CQrYAgvf9@vger.kernel.org, AJvYcCUkv1woXETLsv2GzYrbzZFNSuIR6rUFs6URTkA+2VoFp/UFREhXtc67t/69WuqPg5OesarWDc9cob7ipRwY/MVBXU0=@vger.kernel.org, AJvYcCVyMtkJkrgbHyRmYdBYdjxhzoKa9p3507Oc22x58Qpz0/r9rHln7bEUnfwFvcYCVEneh0WInaAJBf/T@vger.kernel.org
X-Gm-Message-State: AOJu0YzriYZkNCa2mZINfDO6cNPhlYli1ju8W9/W5TQQSQAAvOR7Jna/
	xQhxITwJIa+0f0Yvg0b9GItCK7jqSL4kWGitu20DDY02I/T5z9tMlc1cyq7LMCWF
X-Gm-Gg: ASbGncvDaH4H6AMygwFXMZvbeMZ3dOPW6krbZinNL4gPSz4MC8A7ei6AT6r34tWIRE9
	/dXB20/lkUVy0SI18rk9RC3sLnt5Qp1RStCC2WwV+RQ0YRA5uD8nZJRta+t2oTW4oEEjRaQtxeU
	wRM3DiBNfFO8ViILHLxY2IYos3nB5eeK1GSHvuWitbqxHJYBWYm2GFGAzpUSb0IXPBSoaK80U3N
	kFvyZF3lTMmwFQnGSU5v/hKpVX/0Ey2NKWiGpTkDQK7kQQF42yVh1iLgekKargJ8aVbdVwrfzrR
	oZZlHYMqvWrdDPl+Foz8kJWZ0OPyFOHF3y9LuhKLx5YnOJgN5dfb5KIIrVBUwHqvNqhHOKAcciH
	JJxm3pfsnNlZvqaB7raU0Aaox
X-Google-Smtp-Source: AGHT+IF2K5bC9dedHbcPzkH6ZSoJx38ic8C8iksAqtvZroGv+V3GfjVkDQrTKORoon1gf6UNrJ/k1Q==
X-Received: by 2002:a05:6102:c09:b0:4ec:b36e:ad0b with SMTP id ada2fe7eead31-4ecc6aa4d00mr5436478137.11.1750940485031;
        Thu, 26 Jun 2025 05:21:25 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-884d1d88000sm206875241.19.2025.06.26.05.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 05:21:24 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4e9c3d752a8so516331137.2;
        Thu, 26 Jun 2025 05:21:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV64CK261FfjPrYCouhB0hFe7o49B94RykVeFc5pj0KsmFHxRLHnD0LsF7YKqU3aXiXe5hDYb1IHpHQGUtC@vger.kernel.org, AJvYcCVKQd58ab6WwYbtpugbdZk8DYXSCBLDIOdUjFMiGYMNsRG+Tv++AByXClzy2joygSGJtEE4nJuhms4QRevb+TVmWNU=@vger.kernel.org, AJvYcCX2C5RZBIJ3zxSAwAAQCQpmZDn0sDzUlvn0PLV4o0eD6gEAyWK3oaNdBBPXov8g9EppppKEnfiWPMyb@vger.kernel.org
X-Received: by 2002:a05:6102:2ac7:b0:4e7:be09:deef with SMTP id
 ada2fe7eead31-4ecc6a7700fmr5340257137.7.1750940483828; Thu, 26 Jun 2025
 05:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619135539.207828-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250619135539.207828-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250619135539.207828-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 14:21:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsFDPycsVTNoNvQRgQzdmwBKRbDnKz2Z0XUFED4um5Jg@mail.gmail.com>
X-Gm-Features: Ac12FXy0Cv1Ijc-LN_QM4gRF5QRekPj_kqBjHsHzZJpLVTC-T9lG1LiSsuXV85Y
Message-ID: <CAMuHMdWsFDPycsVTNoNvQRgQzdmwBKRbDnKz2Z0XUFED4um5Jg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 RAA215300 PMIC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Jun 2025 at 15:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for the Renesas RAA215300 PMIC to the RZ/V2H EVK. The PMIC is
> connected to I2C8 and uses a 32.768kHz fixed clock source (x6).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

