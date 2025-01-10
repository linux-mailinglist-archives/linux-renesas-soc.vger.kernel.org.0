Return-Path: <linux-renesas-soc+bounces-12033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A36CFA08DD3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 11:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4B6A3A60FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 10:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E625420ADCE;
	Fri, 10 Jan 2025 10:25:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9DE2080CB;
	Fri, 10 Jan 2025 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736504724; cv=none; b=lawYaqkhGMm96W50c+wCISXnlQ/BONPPsDms9giqXHZyE+3WJprAopFF4ep9rSksjNIPW2HasQMEt2OUL95X4mQgfsSd8dHmTochz8YBVytt21+c1SFXvbk42KYY3baAwj2vb82VF3BWv2ahPtYJz9kJkgZcxuxrU0GJ2TNKRJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736504724; c=relaxed/simple;
	bh=MAE90AgN96OG+OrVqThdc7SBmeXx4ufM0TFjeGoZOLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdJTSs2o/fI/IIYEO8v8WSAU+51Qb1YW3YyeIHGWtl/zh+j5bGK+c5ELAegbGO3cyDEeX8NWG3oxC9RYly39kz0bC0WwcVM/kZMg4HrClL75f4lxNEL+Re5lOPARpIZtclub8TBNF5f+tssx0KXNGnpA0Iodt/u42wS1THI3yvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4b1279ca1d2so613117137.3;
        Fri, 10 Jan 2025 02:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736504721; x=1737109521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bW5+BOvTWBCKEEz3k+9KBveEEoiP3G0OCuycj5JkLcA=;
        b=iTieraRHM9ww2HWb6Ac2aiZN3nPWi1gSf8l0HFoB0eIMziTd6fbGfBuSdCXRmK/WEn
         wQlHrVu5hMJhqxsgD0+f1vxPNlZWlcjnhyShRDjJBo5ZlVbNMtqUZq+z5MFQGwiY24by
         8McIvhj2dv1Tmoy3S/DRAvj0GIx3MXOPXZ2V4GjgYxLyrSU1W7I8NF34Gz67UuTxFwHF
         K5liet+xu5u97x7kxr1+KYVXyASP8pmvesbmZJ9ZHuTafZ07K5IRhkEEZRD17VNOovkJ
         IitY3XyL7C4qpGWb4VIz2KJG3kH7cD1VE03P84rMS4gRrFpJKluNid8ud3vXMVuojGbN
         2MHg==
X-Forwarded-Encrypted: i=1; AJvYcCU6gRW+GE2n9+bCZAz4khXOjTMJPeZeV51Tvlm31BDnqW6b9VlsadugRu7JXvCAYt6XCBNVJ66I74RtfhSW@vger.kernel.org, AJvYcCW4SczeMVQwqERpavftkgVCC+0os43W99fnKTmI9QnvenEoCM5iiFUaYhmolcSFF9fU+7ASszUWm3s=@vger.kernel.org, AJvYcCWQft3+r4H+zq8K5/rlVhNf9qrOn2xFjXrX1d4V5+V/KqL8nfTbaKRfDtd0gNfoQyUdmzxiIOxXz8VGJa3fvdu26QQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXNGxU7z9Z7BJC2fEgum0k08eDW2RW8xYXDra9Y/4VCeAIOxM8
	gLQEefCcWH7SmMjXj3P9pZaWzZigWqbcGesWCNsR9QPmg7SvLxa2URY9mmEY
X-Gm-Gg: ASbGncsJ6fW3HhoJE3ZzZpAzdgZ/xyZGDb3LPmsiTlQFX8uZErc2HJgV+Qe7ppg1hC7
	oI69mWHMh38NFpeqcNXMja2I6L9GA6g0zEKoDyj3tA4O5MWZLlDcBd9jxpYceNTM0BWGziN8a71
	K8yspl3jxObVsMwXP/AE3rwb3nFswkqiU2gs2Sig/XrJhvAiUuzbhSit6kWBTBxxaLm3yeZ6Br+
	Axc0iUUwidE33XOjnZlD8aHqO8VRQqScoV0IScF/L6JqJveyjswYqpNay0WdIFBgM8Uu080U3hE
	03YXgi8N/pBRfNaHgjRKnsQ=
X-Google-Smtp-Source: AGHT+IGZoQhNBRL1XI5LWFy+FBVGupCkm0u2dOAFYh7MoLUHDSrisNcTqWqINtHzOtANhN7kgOSN+g==
X-Received: by 2002:a05:6102:3ca0:b0:4b2:5c4b:5186 with SMTP id ada2fe7eead31-4b3d0fe692emr9847001137.23.1736504720697;
        Fri, 10 Jan 2025 02:25:20 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b608f44f53sm2199682137.8.2025.01.10.02.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 02:25:20 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5187aa2c97dso705995e0c.2;
        Fri, 10 Jan 2025 02:25:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1HPjDsh8eiiiBuvV6WlWyA9fASWRv0BccdU5xIdKKfuXec14ZypZAyMIemPJMy4j5TVk7sL1IHmwqla+oA2OD10E=@vger.kernel.org, AJvYcCWTrUwCL3hB9NLVuwOx5vLH3ebMjsFnWk1YnKYQAPrUD+LoNCVPagnvj/3rljqlPQ8g2MskgxdEXkI=@vger.kernel.org, AJvYcCXRGhNq6bnl8sM7qijNdayxxEJtcuXod0DpTkJwuXifKsm60wd3AK11dQ9Qhhm1tGMBZC3AEKKhU45/z08q@vger.kernel.org
X-Received: by 2002:a05:6122:2a50:b0:51b:10a0:331c with SMTP id
 71dfb90a1353d-51c6c3a149cmr9253652e0c.5.1736504719358; Fri, 10 Jan 2025
 02:25:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216210201.239855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241216210201.239855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jan 2025 11:25:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9=XTBoAaZhfL86wgyetUDkqfivM9TVspV6Bo_H0vkwQ@mail.gmail.com>
X-Gm-Features: AbW1kvY-GoBm1gGafdYetNMAIPF74n1tWkOQCx-ig5oUc7MWXDCSiIyKdwcYGaU
Message-ID: <CAMuHMdW9=XTBoAaZhfL86wgyetUDkqfivM9TVspV6Bo_H0vkwQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l-cpg: Refactor Runtime PM clock validation
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 10:02=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Refactor rzg2l_cpg_attach_dev to delegate clock validation for Runtime PM
> to the updated rzg2l_cpg_is_pm_clk function. Ensure validation of clocks
> associated with the power domain while excluding external and core clocks=
.
> Prevent incorrect Runtime PM management for clocks outside the domain's
> scope.
>
> Update rzg2l_cpg_is_pm_clk to operate on a per-power-domain basis. Verify
> clkspec.np against the domain's device node, check argument validity, and
> validate clock type (CPG_MOD). Use the no_pm_mod_clks array to exclude
> specific clocks from PM management.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

