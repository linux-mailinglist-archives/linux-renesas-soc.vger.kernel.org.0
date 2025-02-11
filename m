Return-Path: <linux-renesas-soc+bounces-13050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FBCA30CD4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 14:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D18D8164FE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 13:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781C422068A;
	Tue, 11 Feb 2025 13:28:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9753322257A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 13:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280523; cv=none; b=FQ84Tw0BwhmqP4S9guedWYnhI2+I/cI+lNakXv1upkDW5hN7iWL28+OgUozjOBszWII0tZQ50g3JoB6fHV8yO+lp7T8EY8N5EdtdGdSgLQoXn0VJyQotC5Y4kPdFoj5Lb9LstU5fW/52rowipDnoM2vYObUlNQnhni87Td3A+WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280523; c=relaxed/simple;
	bh=paNTP2dinxFMTm6qnLu8FLyVvUtX9nnSIJz4Dov7dzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i69zuYiZvyhQlvWCDuaPMce71D107tITb0jXSpeEsQMs1Izdz5/xrycQM1R2awGcHxlsJWm3Gi775g68Px/wOQ0/U0AQ0JFFBjcc+hOBiYr0G8h4UKA8x0L9RiqetXS5910GjxwGZ/yn/SUiDS/141lJQzbgKUxWKc2x0C+OAh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51f227e8bf6so1332368e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 05:28:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280519; x=1739885319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyGa8Zgw5M3rJqCL8jUct55XgFTeyHZjoExT5VdODYM=;
        b=CEf1FKntrATwqCNJ9ULnnqwpq1F7kZDLFaFYzqtegficXrEMrB41k60PVsgBEnPHjz
         GaA+YwhmtVlq6hu1kTMjSnAR2Zzmp85+QNJ87ab+Lw1jcwlppChy7iwcY9du2f+PH2ZV
         bKZj09IkCENbvaw+Fp+//IFRIjz4oZjbVAKN7d5QM+MxFVhIT0EZogGYBZGCG2VkXu3l
         UK0SFzJLO2cMrjVsNGmoJH7wBzLHPghSl56QXH2sWRq17/veZ1fVk4hGnuO+vzejgzTa
         M+VxjaU3pbAQYRtzPza7ibKN3U2pTykNRBLgaVmufCRHm/suRdSy1H9ZDfrm8H+qnhE3
         FGhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeUTnONajOg7XlngJVN8InE2z5qt1mLqQ/Bdpsd4fnuyhA9+ayOXZktPvv+fTydn4KjaSuwfSMz8p66oKmaal5Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVgHPTOvVKe7H7ZNy8zmgl6p9zdKcSxptnCqZr/RYryjSSqZRK
	ZjDHH/AM71sYI9LrISHg7zPQi5iDvERNAaDPItUCjs5m4LgC6PCvHV+7qlJoC7M=
X-Gm-Gg: ASbGncvS22+zHWLkQw66pppfDzLaoj9S38R5yXGKZnJUVL9tyMCVS9uMTS6/yGB1uf4
	oYPivPXgSzrvo9bwmZQeCkYBUrJu7887JdjRo7Q9uMEuOA78p2ekmrWLLosCpOGc0KOqva2xd0/
	galm/vhsAZywHSb2xb3zLbEmucTBjUXeb6ub+Cb3KyKy6nMIRlMugbD8mdj3cticSY0RCrum6kj
	7VPkAOWEHSZCowPSrsNeayrDDLF5bjbsyqUDqpINTPBwUcnQs91Hrlkxyn+HhMF4Sfk2zN2PNYM
	pdqS9xuOfHllUvbWAl7DINpzazQ60YDUMXL7Ml1340gpKlUUesLy3PBwWw==
X-Google-Smtp-Source: AGHT+IFiv6MPyQ0Et83zL4XTSnQUqPwTcCykWMvMDAkdWMRhaW8pJlMqRQ1QhJMx6s6ruEU+6JA+yA==
X-Received: by 2002:a05:6122:2528:b0:517:4e40:6838 with SMTP id 71dfb90a1353d-51f2e252893mr12122232e0c.6.1739280519416;
        Tue, 11 Feb 2025 05:28:39 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5203f488757sm596131e0c.30.2025.02.11.05.28.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:28:39 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51f22008544so1025746e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 05:28:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIG2lE/yn1qJw1uXEWn6zojOOaRGvJlYw90reaEYTvWZ4chsxHWQOsLYZn5fNkzfrSuESfv+kRoZbbkx9ouEdNcQ==@vger.kernel.org
X-Received: by 2002:a05:6122:794:b0:518:7ab7:afbc with SMTP id
 71dfb90a1353d-51f2e251f93mr11467441e0c.7.1739280518551; Tue, 11 Feb 2025
 05:28:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207113653.21641-1-biju.das.jz@bp.renesas.com> <20250207113653.21641-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250207113653.21641-12-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 14:28:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7xqA2aN=TzZLf-tGwGvZYFdgnB3tGxOozMDb6YYMeFA@mail.gmail.com>
X-Gm-Features: AWEUYZlaijCiyLlxAOI7n2wCuSllEoIU2c6oIj7jRY1tnIWC5FUmxjFEP6ZlJVY
Message-ID: <CAMuHMdW7xqA2aN=TzZLf-tGwGvZYFdgnB3tGxOozMDb6YYMeFA@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] irqchip/renesas-rzv2h: Add RZ/G3E support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 12:37, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The ICU block on the RZ/G3E SoC is almost identical to the one found on
> the RZ/V2H SoC, with the following differences:
>  - The TINT register base offset is 0x800 instead of zero.
>  - The number of GPIO interrupts for TINT selection is 141 instead of 86.
>  - The pin index and TINT selection index are not in the 1:1 map.
>  - The number of TSSR registers is 16 instead of 8.
>  - Each TSSR register can program 2 TINTs instead of 4 TINTs.
>
> Add support for the RZ/G3E driver by filling the rzv2h_hw_info table and
> adding LUT for mapping between pin index and TINT selection index.
>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Updated commit description fixing typos
>  * Updated rzg3e_hw_params with .field_width and dropped .tien,
>   .tssel_mask,.tssel_shift, .tssr_k as it can be derived from former.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

