Return-Path: <linux-renesas-soc+bounces-18781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D28AE9DBE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 14:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A29933BBDC6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 12:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5BDC2E425A;
	Thu, 26 Jun 2025 12:45:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ACB2E424A;
	Thu, 26 Jun 2025 12:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750941908; cv=none; b=mQXAbsM5GFnRj3bmb1bwP43LWNlmn+ITsYQs1u+pa2YPx+lWwjXJsP0f3odpENSHP/TckP9CrikAlkl/yVMSQe7YCWQ/tMOao59FZGDRbrFNaPFamiiSW0h9YXYmz5na7CKYvd9RbILLu9TblgPc4gb16K8fPZGpq2fA4elzot4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750941908; c=relaxed/simple;
	bh=ygIPPCwkisB1P/FdtKcAFBlOrklq9uHRic3GKAE11oU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0Eyft3D5xN1Fxl/Cewlas6LmzDYTR4SDUulvYFqyz5+7jMgyyI0LSuJ2wxHs6eD24SZzRzARPCIIoVUSo2OUccuN5cejM9q54d0tf+q4mj5o+ukIz5++P2FQH5Vqzgc72qr5/+xuYoDnGWGe3KIMWz1nUQmgQMMBCY9Mr1fZro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-87ec9a4c86cso286947241.1;
        Thu, 26 Jun 2025 05:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750941905; x=1751546705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryBgzteS3sTzJnY4xoXBjjDHmNQzmdu8m3mCNrAPjO0=;
        b=xH/Z1FCk2MYbQfF61ofX8ztWeN4bwvvrynl+8cHNuyrw0nrF/DEcataL7bVNoEPgL2
         UWR1a5sRofRVnaIDRX4TLefHTNk+FmKj4U4ER3PHzqo1Jai7Gz4e/SrEHq0oLX6HoawK
         80I4W3aOmMjgWO3AAcO/W9ieKzVKXC1mRvwJ9iav5z1Tsi+rcQmFQWoQBOZgChJg8UMY
         R1GS935t/V0q3djbj/VF1TweUan2mnv5OMFuK3BF/JXhIRV4AMoAeuRHNPRei1ll5P5V
         bQFiMG99uD84f3ZDBCa7eKb0wXXdCPAftSecI/vjB9is3BJCu1l4SqCc++unzSYOqP8C
         unew==
X-Forwarded-Encrypted: i=1; AJvYcCVDNzq5X0R9HZ5AQmWvl/mjyfUf9m/jSnNsEORtXCWVUhIXvQhxT7yF4zwG8BB4VkkwPxLsEnGED8exUMM7@vger.kernel.org, AJvYcCVkAw6ZZLXyFIgfg3wJfECiHJV5xLJrezMLg5XVpOlvTq6rR3lS1sYdJfkV1bDiipuIjP347nOb3VA=@vger.kernel.org, AJvYcCXTxV8HwimwY9PEyhjEuKgOYY9oASfnZlkLJnqHvq5FNDDAZIVTjAWtCMChdbreN2ShR9y+k17pnKsIuAjBtpoFEGw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw58GeSAYswWfSjKCgfPjMUwEGj++zQrjQbBQ48kWN0Off9wA2u
	w5NybWwIEO12krHhrLWiFfFHF/DDpZlvGPXH2oS3qwvXOnRedYb65XuVSFQWVIsP
X-Gm-Gg: ASbGnctA/VjSpl8hbrflysMgPr/jALDHalcIRrq+nluy7J0PTjeZjyLyhGYhMG8TGip
	WMJ6f2vLt6OPsf5zjAynoDYaVRVemM2dKLxQwFKg1LMUlKpLxiBXfvK5Fsqz5TO3tlyKSpwl+u0
	H76V8p5W1yPivWQK8GfQN4U53EIp29rKk7Q7giBALBT0bgKuUR9XgbrYgIq0bpwB8qwy3w0E17u
	KvfPS1lN7+oPYSTgc3aKOe+6kipZoYQX850EH34pGX0FRiAoNUanO6yUeKT/vWviQZfUu8eoUSs
	Ku2vaUWGp46GtrSSuWzkpTGVBilSd8aU4x/n663losEadLOCcAYnMCpwO0QkchzVgRmPQl7SbkQ
	FM+BdIIVpVzqcCDCuG83OMrY4
X-Google-Smtp-Source: AGHT+IFO/cr74RvRtVktNPph8ZJPNGTLi4CQTWzmu4rg74aK5ujUTQDAQ/ALOstjOkD07i2ODglBDw==
X-Received: by 2002:a05:6102:510b:b0:4ec:c548:e10e with SMTP id ada2fe7eead31-4ecc6a67c63mr5522086137.3.1750941904870;
        Thu, 26 Jun 2025 05:45:04 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e9c7ff88b4sm2473262137.7.2025.06.26.05.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 05:45:03 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4c9cea30173so230107137.3;
        Thu, 26 Jun 2025 05:45:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNtkiUpEAHJ5rsgzNgl1EWIUwHjsgDymF2sKsFIgoDSfKj2QKCa3cOXxpyZm1W6exPszC6vNxMVCqTsFg4@vger.kernel.org, AJvYcCWUc8bomDrOq428w5NudSzXcMhiW0TPNrTAvuIL+yndKafgdraZ9vg5yFg5SJbReWpuzl0DpkwQxxc=@vger.kernel.org, AJvYcCXCj+ZAQTkU4SUfMztoI1xiVsglnZe9OaHYDFIQ0QhicDt5cxoClOLVYgLzocRIguPOfcMun4aprqfhhPwgNFktpC8=@vger.kernel.org
X-Received: by 2002:a05:6102:6886:b0:4e2:c6e4:ab1e with SMTP id
 ada2fe7eead31-4ecc6a78bc7mr5097021137.7.1750941903009; Thu, 26 Jun 2025
 05:45:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624192748.340196-1-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250624192748.340196-1-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 14:44:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrkacai__CL3HL5PotqAFfMSZ5PdXDtukjtAsce1LS_Q@mail.gmail.com>
X-Gm-Features: Ac12FXyBnCzNoQ55ka7gh_RMR1l0Nal9Ygi2IIJ0t_IJDA678XijlfXJjDf9jFQ
Message-ID: <CAMuHMdWrkacai__CL3HL5PotqAFfMSZ5PdXDtukjtAsce1LS_Q@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzv2h: Add missing include file
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Fabrizio,

Thanks for your patch!

On Tue, 24 Jun 2025 at 21:28, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> File `rzv2h-cpg.h` makes use of data types defined in `types.h`,
> but it's not including it, which could translate to build errors.
>
> Include `types.h` to fix this problem.

linux/types.h.

> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

