Return-Path: <linux-renesas-soc+bounces-13588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F32A420AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:33:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBAC31891166
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A16C243369;
	Mon, 24 Feb 2025 13:30:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACC623BD1F;
	Mon, 24 Feb 2025 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740403853; cv=none; b=TMn0K5iD0y38L94SoHmzk4nYkKe+1/9ul9g4jSOGUX1vabtc8HFD5iZDDIQ3bqGHcEfvMuZJlc0tjjkz7MNYf53/ow03NN+mtPJFkOa+X9z4R7jzlpiTaB86WoO/kzBCznD3yIC1XDNY94i7T1+4Gmvrk+8zdcFqL2Kjt1dktMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740403853; c=relaxed/simple;
	bh=unXFjybSROaddo/vBqAKeLhjzHqLnuGziMJUCf+P6bc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tM1nmaEs5rcfo9rVLSeZndEkJjz3moZX9DX1c3Ts8/Ym0js2TVmz75aeQglV+HsFh56kLZPK4hpZWTORJKe548HKiOFGoaI5HZOb9NdzjN4T5pDkddHR24ggGJRHdB6a7YkFceLwkWVW7IypBf2EsNsiQVqNLLYui99Ddzi82MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-51eb1a6ca1bso1047016e0c.1;
        Mon, 24 Feb 2025 05:30:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740403850; x=1741008650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMUYo+D/dbQ2gTppbo25drTg29nK/Xmf3gi1zaRwobY=;
        b=DN27mH96MgfPV+tJHFYOCgY0tFZSPm23XL+YJNmCEcHsHJ2WOseNw2jTF0VxMf4bpO
         gPjzxPeXubDN0DjuZgZB/I7zg1Es+BjhpOZ/FZLFD03/kUr4rQpBaAstjtYVkRdYqRtA
         b6A3wy7Rs6LTsKBAUNwoCm8HKKeqv8bX3/Ht2dxw6LOuZX/gUpdQPK7d0bGOjh+L8vHN
         kCfB99bhbor4xdug24FD5qNOk3o/VO83rz6ibfKeEIP/eJcuYtsEgetUAjDu7TKhmwIr
         NQv22hvg3QDvAKdw07MnUcmdy0PQiCEHbezwFKXe8xNduJWJWg72mMVM0I64XQ6Z6zAb
         wglQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRa9tocE28ZFtAwn6snl0gvH2oVW9yWgwD54L2wS0GBsEyWTfInevMlOBMBGXrh0LwrlWj1P3LPtGR@vger.kernel.org, AJvYcCXBLcC6DVJpr7YsxuTU3aSxp4gSNKmVh9fo0TMic/IQc6uJQIZcDhX1mf/ZahNal37Nzn9McDoh2WX3AGcMgZTaZks=@vger.kernel.org, AJvYcCXtjpcCHnqsq+J4HIufxLmpz+05BpRjF6P0EKfbgxu0C9UVbR0J+FxUUZBCYv3/hGkFU5+F0oa61vNGHzOu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5fYJgFnmwqOp/K0FH2z4HKUMplq81+qjcxDVpyGbERP/uSGuN
	NVAQ8o9CH2N1fib0x8MGMBOa7yZQkl2J2stWDOLklj8vje2HltVCCNqFO6CSPNU=
X-Gm-Gg: ASbGncuReaFpZxPDB0FHQH8+4jo/j0V7zIpVukaZ//o3vV0chs1YyyX0stACySVrZYV
	kyIeT3Cf3CW32FDT35YMrTVkcNdI14yeGnSIASWIJ+L10Tz9XH50nV0gSGS+FzdNA2bTJpd717x
	lHdYtNxTbFMnr0S0JYDAUCy5Tg7db9iEe3rv+8nnN33zh/4UJaOQXDQMEercTXnT83lR0ll/WCM
	AAj6Urmb8WVnbxxhj2jm+qIAXEtm4iUni3FA5KAc5a4iELSZ3M3DHjdO7WB4VfhSxt0qu35x3eA
	hvVGyxNFJ8TxAlPRSeoF5Mku9n9mkMiNwk7xSgRYvLghRwvKLze5PvwpcAaG1mPO
X-Google-Smtp-Source: AGHT+IEfQMAK2+orqfdM9j+iBTtFX7ZxHQL6CaRsob7U96dhRwvFwLekj+sG0PZylhCtbaMAUgnjRw==
X-Received: by 2002:a05:6122:1790:b0:520:8911:df12 with SMTP id 71dfb90a1353d-521ee4b4ffemr4635683e0c.10.1740403849856;
        Mon, 24 Feb 2025 05:30:49 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-520b5cab858sm3220025e0c.15.2025.02.24.05.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 05:30:49 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86712bc0508so1238330241.2;
        Mon, 24 Feb 2025 05:30:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTrWuNZJsBfZfCxSnjDP42O+hd1VLDHIZCXnjdN/TcqrLG1WygEjCKdBul4N+EH55EWdrasG9aoWd7@vger.kernel.org, AJvYcCVn7tn6yfqk2tIrWVKZG8B30FC2EnNkUiE8CZqnRxe9g2GSqW5qntXkvYKyPxDyEl0TcYthXZa1PTqBUSIffbdcckM=@vger.kernel.org, AJvYcCWd7mlOyeqRgcdJHm14TLoWtFU7+Nt+Eb4XjilvMC+Qaoc3oo4Sznr45Bm4rpRLeQpg9MjLuWtwb5ryEgRz@vger.kernel.org
X-Received: by 2002:a05:6102:32d3:b0:4bb:d7f0:6e7d with SMTP id
 ada2fe7eead31-4bfc01c63c8mr4995449137.25.1740403849274; Mon, 24 Feb 2025
 05:30:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220150110.738619-1-fabrizio.castro.jz@renesas.com> <20250220150110.738619-8-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250220150110.738619-8-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Feb 2025 14:30:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+29+g9rWJMu21ULC6=NEZoNiXreKrprc9afJSs6buOw@mail.gmail.com>
X-Gm-Features: AWEUYZl42ccqa5ANI_GKR3l5JAGEMm24Lv4Tqi4xoIxZHUtAOnZmiSL8fW1uVpE
Message-ID: <CAMuHMdX+29+g9rWJMu21ULC6=NEZoNiXreKrprc9afJSs6buOw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: renesas: r9a09g057: Add DMAC nodes
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Feb 2025 at 16:01, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Add nodes for the DMAC IPs found on the Renesas RZ/V2H(P) SoC.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

