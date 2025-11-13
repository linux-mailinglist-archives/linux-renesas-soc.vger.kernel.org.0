Return-Path: <linux-renesas-soc+bounces-24579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45319C59320
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 18:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C36945409CD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 16:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EC32FD69C;
	Thu, 13 Nov 2025 16:23:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4737342C9E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763050996; cv=none; b=sCVjFNUlazvDJjV6ypzvf3TgfvGPD7ztPDsleAFc5z2rOldTLHdM9hbbcst/SCLoXzNdQcd1xmqvXO3yhst1O/WKoM7dxc6z52uogx32BhJh/NIU94ve0HzNVG3v/NT2Fh87FftnQTlZ0jFd2b0A85DKexvlt9HvDaFB7e+pIj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763050996; c=relaxed/simple;
	bh=tLAT9m5zzv27vIHramdo70fQ6JjFWjWlaXUWQOyCtIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bzkBudoVqupPYIyVQHobht53qbB3vj0xS68iaiNvaD1fMFTxfQrJ1VH7O+ZS8NjWfFre1nk5xcKD8SSzH2PCSqttp470pmB9NgpowVKW9druoVYvchqXavRTcv0eH03cLlWsTeka5Q1fdAkNvvEBszFNXPJmDQIrSGIOxj4Ti54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-559836d04f6so677613e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:23:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763050993; x=1763655793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5xOhgj3KLUbudZf/OSfykos9RtGD8I/iauuwMcQjwE=;
        b=tbV85Y9Z8+Ha6eMLNzo0DnRYZChYQY/9AjZM21xm1ktNlwisMemLgnxPCq8anAUYxq
         M9QnFeOPuvKpmfFAw0D75WgiyVie/d2udma7+iKT84wWb4BM/uVzYxLvQfvAgcx0ERuK
         SRxJX9EaDACrjR8PyvSlpnEpNU4EcStuaueKspoCDKRybeG7xRfiuQEyVh3oJrCKwjb+
         9hcNmNe8ftwWeHtYH2j8Ne5TWy8+c7GdmhJILsAm1ud5gA6zPM64DL4bQAXv4MPEcRkT
         cjQBT/6KIrvjgxkFTlyYbpEyzgGA3igIEgWm176ER6vBtJj+7+usmqKjbwsM4yI1g3Bp
         Cc1A==
X-Forwarded-Encrypted: i=1; AJvYcCVXVBMLZdTXd5YLDZxzm7AhEjurqt1ez3lJIWjXGbPV8Wyp90kAXE8Ml7w+73pwqOb63JYRkPhLCGMBOrZ60Pxyzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx69YWym0fMIUnIyiXCjPdrGTgnKr/AyUoN0AEJrwNWeULJIuY5
	cfW/wzb7XbaSvsX5hVCVP1/WvPfQbeqqSgqfkR4Eo+/Mjfx2SjZRUmNolgE2ZeLNrrw=
X-Gm-Gg: ASbGnctemttga187iE0KmXQ/8SXhfBMTnKi84hm0L0qBHASkwodTzbe8OxaS+KshMvL
	M2+dd21XYL0dcOM1DTwEYucS/+o+lboMXB24kYN7rIpIlzX4ncGW62F0W3zw20IGTEKMKiPpCos
	JRzB4o+FmCq+8gVsn0x7GL/5TmuRiBkhztVQF/dlM0LKfGECRidO8Rkf00c95LkjTuqYv21PjHB
	3OT+6lrSJKlkouJAYhi/y3xQ77OAfGpZFH5R/dPN2G2QLpar6akT1oKQDe1VC3E5NicbURYG7As
	qOECncNkRM/MJ20Vy3FYK70xssCLy+MmN7AjlrWXppwvo/LBnAhVftss2gXO7gq9407TShKvXSF
	J2lOrzRWmh0AuAlBSjeBfbpRwd+h+tsVPkXzmMJ3BHPiXg3Hf53r3KRWU2wefbUgnKxZDiI4q64
	Or9YCou9HQIBdrGKFS+eK71kDdxQvIqWxx317kdw==
X-Google-Smtp-Source: AGHT+IE5OIt1V0k+Z+H/8RlHf4OOaIrXw3oxuVSLp7wLC+BDVWIi7nQUnSyRiOIiVBQjwqAVYmkcuA==
X-Received: by 2002:a05:6122:370d:b0:559:6092:936c with SMTP id 71dfb90a1353d-55b1be0404fmr141884e0c.12.1763050993470;
        Thu, 13 Nov 2025 08:23:13 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f44268fsm813122e0c.15.2025.11.13.08.23.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 08:23:12 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-93518a78d0aso532536241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:23:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2xv2ZN/OBKshiw8J1eO+24FzQhPj+UHLRIqA5AerWD70Qcc4ypUWv3gNQ8Q2kGXSuzjbiTwR1NDKXB/FnrAQVhg==@vger.kernel.org
X-Received: by 2002:a05:6102:a49:b0:5df:b31d:d5ce with SMTP id
 ada2fe7eead31-5dfc567727bmr157516137.28.1763050991936; Thu, 13 Nov 2025
 08:23:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106125256.122133-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251106125256.122133-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 17:23:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVP3xOGa4gj6LRBU1fdGPbihAayGF8xUCCZjJctyR-DOQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnISpr8jjnwV1qnu3HpPH36xFUGAy4ZFaDHn-fPMgUSA8TJ75exCa3iTno
Message-ID: <CAMuHMdVP3xOGa4gj6LRBU1fdGPbihAayGF8xUCCZjJctyR-DOQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: sh: rz-dmac: Fix rz_dmac_terminate_all()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

Thanks for your patch!

On Thu, 6 Nov 2025 at 13:53, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> After audio full duplex testing, playing the recorded file contains a few
> playback frames for the first time. The rz_dmac_terminate_all() does not

... frames from the previous time?

> reset all the hardware descriptors queued previously, leading to the wrong
> descriptor being picked up during the next DMA transfer. Fix this issue by
> resetting all descriptor headers for a channel in rz_dmac_terminate_all()
> as rz_dmac_lmdesc_recycle() points to the proper descriptor header filled
> by the rz_dmac_prepare_descs_for_slave_sg().
>
> Cc: stable@kernel.org
> Fixes: 5000d37042a6 ("dmaengine: sh: Add DMAC driver for RZ/G2L SoC")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

The code change LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

