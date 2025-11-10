Return-Path: <linux-renesas-soc+bounces-24403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A330DC46D5F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 14:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 256063AC628
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B34430C616;
	Mon, 10 Nov 2025 13:18:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E7930F7E8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780727; cv=none; b=JjLMULuhF8SgVyv5CDmRd5AQ5XzBCSMgMUS1mOh4UkJuDGhMXutHcR+OVB3/aKMWbZmVHyQqsBqGOA9mbUFDJufyYzfHVfpe0AiOPSA6WxFK/3btzUTW3zSQIGcUQuasfYexu0NHupOGZQBxhdLYUBU8aHyqxXk4IOOSzFfRBtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780727; c=relaxed/simple;
	bh=KadK8l0y+2kGqkttEVnDkIhHYVAwWa1JA/uwvYjgOO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMU2bZFG7dWgZnIZrpVB5TdcJMYkKZLSNsJFtwu0JSUaQE5LbCt6rKKLNiFzAI4EGNbuTgS0CPxbhpWOugPC//zhT2VHwlx6gOjAqcEJgWU4/DoFV2wm+t9gQWsY7S8pjeQFRRxWhofX0seEZWki111GuDT64k8drzxzcmV0v3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5dbd9c7e468so1438171137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 05:18:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780724; x=1763385524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JtWC2opMXjpjODI3FtXSyNgnLs1SnEjuR36TMHiZyU=;
        b=VBGZuJffSuK+CkJk2fPVZSze0u8Y2nizhysnL2ua5Qab7tqc7OisK6UN0WDffItVcC
         0Gq5//HsIHPNxDH+n0owqnv2KQPygyxS8dBBoIrmTm8w7FmXNdwZ9t9cgiag7juFxSji
         5Y706V174hldx2jsDeEBwUgJPtqMs+e4CSfy7i8SFZhb1G2Dw29auu6sgY+tWZynxcty
         HoUsKCaD+knkc0rCGqJ4enGnwGCBsBwJTZqK26U3wMXtqRzfE7+wSiAifhlngzlDlhpe
         GO6Ylb24R899x1N2AOGLQgcApZmcXYxWDVDWckHWpdSgL0amHajykJmNXDJY/EyZAI3S
         k4rA==
X-Forwarded-Encrypted: i=1; AJvYcCVuTmIlGynreAbTOykh5MC0VWj2WEPMPGVNot8Rfdt4NHs7dbp4Bc85dpJMdSUCcMWSbCmKKyp5MqqLKRScauYd/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSQJR9SjHcc1hbj1D8+abyKWn8tK6qeQqMz9HlhhIkCjTJ8T/E
	kr1Il2Nh7ETGOjmFK3pOoUIC2eAn1TzcBHlqXZegPYoVoMHWl9FTYpTvb7o3kS2T
X-Gm-Gg: ASbGncv014EtE+gaCmASzD6EbiJNTEQ2/oxnzoVfATWEYj9s/reQMoFTZREgstnXlmz
	caXtK0kFgF/Sk+oDvrhdM+OeuaD7kPMYl2GQUmZYVQtiER9Np4/yF1ZNu5kWsCcztpSSUVFMoGK
	V8qFm21BR6sfLHKEBrn9puz+9AnfxVAYJUvdIYXLtwhmzuC5yJyN7HFbPmTxccIpMko0Pdxnjvg
	aLEFLt6slXpu7nW9hoqAirMGcbOBa8d0s2pFnOgfNU7Bj/CUIz5XQ6y7BB0vTYWWzzc0kKrqTSo
	iCWFarLA8RvP1g5eYZWmXu9/yW5/HIl5LekqcBt0fy2VXjtwuDG0zgv/tTFy14FHTTYYuUF7YJs
	cItK6xYvnRRCvMLnbm7Sh/UJIIrKiYal8neOnIwx613JAFf/xxMiffBt+x9lWasoKMZtqoBNLmm
	NbKyGoO0N6jhV3MCfXrZEBTTrIx+/svS7ASamdJA==
X-Google-Smtp-Source: AGHT+IEg8zqT0mokXoaIGDlrjHftMm3x2aPIQgxtbC+KHT6dId2LQLwczAmGgbgG3miwqw6nBWp4dw==
X-Received: by 2002:a05:6102:3a14:b0:5db:ccd1:9f7f with SMTP id ada2fe7eead31-5ddc484b863mr2084310137.40.1762780723996;
        Mon, 10 Nov 2025 05:18:43 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93725285d26sm2999080241.7.2025.11.10.05.18.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:18:43 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5dbd150efe8so1256208137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 05:18:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCRgECLzHjczf3ylzFkc1v+2ar8gxtr34WeRtPzv926ycxX5nW+A/orjXRz449IJFS9eh2Wj9n7Yp4n2DbzPHxww==@vger.kernel.org
X-Received: by 2002:a05:6102:3a0a:b0:5d7:de08:dcd6 with SMTP id
 ada2fe7eead31-5ddc467ebf4mr2259170137.2.1762780723317; Mon, 10 Nov 2025
 05:18:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251028165127.991351-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251028165127.991351-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 14:18:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUAqP7zdeGfvR_WaLDhvnDCR3WqNy_+qkh66=X7D7NTaA@mail.gmail.com>
X-Gm-Features: AWmQ_bnxVvrR1Phxc4_ghxbxu9QxxlwIdRwsEpstOMyyybXbOekzQi-mkOZ-Pbk
Message-ID: <CAMuHMdUAqP7zdeGfvR_WaLDhvnDCR3WqNy_+qkh66=X7D7NTaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: renesas: r9a09g077: Remove stray blank line
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Oct 2025 at 17:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove an unnecessary blank line at the end of
> r9a09g077_cpg_div_clk_register() to tidy up the code.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

