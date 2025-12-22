Return-Path: <linux-renesas-soc+bounces-25986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ACCCD6303
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E4053036590
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0572D839C;
	Mon, 22 Dec 2025 13:39:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CC02C11F8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 13:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766410775; cv=none; b=rzlyYy3XKQbOwE3buYz8bPljZ1kyozpF/Po4wN7dxu4dov3/QlmYhm+zB5Iik+P+jsSkMNOERcxvgXYlhbRezuJoyQLXnMnArc9oySO8hgQMcG605lwrqyTkTgxnMTTGh78gFsx+3mEhRd97l8uJ5pT9tuMY/Id556N9EmFGJHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766410775; c=relaxed/simple;
	bh=aLorWmYRvNIHl/ChpwP0b5mSgCM9jBpYeqRPfx8gvZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YoBOFBTiygOX5WZlCIVT8mNyXTJoyYuc6ZutyrRtm9ZaAACwlgj2T9zLtFejQAXkJ0l1dZTOCgtHuESAA/BFgEpKSq0Bu996qsBcrSQ0y2hc37uyGZPrYm6dc9LIH/IxqQ2wUYczCenRAveX5y+9+y3ICxK/g8fnH1B7mUi5K8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5dbd9c7e468so1609030137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766410773; x=1767015573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYo5pX+aZSSpkX0T6WbXVuuCRV96o2JsBCIYhgvV9O8=;
        b=WJiLOSnWIZJFMk8IQp86M/AL4Dyyg5JZHY1sB1o6FouAQT8IlYMgaVHZKT0XtH2roE
         CmhfZu+ess9yiq6m5e0AfQCSwCQLN+ZwWctVVy/aZoSFafuE+UZqaDVCKoWquiQcQooP
         kR1qtw+yY2q4hSXIBTxhZrn6Fp3FCTm8SG40+fI9aQ98ZpHHnN9ATxCf4HQ+OTu3jR68
         z0970ookOo1SU4gZGgg3fKummDsHDdFotmKEV2c7dAwbzVsgRYsWPB/zS0rO4txU4sbz
         EH7b/5X1JpCyOKq96hpPP7XakM+hMHCxtCqZ5Xp0/rrnImEQeYFYXSlclGms//S44oXP
         yS2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUKo0JBO45GRP24fouoj/gNJiVgzS9V5sfIOv7dXKgMfOAM2FtTfDMNFPUjW7Hahl9u8lWfxtVzj4ZOHyhHiuplw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ0cOZlarv2mbZKTWUN6zCtk6PSq8Yssm21Bp3s7tn7Qla6Ibb
	ISvL1QScOJ9PQvRei0AsEUfJoUmPJAqE5qpcCKfBKCpklaRYh364Z/+7kpnZbrS7
X-Gm-Gg: AY/fxX4QjffkOoXShUR1QNo6WPtorq3hHonmKatuJXILhKwZiqeNRPbEEuag8uNuQwK
	8C7VhNPrybpXnKZFVDiEoXjJdxEcAAZNu4vS42Dnu4msjpWdkl3hsdVpOyJtv0LryhmFPfUTRI2
	mwQJSeVQHRhrGwMhVEhPw/8UZdwtxNN0dLfCV7wicpminG1wNoRh99mZoo7dlmbnKVpU98jTndb
	Bk5vwLxg6kxsrJ2Rj227p7SSivZXxZxexdw6k0t20yztEhnXzilhyoxiKHU/IY5gbVF0RFkC57b
	lUpwI0sbKIwHBaBjuzc44S19hAk5uXp6IcCmb2jb0sTWzb/6kpS7BtEi1cn3MT4YtIx9XxUf0Zo
	/Iy4iKYKj2WIZjzgZtbwpAIpfjDDPH3BuyVeNR0m2/f6kAHj5pDSfMvacGzZ8S876ciuLZvhHoc
	Q1SsXL5XfbdlgV2rj4wXuYpWhI/P8ZEyNvDDbRIjefO25zv7Zw
X-Google-Smtp-Source: AGHT+IEV41czAFagPCEKsoS8krFf0VVRJiEhU92Gk/Uco04iTxaqgTHD9ILRrsjqpM+GmDulwS6BIw==
X-Received: by 2002:a05:6102:2c10:b0:5d7:de24:5b3e with SMTP id ada2fe7eead31-5eb1a631349mr3311738137.6.1766410773131;
        Mon, 22 Dec 2025 05:39:33 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1ac90a6asm3316493137.13.2025.12.22.05.39.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 05:39:32 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-93f5905e698so921857241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:39:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrv+6XXZH0jbZQvOZ2Qyl0W+ZcsMKGcvNyoM/snjfwKrqI/IICpWdyEWVj2mPWZZOk2DlNt5ghWvX9PTWf0d3iKA==@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:5db:e297:2c75 with SMTP id
 ada2fe7eead31-5eb1a690d56mr3146711137.18.1766410771741; Mon, 22 Dec 2025
 05:39:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023212314.679303-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251023212314.679303-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251023212314.679303-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 14:39:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgsaLA8oLkKmnvZ-4-BHh9zokH7ELBLzULhiFtxNEYsA@mail.gmail.com>
X-Gm-Features: AQt7F2rUSnyhEsMU58-_oHkLcTQAMyF45jFSROU--OEfcy25k207D_YCitdMMXw
Message-ID: <CAMuHMdVgsaLA8oLkKmnvZ-4-BHh9zokH7ELBLzULhiFtxNEYsA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable
 DU and DSI
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 23:23, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable DU, DSI and adv7535 HDMI encoder on RZ/V2H Evaluation Kit.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

