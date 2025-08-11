Return-Path: <linux-renesas-soc+bounces-20359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B53B210A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 18:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E28E61690F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 15:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C822D47F3;
	Mon, 11 Aug 2025 15:33:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCDC2C21E9;
	Mon, 11 Aug 2025 15:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754926432; cv=none; b=kYFf/UKuNH3erF7PwO5Ctdgm6wJ7BgyW6aev0IKdCJCSqlAgPgL7JemJ+3JXwwfPEg0bc88wyf4q7V47Yb64BGTRe3FVLMeL3XZySXlwCp4pL2U50XsaEHgLen7HZQkF4eQ6C8aaeQppUAHE0DWw1llcROB6Hz69d32fHAccljI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754926432; c=relaxed/simple;
	bh=uaiI/FPefBSxRJ/NPu7WyL26yvTEx++3mEw/3FhpfMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gm43PUg6YCLQl1todF+MmIOjgmDh/dv6K/OjrqehonGi/usRjp0hBHLhC9WOy1v01snO4IBNw5+OOts+v+Zatik/gaQcbncj9NTToHW9PugvNofwRtOpiQ/jD9XQki6R2muuU8YYgtkLbwUQ/upqxMkUpVy5ZJ1MB693K9f9M2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5006f7e71aeso1444151137.1;
        Mon, 11 Aug 2025 08:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926430; x=1755531230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZXh/Ja9dZHVZCINX8cXzPM5Z0h7erpOnKMsRLNf0A0=;
        b=k01Yhg9BOeUdwaRrTvBcYHvGIdJRRbT9gxCYRpo0xyveSUINqqRfEuRROX4gHQtgQM
         bGCOKGzWfbjRwBi1I3HsuPzIXt6yBsuMyJ9KFAnZaIBzOP+C+QjfA1JtJBTTtEYB3uT+
         LMFKCPIDGiNVk0OGX2WhK/49LKG4Qj4eC/zIPNIBlpafH3KfAniM0O6IdVGwM9FP2/9k
         O7F7JmxbE5POA/XKLtKeRFcWZw9eijK834hR1tjbggs8ARiEcTAMZvyGSyfeUE1fRwTK
         MpfFFtTcGydarYVVf6a1+5iNrlowve2SmOvfXzOw3e/mW5dlQeSUEbRicSWkTZmxc/LA
         J9rw==
X-Forwarded-Encrypted: i=1; AJvYcCU06OtbYWxco/Csuc2/O7Ve/HI9Whs8KJrEm6R+mfKW3xVkbi0PqNqcuitg3kDaRf2ZdahbL4IKFbvg@vger.kernel.org, AJvYcCWYUuRM0Q1sR0rp4DdFnT03NfjOs527WAUfxLY2qlagqjNOEeLN/iz8/EKjvqCclgJiAVMP7/aCFaXK3p7cxsnFotE=@vger.kernel.org, AJvYcCXHJXC3twdTDosA/gHJZqrqoLItu7o4ktO0gxmidyWhhk9BCd5tg0BgQLidva2dVt8C6O92NJ3fn056zC6/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc7gVLpqn07K7psec2UX7fl3wylx/0pDAa+Hx6DWoAqgkgd9Bp
	6XxmG/E00u8rf7yII8YoHedEcjJM+JSArds47mORHt398ZDh7G82vtbi4aNj7OZ3
X-Gm-Gg: ASbGncsHpSjON1DZdCgLujEa73fzc8VNI3i3UocAach92z/0iizQSRYsO2hgyKoFSte
	uq4yF4EMeAb2Fn8kEQa2Vhkce3AK1si76a1wy2Wt8H02ZIcFSuNLKRu5Lzq9UL0VSO6mzJJEuWI
	nYSUZKweT7+9iTSeIR1U7QFEejtZIZTBTK30yqlxZ4PtwsMisbDy52P/1X7HouXia5vCrvBpWuI
	E+sNJpcsf5kMuZZVEtkt23Yhp2m5k+HozLeVfJXmfEN1LuwzvVOdEwJk7Z83nftT6XR1PhWAC2/
	sygxkY/Kswym5WD4sqDrSGGa/UR99N/OK4uoHEjbeSegMuu6hTTABFsNVaYKEU05j4SZpn5fq9O
	BR0j65cf5vxSaD9jBtgNZ9jWNIxOTzi8Jn22uc9bDS/HIkWfSojQ3mIi/x5CNW2dSdW5fSQIcnM
	g=
X-Google-Smtp-Source: AGHT+IHzGHu56Ga+8pvXeHapS/8l3EZTca+CDCnbGm+7lhHSGDJcND9gfDwL8kVfW6cKAw6IFq2rlQ==
X-Received: by 2002:a05:6102:f0c:b0:4ec:c549:161 with SMTP id ada2fe7eead31-5060f0cf776mr4469200137.21.1754926430014;
        Mon, 11 Aug 2025 08:33:50 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-50629bdd097sm1917052137.7.2025.08.11.08.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 08:33:49 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5392c221192so1666335e0c.2;
        Mon, 11 Aug 2025 08:33:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3uuRanAL/+7bj4JBItiYO8LRNzfQTKb2fgwIw+wapApaau3D/Wz1eLuJjQTXb7kinOLgLX7+UMLNIIy5c@vger.kernel.org, AJvYcCVolxBucZAo38TFR6UpFDHp4dS/oHCgn/wFDl+h0pzVi0rZLxjkQoKyXtCfj++kGKaR/4vTC3y5S7f5@vger.kernel.org, AJvYcCXgoFBn66ft2Z6gZCWhS6E7oVq2Q/0rQat8NaucVI+xu0e1cfIHNAur4O6ufQ3W1zhLtpfHdJ+s0o5FCIKdjI9yf9I=@vger.kernel.org
X-Received: by 2002:a05:6102:e11:b0:4e9:b0d4:1133 with SMTP id
 ada2fe7eead31-5060f0cddc8mr4601590137.20.1754926429437; Mon, 11 Aug 2025
 08:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707153533.287832-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250707153533.287832-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250707153533.287832-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Aug 2025 17:33:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVt0pqEp8TRr23=RcoH83X-nsOWPX4fb1KTj4UVEr0-MA@mail.gmail.com>
X-Gm-Features: Ac12FXyU2bCfUQIEmVfLSxQC5drJN85wwapoCqc3j4tUvSUjDNtiVp-cG0MBpcc
Message-ID: <CAMuHMdVt0pqEp8TRr23=RcoH83X-nsOWPX4fb1KTj4UVEr0-MA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: r9a09g087: Add I2C controller nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Jul 2025 at 17:35, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The Renesas RZ/N2H ("R9A09G087") SoC includes three I2C (RIIC) channels.
> Adds the device tree nodes for all three I2C controllers to RZ/N2H
> SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Fixed W=1 warnings in the device tree files.
> - Fixed clock for i2c2.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

