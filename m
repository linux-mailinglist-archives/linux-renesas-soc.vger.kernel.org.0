Return-Path: <linux-renesas-soc+bounces-26372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3080ACFF46E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 19:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 048CD34F21FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 16:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CF037E31B;
	Wed,  7 Jan 2026 16:38:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A66B3A9D9A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803884; cv=none; b=ru8xh0Xp/D/zV6MZA5hx+IMaHo1Ii7BjacIzBqQDTK869VI8zv3aFx5VBixtMY9FH1a8kX7RgaQmT99xpMwgFYdtriHFFz/kHzbhUTCm9WujH4I9iDUj/AG0kUSWVER8jDcaRU1HWzVY8JduFkwPyQ9311PFBoaEEZ/0qgMa28M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803884; c=relaxed/simple;
	bh=GXHtf0v34l9dMsk5oXU662hmJwODCVQiZecT5r2kdds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYzG5MWOv2Q9UiJYDEJhYOie+jPKIYyZvefMnWfUODX6j45XEWUkXkshLDHCTBNhN8eowqAJYIgDHSJLCTK52OiU+2FVGHq3COj3+oXyS0V+y/9gkh8VM4dEf2nfwADpanaMZ3VMK/qAB9ebuU2taaigD/WpAFu/zjok/rf5xkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f67.google.com with SMTP id a1e0cc1a2514c-93f5905e698so644111241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 08:37:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803873; x=1768408673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKu9A7wTbG+gOHLtE+m+HecdyeAHdeY1vKyGmb5DtV0=;
        b=RgnUHaZIYfux7ZbmzkfvmIN0aXxAnL49VlcsEPO0fPkLnH/Brl6w4UKU0k9ldS4kXR
         LvLX+1wLgCMy2zmInWj0SlnICRfNvXeHI4zOC983KBcOjcTZmRA54Pb4xlNFOe+ZvLNM
         soZZJZnwDbfUE5QtWRa23YPvbzEp1WEQ4OhafLkOrF4QEXcsPixwCrzN6pRyQ3SQhJrw
         DmLV+0cPRzcmTVChodaNAJRq/VZGDyuEIKfw7hFUgReQo89d+Y7o/SSbF+X78ErKMl14
         1UEuqPk9xIAdYvYzahy6gVJ/Lvj3z015GBPJP+6vGz4Rvh+EEsMMYOnOz9sBLoagTmaC
         oUrA==
X-Forwarded-Encrypted: i=1; AJvYcCVY2BSMVztykBeaZQ9Zj1Gtkd2yqaZzFPQqMhxjG6Jb/jBT9awQTuxddKW7gbNradVnMj66EP1xsuwkebpADj1lug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvKvxqPDYQU1D700SGeo8WuNaK960QtU/2ISgGgqGjw7BWJ9RD
	MXcPRWNozorSdWfhLaxzaS6Fe4pz0OHWwE9eDwLczJD5ch6odc3grq7ZWOxlbESwMY4=
X-Gm-Gg: AY/fxX6AjCWukv4/4882H/mlgIpTdoprXRChr000sxEuWKrsQkBpybBebrbPAYLBhPS
	ipCyGoDBysLkeUXZD7CtPrAjZdf3iAYdoVKK3R6hpPAe2QxcyNcSPtOEgce+rElkvaRrKGwWEq9
	jXBv+4ncTCOXAf+2osf34Fq24168Mluvv9Suv1gQjYxPjhptFc+GKDATB4DL7oDkc6WlDM3H25x
	UV9oT/TtUUQGsg3yiTYunh277yscdY3K8G0hYLqqKBbOLEetVQwiy39WnMoYWDpassA4fQX2/xT
	tlKw/5XoggOF6zCuaXFX//a33ckM6MBDLqIg74DxeFo/XF2/Cm3yNVFe/1PTQCURPTzxQM2bvxa
	l5UKw7nLcIHsgvwBJH/EMDwELvNK+QM+AGUYbH3PlhyocR3/zanFSMJ6TzvNIeikHEnKTI3E+kz
	wePVyagvvmv6QtEUoRbtuZ+knhEoUFGI4Yiywigr9NOPyJGFd+
X-Google-Smtp-Source: AGHT+IGSSp6asdwJCVEVWcfoN+XT9CKs/vyRLA0BTln6/vSR8r6LpnmIPteuhNUJDY/zeOR6h2e+Sg==
X-Received: by 2002:a05:6102:604a:b0:5ed:928:59a4 with SMTP id ada2fe7eead31-5ed09286728mr634716137.39.1767803872755;
        Wed, 07 Jan 2026 08:37:52 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772e3300sm3453079137.14.2026.01.07.08.37.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 08:37:52 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-93f573ba819so744374241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 08:37:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXh/km+7OXwRdWxCw3xEE+MIDQEKAc/8ptqH1s5FA6Ayj1KIBnUsaapbLpjEXC5gZ+bnfdDtJQlvh3qraWX0BFnbg==@vger.kernel.org
X-Received: by 2002:a67:e716:0:b0:5db:3d11:c8d6 with SMTP id
 ada2fe7eead31-5ecb5cb9155mr1165051137.5.1767803871092; Wed, 07 Jan 2026
 08:37:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251230115814.53536-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251230115814.53536-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 17:37:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWYuq=x1hDb1m9D=H=rY83pqcJztXW37OA-ReXAaitGKA@mail.gmail.com>
X-Gm-Features: AQt7F2qaXZupH8vZG5zoME2d29ysW6TbxB39ZBn0ObCH0qVc70nPQN5riXV-6zE
Message-ID: <CAMuHMdWYuq=x1hDb1m9D=H=rY83pqcJztXW37OA-ReXAaitGKA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/T2H and RZ/N2H SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Dec 2025 at 12:58, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the CAN-FD controller used on the RZ/T2H and RZ/N2H SoCs. The
> CAN-FD IP is largely compatible with the R-Car Gen4 block, but differs
> in that AFLPN and CFTML are different, there is no reset line for the IP,
> and it only supports two channels.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

For the content:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

