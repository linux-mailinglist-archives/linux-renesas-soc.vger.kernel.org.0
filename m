Return-Path: <linux-renesas-soc+bounces-22833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 81683BC95EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 15:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D82803507F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 13:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A662E92B3;
	Thu,  9 Oct 2025 13:49:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5723D76
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 13:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760017758; cv=none; b=huSHH6h+j3egx+Bv4zGPhtSC0Tzk97JzfWi2bJoQdp/5Eze14rqiCC3OSrUJaBd8B9gHs+GAfrUb+XECP8YVIM2L2YlHm/ygvEArO0mxo5UCtjVqIrbXPdID1ZPYaS8nINrVMghVwGlaOK9ikkkLAhij6ROeuHZR3cINVDHujFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760017758; c=relaxed/simple;
	bh=yimaDht2VPmckuijnK7RHpnVJdwPGNmnTY4r/gDwrBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQ2q6KWi02oa8w07UvFDkPMIXAcrkDwbDSVCRIp0FtnpRntANcYLNBRRFrGas8t8YVEbGCtCIEEgt8D97eDkxT6QWujylpxAOSQWbZSZnXRqDklbjLEx5Bg3y6Hn7TSjAZ780dnoB2zyUSzAyj/vTP5lnCBGcQyL1YVZoHbTqEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8e401b11bfaso241208241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760017756; x=1760622556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rG+VBn74V/FeJGvzOBH4i7MNFu3atTCKtUYOgAi8OVI=;
        b=dQ19+AlzsZyuzSIXqKh9zzO3/GOHDGMYdIaWBScpP7dhnGmW65U2y6eE35sOvdysNF
         +ETi1eESxZMCPzy59kgGa7zdDaXV7VBLQgfs7mmyTWR+AgYk2Ag0xR5XRJ6upfYUk6dp
         AohUQDRibBKENxK6o1++XnfOZXCphS56Ux3i8oQGdxMzPCIQJ3/vvd/EneUoifUxMlhc
         yrtwK+YIi5iyxxxYXz1TVvT2+CRYRdM8DwIU1evIPryqbJLn+vzwdmYxXjiyeUN/g8Lx
         SOLoR0bhiqbmelDYuOox3/zwog68sbHm8P3v2vvO04DkrQuvjG5/2PNKLW+yZwrbNlE2
         lkiA==
X-Forwarded-Encrypted: i=1; AJvYcCUzpDnl3GBeppcJw0V879w6+CZduPggzgxBCai/r6uzQ4+G0whRAupBVXx/9vf9jW10KVT8QDsYA9C0InL2kkj1aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjeyhJlGC/JpEANTtQddFRFkEEikG9stfSvbYoYhFhyTQnJTCV
	a1IpD8OPvB9ZG33GAzIuY4Or1pV3JlVzhVe5etIWEipFSRBv3UN6HP3HaFVCHbuj
X-Gm-Gg: ASbGnctnDbhjB+DazUNVZQS0sWoFu25NBNHEPOIUhouQhSiZAgfau+F+7wE55adXYbX
	Sks8zAAZVHwjRVLUMvznzVGC4qLaqgDzJ3sv2wZkZhn/plj8xpvwk5dBASE9s/5FKces6xkoh9C
	hn8QV9TacZ82RJ2stB8NlSeEKHtv2HKd1aXx9p5W5sUu1TSptMvsw6OgVXzj17QfdRj6A9ZIzZh
	nbHO+eM0dYZFE5EP2RSx8tL25D2eDJdHgdapLK2sQf3GxoAv/J+voIVf4KaaJynFaOjlPDpGobR
	kL95fYx5oF098z1zRPO45ue5Al2Mlz0mjV1OV5cgDlMlJVT890uAAWoLMrbf6P67wsGp7G3zhDe
	doq9kbpWFgXRhqM8oVzhcC83e0kj+96b4NU+WIj3A5RMZKmOAuVHw4Kk7mNhhDRbfBbDfboU0BJ
	/Zdeh4X504
X-Google-Smtp-Source: AGHT+IFc1lpqEM3g1LU5WMjOUuOWXcNMZt2GyzpMTyCLu0O4VcMu+FAvGIeZKlwEfuPEpZ9XVhWEzw==
X-Received: by 2002:a05:6102:688c:b0:5a0:4f93:fc31 with SMTP id ada2fe7eead31-5d5e21fbc75mr3124891137.4.1760017755857;
        Thu, 09 Oct 2025 06:49:15 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d3835333sm2424838137.3.2025.10.09.06.49.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:49:14 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5c72dce3201so358049137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:49:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5nf0lNFy9RtL3mu0FKSaSgueA8LEeavkHnQSCL2iR5CZM1i5Lw9EOIYdutlyF/Vu9wDBxhioyIrpSx1Y8dM+pMw==@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:520:a44f:3ddf with SMTP id
 ada2fe7eead31-5d5e224f3f9mr2430732137.10.1760017754092; Thu, 09 Oct 2025
 06:49:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com> <20251001212709.579080-10-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20251001212709.579080-10-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 15:49:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0k0k4EQhQ9C_oPUPno7BsgN3tW3ydLrvzD783SgULyw@mail.gmail.com>
X-Gm-Features: AS18NWBiuLuEjgmzyDSlSzZ5zrYLpzbrdlxBs-yvgfRSKSU9hkobcBub0EljavI
Message-ID: <CAMuHMdV0k0k4EQhQ9C_oPUPno7BsgN3tW3ydLrvzD783SgULyw@mail.gmail.com>
Subject: Re: [PATCH 09/18] clk: renesas: r9a09g047: Add clock and reset
 entries for USB2
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Oct 2025 at 23:28, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add clock and reset entries for USB2.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

I couldn't verify all details, due to the lack of the Additional Manual,
but the rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

