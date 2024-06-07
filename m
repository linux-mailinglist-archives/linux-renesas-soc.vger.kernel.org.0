Return-Path: <linux-renesas-soc+bounces-5940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A2B8FFC69
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 08:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 655DD1C26DA5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 06:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B00153565;
	Fri,  7 Jun 2024 06:46:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6EA4204E;
	Fri,  7 Jun 2024 06:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717742795; cv=none; b=NWzHVT2eMYFpyuqGHmkt5ThRvNOyd0e7wwF9pRPv8OkpueSmprduO9Qtv7SWxfULET/SF/rJCnlXgxPDDqmM8S/Zn14Cl6WkKIQp20iUehTc4eNJrkEgtmkuq/xtXVQ7q89/32Zdlz85MIa1P0NUfl4O98GaUUmpoyA8qXO6NHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717742795; c=relaxed/simple;
	bh=m+AxGavw6qf3DguFuG/0KLvq43YRxheits2J8pXupWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSKPtWF1JcPsutZBtXEg/N0HjmLlzVenPhxmbYDnRmrpYYcS9zDBF+Nsxd6tZuyB74DmefAQrad7ZzfzHyVS5scYyTUnXRK03iDfuxLp35CKjUZj3bla4gP1pCTEUxXa23RgZgRNLoSswR4x2/5T4h2ivdVVL0o2i7VLtw/uX5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfa79233c48so1788432276.1;
        Thu, 06 Jun 2024 23:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717742792; x=1718347592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+CEEs7bAPn2yXK6wMOvbkOCpzTOjIzYTwlHnAovymsg=;
        b=IZ9Iha8zabD9J0fAkR39371SpQPqrBY8GbDgINVIYDae0b4EW5jus8KFBzunf9W41x
         nfNHDfda0XMko5/OhqoRiFR+LF+Y9YIq9Xu2v5Lx51ApBVMO5MmsUZ1n6pafYVkuddVY
         RdZ5gR7wp1A3GTKuNvG0zBSTqMokg4gPxQh71q49HEzjKWKdpV1+/esShwkvMk8/ZswE
         GtTULrk7bTawE/0gHP2Bd0ksaNS4bgxiSgEjyn9OwzPBNShuWpBOb10RKXxMiIilrxqr
         0dSfoFPevRLJD/JCJZs3X5yyYWK+B46uij0yJubk3tJu3B75tmZEmPWyLJejkoRhWiSj
         oMIg==
X-Forwarded-Encrypted: i=1; AJvYcCWkAOaWo0PsWKZpm6mIXjfQAgdaZLndYwN5ztUitar9sxvcdhTK+MD12bYG/C+JBZmud1UVk8MKct7azX0ekB1WTwgK56vIeIZrJhz4WRu1dIG4/wUIYkt8c4qIPrq5BdnidYrO44XR7AzqIsVXfGEANJVf62/25LV+xQF+WcEqmRO3Mv07nYrmXudxeuT3hy9bn/+wqHuGnLwWsWvcCl58unwdUNmd
X-Gm-Message-State: AOJu0YxR5+ByR/yyeg6P5a75GDCJhFHCU5qFyIowZbK7+YQKnqyk1ZRB
	4NyhNS929ybOMUuq54hXb7Pj+JG/8qI+pUp2YP3j5SCCQEhYBfb6WoNByHtF
X-Google-Smtp-Source: AGHT+IFRk5bGOhHUw/P/axkd+o0QA7Z1k5Y9iiuR6koLpSxSbl3Osc8QH6yYbfcEtNr2QD92ropFag==
X-Received: by 2002:a25:aba3:0:b0:df4:dcb6:75bd with SMTP id 3f1490d57ef6-dfaf64e7195mr1591044276.9.1717742791765;
        Thu, 06 Jun 2024 23:46:31 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfae53027b5sm566333276.38.2024.06.06.23.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 23:46:31 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dfa629b4e0eso1815616276.2;
        Thu, 06 Jun 2024 23:46:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLzNd8tRyJVPmpCojnT6swHRngbMa1Pve6rqaCNEGcH2ze07CkTBfQP0T4JKgUW3y2odH6C09mhU9fKesb0i71/hv4J+C21qaQZNImXFjXOMrQD0AdTKr7XJBDHUS2MRy+1NkrD7ORNdb+AtpS45sagomb7zyDt/TTAciXx7FdS4yS/50ccTDmZ8T2J8OkxEq/BUbOxH6MDCNIO3hYPGRK33Lbf58Y
X-Received: by 2002:a25:ad50:0:b0:df7:89e3:c8d with SMTP id
 3f1490d57ef6-dfaf662699amr1759515276.47.1717742790990; Thu, 06 Jun 2024
 23:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606161047.663833-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240606161047.663833-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Jun 2024 08:46:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9NK2eAh9rYk1vRBSMc_iGkmVQdxh4-kapxR=Mn1S9pw@mail.gmail.com>
Message-ID: <CAMuHMdV9NK2eAh9rYk1vRBSMc_iGkmVQdxh4-kapxR=Mn1S9pw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas,rzg2l-cpg: Update description
 for #reset-cells
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 6:11=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> For the RZ/G2L and similar SoCs, the reset specifier is the reset number
> and not the module number. Reflect this in the description for the
> '#reset-cells' property.
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.11.

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

