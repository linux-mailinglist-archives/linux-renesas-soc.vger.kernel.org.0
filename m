Return-Path: <linux-renesas-soc+bounces-24405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAC8C46DF2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 14:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 376D23B8AA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071F43101BB;
	Mon, 10 Nov 2025 13:23:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3182F303C9A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762781024; cv=none; b=ZD2VEX8Slv2vKFFCp6UkoRwhG6SOa+pqQNUt/OKK43Y4vKicw/EN6Mx1s5VEZWvuqCx79f+jRnSY5eJTD0BSmp5AvHACEE0a2yGR7mQ5kIoH6BqihiTNazA186wAzmjre5+v7lwN6pGsu8iVeGXBv5RzKC8h9EcN0Dd8eV6vU4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762781024; c=relaxed/simple;
	bh=vDBZRrptiL8B1JchW6TdyIwfOCu0iFp0Ce/dGtkhJC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hyAyyT05O7kyPBHyEWjpEexhqg1ZOPLa/n8gGttxdZ5XYid8MVd1D7PdJU+/9ts5TMR0g97xE48GUgKRocRILOxpPNxS+MrNbbm8Fh93bSqeldqaC0E9sIw6040nriYiR2q9gPR5UGqvtdUo5cRkpXEJjzItpkkDAln4N/IawYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4edb166b4e3so12112801cf.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 05:23:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762781022; x=1763385822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJ0ifGUcnHr6Kd16YmJsShuaDbT8XpGIPU3sUDQV+ek=;
        b=mWP6Az1SbcX2fFiiRib6nHW9JUvBdXGvgSKo6qkDoNo8pqDVzUeKkrFsbocjgJQ9aA
         99i1kEkWcEAduYyqPaxReAT7/85Rgsis3CnNKqa3amA5OssAcZQvHVyqTVpfE/pl/idP
         AtafHV4KeGQmOO9q3AEiyUNK2kfIp52Ce12nR5v5GNfgwr3lMedz6ie+iHpMjyyLpgNq
         K7f3JszmHmcXULiU5fXwH8sa779qy4Dyab4NkTk7t1/PBBqZXUJ4vlEZqARUFNLP97EK
         A4S2VIgdNRsX7v42FhZqk4kapZRLukhxzAOIvB6dS9riIHFlbCK3FS1fkuJO1QNseUxb
         ctAw==
X-Forwarded-Encrypted: i=1; AJvYcCXg9UU/x1+7PIbhnmTBqmrnk0QtHsF1MGk7yCUHuerS54gacGQPTMvQ6QsdGwAUOq9C8im2L11v/zXm+nrIJm5mMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqNXwMTTkj7i0JFaNe9xECVU/n9cxMw9RQv+uBHH1BH6ZZ92Ta
	WKoVnc5o4ye8d/3BgJe745IWp4fUTm/rdw0efwlSyMFaQA2iClCojChFFUG6Wgk8
X-Gm-Gg: ASbGncv2jWIcNbsPfjxqYr9FQ/n+TzLeHCRtEh0KZCm3OyOS8bA8JKTj7CruGwUP0p5
	uVPk5zhGuiNPOZ+c9ONQB8GRJz1Rccq0p6fmr5UdyPoa8k7kIkICeKSrWc06jfe1GYpFQskcItQ
	PJQfkCIiwQIOuJyrvnpkvFH3DPOU1V67NTxW93mIf7k/MVS5s1TawyFp2DKF9RbkSet7WVeUXKb
	T+UH2vSIwt6qxmBQ7mPjadq0ySH9sCevzjxfE02C417IGhFXdZar23bNfA+3zgOroyQ4eyytlmm
	tyR5NlzstgNRRrtaI0tQjrmmymn3A21pxeAU1tGyMjy9/s0MNwYfloi4ShYfomplt0TUk/jOZIY
	OB48bQAzfzIPryUx55cHVUCmoXUicF4j4ijyz+hBaKzdJ/U4jmEhkwwwTup5rejmwtGCRPR7/5F
	pxYhGZsFaKoVv8Vui1zAKjjbek1S2WuB/LXMwOag==
X-Google-Smtp-Source: AGHT+IGNT5oiGXJaEfNLxQCPR0kfhoBzknGpHVuiRPBoUTp+w+gsUvkJ80f/Zox6FxtAewPutitWCg==
X-Received: by 2002:ac8:5846:0:b0:4e8:a9a0:48fa with SMTP id d75a77b69052e-4eda4ec8f76mr105164891cf.30.1762781021633;
        Mon, 10 Nov 2025 05:23:41 -0800 (PST)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eda578532csm47330261cf.19.2025.11.10.05.23.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:23:41 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88246676008so16265246d6.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 05:23:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEyFOK60TI283s5bBF0VAetCZo1QiCppnT0sBZIAsGig94QxlK+zc4imrpsHjcXtEEgBDfb+gDrCQtNJnYJzEcTA==@vger.kernel.org
X-Received: by 2002:a05:6102:5492:b0:5d5:f6ae:38ef with SMTP id
 ada2fe7eead31-5ddc481b944mr2851696137.38.1762780697780; Mon, 10 Nov 2025
 05:18:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251028165127.991351-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251028165127.991351-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 14:18:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVAyN-XQVoBNncCC5Jka4TMqSeswe8frht9sPOEJB+VLw@mail.gmail.com>
X-Gm-Features: AWmQ_blg0wBfBRVHEE39XqXvRiX15hbIbJMqYeX6Rvu1lD8v_t2OD6KHWJX8VBE
Message-ID: <CAMuHMdVAyN-XQVoBNncCC5Jka4TMqSeswe8frht9sPOEJB+VLw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] clk: renesas: r9a09g077: Propagate rate changes to
 parent clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Oct 2025 at 17:51, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the CLK_SET_RATE_PARENT flag to divider clock registration so that rate
> changes can propagate to parent clocks when needed. This allows the CPG
> divider clocks to request rate adjustments from their parent, ensuring
> correct frequency scaling and improved flexibility in clock rate selection.
>
> Fixes: 065fe720eec6e ("clk: renesas: Add support for R9A09G077 SoC")
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

