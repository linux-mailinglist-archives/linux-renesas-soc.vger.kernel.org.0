Return-Path: <linux-renesas-soc+bounces-21271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A3B41DDC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA9D41BA7B22
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B892FC86B;
	Wed,  3 Sep 2025 11:57:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6AB2FC019;
	Wed,  3 Sep 2025 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900621; cv=none; b=MyAJCKWBnuzk+7wFfZSNxMWzRltQZpVEeLsiVPxDkqa2CwQ8XbMmnNebzluvT35xoXu3zkTQdp+DxAtUnbC8EZVaoAr5zqeLXNokhcTldy6CowODrxvAr6PifQfChg0yYS5PVOW19P7EIYaLJiFfY9cyo8xOUjOJ2plB92UovV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900621; c=relaxed/simple;
	bh=JVZN7Thk57ubkHL8Lh98PDhOuxGLBmjYHulFrZ/HEBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mc7ASMcnAxjGGskrH5k5iRyFwVqY/lmqlKC5Tbc35VoSinIWxsACgWgLR1EO8/iPX9bGbvsKDa+/2dUnCrEhs87W+g8K6H8oWB8O9kjBzg9kjzwYhPv8rl92JcPDaeHb+Jf7JtA4XNz9LQiXj6cJzU4T1K4wWiXIT1EUjRqBt8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-544a6597c82so1802156e0c.1;
        Wed, 03 Sep 2025 04:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900619; x=1757505419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWlQz62fgHWX4uCU0ljXuo6BVv6lTkeHam21GWLhzFs=;
        b=BGt3n+sqrAOhpaqOku0QovHO6hIADsoxWOvlSxH/FAfO77jCAhb32KIW1cxSMOMf73
         UCPYRgIw2y1PPd50E6VDWYbgDU4oUowkgx+h1HDcUaHMlRr6jCbvAL03HIhb994Z5IiW
         hg6iky3bVNy+JhaEGGDQ3y1vVQxBHxHE84sm0ockXy1DIncdJeN/mWALT1pPMIlLIH2e
         4HRw2IoN2qtRisRdn8aqdqgm95ye/dQR350JwyRNJlaSVr64tDwdyUfqGEIXyfUZzidB
         KCPavJn1Ovvn+xxLn9gO7Y/u2BjxqK0Okz8bQoOqWZR10bQyDQEURaMQJc8RQ/y9uZNT
         WWcg==
X-Forwarded-Encrypted: i=1; AJvYcCUUkXs5t+ZhrI7BLtqf9CNsu9s4h2tCDvM+FKrANVh7na8+GlpP8h3YA5jwTm1pjlvqoNIG68QBmswc5Z1v@vger.kernel.org, AJvYcCX0f3J1v7BEJYuEAx6g7N/3yARGlttTwDnnWIrY7ehvORCQJbftHp2a4WM2zbjolVh/UyHH8Qd1NiQ=@vger.kernel.org, AJvYcCXkVuR6GhIyQjgvPdZ7C0BWyrHH7gl6epJf+DmNx1CI/t5Gk1NwThO5cmVCl6N2GBFKOgvmENk6eym+C12fNPambq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcVFvXZS9xCuOa10cVwNyMkRXsOsKZIM4y/oxohvP5pHuKjHrz
	g0SYz+jgmDKeWoV1HOjMIi9BqlW49RJnUFPzQkwWhsJrQj7yWjZcy2IpdZXXurlt
X-Gm-Gg: ASbGnctNx+nEqtgHrQt6qLOTMLsw9n14o2vwuTLjsqOMk/jIpkT3IruQlNkAbSCY7KC
	UC+UP45Q3kbFOHirARj3a+RA09iVZSWXfZD8Vt1zdgvr2dbpNybvTH8n4hb8fp2wYx1wmS6ncdn
	yKBdaqbb/UX6E3hRLY5LkmTpkatcX6T6e4KlcdRDHf+J2llKsOQwb4uyKkQs88RRzJRIhLcPYcC
	XTY7C2eHGiXpt1YEk7+rnGt+IC84feRT3v1fdRpCjPp8YOPkjfis4TYEDpRRokFBf2V6Nrz+BSj
	0Ta2USC1bHuDl2+K2LckjEVARMdAi1bcLsZ4Fvfa2rnPbsZe7biLk5HoF/E5S22qISRvUxwrQEi
	miq0TamhItc49EjJNoF4A9yedLwKKb2My/frvBMmH4DDgqjdujNXj+yBofzeF47KO3X/IPtM=
X-Google-Smtp-Source: AGHT+IHnzaIG1c9I71bnd834oCpW61fUrl7Kctani+zmXNklm9M97r1H47HWpHguXTdc5PwKrE1jrQ==
X-Received: by 2002:a05:6122:218f:b0:530:6bcb:c97f with SMTP id 71dfb90a1353d-544a0226a4bmr4683344e0c.8.1756900618978;
        Wed, 03 Sep 2025 04:56:58 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544ad6f8047sm4159169e0c.25.2025.09.03.04.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:56:58 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8961144a9f8so710543241.0;
        Wed, 03 Sep 2025 04:56:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLwE7VBVMzSXYonZMGbiNPPXVV8fWX9tSDUGagxFOkEOMoLysp3q1HW5sOhkaGin15xhA8m1h/c4eKbUZ3XjP1xsw=@vger.kernel.org, AJvYcCWXn+H4f4WhKbqsuU51IvJIN++3GVYRAmYLAF3OMCkdEr5cXyF2H+zjYgP/4CIYjoZwb03IpyoGP+u7BfrA@vger.kernel.org, AJvYcCXmbvOlrog1gI2qeY4HG1m/n9c2NTkux6X2BlZbfqkSv3jSDF9LEqLi0Y6XhPh1lDR0HMuQQfM7gMY=@vger.kernel.org
X-Received: by 2002:a67:e707:0:b0:523:45ec:c51f with SMTP id
 ada2fe7eead31-52b1b6fbbdemr5088271137.20.1756900618564; Wed, 03 Sep 2025
 04:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903082757.115778-1-tommaso.merciai.xr@bp.renesas.com> <20250903082757.115778-3-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250903082757.115778-3-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 13:56:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2dvTC1_mQZbSO-cZK3uKdQqe-ZWpK3cjTFhwopMpqHg@mail.gmail.com>
X-Gm-Features: Ac12FXweDvlSgcPQKXoKLUTDe77flpLLVoKpJclGQMvyXnBRhhMqERFJ6l82_G4
Message-ID: <CAMuHMdU2dvTC1_mQZbSO-cZK3uKdQqe-ZWpK3cjTFhwopMpqHg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: renesas: rzg2l: Re-assert reset on deassert timeout
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Sept 2025 at 10:28, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Prevent issues during reset deassertion by re-asserting the reset if a
> timeout occurs when trying to deassert. This ensures the reset line is in a
> known state and improves reliability for hardware that may not immediately
> clear the reset monitor bit.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>  - Collected GUytterhoeven tag
>  - Removed dev_warn() in __rzg2l_cpg_assert()

Thanks, will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

