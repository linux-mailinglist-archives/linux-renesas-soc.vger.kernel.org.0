Return-Path: <linux-renesas-soc+bounces-12674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65773A20C6C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:58:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 715FA167419
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 14:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673F61A072A;
	Tue, 28 Jan 2025 14:58:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DC8F9F8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738076315; cv=none; b=MIG6xYmjhLbxMQ9lyUs7NG1O0CSv/jJkLkcMVIND8yHBOSMWbjdYTE6kxBVRXPkAtaHGRW+nbajYIW17ICV4ocVpJqEa2NJHEdhFSGnVZJT9AmmLqsdJrlHgCrLCZxfSQsLpYQtjQw/GtFBgLFBMAz4MKxf7jClgHG07idf/rGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738076315; c=relaxed/simple;
	bh=75/boI6OE36UgyQTb2kTZ0FGIOEtSBnuesqurBrtfw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BxnjfSeKCFaJTVGYgovWQ+fi4jgbmBWADJgCAYYivH887/BGUJuxTI1G0Ay6/GEIg0ly0i+iF4XMAGyFup2p57N1P4XPfMj4AAuKAZguEknWX62JJMprlOrYMFOqqaee+7UpdBQZ7hnoJ8SUmQGiZhFNRtcxnNcpcMOh7lf22xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85ba92b3acfso2696239241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 06:58:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738076311; x=1738681111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8tyqzGfc7RslpKnUQfNWO4dinM09echSawSnF0VfqY=;
        b=M62oTyqfnzvEWZAtg+UyprXE2Mc/Ln/86+mMJxl86JA2csJG1KMNbvK3V18VvU6Rk4
         k5oQyqTnW5X8k5ENlaLnoZuYGPxtRZz3swoh7bf3zmsDO8ToNjcSgCGK05Grl26woDBK
         qE6qH9UxN9YNMISyrC61fIwSvuG5ejIoQWZrVtsnJWtQLGl6//hxzzMuLJq7XOhH2knf
         lrZ/Rjd1+t/0Z558K229Gs2yXlkAITW45rjRzHyD1waNJ2ayTsaYFXke64+q70fD1Pu5
         nnrLg7w3AyCZRtP8zbFimUzazaUzhLRAJ/xmEftvQi43rdDfHKqhE5t44E34ClZXItjG
         apew==
X-Forwarded-Encrypted: i=1; AJvYcCWVKFrdytS4UCNb+yNIX4rYC++M+3L7UpcYRazWgxr18FAQV0jTmP9ZMrKp+OcwZgqKHg9PV0vJSqANpRvCS0lw+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzlXvw8oYD2haIcI+YnYmPLfU3CHXLm9fsuqumk5aX5PCyh/4A
	VtT4k0B/LmqsFWnyWczyjxTuHpQl+b0DVCN5pnH6JbTUtS2OYFy0MzpHPo0y
X-Gm-Gg: ASbGncsJcZeB69vQn1vos0fsGbJABL1ia34xk0XuBkNuCp3q5lUyq8WA+N0VkzyprXO
	F47ST4/FDJ92CmMkG82sGCUDXpddJWg/HH4DnAOqyrWovoaTWKFgIwg7MyOdx2PIr5Ym/3FVFn1
	MMeAIzO+D2NcPFl62QIKoaBMqudfO9q7bR5JhzYJ44y6l3h/VJCTp8zuzR4MgACGrlH4RwhX3mw
	VCqFYmNGBqF1jUYlcSeLrc+73jk2w/M4voLC0wehX2AFUCp4rJpq2KtFBl9bPiPnnznVIRyQffr
	pddtTTQi1gCxYQVRxQ1kXurpQZFEm4i7pSM5ijXAFVrcuhKyJ1ydzEhccrbrSh9R
X-Google-Smtp-Source: AGHT+IHDuxgCptEeOWz2nVmsHXq83lhs8Vc/uLNGMzk4HZ/NRxTbuIZHmTo8adAw4RQINMz5B+NcSg==
X-Received: by 2002:a05:6122:1698:b0:518:91b3:5e37 with SMTP id 71dfb90a1353d-51d5b26bbafmr36973705e0c.5.1738076311352;
        Tue, 28 Jan 2025 06:58:31 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ea363b6sm1778725e0c.8.2025.01.28.06.58.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 06:58:31 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4b2c0a7ef74so3339441137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 06:58:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUpaqZiTKCb95uYLPZbe79g4+ivifqMJiC7Dwd4TX7PVbDSRvlpF1C52/4b8y9Eus1RJsPnnYNAB7lUK3oQnW3ZOw==@vger.kernel.org
X-Received: by 2002:a05:6102:2923:b0:4b6:1a64:1c95 with SMTP id
 ada2fe7eead31-4b690cf1487mr39078359137.22.1738076310526; Tue, 28 Jan 2025
 06:58:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com> <20250128104714.80807-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250128104714.80807-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 15:58:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWcN0eDkorHrGxey_BW6DMJsR-e8b82aW6mvjx52VE+rA@mail.gmail.com>
X-Gm-Features: AWEUYZkz2o4qrbdlAEKI-9XWv3Hm_B277nWSm0u1O7NiQA7zYZhn9AweXdVt0W0
Message-ID: <CAMuHMdWcN0eDkorHrGxey_BW6DMJsR-e8b82aW6mvjx52VE+rA@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] irqchip/renesas-rzv2h: Use devm_pm_runtime_enable()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jan 2025 at 11:47, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Simplify rzv2h_icu_init() by using devm_pm_runtime_enable().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Updated commit header.
>  * Replaced 'goto put_dev' by 'return ret' as put_device() called by
>    devm_add_action_or_reset().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

