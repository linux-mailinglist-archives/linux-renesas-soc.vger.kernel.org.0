Return-Path: <linux-renesas-soc+bounces-22442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E463BA90E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 909F8189FE32
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 11:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421BF301034;
	Mon, 29 Sep 2025 11:37:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94693002DA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 11:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759145871; cv=none; b=qbDToXjIVi7gnPayjQ8GkqwB6Z4fW7LXUi+Vah7P/Pb4y+hBukrVOJkpQji3bskpzb6d3PPm5Scf8pE/xWnYX8kFgBlIuskchaL+tPUGPLvCs+Ky65q4uY7NQuj1C+BfjTkjLx1/90dJ+7powIeHR7/CY+qiAVthw+Hd7zF8Qic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759145871; c=relaxed/simple;
	bh=14SGPZS9nPNEndJRTPYwlhVvLeiJWTHVwacGI0l7DKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CU3BFpMqhfsZCv3FiCIbrfzX27m2QyA9gsca6whmom6qmqKtqDqthktt2tOCuATL0uh1ghwEy7GWIy6qZD/3e96FNXnB3bkYBfsj0rlriqpCTtkBttNdqjqU7uIFmHLYwhl8Wg9Q65931SJtwnJQTs/dhtLCKxiWOs5RiKs4QFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54bc04b9d07so2000611e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145868; x=1759750668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weWdXbQxCnMJeHS7B7BXqXEXqPpjTdZBAI+JQlcZ3Pc=;
        b=tMckoZ0+bgp6mSklA58rbtY2WBiXkql/7rOifo4vtAYmgWriZSTe/eVNrZNvjmVTmc
         CT6dz2ZtK4P/GBigQkpNEe0+oSfjV/+bKNqZPY6g+5JVtk+CYrT4vO4QLCfuM2E+7ptb
         5bt6Xj5AX7LqFbDH7hCwDS8RU6nWIR8OXun2sDWUNS7PuGlsR/hfq8w2Y2KHbApLERgf
         8z9y3peKLEZ7pOBitz9jotnPiv9Up6RUzSi3DWcTH/Etgq3S+yev0K5lwdtXR44Rin+N
         LavS+tJFGKAUEsMmAYId4wuw0f7zG9HHibHzrHjZvqlhSw2P+4MOsxe9aIjbx+fG2xhU
         RnIg==
X-Forwarded-Encrypted: i=1; AJvYcCUc1VSxadZAonpvFcvBkprRghIEgjKki8cu3wjn4TcxVGDUjioEWN6yiR6OeXhaAjh7WjORsh0XUFCJPhg7b+xMhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN2eqVhaOGTvnl12aRe+jJMbNC2N5ZFb6rITvPLQFPZnLYQogt
	5qB9oQ97Tf1q8HgXIqxzcRCa2jMao5FSS1/2cJ2z0FP3Nznecw866/mf9PMceS6a
X-Gm-Gg: ASbGncsTYr7fOuzJs9VAsG+X+PXobLRibA1y/vtngrWE0mWKH8XQImphYXdiCjhrI5d
	vbYChJq5uEeuM6sU5C3/gSMotLMFC2ZtSnoFZ+2AF/Enp6ICpZO6J4pzQ5dnICgVvBLDr5oCe5j
	oWo9JmBa4oT7z5qeaaO+AKzVAn0WlbmlnCbkBBkj12PAShMjFFeFFdCBK2qdb2QsijPha4EMBZH
	RYvm1/c/3r/sX3rsEmyK63aKJLpkBCVw4lwdovOWS4B0hZj/RvQPzkFYx14+E3ItR6kbioqxqmI
	4zRFmrsjv5wUCtGf4sugugt7oS6KMAgqPjwblI68/HW+tPTPBgqQMq6ltBLhwyVfLxa/arkejnd
	UBzvmioauCVC8nln1YQ3XXA10Eu2Q4FMgNQrtNXZoj9v8vJhVyw+b3ZwGk/CQtCA7
X-Google-Smtp-Source: AGHT+IHQ2HH5xi01nF/BpXZRkZ8ZGoOL/5GMBlPs8jTL/o25/pzOnJfqz6lvQJM/ulNANsLsBnv6MA==
X-Received: by 2002:a05:6122:7cf:b0:544:8d16:4541 with SMTP id 71dfb90a1353d-54bea102e5fmr5636920e0c.7.1759145868396;
        Mon, 29 Sep 2025 04:37:48 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916d1701df3sm2542285241.7.2025.09.29.04.37.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 04:37:47 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-54a8f6a2d80so1615698e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:37:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEJyq3eKHcknNUsyXlosuYVWD/iz/9IC3ReBnaWrpgPuVrX6g2y3SOftbbW6bbXsgE+U1QPi089L7FRnaFVHJEQg==@vger.kernel.org
X-Received: by 2002:a05:6122:7cf:b0:544:8d16:4541 with SMTP id
 71dfb90a1353d-54bea102e5fmr5636901e0c.7.1759145866822; Mon, 29 Sep 2025
 04:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com> <20250810122125.792966-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250810122125.792966-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 13:37:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5zSX5URg4vY3Mm8zo9ghE9cTBOMg8ozLZJ2QevF=7uQ@mail.gmail.com>
X-Gm-Features: AS18NWCeuTWOa-ri5Qlkxi0ZocAYLNnINdMinkM81tK5_mT4fKgbcdtjVA380a0
Message-ID: <CAMuHMdX5zSX5URg4vY3Mm8zo9ghE9cTBOMg8ozLZJ2QevF=7uQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: renesas: r9a08g045: Add TSU node
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	niklas.soderlund@ragnatech.se, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 10 Aug 2025 at 15:02, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add TSU node along with thermal zones and keep it enabled in the SoC DTSI.
> The temperature reported by the TSU can only be read through channel 8 of
> the ADC. Therefore, enable the ADC by default.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

