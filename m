Return-Path: <linux-renesas-soc+bounces-26743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A52D1FA25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 16:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20B4A3009967
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 15:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B2A3176EE;
	Wed, 14 Jan 2026 15:11:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D93168EE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403499; cv=none; b=CArdkJwoP2V6+Hvrp1Nmo13GJCFxw8bI7MoYCInVbZ4RWKJgPinPKFM1chfAB+gxMxUSQU0JLQdP5Agzj0n4EhH3PqruFOkN+CsQSG63ILSUcg0L6PM6EXAiWu0RNihx+ktOrxJ1AsmtRLSBcyNfFiUIcdGbMXvKTviHSuiyv1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403499; c=relaxed/simple;
	bh=+M+9z0p7l/E4nDyP+sFiFcu+HP8xpPbGwtgulKvWo/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJyJ7Z+xGJIs9VwM8xE7BfKkJg2BLAeEn//yH6QaxjXAM6WNSHc9cAN52PbNKSnz8VfbwZh+1KmdzK1VZLYBkk+JAROakgsrpzmooHi0w7Exv68WqoGnyBhu0k4um7/cO3qxCMFPAKFT/oqgMbytWSNdYCFnVI+eOgZfOjrXQGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f196.google.com with SMTP id 71dfb90a1353d-5634d866615so4867878e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403497; x=1769008297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2PPCiljP8mKTN3qlK3gNrjsm5ZPU3Yx8SKu0rtGmFo=;
        b=kBlb382EWe7n4kX02v4c2pk0dr7S+33lc+162fKA92Uour2zXZvNsCgHE6sJxSgsGQ
         CFCZqLablRlDZymhzurxX485sSaEbkxuznvXK8YeQGdJL/2TMPbNZ5yrd+GF2d0ecgHG
         iv9/yhKgd01JA1M1YZiT1+Dr1PO8+1axGp2NdnA5pq6u3CshbUI5bUPZAPUmnCrv9JPR
         Ph2PdosmPwmCxxpvPz80R4hO/ZdyCzPEy0BaItWWHDmoKbjC1JwN5jOLx8KZIHaxfE2i
         EHt8Ycc5yop7BIrTFwzkHbRmnse0DbrNfwAsKI8P4TpkzEb2ttO21zUrYoLEt4tNOnkx
         0vmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAv0VN5YkeMp9pvXMlGGmNZqTHBk9nS4CqdpCmR/7WP28lzWhSYP8iSG94bFLLVpLOy1evkOjAtnMN8SdyrQE/Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGqhvocAOfVFMVSZ846uysQk7ZOsuvJU6PAGF4IXxtNsBgJZu4
	RYKnGxgv6AkOxqF/2Yf5oTD3XTy8LZjupCXd6Fu5ukl7iWiNVD4CLLczDJhH+32gnLQ=
X-Gm-Gg: AY/fxX7X73j2T8iTkzuVQLEd9Al5E6z24qq/ZjqES4Mg6hx/L8NMtKXz5ubkndBv8u4
	5LHeJXiCTODCQmKTqwmJ8Hl7pCJkhE98VaEvrm6qXLuyaVghthlrYrV07TDoa7TpQQ0fMhXO2RQ
	B6YQ6SSROEeeCx9L0pPOejSsXKxnt3oPQOXXDmNtus4luI6+pmhsMOYT/XMPloADPRdtw6hbNAW
	DBOPlCSbU5/OUn203cW6wrbiVlFnu3ro/yCLcUe5f53ELdbWryQucMq0mflpID8QXM5/7aMRw+3
	G/xhsvMxqps+qPuGpZ6ECyX3jdkGBa/28nC07XGKi0lRABOmEjIcJysuKzXYo4CtD9WtPezW3Xv
	YPipO7QppxrfFkAaaeyb5f63awvVkF18PgjOQCcQC9uiZ6yRgnatwQ7ZEkUWYLEh9oXa5WmK3VY
	kcGZdiKfsvdnlWxdtzYHGSFJglGlhb36k0uoLLI1+1SARf3HqTSiK8
X-Received: by 2002:a05:6122:3113:b0:55a:ba0d:d84d with SMTP id 71dfb90a1353d-563a093abc8mr1236121e0c.7.1768403492291;
        Wed, 14 Jan 2026 07:11:32 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124a3386sm22225849241.11.2026.01.14.07.11.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:11:31 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56365984503so4115899e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:11:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/Sb9GZsJ7poInyDbeaFYeK0hiifoHhxIoEslpLGnIGDvGBET6RX/RFZuNlL8bW5dMFURqQErbfwGVFqvFubhIxg==@vger.kernel.org
X-Received: by 2002:a05:6122:46a2:b0:563:687f:360c with SMTP id
 71dfb90a1353d-563a08080a7mr1323779e0c.0.1768403490712; Wed, 14 Jan 2026
 07:11:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <7b30184db6564f61742594c83c3da072d15a2576.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <7b30184db6564f61742594c83c3da072d15a2576.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:11:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXj0_rNtvgDGnaE=pnenFpHi_Aa6dx-Ej6-42oweEv0Kg@mail.gmail.com>
X-Gm-Features: AZwV_QhWXdjW_YU4fjdNyqOSb6ulXkw-i8mzGwj6hWPbLAjpoXOZB9H0uqSzcLg
Message-ID: <CAMuHMdXj0_rNtvgDGnaE=pnenFpHi_Aa6dx-Ej6-42oweEv0Kg@mail.gmail.com>
Subject: Re: [PATCH 16/22] media: dt-bindings: media: renesas,fcp: Document
 RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 15:10, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The FCPVD block on the RZ/G3E SoC is identical to the one found on the
> RZ/G2L SoC.
>
> No driver changes are required, as `renesas,fcpv` will be used as a
> fallback compatible string on the RZ/G3E SoC.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

