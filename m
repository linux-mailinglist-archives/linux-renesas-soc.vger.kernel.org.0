Return-Path: <linux-renesas-soc+bounces-23584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC765C059E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 12:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 861F61B818AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 10:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387233101AB;
	Fri, 24 Oct 2025 10:38:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807D6146585
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302327; cv=none; b=lMc80p0ny28IamI1J8bpqgWN5gHK4e5Mzhg4TAumizOUD2bL7p7DC6Xt+zt16paxaSOYWS//447BOTYhRjt1/BSxCU2WrVNRdBVgRCqmA0ae4PGQI5MghPNI1mENKCOGjCT2hogb9pNXzWPHVnM/S5Ozo5QsH+dD/vdCpGvB5iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302327; c=relaxed/simple;
	bh=4aqMM2V2h8+Ukj51rclziCzvwPpszThxOiAHjq+32ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CoJKOG874aOIn5871xygvUFPerOdmFE53/RvOSBZyBXJSh8/ggE/CrYfn5ZSBkj3KY9bXSP4diqv32fr9r8i1TspWq2aYdW/hU1sjicPkjox5U7WFdbsTNvmy+4glOon2VtpoHcP09jr5n9hOizoaGn0McjyoiI+mwJG9Fy862g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-932ea034862so1475802241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 03:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761302324; x=1761907124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORay2JAYaT3uXyXxpnw7CEar8/xMIWtpecxnO8T0h9I=;
        b=kuNCLUMA/gWKvC+UOTbFM/S/PGQiLpF0bkrT5OXUUtutRC1cEhUxkvTQoWtso/ogbU
         5oZTxgTDIjT8dEgzHJqFyAJMBJ1RlDNKstsCNa9Bbl9jejTRW5ETMrDvKDmcdAie8Y49
         6GOVObr8nn0MJ0Y3M5+jB0qy5fsxQ6/mXMy4XhS8JChbh7gkYeDGhAh4TIoHHZl8FSY+
         PqPQanjJO6KFE49fTlsQ4Qm+e22z2p6M514eCCepcMOb5ZxEQVsmIDk0audYCP3ANbts
         Yzd7Y7rIjLEXFF5Xlg4tJUMDNO87fsA0Zs2ChofeZqyH3kNk5IRWn8OvG+3Ky7QrBiat
         yGWA==
X-Forwarded-Encrypted: i=1; AJvYcCXVaBaBVdzorFkweVjVUY5iNV5K9myTjJMdoiYEpEXCG8PEa7IQ+YTEyFTHNhkp/mQ3JYa6SebldfeDEcH3UT4Log==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/U0pA9YGD+SSroYGBhwbNy1YdWckEkVWtvcdAawrSvA5l5gyR
	99YNcll9CDacl78fFnizXy87nKprSkABZTJRaSu43CI//NBqDrICa3wVc49cuw1a
X-Gm-Gg: ASbGncsqYSwXYoUGxfyaY25bcAmGVTXI13bjo3o17GhDvlkqCwLWE6EIBJdNmC/ab8Z
	iefFUygu49uUTohmiwD+66LdReT02zU6vUx2xZN0JLLFovBZUZrvVWaWkRNSsWswTb5U6X9ua6H
	WdKmppWx9Vr/UTlv1MH9cD9xn5fkhzAskmZ7S844d3PNuF2bt9hJWRJ12lEs3cOa/Uu7TNRDpU1
	zafU7+5ofFDM4WVpUzYaVHOBvGXhuAN+rG3wapSIpagSNx7sPfjpLHmvCCYxPwf/YqyqUHvgtc+
	afEAEXTD2qiPajF+i8WoLnm46DfuWoEnoFyghkZGdVM764zYZ5AK+75RQEr2DO0fINvtAm2F78K
	+Rn+xMSQEZd0QQpkqxguMP6YYcaJ0RkvpxpUdTjFTZX8pCaATpBzLojRNhU5XPEZ2Zr5KTP+0sS
	/+XAWCVzQcb1RYb/RH2NCzU7H8P2g01hOE2UXBIxFIfeBIuOB3
X-Google-Smtp-Source: AGHT+IF3m4HHgRA8q4z+OAWfUuerWYjwge4b4hFWmGhXH1bHVXQEYtDstkk1Yy9j8HfmaOqpcpu7KA==
X-Received: by 2002:a05:6102:2ad4:b0:5d6:1011:42a4 with SMTP id ada2fe7eead31-5d7dd6a4469mr9801771137.27.1761302324226;
        Fri, 24 Oct 2025 03:38:44 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db2c7c93b7sm1945287137.4.2025.10.24.03.38.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 03:38:43 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5db308cddf0so1902069137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 03:38:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzIYKDu6W3ag9YDSNGKTt6668o16iUyw96+ogNe91lB6mi6ZwpKnmdbAE/w+LX53yKN5sJPdli6IxG9ujtFejuNQ==@vger.kernel.org
X-Received: by 2002:a05:6102:dcb:b0:5d5:ff4a:87fa with SMTP id
 ada2fe7eead31-5d7dd6f5c1fmr8926294137.43.1761302323213; Fri, 24 Oct 2025
 03:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023210724.666476-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251023210724.666476-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251023210724.666476-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 12:38:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+XsMz42cmSK5tu6DhZV-5ZqJCa1c9u0-YxgMe3V_5=w@mail.gmail.com>
X-Gm-Features: AS18NWDY2yKje__-I7uH-MFrHGUKvE7lNUPe_6x8wQC7kjvQj6AdehD9vn5JPrs
Message-ID: <CAMuHMdV+XsMz42cmSK5tu6DhZV-5ZqJCa1c9u0-YxgMe3V_5=w@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r9a09g056: Add support for PLLVDO, CRU
 clocks, and resets
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 23:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for the PLLVDO clock and its related CRU clocks and reset
> entries in the R9A09G056 CPG driver. Introduce `CLK_PLLVDO` and associated
> clocks like `CLK_PLLVDO_CRU0` and `CLK_PLLVDO_CRU1`, along with their
> corresponding dividers.
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

