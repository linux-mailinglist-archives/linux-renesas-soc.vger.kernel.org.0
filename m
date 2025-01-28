Return-Path: <linux-renesas-soc+bounces-12670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F36A20C57
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C6DD3A7F76
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 14:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F701A2630;
	Tue, 28 Jan 2025 14:51:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D311C42AA3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738075909; cv=none; b=G8qz+8w29AAo4Fr2yTMnuul1VWvTxrjbM7S3A2Xls+thIIUSKZ5Tw5lr5F2upn7aIYni2lvyY9QqtkH0yq4ImOkuNHMWFLOs4JWTBLUtK9EFT6Yt7RrV15TwESn2td4HbI9KpvtM6uglmIvkfa5eqSH5AHSqEtN1DGImv7oORD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738075909; c=relaxed/simple;
	bh=Jz62o4q+86u5DhOKEmCrKslBppNayWO1Id/tjTMX7fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1b5q7bGHBSOOfr7qKAQd2egsV9Mc6s7t45ihKLA9bg+KrIFqutH5auRF7omp5gnjJOQWJMFyQXIJc3lcPZ/S9rBU9x3vu0z3DV68IHNQu3Ap5bwSo1yYBm/4GtWnDKtZ4slA/6Cv9dE0chXZC9OjbJfxvRtf4EkTNHOJvn10Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-518799f2828so2765198e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 06:51:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738075906; x=1738680706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBxbN0bF9J5oomOfyjlwHlkkfC7CesY7yytEHqWFSvc=;
        b=pJAgpGBVHgQ56UfKb2ByohCWQ/3/SUWKwda8cTfzH6v6fsRfQrCF3UDHmGD1/CBdOP
         F0/2IEEkiS7NuU3Q5/lqFf6s54XBf2juFYyV1QGbiHhs90S+1UhnQiqTdX7IpmT8lTaa
         ZW3AYLn65oBAHQlrfeBX6ww3MlVJSgb7MLlYkkX3FXKE4i8EFyAeVazkq09xUaMSoJhU
         RkdMPXXqI0Of5hF09P+EleIz+7nIPFBg6d6C2Xa1CV6C33Ay3wxiKQZhb14vBy3GxbIK
         yJ9aty20esZHSctftWTLe7LeBFtNxxzMmsQbshMf0w8wo4njyv92wQJUR7TYxeEgS5OL
         5UEw==
X-Forwarded-Encrypted: i=1; AJvYcCWDY5nkp5abwZKqv7Zh6VxSAPRncOXCsQ0yFcajNvZ/C+oG2S1v5wsejEgG/IWiWSi6zNYsszmw01Vz85Ru3R1JOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+INDfU+P5br0gQ2BctRQMvcIOhAoXh8y4MvIX78eqayGtuWWP
	GY4Zn3CXfkg8/uXYvYdIX/Jog76C6fNqsJIqNzz+ZglIq5cTrDMWnG/XdiXE
X-Gm-Gg: ASbGncuItM/cWZzPCcnYp1H9cTAY5SXHbJZf7Ney8PJn0aA9UJ6C8kG/ChFSwfDsTpX
	BOUq43O+eExbQpThvVsHsvUlcBBp/pKRs+jblbaseHHaX0I+qMG52SLx5KfnHQcYdY+8w0G1hCJ
	YqPmDsTD7BrYyBNI84rhWC6xQ4G83IaBokcPWjeZMWJuiFHxs/DbcudYKcBnD0jk0KG78F70NKa
	Cu3BGj6xYZPYHuQYvegJIj4JYDR+d2FBESU+EtC3USoqSo/vJJwnRUn6HUZ7F+REeT6NSk5exvG
	PT9tg2YrJ3/yCoL//AuPbaJvBP1CXyXz3FyXCdENqkba0E2yDfSEEw==
X-Google-Smtp-Source: AGHT+IE5NT8GDam36KhswNkoKL+heGbIe1LGM6D7VGYbziQuUHsBeV3qw5lC0kRkhjGQL01uqC7mFw==
X-Received: by 2002:a05:6122:348a:b0:518:8753:34b0 with SMTP id 71dfb90a1353d-51e8e1cf61cmr2860078e0c.4.1738075906062;
        Tue, 28 Jan 2025 06:51:46 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ea363b6sm1776703e0c.8.2025.01.28.06.51.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 06:51:45 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85c436db302so2944337241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 06:51:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+5ZrrckSzal7N69JXQnPDpTPpKcDc1Ac7n8uxMX+eRcTIPlUC0J89BtgYTWI7DTZ8qz3iCmTqBlRFlM0NXfopJA==@vger.kernel.org
X-Received: by 2002:a05:6122:911:b0:518:8915:89ec with SMTP id
 71dfb90a1353d-51e8e186608mr3066980e0c.1.1738075905653; Tue, 28 Jan 2025
 06:51:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com> <20250128104714.80807-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250128104714.80807-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 15:51:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdULDKotGp-4Xcy3=ohULqynB9bXg1s87tXTFy6Fb3cOJA@mail.gmail.com>
X-Gm-Features: AWEUYZmo2I6-Sfbg4t_KY-5PK0gHa8xidXwUMrHcrfBxCnnLaCGoz7wL1eSK-ds
Message-ID: <CAMuHMdULDKotGp-4Xcy3=ohULqynB9bXg1s87tXTFy6Fb3cOJA@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] irqchip/renesas-rzv2h: Drop irqchip from struct rzv2h_icu_priv
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jan 2025 at 11:47, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Use rzv2h_icu_chip directly on irq_domain_set_hwirq_and_chip() and drop
> the global variable irqchip from struct rzv2h_icu_priv.
>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

