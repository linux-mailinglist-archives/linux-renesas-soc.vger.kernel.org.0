Return-Path: <linux-renesas-soc+bounces-16807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E56AAFB87
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 15:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 035711BA6ED4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 13:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7066622B5B1;
	Thu,  8 May 2025 13:37:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76A184D13;
	Thu,  8 May 2025 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711441; cv=none; b=Urg8oy56CDg1Sp+c7eja4AMoN1XTbcrkg7baQW9Oz9MoLJdoqCk2+gDqzr8EJeLlOhm2EGCiOCC0XmxgjgX5yev1eQRb/mvvkRc22vlXlP36cSiGmSuC3vm7PfYOO2u8J610cuKt37caOBPmHN6hcD0aMJx3Z/pXAxZmAvDUdNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711441; c=relaxed/simple;
	bh=J+5Xl4AJlXKR0LGY/FDuaPDERyS7nJcBOAZ5q7du8Rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYc8JSbWwrKGoavVqBl7mgq2/GliitfXYJnpNpRlt5l2XrxiQl4g2WxvPk5QQADtN9WcRAOy8OoGVbfGd0nyxuz0rT3770p7JTHgvB4HMmfMKjfS2jW2tuxqvtAIMpB5hAwSuX8GCcOHY2RQEJLFUyT+uKHF6TWenTAQmHv8n4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-523ee30e0d4so370078e0c.2;
        Thu, 08 May 2025 06:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711434; x=1747316234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3YnJIyt9szUtkbvPGx9Htt+t6tltN/pJ2e5TR8bTR8=;
        b=YCPS8A619bOokqPjBTLjOAu9GG+K8B9HU0VWGLZ1yYm+AtCZ1fK2LEEawvDK99fxyL
         K4k5V0AUm6n7rWeV8sOSvJSDqc/nz3DWfYqB4cbcN4tZGIdYa1i8pClOkpmBbIhD1Tx9
         IwHxUK+zInGAw1vakpSvR2GJmX/LzEIPhkTmxUKd2pG1vfai7KheT8Cd8VXFB4qLo9BO
         rTAlnpfuqBpr/DoaSeVJDlX/wE/aTNr54V02QarO1CVlcNsMkDCK5mKDrENi1FR9EgPn
         X2KhOuMPEgGxasdY72NRnfsYexh5KTnkorJSRQ2k3zIVKqJ8wDPW0caI9epJiXmC+zHO
         0bAw==
X-Forwarded-Encrypted: i=1; AJvYcCUw5QDw1Wxfl/x64gu4uotewKCUGk2HAorO4X5LuLSzVYEg1wldbosTa/OoUR+EJgFwN5G9eBNwQlznoN3SjvnQ2GA=@vger.kernel.org, AJvYcCXsFcstNMmOfncNRQgxKVSaMk1r9Ng07P36Si463JUoz9F/oLhy5uDTCynYIl/X3QNRlA7WQVjBdxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ9hXSi97oL1wA1UbE7ic56CqpG9YpqlP+LIDc+s3yZOc6EFDl
	Dm8FiywGZF4rrQEr2VoJeM4gb5ZrmoOjvBfx+BEmcjnZIFpblHoQ8H59Ltkn
X-Gm-Gg: ASbGncuPhkK11BakZ16etzDjA/w0R88+6uQHRq3/uSm/91sxWVs/lO1fIClTu60lWBx
	dfp5JPavs4oVyaUB+AouqlNp85Xol16lAWbm6IX13+XJdUQbuFYUfs6SW0VSjE6wwyM0Q0ruKnW
	r2aB0yfcloKRi8VLBbURM/oNUx1H6GMer+brWJVDmgGH5QLylrwmD0xah0v1PjFoKOBPNGyr06V
	u7JwKakpm975rUwAiSCfH5dxHY7yIZXcoZ6i5TeJEOWmDLz4Q49YyyY5RCrH2nnX9EskEc8t6V7
	VTLOGKR+ETbzrb/YCz5QjV6RMrt3MDBjpW7tGlSlT/5u/XO5kXE5noHdJhIV4AMDB+agcRkGoFf
	tmaHhKT4XoKjg8A==
X-Google-Smtp-Source: AGHT+IGzrHpKBfIpSODSWSfpDyJkcYGCti9Skck68aGlACuuaKrI0obTU6VjKKliiel/RQHtyglozQ==
X-Received: by 2002:a05:6122:3184:b0:526:1ddc:6354 with SMTP id 71dfb90a1353d-52c3789cc79mr4826412e0c.0.1746711433834;
        Thu, 08 May 2025 06:37:13 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52b0a92eb27sm2141417e0c.14.2025.05.08.06.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:37:13 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-87836f883e2so205069241.2;
        Thu, 08 May 2025 06:37:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMB+fC/PDKPsU4CKejLNb+IFo55Xkbv9z3Bm0sskGuRyEXgJtnxqNLXe4PToF9JtVOPa59DB2W2Kk=@vger.kernel.org, AJvYcCXxmEWs+jGooH+1qJtUFBednpPLN4a4sT7Q/ou3WgSL6LYPYv57lT1hMDyzmkBVUST1fbRaRVwivrgbkBdam0JP+6Q=@vger.kernel.org
X-Received: by 2002:a05:6102:3f8f:b0:4db:154b:cb3b with SMTP id
 ada2fe7eead31-4dc73798314mr6338701137.3.1746711432913; Thu, 08 May 2025
 06:37:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424081400.135028-1-biju.das.jz@bp.renesas.com> <20250424081400.135028-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250424081400.135028-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 15:37:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFF2wzGkLn2G1_9RYg4NTeeU+cZ_k7k-JbGMJADv1udg@mail.gmail.com>
X-Gm-Features: AX0GCFsTgll473T3f6ww-5odMF2P3wXmO3zapqgOjwc9eOtxbZuKsxpMU4HjCdE
Message-ID: <CAMuHMdUFF2wzGkLn2G1_9RYg4NTeeU+cZ_k7k-JbGMJADv1udg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: renesas: r9a09g047: Add support for xspi mux
 and divider
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 10:14, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The mux smux2_xspi_clk{0,1} used for selecting spi and spix2 clocks and
> pllcm33_xspi divider to select different clock rates. Add support for
> both.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

