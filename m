Return-Path: <linux-renesas-soc+bounces-15143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B30CAA7657A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFA071887393
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDA51E32A0;
	Mon, 31 Mar 2025 12:14:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6012778F2B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 12:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743423251; cv=none; b=dHObfsFeQK7ZTZg2X56ep5jG4jCWO9f3nDSBiZWiCKA6oLOQtEt40iz8f3ml9nkzKOJk0JJN8AvYuZhD6a7GiNJy7+ryBfc7ux5Lxry+HubiHrPkUie05p7T7VKNwja74LmyYnl8UfF3YDuMBfLMoUvdl+HLoCUesX314EMRz3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743423251; c=relaxed/simple;
	bh=UTa2ORerBmI2gJzzInndLmwAxWsNKRIK+3Fsr99KMeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wv94tk8vB3HdZKMr301caZcgnb1zbyhfN+Jq5QK/rhtcO62UxeuyIyIDhZbqozR0iHHYcGRBZRhN17X5QIFPkKnbODGYd70+yoyV91MbsoOyEhsTVWFYOonhMbqUgFQ4xZOCcwkdU3WyDuwCgFVkCqHrc21cJTjsULSMsZssCas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86fbc8717fcso1955521241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423248; x=1744028048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ll3HosDeVoWxjcAZON19qbliOiBMQCZ1x4Sbr98Nn0o=;
        b=v6UPgEAgyCpzm6P1h1p6C0PXVBHDBZDQ15HWEcjPUYo4MYAFPlIjwhj1TyeHt8IRhH
         egIfxWKesmklkFoTP2x2nQOwLMSwuCsxpZ3LXz2GqfFv/LLttC6JdRbPIJTncl7BcYow
         e3XwmPTOWj0aZUaTzqGNX8CR2y2Y4PhP69lbm1IzljHu/Zgd36yYyiJQxampBM5jYHKo
         xOjTB+vw+Dsr2gONcJPUzpbEeZO2WvdkuGoYLXBEPe8Y6Lfh+Ejzp4AxocHfVf25GUTY
         w6xNgMGAodSm2EMwOMFgzji2K1ouTmm7ohhB9vh6700PUjq+oGEaBcGJcgVnldX2F3VR
         l0qw==
X-Forwarded-Encrypted: i=1; AJvYcCVB4vw5B5bn2ajITNSgTT6dZqI4oqARq/twMYwLnOKJUEQFnf9eifjqANrMNq41LvAVjhlZnLmURvz6la3Am7ucvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzexuVA1+5XdavRfpqCY2BqvnXmeTDrFa9x06ZaCS2wVVBcQahs
	mfKdr4emEnnzv0+42wlIi3N7hvo0rybd+9FYPkYtBgrBtM26DVK+/svH3r4N
X-Gm-Gg: ASbGnctOLQ8PPuz4o60ZeA6sQpBY7UZvHFGIiLtyoYrariRcjKmws4grBJLmzC6FwQl
	yaD2nTar77fKKJ6f/q1yo10SSue8Y0ZwhTG1z4UUooRzh3IGGFtmiyuiWCg1H8Nb/BpkbqTS90X
	5OhyLeEDW0EsCSC2zYeGmncQ9ATZ3/1tCwTdjUUMB7IxPRTIYy4XOITv+IplL6NbNHgJRJe7frP
	B5IXCwqPBdnOkRsk3CBUh60KfnCASM9g9ksJwFrWo6WwLBPTaIsIDbJ4jVD1TKi7WitfgGyvJKs
	9YlsOfFy292MYmJUtu6H5RjEaIwmolmWloJ0vkWpoNQQMeWgfReoOv32ny4b+zxp0E0OdHUXkFF
	bePLuwPQ=
X-Google-Smtp-Source: AGHT+IEb8IftfXo7n+SlRpvB99GryFEwyG1mLHWOHMUYeYfed441YM7ZZDBrtraiJQa4qKWpDCT01Q==
X-Received: by 2002:a05:6102:cca:b0:4c2:fa6a:7e2d with SMTP id ada2fe7eead31-4c6d37d685amr4078948137.1.1743423248059;
        Mon, 31 Mar 2025 05:14:08 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-871a328d2f6sm1523770241.14.2025.03.31.05.14.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:14:07 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d69774081so1910875241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:14:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXN3s1y/IaNDK+d75ymZi2XUjNKvncCbaXkXKiKX3aE2nKWajfvFw3IxAZ7mgDdjCvxk17a1sNYoAverkYnCFojQw==@vger.kernel.org
X-Received: by 2002:a05:6102:510c:b0:4bb:c4ff:5cb9 with SMTP id
 ada2fe7eead31-4c6d388ae4fmr4364712137.15.1743423247451; Mon, 31 Mar 2025
 05:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com> <20250311113620.4312-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250311113620.4312-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 14:13:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQCOp2SStLqCP2VhQa3qS=2H3PrUe2x_fq9cW2j4JLCw@mail.gmail.com>
X-Gm-Features: AQ5f1JqWfeKkNfKWfNrQCSzwKELRMezXOj1rOGrbo-SfaiiDTU494PdVcThUBAQ
Message-ID: <CAMuHMdVQCOp2SStLqCP2VhQa3qS=2H3PrUe2x_fq9cW2j4JLCw@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] memory: renesas-rpc-if: Use devm_reset_control_array_get_exclusive()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mark Brown <broonie@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Mar 2025 at 12:36, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Replace devm_*_get_exclusive()->devm_*_array_get_exclusive() to support
> existing SoCs along with RZ/G3E as RZ/G3E has 2 resets.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

