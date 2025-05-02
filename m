Return-Path: <linux-renesas-soc+bounces-16650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DBBAA75C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 17:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B25167A2EFF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 15:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456F12566FA;
	Fri,  2 May 2025 15:12:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC381C174A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 May 2025 15:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198757; cv=none; b=SyM+yrkwCO+4khWCx5VIYuSC0fW0za7TQoBquJLqJ+Gp/se5vptPUSc4mADE7TKAaXLbQiDwlDun0uk1Ip+kGfC5eRiBVXbuP1087fJZy/7ts7CMTT1XaNr6kCMFrtRgSQugDFSTOpBEzb7iLBWOmlbDU9D4gzWxr9wKgAgf2/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198757; c=relaxed/simple;
	bh=4z1pFwLJ8TTzOjFu+QrL5+N8iihJAHwUH1OKm62BslU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ujwl+cSrLKT+9Q8uD/t0goVeg9W4/d5Znnk5PSeZPcFgXkRMDWrxX0OWWUxZkoSVjNDhz1CkzsdvX17ErLtoVuJGFjH4WoLUtiNsGw5HvVPp/TKAXMylBxA1JEw8FKLwfPP44Q3weo22CoOlAU8v/U9umNNIYBJ8rLR3+guzRFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c55500d08cso238944985a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 May 2025 08:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746198752; x=1746803552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUgHFLorqc1kGTFNbEjnpM4RfzqutyDaLTremEVuq64=;
        b=DtqVGjqU5vkOUZRYD+9zHjHd4FI0UES5XHg0UtGWt0dRxN9yrATvx+tq88bX0X93Np
         rD4H+tsVJt9mkG9kJXsb2RZSdmk9aN6SzY3QvuU2yvVK2zfgg/PLwRJ07OOYhbFxL73W
         3sjsDLIwL6vrp+FK37ide7Go5Bg1ykpf/QcKqz/GXsMRnBWr945vFlMMeguRx9KXNAg6
         qpsBFteqIiSXUmRt4RwVpGKpLavTtSxaCvkv3Z7+g4yPj0qPIXhBxYlEwZLo2lMvT6I0
         UxpTYNCauxmmnSKmadTb2GBHd+1fRhUm+nYmZQ2HjcSwdn5/FH+WPgDikc5U7uZ94kNv
         GhUA==
X-Forwarded-Encrypted: i=1; AJvYcCVQYcB+QA9D+fTUfKH7Q4ya27NAVMVBF3RfP+mpyhNGCCgrbAZ2Q/OE92bLjja3bR4wmgYzddsoneJqi/mIIJao8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD+sBDNTkOXQzanc1agBpy6XJxdaZPnbBWeNEXu1r/XCdBV12b
	1Tb1GunQPIuPIdg+qsVaBRZUfi4BY5tzdo2VMsQi8JGL7np190/hYunv9Qpj
X-Gm-Gg: ASbGnctmoCKyWEVer3M+TdoRDrbEgf3qjYmw+Z/KeGWxfNYckz99xaUD6fGwQ3zFrvk
	8sVvdXUppTsAYCMcES6ZSrlu3F1B6GomEwM+N8saWq1Gm/tpkgCGgfN0PTfDuYik/ilg6fIKYq3
	oWipEwy1nzTq1cRcgVDS4HDcj9FxwgX8kqH1xrndHW2d2HVqP18IBVmvjrRfMaR+6m03x5j/4l4
	W/fa6pRgu+lc81SXaRGFDd7Gt3Al6MG7caN4HKidMuoAPLuIZBtdm3AI3JBCPTW8viXDK9pBAEt
	+n3CgJ/DprGy+AwfKNsd9OrHp/cYbD1OaWpYuYss3s+GSJEW5pfatsxCNTzbEqBxb5OTcEuPeoy
	nnjptIJE=
X-Google-Smtp-Source: AGHT+IH4CMAX3aAUL1KPKtgl1TOofmJ1tErrSzVIlps6IxlkIOuZsrNoyP3K4nWzeQizsT2eGmSwKw==
X-Received: by 2002:a05:620a:4507:b0:7c5:a5cc:bcb9 with SMTP id af79cd13be357-7cad5bc259cmr499183685a.56.1746198751996;
        Fri, 02 May 2025 08:12:31 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad242a495sm193358585a.75.2025.05.02.08.12.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 08:12:31 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c542ffec37so272635885a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 May 2025 08:12:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVtqHpr+CfkD5QwCOj/t5rxGNkXu+M6OMTDOU0O288hx6abV1cZqIQtkFACVBWNzJ9fgRxV7u2UMeTsbWOIWj/kA==@vger.kernel.org
X-Received: by 2002:a05:620a:c54:b0:7c9:5ebc:f048 with SMTP id
 af79cd13be357-7cad5b3ff6dmr377329085a.20.1746198750656; Fri, 02 May 2025
 08:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424054050.28310-1-biju.das.jz@bp.renesas.com> <20250424054050.28310-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250424054050.28310-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 17:12:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNTy9+MQVmwoaVn_S2CsL-YT6xfFF4Xf6ehUgpwHU54g@mail.gmail.com>
X-Gm-Features: ATxdqUH3ixU5-e0144v1C4GMTrU1irCUcPJxoW004SfypH51jbvHQMGuupsTRpo
Message-ID: <CAMuHMdWNTy9+MQVmwoaVn_S2CsL-YT6xfFF4Xf6ehUgpwHU54g@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: defconfig: Enable Renesas RZ/G2L GPT config
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 07:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable PWM config for Renesas RZ/G2L GPT as it is populated on
> the RZ/G2L and RZ/V2L SMARC EVKs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

