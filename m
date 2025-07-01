Return-Path: <linux-renesas-soc+bounces-18970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48397AEF806
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 14:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91098173503
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 12:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E13273D8D;
	Tue,  1 Jul 2025 12:13:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AE626FA4C;
	Tue,  1 Jul 2025 12:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371980; cv=none; b=JBSypwOSLyWeU42d0K+Yw1+AlzDakakBK8PfmpYp7j0jBW9Ysi+4065elkL1/qOHU34aTR9TCzKoNvAvXqrgmcJvBm+nXVGOo+LVhwLO06TfZvNvnktihwuczHPceWEs9kx20pimqbho8dwYfWBhZxQEsq2Y0EgbGofR9go604k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371980; c=relaxed/simple;
	bh=AoUFXLo7D7QQsry62v//yPqbsOuPy2TxjHRdRdOxK78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKY54ePRA8oYUB15tPbZPaVGTxv13bnGSWtsO0fTbm86QjtkSPUwRFkOyYAmWDW3fVvYMu/GVc/sYAg0I/gg6yLtU5kSkh+tj3sasTBPhvaaqd5MXBHH99u5UfJMUSTM8ARAZPlBqyZfBVtKC6IwiN+71mnkUsW+YJchD56HEFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-70109af5f70so11453876d6.0;
        Tue, 01 Jul 2025 05:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371977; x=1751976777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOAD2tb6Dh85dGzwJxy3RcScPy/E8XEt4srq5E9c1Z8=;
        b=LhchoA349a3Ci5ii45k47geFm0rB7WH9Ti+y0OtQ5L8v+fA/Z+NACCk/Sj5PqF59SF
         urFkHqpbqt/CU48wk7pwIJjucPaN25GaxSS8zZvHZr7oBu807OuiIm8L/GXHKvxX/9IV
         dobj+uPxAqcdfPIUNiYpXKYLOkagq/4xttJchSxRjNgegK1D1EMR4K+EPAp5Auz8dwww
         syGxF0FRsdhCEbjRD5fGGLJHe8P2H9NvXTGsVATmAlT0+rYS2XkITc8dPnyYAl+LsRpe
         3c9skwkPP3m89ca6+lNeKysEenToktHnw0lEb/JnSdydVuBuSEYue8Rez2Zc/pMwKR4R
         5D/w==
X-Forwarded-Encrypted: i=1; AJvYcCUXZni1aSTsJl4OocYGZDfQ4Jzo0SFHpgm6LFatWlCbTruBjcp+/v26yUBKnEBIPFR9sInt6O7DXROJ@vger.kernel.org, AJvYcCW/38qq2h5/f8LsDsO0b9YUeABd/u2YT3SzNiaDIUqcpSqJTUp54HX133wun7UsPA3+vz1mvNfcUjeI6w1Kh38IvCU=@vger.kernel.org, AJvYcCWT5qUtmsRkYMV+AjP9cLbZKk+M9NM0W/hl0sD9ueT/3sDwAGfgGnNhB7R0ZSmbkI+U6zdnSTkLiW7MU9r8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46tj6ljPvUSO+GLoHrhxEVoeH8zQquMVnpPNWCKmAbx3HjESP
	NZ1dNrvLPFyEZZarf0+rnpxjnqW9rtCHUlihtZnsXlDnDwBbvDQ8lXS4QaG1Y0/d
X-Gm-Gg: ASbGncsPaKtiw7Wd5FcCAsA6u3rMIx0eRTH9YzFzT6zqRwVc3MkQUD82/ToNki0UGke
	gcr6leIq7OssvdiV91QitaDHb2XNFajd+1678y88Dx0bg7oY8WFICOKtqb9VPnV3evuKeqjzfsk
	ZM7k+fdJuHASJ2LLob2mDwkqQWGScBU12E+xTfatrIn64HQ+9gVh8js5/Mtoy2ybyx193pFeZQl
	sya2wI0GwXiWvgDOc758STzftE6TCRrCB9s6O/T779tDzRDHzb6I3Eh5YzCsuFV5uZHvXNfWRbJ
	5VJanNta22Zj0fqAeRjruMSGQuHqXJJJ9hC33z3zfCG9H3DyrUWvdalD8iZJrOUf/P9ri858gMN
	+bP5xMtWVZSrnW72AFQtujl7s
X-Google-Smtp-Source: AGHT+IGSDtJHoZqPhp1cuWf/l3HacjJgKTK59lMlONb05J1ALSvCgpvAWap3pAaU3tGgGe/sEbsXJQ==
X-Received: by 2002:a05:6214:4309:b0:6fa:d956:243b with SMTP id 6a1803df08f44-70003c8e7ffmr325734756d6.37.1751371977034;
        Tue, 01 Jul 2025 05:12:57 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771acfe6sm82994076d6.31.2025.07.01.05.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:12:56 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fae04a3795so60048146d6.3;
        Tue, 01 Jul 2025 05:12:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIlNGnCu3XGXBRl96xpvEI4DZK/pc7Qri93XASZNsoLt2kRLGMh6/gB38F9B0BWvwq0S+LETp73mtPFcQ0@vger.kernel.org, AJvYcCWOvLCw5yoisccj4qSpBfczOhkkUFrlBMTNbOKBMW5FGynu5dP5TpNUxo7O3zg3tlnGVPtgm5ilezxfAKqfz1foBWg=@vger.kernel.org, AJvYcCXQDm77hcbeFSH3O7kBlVnlVTD3cPgGHN9zblB+4Fuj4nOQiiwqqW2bXbqBvuV+FL+jFsywVISmvAdO@vger.kernel.org
X-Received: by 2002:a05:620a:4143:b0:7d3:f17d:10c8 with SMTP id
 af79cd13be357-7d4439802ebmr2248205885a.43.1751371976308; Tue, 01 Jul 2025
 05:12:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624174033.475401-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250624174033.475401-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250624174033.475401-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 14:12:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGXcmTJq8g4iahUSJ5vG6shnM_JNXzaOq09mu=SHkyPA@mail.gmail.com>
X-Gm-Features: Ac12FXzLXNAFv16D44Gbcl9rIFk4tt9H1mGSsmqK56EsmNfKAXEqvIiKQtrpeQ4
Message-ID: <CAMuHMdWGXcmTJq8g4iahUSJ5vG6shnM_JNXzaOq09mu=SHkyPA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable
 serial NOR FLASH
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 19:40, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable MT25QU512ABB8E12 FLASH connected to XSPI.
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

