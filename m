Return-Path: <linux-renesas-soc+bounces-24587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E29A6C593D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 18:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A32C05438BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 17:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB7635A941;
	Thu, 13 Nov 2025 16:54:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FABF2C326D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 16:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763052897; cv=none; b=mfzzPxZvB2bbAAVtsbp7A+2Ix+i55uBVA6GTdazjl/sKuRlnQHAWbJXRLWOJ/Jr4rI+WG5d5fOXa4qFd2NrcsjNRZrshI5+kJxJatWgdnNIDXeGO9T/JR14CcEotKsc8NXlB0GEYbi2PhpyWQSGr4nm/gTA/5xSDNgFqu3pIHL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763052897; c=relaxed/simple;
	bh=/w7U1lULN0Wt5cy2n+o8BXmaQCUvdOw6lpumB8VVy08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rV8qISMff8TPASCSuFUXYjfOZVzcfSrrOpds5JDw4uHD7PBnKrfZOtNZzMqbd0Ptsfrl+a5/fTnMIeQrRXhOzD4Ui9VL00znmnxyTV6cUduDS1IP/6aOUUECK+KvPRAdeUOn3qzDJofs1RiI/NnYVH1apiiNzTJCb2/EBEn+OEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5dfae681ff8so643360137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763052895; x=1763657695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiVTOOriFml3/StIKpZ5dwhW9Hno3lDZNqDkWyJuxDU=;
        b=Rn4LZtJI+OKUJL/S4ErZc3LVEekfvbC5HkbZTggNgQg/lL64luE/VWCfBTLX+M5Gzz
         xnI1bX6b7kode2PneA161jk+YTH+2G9NQff77ObCOpxCZ2TWW+8KZp2AG+4xKaeN24NG
         oFityLuHutAnLtEfP8lJLO7a6zRoWpcNslllsoOR/WEn0RBSHr4UfLzOl0IKtxt5Vd1A
         d5C2oPZ46amFRDlIVKeWeywZlTGw0iDYC4y8AtLwTIXahhzOjrws8zlj2njFYCUGSXoi
         uBNdS+37LzWbNfXcnOh394U3mzwqdiKykP2UFThZRNNUStMr7EwsWG1McANVrEgnEjPu
         Xcrw==
X-Forwarded-Encrypted: i=1; AJvYcCU1OOKp7kheT/EPJELpFnhkJnv9pUqOFr0JvdrvYTDRGp+03R83CSuIz+YAxoJW/dwRl4pbhcRLTDTqQMib2nrjTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqKTQeFdjmVVFOHUnx5BN+M9k9M/CJ+LY0lHZDAkNJ7BDv4ghf
	DPDreoOySajGdS8DzG0CCQDm6Zp/NYV8OO2o7bLqOQjDOFX4g2bIN1ItdcEVSwMcpsU=
X-Gm-Gg: ASbGncv+ADNv2XVFQ9jo9fcaR5e5iY+k8d8bl2RYQDp2lPwqAanxm7dk+W83sZjX5nc
	f7TZJfBh7A3FgeOsalOgUN6vScj3ytg/cEgkzcHUxYLvU2P/MVSp4xLSW/Bn/8Gjy8MhnsQFb+4
	tOTB4uVUCzqIdMykG1iBkAHbMffdNA16Nrje+pdMmHEg/KlwQ4u6dUJOMBHgoqKIh6WgRKC/RFj
	lW/d52YU2qSfatteq+dlVQsJVqAnAG+XKV3vRVgrBcFJgf2JsHNrBxDlvrAFyZHL7zHHxOkW7qh
	cCiHxMy6/d5WvEJH/bF7HhUKzT6wAz7aXuIo6yvcM5NBp6aVp8ZxokAzq5/UBPDAxFpxrz9yI6f
	R+nK5AQzIdi0XX9zNz3dwUo3+nJ9cS+ATk3ytJj5nCL5SBebgTBOK4Gvp607kG7MDtX2GA5uOPI
	lwNGlLzBzLNQfKRgj7o1my44RCNeGXWD54N+3TQg==
X-Google-Smtp-Source: AGHT+IH/DZuifmMKQHO+/yBV2sNB4Hjn2diMtYPiV47Gka/KukLMFHV4SYsqjGL7u7pVpT2mzpJ/3g==
X-Received: by 2002:a05:6102:4487:b0:5df:bddd:b590 with SMTP id ada2fe7eead31-5dfc5bcb96emr210686137.34.1763052894901;
        Thu, 13 Nov 2025 08:54:54 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb726d37fsm749048137.13.2025.11.13.08.54.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 08:54:54 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ddf9c25c2cso769409137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:54:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgi8HBea3aYkmCl87TdhoO1HnXSclw/GVdMcliEhOyY9JhjiaFL6agq6vTFwMrPZRwcnHsLx9mN/MJLfxciZWInA==@vger.kernel.org
X-Received: by 2002:a05:6102:3751:b0:5dd:c538:b85c with SMTP id
 ada2fe7eead31-5dfc5b9485dmr175827137.24.1763052894285; Thu, 13 Nov 2025
 08:54:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251101050034.738807-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251101050034.738807-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 17:54:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXRkiJHSFj1QsQjH_6g-WqVK0aYE4Q1+WS2zGKLXWoj1Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmUKyeVUtnm2gNnWCtpgD7bmlT9Yk_sNHgyVVXH3XqZY-ChGkFlPHKyXXU
Message-ID: <CAMuHMdXRkiJHSFj1QsQjH_6g-WqVK0aYE4Q1+WS2zGKLXWoj1Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r9a09g056: Add USB3.0 clocks/resets
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Nov 2025 at 06:01, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add USB3.0 clock and reset entries.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

