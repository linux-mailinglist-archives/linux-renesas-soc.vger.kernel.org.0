Return-Path: <linux-renesas-soc+bounces-17349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DCAAC07BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7E8B9E37F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 08:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C8B281531;
	Thu, 22 May 2025 08:50:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A57262FEA;
	Thu, 22 May 2025 08:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903849; cv=none; b=DTInx6ieT+u6p0ZB3nkVi52bOTrPn0lty6qxjynnm2n5yfQjLKczpn7StvfroLKD+TkSNAo0MW+vT5G0+W7j0CRJ2ra1+wTJbu5MAabe1oXwKMcUAR69vvWgFGXAy7fwUPejj057U7ItL2MS0zn+1E/HCcdikqXABVOzwkM8Lw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903849; c=relaxed/simple;
	bh=2K+KQZzikeLIqku9jAOLpFAf26kMriVUDbPVnwyyxbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JgShQ6Wo8ajCoOMCdaWIodmziJJHoQ5+9/XA8cTwpLsLq2YdT4LdZMtsWavLR39rNV4TNv/Kn4N4aoM5HkuAGBx+BWJ1E8O2LuZ3mya56k0JBjNJEpF07qujztNBKRnpbStwaaJJHZi8fIGf6Jmf+Tvykd0TWwQoitCSwj3vDfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-525da75d902so2464178e0c.3;
        Thu, 22 May 2025 01:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903846; x=1748508646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RdSzTCdQ/gxFkTRRjzHv6shBsRitKkDZ+s9AT0E9TE=;
        b=hpxiGxa4sGgx1/v9g0RjZ1nRvljhilkDUsPXIxXK2yJTBwJlW6w7FfNAatw+oD9v92
         9gt89t54jQycuK4HxHnMuy9JJ7FoJ5zq6OZqQiTeYuEaZzC+DUYXBu7SXuXNCivfz1wC
         a0Mi20y6k8eAVczE2RTRw+50KNOJ/8cL3fcVW5ijJFRbpSl7gw5g3s5bvw/cpdZYYbyV
         niEcYaurVk8hsp4ierEXmEBCTB3B7yido+SSvDo5i/fxEAW7kuBotK9j581tfuOGh4dl
         CeF3NgkIO9LSc6DJj6XEOpKRo050Q3YEmJ+fiKiIZ5XMYKTPHqfvVZCdkOsXCqc8VLte
         WCwA==
X-Forwarded-Encrypted: i=1; AJvYcCUFI+65Qr3olfNEZUWSKYHVWh9rVbXiXxSyNRpPaDH6fEILRRgv7CKB2Oi7xOmPAHeBp6J46YLz/+k=@vger.kernel.org, AJvYcCVbyFsFlkzKHse3800HJBmu8/XT/P3AjqxeHhQXdRFk+gWhBSmIoG5Vho/KRaI/1ily72MP3F764ZwuZmjE@vger.kernel.org, AJvYcCVcEV+m2pjkahBvcf8wJc6ZPdSDLIZxDVvI/tW62qkSNnWfpJJe5jsNtHKLQD8OuTlFN7Y0JZG4zAhAO5UZxTH8ijk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEEtjzHcU5lDfoGq2+5CXLAu8jbQpbDhAGEN4LeZqITMGknzmb
	wCQmDaiMXJW6S/JLDzfg3ZudfjixabDMNpHIcOQEjShx+MRJ+g0s911hnY9ri5kj
X-Gm-Gg: ASbGncs5sgADASj3zanS/RtdRyCQH0AGTUm7DSmw9BOnQ0ZWT9SegN7H3Ut+k0vsFDU
	IBepeYQHfaBhxf7U7Sxt1EIeIr3sSitORt+Ir6R9XGziI23qp+6xVlPxonHQrQUUxcdpkHbOSfR
	CstfgRonYUOpwQTIBFuuWPV87s3icOzsHujtQNTffBBSzCCLDfDlBNHa9ZvEIMfhovfXOliiYnc
	sZHHScRhUCYR4ORsAxEyDZ2K58SXAr2ppwo0VIVJdW4fxc6S074qfnv3EBBK/I8NgXw4j+gHGwf
	mxmi96tpXqS7Tm3kL3aq8lSbmb1M59p5geqHa21TyhOkBpNWX35f04cHyKfKRNNSdohXVbUXt8O
	9Lgcq1qM8VPUwug==
X-Google-Smtp-Source: AGHT+IFWze0MmGxN/7N1fO+4bwKK2wa/oIXyq5oFO+zpyzsW8jGnkp8SxDveAx6TexXeZIsoHHIrBQ==
X-Received: by 2002:a05:6122:4710:b0:520:4996:7d2a with SMTP id 71dfb90a1353d-52dba94f828mr20111955e0c.10.1747903846359;
        Thu, 22 May 2025 01:50:46 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e96bsm11441779e0c.29.2025.05.22.01.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 01:50:45 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4dfa5cee94fso1993772137.1;
        Thu, 22 May 2025 01:50:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBZz7yk3DBFfzy46bCQoUGSqMmUxgf6Ex+OwwFa4f536mxy28m2ZagUU2+bm+VKEoSUt4rJpg6ffI=@vger.kernel.org, AJvYcCX8116Hq9KRK+luWQc9jDL56fS0urFOH46HvQ315jB56mbi+dFfgNluhcAS/FMSLWDRy6BJ4xwrAV+h1glo@vger.kernel.org, AJvYcCX8I/XUbPV/8niT2mQl60jK7JQdKklwBcdxmyyLaVoEiZfOf0Tav0rKXa2yrUMuCzhEJxE+9b9X7mBAzIRMW7K3iYA=@vger.kernel.org
X-Received: by 2002:a05:6102:6c5:b0:4e2:c6e4:ab1e with SMTP id
 ada2fe7eead31-4e2c6e4aca9mr3843819137.7.1747903845438; Thu, 22 May 2025
 01:50:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513154635.273664-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250513154635.273664-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250513154635.273664-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 10:50:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVfCwbWmQaqaMAR+gfyYvevvBDBh=R_ZV-sVX7vW3ZaGA@mail.gmail.com>
X-Gm-Features: AX0GCFv2mPwCdEPHFEBBSuxXYcqm_Khprg-6zD_yAUBC96QpV0aFb_9P-gawdgU
Message-ID: <CAMuHMdVfCwbWmQaqaMAR+gfyYvevvBDBh=R_ZV-sVX7vW3ZaGA@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: renesas: r9a09g056: Add clock and reset entries
 for WDT controllers
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 17:46, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add module clock and reset definitions for WDT0-3, which are available
> on the RZ/V2N (R9A09G056) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

