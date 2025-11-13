Return-Path: <linux-renesas-soc+bounces-24584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB34C59377
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 18:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B8A954F0924
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 17:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562723446D7;
	Thu, 13 Nov 2025 16:53:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ED2191F91
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 16:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763052815; cv=none; b=h5YsO3Hfxb0JwhwX3e1TEQpayxUIaQNbd5eMdZCnmNPArPKxIMUchohDDGcPYXXrhv9+Zjj4kYaV4It/YG2kOkPCmy2S50PMbhvYoP8d7uC7QdL2x7srd1OUDDH/lFYU/9ypjl3Kjz63cfjH8o6DR11KMo69o5cKJMuGYuTIwaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763052815; c=relaxed/simple;
	bh=Dbv+NvA54eQnU138bJCOz6IuOnEx2OSaA5K0SN9S/FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gKIiUsgw4TeTM2QAuglAcMDOiNmPoiWX5qpD7NJkMB5umk0z8/noImJsl0R8w9HCQTB4iCGlwT5AeRqX69/v1AgAPlx/Dd4iVmA0PZesG3ZUbPGRfyD/fP4ObAFWieT6aE6VYcmxTtIKcE7Qmq/XKOgJhCRdq+2hCw7YRP0MIfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5db308cddf0so552205137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:53:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763052812; x=1763657612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbQvAYO3eNdTVb0fT9wjAGvduLlBPUoVXxd3qKsckAE=;
        b=t1Is+BVuswVeZ0cWMCFWUjDW8XsOvnHk5QYatdbykOPMTkTwCecUbRedTwfblUmhuh
         XJYWR2l7Nw5lIt2Bauy1ck17xKTNb/1bpJxzx8ztYKJNuvui7Ddff4rUcfE81/Ah03Ph
         P8ZTw6SclKJBywK5eSOWUw5F1RhfWVmWEc0MTTwjqFjezIOj+tBgOMUz18IuQsiVPWQB
         fcTQzN8CNwWHpPrMmK244U3e0Ikorab9ozaQRzAjQItUNKIoFFIiWzpFj094pgZBcbM7
         8UNCJI9gSzjGMB22+fhdDIg73MM2Q2uFUemuvxTaivdo0gHN8nihDjycQZXraaLletj4
         c+ow==
X-Forwarded-Encrypted: i=1; AJvYcCVeXFudKTr6vWMVa55qbXDuKydkW238EiA/Iv3CJn6wXccoum6dObnP3XAJx/faWYzbky8v2vIajTO9ZeHnO4lZpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Tpp3Xa0W5rgfwBERQaehPcVc64Aer/ACevgQXWxdOIS9QbuT
	soHcwTeYKHwlXzzNJZOCOVFSk0t1otEIlxBL5S+MFEAyak9Kfk3Ai2gnxtxc9F0vcvg=
X-Gm-Gg: ASbGnctKAWJubUcbL5cul2mPSFEhfxN70rM5eoKdkJLddXwrkhwu14z1RnHFD1lD8yO
	1xN21kDTsxsJJzCaVlPOEOLL8/qGY7b4t17X4xqcOnlh9uB8E1jJ9LKkVQBw5K6ShJfMahwKF/9
	ObHEYmJm3WyvZk+oIFP6X3XYYuTuAeIXNtSyEYaq8K83bYdO7vs0a3/e/hKulBPDvq43xYkNMtb
	szDlimaq2dAJdXcmZ13rSuK/LMTifsbJIJbLkBpA/7lZOOnwB6Zs7X6BYUIwEmsDXldo9Lckykl
	vYcgM3RVqULKEp+Jmo6gAOawLeYE+Fe27TRn4/uHKh11PCFM4ynnBHwI8BeaBNLQLZpGrJ8Vtd+
	X/QsoBkh7Ne3dGgVLDsYcY7VZuopcEDxsgM8Dxm7VqvgnR7MTCz9RT62C7qXVfXrlLGS4Q6uwG+
	SmXePWX8W9s5yUG1qdQUVDzWwIeJ1ET90MCd7UyPnVPuJKrVyW
X-Google-Smtp-Source: AGHT+IGLRO45JcKdOVzGoAbGHZ71rheU79XlF6AqU+IIlh5ua9V8OQ5PqQyD3a/qMpsm6LXdLG6XNA==
X-Received: by 2002:a05:6102:83c7:b0:5db:f352:afbe with SMTP id ada2fe7eead31-5dfc5550af9mr182139137.6.1763052812103;
        Thu, 13 Nov 2025 08:53:32 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb7232b16sm818996137.10.2025.11.13.08.53.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 08:53:31 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5dfa9e34adbso833210137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:53:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWmnW5FAopJ3t0oyICGSuXqjkYLsVPleYPMg/TBSoaDrV6gFJddEGXW/zXqxw4Ki8PZIm/1oBcj59isQ9V000inBw==@vger.kernel.org
X-Received: by 2002:a05:6102:2908:b0:5db:f5d1:5790 with SMTP id
 ada2fe7eead31-5dfc5587ea4mr226528137.13.1763052811529; Thu, 13 Nov 2025
 08:53:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251101050034.738807-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251101050034.738807-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 17:53:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVo2DGVm0KMx10Heytif4aQTRU1OcXb-xSzLs5SP7Me+w@mail.gmail.com>
X-Gm-Features: AWmQ_bl5EDLinjz9IEQUBnCdqQ9y_TsmjBBKKZa6y0pw8az6LRSt_Iws6T3ZPNQ
Message-ID: <CAMuHMdVo2DGVm0KMx10Heytif4aQTRU1OcXb-xSzLs5SP7Me+w@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: renesas,r9a09g057-cpg: Add USB3.0
 core clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Nov 2025 at 06:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add definitions for USB3.0 core clocks in the R9A09G057 CPG DT bindings
> header file.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by clock driver and DTS source files.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

