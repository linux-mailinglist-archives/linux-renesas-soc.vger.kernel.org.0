Return-Path: <linux-renesas-soc+bounces-19967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBFAB1A2CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 15:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E9053A5ADF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 13:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DA32620E4;
	Mon,  4 Aug 2025 13:05:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA61236430;
	Mon,  4 Aug 2025 13:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754312739; cv=none; b=shG3vgPalfRY+dWEvSbbUrNgC4XeE+LDgDnqISDA/xVyMh+Dp5Bsug+I8uM1pRHwdSd9jncPwudleTkxiTUFmQyXizu7fzabePFNPyrkBl5ssx2FwbhuuK4iubITF2S5FwXYLfji2KozqS7HsMDzclZpWP345kxkbAjAMq61nDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754312739; c=relaxed/simple;
	bh=0P5M1kx65QaAhhe2nssk8eLJHgDw/J88Uq8PW5qMvs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDVusXC38UShW4dTuJ+xM7UcsX1XXJYiUiJiCgs3cXj60BDjxQyKck8DK3XpQaRDSEwzIRNnfkzdcVT4E5VSm3byS8V6ciODNDelqEMpa7I9r5Ndmugui40h8r9+0srzZNj2yvfamxD77zFOQiukT53tJJRKwnEF4JxtT1U8M60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2ebb468cbb4so2133351fac.2;
        Mon, 04 Aug 2025 06:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754312737; x=1754917537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7H2c83Dm5/3RiEg910uXwR0uEp2bBIYRUb95k5GL1u4=;
        b=AoT7eAKThRbQfTBBVKDfVpHRCbr+G3bcTu2eugUxTN9TSIBI0VRONl90gjNdkGCFRH
         XsffJUQLRachYh8A6lVqK1wLmTkxC8bJMuJHEw0iSwbxGMuS1cPm+JD7aBCNXcXkQddC
         HCwB1xHIHfQGv+6/VLe2B6kG88HnItchFUnAHWldeLRVvK1inq9iN48p6jl6zXmTT0QK
         s6UOtCkqg2jzrJZCAOY8PLuytyk8+DDBu5yS/UBNbH7X6HOiy4JdNCrY0Ia8xGTL4tvt
         rMuVT8Yt8E9HjIKTu6GOwedcOCLsyzdJuxAF/ppS60NeKipzCUH+C43dn9KncMFlsbIY
         2amw==
X-Forwarded-Encrypted: i=1; AJvYcCU81oS/nFt6bvfx/TVC1zj+mjI4vj+BL3B+h6Aso/n2JlqJ+mGR8gui/niS9CkhlL01pFiiJhMy4n25Aafl@vger.kernel.org, AJvYcCUgeTN3WYPOV+6cQUEQT/7ZdqkglDWOSYrqIx0StC6U4ZmWoejh2r/KrTXlZz6UhIPwWN4IaKxWVSe2@vger.kernel.org, AJvYcCVYX13U9QwmSW52Q0/ntuKGtVSHtFfjqWmpuhhuEXUHNhRRJKB3g9QQxOPF2IxhBFtNg251QpV0XtYCJoZL5qGY+Ks=@vger.kernel.org, AJvYcCX2Dovk0sTXS2mGdqOgIwBrgEPXk08lvLCZK19z6LsakGFJ6Ce9Np0w2U/KfDM0GJYjCj3yAEDrQwvy@vger.kernel.org
X-Gm-Message-State: AOJu0YxUd7G3WOuRb+n3dR6S9iSk15ekjHK8do9N8tw9LVXNOgjKc4O9
	pncYhMoPrJhYqNGaifuIXjJhjO0SIsBThwqQokRaw/ykLpyFfldIdtKJgjUk2Y1n
X-Gm-Gg: ASbGncstlBBXjWq6uNP/lapZDNJym3JqVm1FUWfg/fytU9T9nR29JDaW5z+6bLEfCdp
	wahCKJsKr5pofq6yXzEmpqMRCBVlp5jLoZ1O1rXjksPrbW083DcJBM2AiTJ1ugZI32nj5UPW/uP
	I7QtBybaMPe61FJZrgrasMIu6bOv4y0LdPqLEXatuidsoYUVgSHIKfFRp15hvBap1ydkB5Ws5Zr
	Z27I5oB7kAPHQaoiG4rJwF2TzT/umWONqpGIJh3P3PXsEfrrCF/o5R9+/BKuLwe4UdWpkVSx63l
	ync6ESNMdwtE7I96hLxG6CWwzeEsq4jQUMGTM5pbHsdk6patNjs4WOZ0axRcdmaCtLmZuOtW8dj
	0nSHviWeIXjdtVpRpsZNr4euQVsKdaq5L99r9GGt/jjw8A/cdKDp4kvrTqCbF
X-Google-Smtp-Source: AGHT+IFM3sJzcM+7CHQjK5sWn0UXGNT5nb8OWoULRn9S8xA7r2VBlaE0vYAfnTxZbwouHPLt+u+9ig==
X-Received: by 2002:a05:6870:b209:b0:2d5:4d2d:9525 with SMTP id 586e51a60fabf-30b675d8e0dmr4836914fac.8.1754312736936;
        Mon, 04 Aug 2025 06:05:36 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-307a7172ac6sm2702697fac.9.2025.08.04.06.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 06:05:36 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-73e88bc38bbso1690601a34.3;
        Mon, 04 Aug 2025 06:05:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOcJhNXDRt8rmYpReGlamQBH5I3NwTKeV4h6Kv2h50sUtZ7DCjxr/U2KggJ5BAZaqf6p+EOQ6Qg58tbF2w@vger.kernel.org, AJvYcCW8nA7/a6pnkgIrueYFzO89+t8aaHEzJZUwmcaenAq8k6hH6xyGJiUT2r338VuuJA3EtNOVB5S/BhXG@vger.kernel.org, AJvYcCWJ7k1XbsS9OLQ2D7SlUe6c7cO6qlehH8t6SM0YgIFqCkd/JPbXqwaddLrQqoAXFc5QpQympt+Q++28H9T8dKcV8iE=@vger.kernel.org, AJvYcCXYOb2qxRv4X8wh3AivU0Kv5oQ2UFujjBBhnGaqAGx1yfTLFAUspmZd86gtmfSlFu/GaQqNYjworekM@vger.kernel.org
X-Received: by 2002:a05:6830:2692:b0:741:9fb1:ad52 with SMTP id
 46e09a7af769-7419fb1ae36mr5433566a34.5.1754312735742; Mon, 04 Aug 2025
 06:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801084825.471011-1-tommaso.merciai.xr@bp.renesas.com> <20250801084825.471011-4-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250801084825.471011-4-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Aug 2025 15:05:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUu5byJYcBq94ZHJCgXUy5CdeSxWsg9B2TB8XqeuNRKzg@mail.gmail.com>
X-Gm-Features: Ac12FXzcbuyUbr2GhiCjz7Maf7fXxNgTpABFQdFEFxNlmMVWz3WSOHEZhuRDlNA
Message-ID: <CAMuHMdUu5byJYcBq94ZHJCgXUy5CdeSxWsg9B2TB8XqeuNRKzg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g047: Add DMAC nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Aug 2025 at 10:49, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add nodes for the DMAC IPs found on the Renesas RZ/G3E SoC.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

