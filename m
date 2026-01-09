Return-Path: <linux-renesas-soc+bounces-26550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C3CD0BD93
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 19:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2794A301053C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 18:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3DE21ABC1;
	Fri,  9 Jan 2026 18:34:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D3E19CCF7
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 18:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983654; cv=none; b=aaZr8lUMLPC3oaxca7n7giyvzAJS14H36w4p8sR2TyF5v46VS7pkTLwSQLXPmc2F1u8AmlWbOVWtts6NYCTWX3+UIulJ1QaMORZs5kqRd7v05OKx/tDCCEzySIge0E+3pF8/G1YebJOP4srn5D9/d7Y5LKz8KC8rbY/ntb2HAvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983654; c=relaxed/simple;
	bh=8TzEm6ww2KBwSJjrrvhY+MuA+YjIBn+Y2L9mT5oqgDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwd6kgIZWfdK//7REKwRZ500Ri/lBar0zl612J1tSrhrJizBxJwNZGY659aSQFItlA/5TO/hcme72y3efen+t1i+oV+d6vXyFaXQojQiJgxFa4MFomwqRH7yefqM8o/qkXCX4UIas+/y2FlJx03hcCsWGzfkowBXn8NmiI5qprs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c13771b2cf9so3340564a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:34:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767983652; x=1768588452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fLS5br715ALrW9iu7K4XmrLPlp0NmncdqOKXgMKuek=;
        b=OUV44P8WEiqY3hLPYCSIIUrKOc7B0xK7hI9uqnyKKYbHst7ntim6a604kNTV2MFFuF
         lzm6D3y/pXKnKaP5FJ57+owc23GvIoFBwipliIf/NCg815l4WJCL75CdMme4R+q7yR3g
         cRqdMWUELcglGFRqIwjlYOQtBhNtvWavanPWi5bQF7MOj3PtUVUoH0tYPsd5tfrHbGZF
         QwjdB+AY5+V4Jz74UO0Jyv2bR3ATMntIl+iZqgWT/V8AlbaBCzrDmMmp0PBNo0xutW1+
         GMefGgrh1ij7OnuMXTk50RF21RGjygb6GMa81xCdZqr8aLkhuVOuRI5ciFekwa1+iIdG
         fisw==
X-Forwarded-Encrypted: i=1; AJvYcCVuk6NzXY54qIXKgllXnnnjQV76V5+2HuS9lkVAuMu8gotmcDPh/YPxqC0Ixc9dJprG88BDzBF0dvnUcp7gj9g8Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGXvCHygmhEgZaQa3k1IxY/+DCTXhD0TPDauqGY127SrhdYQ9U
	JqF9RCNSudwerfSWeymwR7Pj3DOkRlOK60nICiemNUXBP0Gv6koBaMHlsfRnOpJx
X-Gm-Gg: AY/fxX6z3ZKpSB2oFZ6kD7p47iuGKjiBnvxjCjeAhQ77feoDezph2tIWhMVKqayPBx+
	gWwENiBVKyo8SQCsPm+QmNt9NFcoujDRfzLqHB3hEDdTkSs0hW0oIgFO/49l/68J7o8Rtw9oIAP
	73P0kUAOdpwuPT3OhbUhUAY5umTRR+wPZEgYNlQa0s9gF6nV/8rJUPCamsaacgD/HaGMVhYpDD/
	E4keIcPeGfF77Yi4aOAdcfcdQg03Nn9fnZr0AzLI0/VYLAFOKU1eTMdfbwjG/zO/3DA+SymTsn4
	vgkqj3kpe5oZNyUFd0R+274ABkTWVqod+Ga1dxXp3yKHuZ4AFW9/m852PpQXH+QJVc7QQvBOb0t
	FGpuyhcYyTioMiE0L5tI0riNJrI/bWGk7RgaMyyux5H5vJ3UmQtyhvCoQR7xLAkzjA7/0HZlxF+
	H3K/Yr67hl1B0QXR5xV041G3R+ypvaVHtSWwLe3evTLFXPOmJ1VL/S
X-Google-Smtp-Source: AGHT+IGNvYSBx+ezjsetr1KdS5SmQnna5yE6341Pf0RkganaY7RKSko3WuIKFWY2hRmoXZrdPnBqyg==
X-Received: by 2002:a17:903:41cc:b0:295:2276:6704 with SMTP id d9443c01a7336-2a3ee4bf4fcmr77447385ad.51.1767983652484;
        Fri, 09 Jan 2026 10:34:12 -0800 (PST)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com. [209.85.210.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48931sm109744115ad.29.2026.01.09.10.34.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:34:12 -0800 (PST)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so4135734b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:34:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXI5aHhEdjUaAZ1OifpVoKpVcG4TGcOsF3/E1cFVIfNRM1UoWtEHr9e5xawjgXkeWI9Yu3yvA/qW1yVl012C+IdJw==@vger.kernel.org
X-Received: by 2002:a05:6102:604f:b0:5ed:f26:55f4 with SMTP id
 ada2fe7eead31-5ed0f26580cmr3794404137.34.1767983267169; Fri, 09 Jan 2026
 10:27:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <371314eb59c84965e73c4c225db386456d82b1d3.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <371314eb59c84965e73c4c225db386456d82b1d3.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:27:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqDPYNPE63ZBFxWTnJtzJwisMNpUPFPf3BJodCxzZ+ew@mail.gmail.com>
X-Gm-Features: AZwV_QheUwWEgzt_8L2XxxL-r3KN1XzfOq-OJJW2J8DrDX2eZqhIZwBOou0w49E
Message-ID: <CAMuHMdWqDPYNPE63ZBFxWTnJtzJwisMNpUPFPf3BJodCxzZ+ew@mail.gmail.com>
Subject: Re: [PATCH 02/22] clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
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

On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add CLK_PLLETH_LPCLK clock support.
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

