Return-Path: <linux-renesas-soc+bounces-26733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A44D1ED44
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 13:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41C0430519ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 12:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBD2395DBE;
	Wed, 14 Jan 2026 12:38:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542193559F0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 12:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768394292; cv=none; b=Pxf87Ay8g4xJIBIRVLVAOM0PsfrzirOlDy/+kTdSs8M/AwUmQ6B9gT7HwPEXf7cGZVg3B1w/33xh1z/E/dhdjrWpfmo/HMVJn2zGjgJJCh+Jig+TX2YxCHCoOxavV0SWwpemcdJgPhRpyCckPa3P3w7XdPR26Z/6QU3gITUFpOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768394292; c=relaxed/simple;
	bh=uvyq84vfqLkBb8SFLfNReYm5TtcOjgPQQ2g9fXWWq84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CL2YSm53mY2B/FWjAA4coHOROEgveifJRT4JxWa4EWfH6FtYeya3BU8vSyM2iCmJMKVv5pOzqI8XFeQSU2CnG2ASq0WnbAenrfbUokQQVVUZLNPJLi9HKaD4w+yjfehelGPJAbRLUbo3AgBDcOWntOMnJjgqfoxKNMz3hjYeOV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55ab217bb5eso1422211e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 04:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768394290; x=1768999090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hj+1g0xoern/NZa0KoVGvEg+BidqfC0JY8V0QW/WQj4=;
        b=C+eOuGu9Q0NI+OiAxgyzVc5OAp9aEXAfQ/inGpAYB7LKPsjPV03LFCVIOfWpl2vRYY
         p2SuYIt8SxOV6CCIsrJeUxgomqaDFH4qHuvsuYX83uuJZ8sSLv+7IMKB6hes8JZ1cBay
         x3s0MDmaNFBIYN0T3+z641pDA+/M8JpjmNTSUh05Su0FZXhQsQZ2UGbkgatyky7CSSlM
         kfzc2VEpRlopwwQ/aWamWy/qoivwF+nty53+KR7XlKe2LS1fvOWi5p5WCq/rEpicc9OA
         epms366TTYr6huF+AQxkikI+dlzRKpimBJHdYxpNRucPhimXn7XYVed4AdGLISexzhY0
         gvOg==
X-Forwarded-Encrypted: i=1; AJvYcCXtAmrFVbMKk17uhNwTbqkFYNFeAhTs3iEu2AUkSL6zKqm/FxYMdxGOatT1Hy+1NUXTbPiViFk6KEd+WtG2kxnSdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzziebOd/TJj7wFhRqCHh7bp4hAxXe59M1IfLvaKDoCs44Vz9N
	2Y70dQcWJQCCYVj7GU/fqMWqQfVOcc66ncbfTKfbiq4rxB4CBSPRHoNRZhZEYw59
X-Gm-Gg: AY/fxX5l+y5GfDbDKzBWh2B352phYcbjACM5uWvNZlcLEJ6z1QQdYHvqpxsan8hiISy
	YSz9fPbhwOEGY2GP/P9VhscSW+BkJOy8KdourieB/ThetzbHVM+NL4eZf3TC8s28TOoh8YT4rHd
	b766cnCouseVrp+qELZgL/WJIS5BhTp0QUSNuktP9ob4+c6q5X6ty1pWz/rTgOALAVWPhgQmIp0
	DnRUf8c06nF4ghOFLG5uBLCQvM7zsRaH4nE7P2MZLnY1IjbUEMlD0wVU7K/LFslo19d57rJWbhg
	PUfpCVOrjoLgTUbLxDcs/jSRfFr4XtNRh0h/1it1k/yQP7QCR+0/7KwtCghhrD6uejZ8yw67W3J
	tZBYfOvmaGturwNkcRbYhHnJ+POTl4w3fMJIZ6D9istqC+CiIWV4f7BareeukZ4rWWI1OV4S/1v
	33/XdAhd3VkCNqM+s1nVHbZb7NVCL6PIdejzZsK1xbeL3rDQrJ
X-Received: by 2002:a05:6122:2a02:b0:563:4a88:6eb0 with SMTP id 71dfb90a1353d-563a09567eemr809958e0c.5.1768394290264;
        Wed, 14 Jan 2026 04:38:10 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5634ca16da7sm20618671e0c.17.2026.01.14.04.38.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 04:38:09 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-93f63d46f34so2684758241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 04:38:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVy3M908NRbsqcwta25+7bdW3jEjvk0GDPHcRpBbLTwk5US4dB1TpGz02COu2WTLbkT/nJir54y6Db6T3dGemJx2Q==@vger.kernel.org
X-Received: by 2002:a05:6102:3e0f:b0:5ea:67f4:c1ad with SMTP id
 ada2fe7eead31-5f17f5c4c79mr942660137.21.1768394289171; Wed, 14 Jan 2026
 04:38:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <20251203-shrew-of-original-tempering-8a8cfc@quoll> <aTA-Hj6DvjN4zeK6@tom-desktop>
In-Reply-To: <aTA-Hj6DvjN4zeK6@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 13:37:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com>
X-Gm-Features: AZwV_Qj82EmcdFo9GBygajeXpLdMczZEl-yzaqrHERtstQ_T42ZqMwts5Zu_4K4
Message-ID: <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com>
Subject: Re: [PATCH 10/22] dt-bindings: display: renesas,rzg2l-du: Add support
 for RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 3 Dec 2025 at 14:42, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Dec 03, 2025 at 09:23:53AM +0100, Krzysztof Kozlowski wrote:
> > On Wed, Nov 26, 2025 at 03:07:22PM +0100, Tommaso Merciai wrote:
> > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> > > Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> > > Processor (VSPD), and Display Unit (DU).
> > >
> > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > >
> > > Add then two new SoC-specific compatible strings 'renesas,r9a09g047-du0'
> > > and 'renesas,r9a09g047-du1'.
> >
> > LCDC0/1 but compatibles du0/du1...
> >
> > What are the differences between DU0 and DU1? Just different outputs? Is
> > the programming model the same?
>
> The hardware configurations are different: these are two distinct hardware blocks.
>
> Based on the block diagrams shown in Figures 9.4-2 (LCDC1) and 9.4-1 (LCDC0),
> the only difference concerns the output, but this variation is internal to the
> hardware blocks themselves.
> Therefore, LCDC0 and LCDC1 are not identical blocks, and their programming models
> differ as a result.
>
> In summary, although most of the internal functions are the same, the two blocks
> have output signals connected to different components within the SoC.
> This requires different hardware configurations and inevitably leads to different
> programming models for LCDC0 and LCDC1.

Isn't that merely an SoC integration issue?
Are there any differences in programming LCDC0 or LCDC1 for the
common output types supported by both (single channel LVDS and 4-lane
MIPI-DSI)?

Of there are no such differences, both instances should use the same
compatible value.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

