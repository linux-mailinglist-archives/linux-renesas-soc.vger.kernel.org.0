Return-Path: <linux-renesas-soc+bounces-25296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 868B1C8F8A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 968FF4E3323
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3662D9ED8;
	Thu, 27 Nov 2025 16:40:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533FB3358AE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 16:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261630; cv=none; b=nwXgHxB8dvEbYGTCrT4hB1gGVUVftd02d7XD/NLI7cH3KlDuCdJt2EL49uK4tlQL1t2uSQh9ZKANaEYnr+9s6RH0yh+uJ2lGrqSITQLoX/UAsW4p4GbLmNGucQW3yqUEf8kyM3barv1iqvpUxsQ6dsvRflYJtnfR/1mZbSZTP5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261630; c=relaxed/simple;
	bh=9+AL/wNlI2qAMcar3WQycvHFD6TVSjG9PHShXIdiJ5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nL1z19I2ZLz4a+vIqNA5OdZY8KIb56NL0Z6i4qeQgjxVJ+oS7xUvkgY0KZYAh7okmXWoGZs7VUFf+JEfGZcTJYDzU1mOnZZ9BWu0bEA/nczfUJOYlatgrjKox8eo/dYK7rbiEJjtST8xp2SZXlhpWNUsohIHxxs1tc5a8vhmK9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-55b2a09ff61so325923e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764261626; x=1764866426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzijuSrkuGfVVngCvAWQGXuG1JFURvXpqK7jWpUiMTA=;
        b=X7YHrpLlwBYqFcAV5Tck5TE3BV8STXTMZ+6A1dVcoKZGm7mULmzsiHKSriojNJiJoB
         D8nU0GOijURmJuhokQ2SgOJiN1uw0omAOHvO70VOFNeQDwGlPqMH2UYwR02YBnWqDm+9
         4DEiwrEh91JeKKGvONr7sSwmuO6nCGCR14oOAImUF84z9M6cYMaNEEZV6IJPPY9GZ9sm
         a0EYbNS5kc9MM8iwFA73+YE5uVzwWamVtGM5Ud8rMu3py7Wxq1XmsUNhOldIOgxNp4j2
         Qj4x+nyADvAWdIhRMfBKYOR8+gTaHEPDtrpk4KA1xv5nth0bZV4Zb0UrZehEgnZ6q+mK
         C78Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVjljQOY4jxs9jIOu20JFVIBLe4OIuMfYxYiMMRMUOCxPxjc9i0VR0eFstyeTVPDjKqpZlzpy7th7JSYgmBgmrlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLZZif+bqKWRigqYj4oE7TnJBzYeWpGhjEGx55sAwdtwM9WdEh
	Hp8IBXudqwj/Aa10NTdzSz/ZfMF8sP+vBVPvHKBSROCmU59YZIq1BPw25Nuy5rm7
X-Gm-Gg: ASbGncuhAeKfuIIv+WnNTyEpKhTnjf+lOnU9SZtlAsnddtZXNT61I1dwyth3fuJrGe9
	FwKG1QaSGBDkLJ6m8blzxSXiAOg7FnMhEL8sP8ugPWQHOASxO9Fr4USjsAmt2MRRjR31RI5IiU4
	tDhYvu/nNyeqU4hNWxUyr+O6Q4nuOuVi4p95NQtyGl4H50XxkleRwRaGKwSKiHgR3ZMZKdHCWvb
	gW24TeV2HKCXJ+0a8hj5WJzLmaeoSyfNfbZC4CSrtRoCqhAwQ7N9dztQUNzdUjxt2MPVagTkkd6
	tGcjgnYKDBiKwWSXFLf77PZeA9H+PQJ2/shosc4JFwZ82sh8cyjmnppLmmXp34SJ98FD7Z624Db
	KVJLJMj47JyH/48e/FDOSiIdovw7/gVdX/vKICAwiGgomN4p7UAFOh0WYxF66Z4vnuahTEbJgmI
	G7+0rnCkPRTfRfavY9Jg4x0GqK73cS5okNk/w/RS3ZeylnhqVx4bio
X-Google-Smtp-Source: AGHT+IGNqJlAoASE/5cPTFAK7rqoCOYSv00uwxASLTvViwdy8tPGE+DR3QhztbCb4yZCyVXJU2VuFA==
X-Received: by 2002:a05:6102:3709:b0:5dd:c59d:ea2c with SMTP id ada2fe7eead31-5e1de441b74mr7664547137.36.1764261626230;
        Thu, 27 Nov 2025 08:40:26 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93cd6c6802asm789454241.3.2025.11.27.08.40.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:40:25 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-55cda719128so325968e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:40:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWY4ffM1IW+qO+uRg88xyAbdVI+0rk9Ct/DeWsDS2m3CU392fB6jT6VeCj7XpE0xWoZcTmlDdIJaTIb/zmZrhp8mg==@vger.kernel.org
X-Received: by 2002:a05:6122:2513:b0:559:8051:223a with SMTP id
 71dfb90a1353d-55b8ee3f271mr7818413e0c.0.1764261625421; Thu, 27 Nov 2025
 08:40:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127162447.320971-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251127162447.320971-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251127162447.320971-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 17:40:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVanMOXFNEAne+HhE-5eHa43kxRvexWHpGjXDdHnJp2bQ@mail.gmail.com>
X-Gm-Features: AWmQ_bl91iDEckR20KwoAWBG9cWq_oVmen-vb5BYknkC8a8GJU0el5_LJ9DTMS8
Message-ID: <CAMuHMdVanMOXFNEAne+HhE-5eHa43kxRvexWHpGjXDdHnJp2bQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] irqchip: renesas: rzv2h-icu: Add support for
 RZ/V2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Nov 2025 at 17:24, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for the RZ/V2N Interrupt Control Unit (ICU) by introducing a
> dedicated compatible string in the irqchip driver. While the RZ/V2N ICU
> differs from the RZ/V2H(P) version in its register layout primarily due
> to a reduced set of ECCRAM related registers the irqchip driver does not
> currently access these registers.
>
> As a result, the RZ/V2N ICU can be safely handled by rzv2h_icu_probe for
> now, but it still requires a distinct compatible so that future changes
> can differentiate the SoCs when needed.
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

