Return-Path: <linux-renesas-soc+bounces-17358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6BBAC093A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 12:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF1F93B4621
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776A0288C1E;
	Thu, 22 May 2025 10:00:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E57286D7B;
	Thu, 22 May 2025 10:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908049; cv=none; b=Usjo7Glpml9jqudelue5euYY/K1iAskudRdJe4YQXTW5siUI+Sjz9fMJ4GeWmA8KsdzCRUDusVF6502tCPr4xzZ8wuP4ZnxWHluRnAE93C/8Sq1eWP65b/Kgz9Yokkrd0X494ltNTnjBP1oojytdJmr1jjMxY0glcqK2ueJmOXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908049; c=relaxed/simple;
	bh=drDuFP8elgaanqXpYaCIjXYAUCK1v3unDiYKeRYxjbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8ziCD8+JHP+5BykJiaeSRguQpmEWidf66+WMIrW7oE1X/UvRCPfqybY8jAH6i4ZafyOjvzoPRXDFjz+ju8+7vTrmcrf9hIyEBd+RaQxXf3+kPFA0cG4Im0f7UGFspXQtZiKHBcmCsJbSz+8pR6a8DdbRA59PS62ESzN77sewZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e11ee95b2cso4419833137.3;
        Thu, 22 May 2025 03:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747908045; x=1748512845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XoblhsMk0V3JqpiubAvMkWbYBcCGAhlUNkOion5qgWA=;
        b=cGu/WxIWWi08pbXdQ+hdZk9Y4wYcnc9sLzdzaim4gGElLjUBIuMw6VW2dncX9oIg3T
         QU8QT6D2U+HhzQFSSb3IU6fvxnTQZZYWAjNpyNDYT/lYBIcYuol2L47R8FxMvl6iohCg
         VFyy1E52gwX7DesnXMKj13d3qDQi1G1LkD7tSiwcCK+kcfXtjUBN4Fkg59t0qayPWkeL
         eOdnNvgZF/3Fd0wzlQ5TvilVGfp4swVBt7ImlEf+tvhJimkZYABYvgRdu92ogd/pqOT+
         aT/ci1WVIz/AWjz1nPqK4k+grlI71/aBI7t1nUBfgPaOximgGiOgxmNxr9rJKV81j1jF
         xz8w==
X-Forwarded-Encrypted: i=1; AJvYcCVE77SnOB+JLr+6IG3g7v9FpXZEFkA7poy/i/ZrC0bMD3fcws5CMaDHns9E3MuE8XyH/5iLfTxfpzDx@vger.kernel.org, AJvYcCWWULMU0vnw1GviXgQr40/SOQw4H9GnqierY8QiZ3zb0j0nLAcnUT+iabZ5ArnAR9CTuCCQaPHlFFh3CHK8@vger.kernel.org, AJvYcCXcVdTrTWENStwcbucX3H8loqeFx8wh78JWbbyYnNzLoxPErWxBKxp3KQQzsZsI6UCjqcW6BxTDQFbiRNtoyPdUpas=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyS5Jgq7TyZyLn4Ljvx2s/sDSJv6rDhADldq0kOldBGSF5EmuX
	lgROMCXxmnTiDdr7/2/GwHxXkbNk8pWwqw/gnj+8GLxGqaV/MXAOfgotg/1vxX5f
X-Gm-Gg: ASbGncuPlzeex1O2by9/GDrli2i9061RhoomhlsDp/2lZzZx5yiKT7gmT2mNJjbO+Uj
	pSDrKiAuij+iKZLY6aIyQ1i19l0QxR4fzEy0PKBYGaHrCcUol5kDGD3qLC28iLj/XEVfmaY5Wpu
	C4TPHlZ+/owCfTf/2/WOedhggb+I4q6E0FDrc3Cz1bOIi+HTrzZrHYGxonCIpTHvNt8Wf9i+mJD
	diBBOqBf/L4c+XmzSZT5VJH+VYKSFYMBjL+6VDWh5pgARK5WLD45BmVWUB+WM2F7jc2cjx7Y7+2
	Wtl0AT4An2SiQbTWvQsSx1pfjW1rg9KTyv2Pui0BCyyJgoGXe0EDo3c01p4kZKOfCvQex4azn8N
	D6hFRZud8hGLD9PfohA==
X-Google-Smtp-Source: AGHT+IFo/MlDmlIfw0TqxjT7phHVgFNsqhlgqDzjKpmITyI0aSHafvVyi+dhB8r9XbDZfa3fiAVY/Q==
X-Received: by 2002:a05:6102:5714:b0:4c1:94df:9aea with SMTP id ada2fe7eead31-4dfa6bebe78mr21468275137.15.1747908045343;
        Thu, 22 May 2025 03:00:45 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec2299a2sm10306149241.32.2025.05.22.03.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 03:00:42 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-52934f4fb23so5270736e0c.1;
        Thu, 22 May 2025 03:00:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVO195qs2fUTetY7O2n2fcdO87x9H74f/IURZ8zoiJuRAKmN3IaO3kpfXsmCi90/g8oh2fLAuiz1VtK93A0Lbp74N8=@vger.kernel.org, AJvYcCVXJ2wXLPPA5RR7oAFP1mxhRtRC//KobbyZy9gJarK/Gii+v/5sV2aQaDrNoFpf/cosql39bSvedbT8@vger.kernel.org, AJvYcCX3vaXHfOr9dE54N3S51MfEpTDdOnM7ysh40iFX5OCQoWGxzmw+eD7kOylicFd/ZMys86fWV/r9ggtKJ03b@vger.kernel.org
X-Received: by 2002:a05:6122:88c:b0:52a:cdd8:fc33 with SMTP id
 71dfb90a1353d-52dba614e02mr19107010e0c.0.1747908042255; Thu, 22 May 2025
 03:00:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250514101528.41663-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250514101528.41663-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 12:00:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdViBg45_JGwBvETxOwCk5a_6e97WRNwiu=BrH=gnAHCfQ@mail.gmail.com>
X-Gm-Features: AX0GCFvUskLiE52IcoYxsMlcd0ZSP1eMjQRGOpw9t5TC41kqHOSJaMDdN-Skzzc
Message-ID: <CAMuHMdViBg45_JGwBvETxOwCk5a_6e97WRNwiu=BrH=gnAHCfQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable GBETH
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 12:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable GBETH nodes on RZ/V2N EVK.
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

