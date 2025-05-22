Return-Path: <linux-renesas-soc+bounces-17348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D1EAC07B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A1017A6C73
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 08:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413E82820C4;
	Thu, 22 May 2025 08:50:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA89224E4BD;
	Thu, 22 May 2025 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903825; cv=none; b=paMBF7eegCjwl7Jrlb+MGz6rNOdk6dYzcpObI+NmcDWY7FWJ1j8aPgXZqvae64s/Srry4A0q15XWbh94kHBQIw0EgdIrI8/BeYytA+CnWCsn8+sIECxMPy7yyKy4AqLtFee1U6/FDu9fwKBB19R7hbyo+dcBfDxyYm7ljhhFtck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903825; c=relaxed/simple;
	bh=2FAg5CcuXpn81swT45IWRIIJPiP5hpvq0AL/Onxcpjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7ealIAPcZ7wSAjq4XuzboER4VLrudhU/GeYG722iOx+u6GfzJPtl1pnDKagj/44Plopr6XsN7TX3pzA6HQ2mu6jfQplGOqkYBGL7mm70BgN7wRO/UDCPeKiH1Se52SzA7ntxM6WIHEXOjKCY43N20kho7f1epgSNBIRscn/TKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87bf1348838so1391892241.2;
        Thu, 22 May 2025 01:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903822; x=1748508622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=He+p5Y1sj2L8PIZ5na/CcjmmOWZnbR9CW6znPxgAlCc=;
        b=KNhdgDEgRuH1zQ/x8rq7vKvlgE1eNdhJkitGk3JWjTopTjQUOdO8jMTtPW9gCx+2Yq
         VbJYTcJhCby8AaJj/A+116hgtvMknNa1ayMEY4bnFZgi1upPPQjEdLq1MZFAbpt346+l
         rqmuI0OvZhQynTkeQXqafT6Fm4pxkfJnHTa+s09Hwss5eaaf9pBv7Efq6HbdnF0QD5zJ
         xd9fTw04b/3uaiaMG16Sn+yr6ZPzPXdS2RYotcCZpvT1+4S+lmOLWGiFBEobalJTNsQE
         mG18WQVxVtU3biLvHFJ5kqEvsRaIIHyrNtQINFBQLAlnLb2NK+dY3cZctmpG5qhMhzhQ
         tgOw==
X-Forwarded-Encrypted: i=1; AJvYcCUfWxeEXphFeqJmqIurgWfqwyPnyDpC8gwLogk79DyhUQGefpRzL8/IqGMhjx0/GSO12mic8ueQj8WsyOe7@vger.kernel.org, AJvYcCWucTp/gfcd4W77qevbXSBsAdkBtVm4/go9C088hVXyySTyq1n55ilFTRoE3wbSW2wEnx3AdVjLft7BaOcbpwz8N6Q=@vger.kernel.org, AJvYcCXB0zNrXp3H8Scj9SyUQ+Vh73ul6kyCLAhSzYp2JWqaNFscrZ0N+2PHrfADcM7dKZA0leiFrikaO2I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3v/yKl67+YZselwq4oiOOcYq3nwI53rsZpDA1xNeg51uQZKb7
	rGYWA/mH1JxFenntePoME47uT1oUGXwmI0ZkDzVCix7bvNkNjwVF+qxORTd1Yyoz
X-Gm-Gg: ASbGncuapMbBKjXYcW1plcjUArR5Y+f8ZLx+LZoUz/GCFZBkDAGLVSbhV0iD+gTIOqe
	auimmPqynKvL24POxe4NUz3kJs1Ucb3GbKLFvEGmrOFbcC2BCPZoS4RpGC7v5/lchsXcJ1N+bqM
	kp+c3po3YrZbK+RRdaxGdeCGNWPZfIL+46Qq3rRjRE6HnGLMJae+Xi3buCK9Q8ltIXPt9jK3261
	3PUTh8P79uroumt8j4ybqyP+cCp73PsXhdZ6OejUldUfJcYiSL4QBoynNdrVW0n3SMRYuS1hHHY
	cQ2u/bwQhhEAzt+nGAtyYUJtQNUlYQZFpRMPsM5o+qYNaMYVnTEqI7XbEu+4Jy11uNPKc//PBzw
	zBwSUeY81BDgfIw==
X-Google-Smtp-Source: AGHT+IFzujuvVDUmOnufTWJ67zIAKPavpSXOd0VSNs9/IQFf6SXoxC859jXy6KH1TblVIMtl8Xx4+g==
X-Received: by 2002:a05:6102:3f0b:b0:4e2:b723:2b12 with SMTP id ada2fe7eead31-4e2b7232f72mr7990936137.9.1747903821831;
        Thu, 22 May 2025 01:50:21 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec10c9f0sm10079121241.1.2025.05.22.01.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 01:50:21 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87bf1348838so1391876241.2;
        Thu, 22 May 2025 01:50:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMhYapPao1W+os9woudt0dcpEmI09z9Ioq7h1AOgCFGw1h78ezLqAToY/DUDHhAPYtfiaWI7TH/Mk=@vger.kernel.org, AJvYcCUb7oLEM+CQfF6CwYiudK1++62+mJkbwCfG6DoqXjzq3J4zU6oc7Np7QA02ZuhpmLEGxTfyt96PV2R3IATE@vger.kernel.org, AJvYcCUe/fTaY0Nss5Hjp4SaBwaMfZHmqNLKP3tpBDrpSPYM1Q/lVoq13TmitVL+/N+HYZNvz3zvjFW/wwu1LZ2CHU6YDHw=@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:4e2:a132:c50c with SMTP id
 ada2fe7eead31-4e2a132c627mr12216780137.2.1747903820791; Thu, 22 May 2025
 01:50:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513154635.273664-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250513154635.273664-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250513154635.273664-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 10:50:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBRWxTNdCWpOHz=2rh4iJoFPJiD7zvPc4mdedFQbx29g@mail.gmail.com>
X-Gm-Features: AX0GCFvBuxwa5x21UhxqQwFoSRSrK2Nv-JBkR-46pPBrwoCVne2-kJhK0qgEiJg
Message-ID: <CAMuHMdXBRWxTNdCWpOHz=2rh4iJoFPJiD7zvPc4mdedFQbx29g@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: renesas: r9a09g056: Add clock and reset entries
 for RIIC controllers
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
> Add module clock and reset definitions for RIIC controllers 0-8, which
> are available on the RZ/V2N (R9A09G056) SoC.
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

