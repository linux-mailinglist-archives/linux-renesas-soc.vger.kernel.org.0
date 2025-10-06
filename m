Return-Path: <linux-renesas-soc+bounces-22680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F28BBD393
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 09:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B24E4E893A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 07:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8482825522B;
	Mon,  6 Oct 2025 07:35:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6E81DF261
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 07:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759736120; cv=none; b=EUwQi62edvrnuBHjfEZy2ABJoIeowJMvYJ0layZLd+bt8Y3yAt8q2/Vrd+vtT2KKXci28gy7Rv13+SFvcyEFsU6kEngQr3cxWGXjm7cIPNYNdt62DDfetW0w3eTJoCKJCKDtmUQ8zwjVmwrRP1DHpeU8ki/qpvSlQtUHtsEw4JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759736120; c=relaxed/simple;
	bh=Seg/zBB5psfsVpNwNUkdV6jEHpzqviCUZwoGlYe5ov8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtFFnV0+rpDKKPILarRXjQXGLrKMPzUvqfWH0zsqQDxKsyPhXw/QTdw77YQcwPsF4J28bSKN+d2ofb/7hF6ch8KsUz7w3Pp5BaTSX2oBzK6IAJKDXfPwPBSLFR3j7vE6bAO9OBnchcJh2FbYyVwW1q5AaINd5fOclpGOD02Wkoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-54bc2d1feb2so1260825e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 00:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759736118; x=1760340918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gi/dIonYfUmmwW2Vuh6lMeec+QtJMKdHIzm0Sdbs67c=;
        b=MgxTL2u2pIzQjowUiSC7LoaJCX4GjJ5yJqrAu+zoN8sDwazGQduTxnqSZ0PILuI/S+
         fjjOmx9zSi90ZRABuY/FeJz6ZIwhltidtMHhiQEnJSAE838XHmWwmb6JWFP/ZwMspMyh
         uBNk4KMoYYBQV5p/BWhwwYEbspXSDarnHYyBffCVK9YVEEM9rWYS9+GqIZoLl193GmU2
         cBW/RFIYiU+51Hb25JNlx7o2FpUFZWqRjMHGqdb0lNuXCG/8MCw1HHDRBUL5w41g78Z5
         q7cHfQJXfc4EOTYB4SNW8U7AOU+TaU8FuHxKvF5tokvTYwJerXOxB5kH8a+0DPYAMBNf
         x8oA==
X-Forwarded-Encrypted: i=1; AJvYcCWCc8hCtiF19tnZF6UELjOh6Bio14cLrzcbRRsb0gjJQVAg72S9YyrCCd2y38F08dGcnie3XqwrUNq0ksjX2c0M4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYpy2E39VuOSw7jqpdlgwemqXVCojXHRkXJxPNWw0SSPjPinlQ
	yKkUod8MZedqFrUuLFaniqtW+FqWFbA3oma4BlgjKgYM0dNST+NumiA+E0rk39OK
X-Gm-Gg: ASbGncvDcJBKTSikz2ejc4aK0fs7Wj9L/egaYMhRJfoBkmKXjXRlmXwZccsfgKLQHpI
	FQSXBaIP0HXVvq5AmEpRaicQBSa+BB6ZX10AvwBg+HOF3S62SALB7hOChE8czEs+Be1cuOG5UEa
	C9vhk/NS1ST24BuUcY7PMWNrQBkHg519oiU/HN1sq3jKg7KbiGj1khEivqhnCPUAZTV7UoNmujh
	1t1LLkln26IcSwi5eN+HJS4pvwH3LIUm7zUaCQK85ct6N5HaKShGbOdIR3KjzsgssJwcxOhCUng
	Te4WWpuZXb4HLyVbEq+M6oXa57MnTht2Srt4UBOXopJW7nWsgbGx3O/lm2cZncnSi3LhfNbmdaQ
	+jyZYJfSSvt2BBAGDu0cZXlOw5sI/GIsc0dPJeeTtksLlbmBb9Yl2jeYPxSrNemIyEDmGQnG75E
	rui+bykoIH0WUCvXqe9Zc=
X-Google-Smtp-Source: AGHT+IGnsA1RXNgpIYEA7cq846CWR9PwsEUSd1UNXGxBQiRSnoedhRruSRiJ+cy50NUM9mUINwHzCw==
X-Received: by 2002:a05:6122:319d:b0:541:fdc4:2551 with SMTP id 71dfb90a1353d-5524e84711dmr3259247e0c.3.1759736117633;
        Mon, 06 Oct 2025 00:35:17 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce1c31dsm2846802e0c.1.2025.10.06.00.35.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 00:35:17 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-51d14932f27so2349011137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 00:35:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULMBlJ23WLcHyAmluPYEgVlwgJQ4Flu0cIJ7Z6WxKVpKYkpTjTKD9pp87pZRhs2K4Ms0w2WPR2Pw2fiJuA/09IhQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3e2a:b0:528:d2ad:1f54 with SMTP id
 ada2fe7eead31-5d41d0491aemr3884804137.8.1759736116168; Mon, 06 Oct 2025
 00:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759485668.git.geert+renesas@glider.be> <98e13934d06116d5c116bd2b2187842ec3a8c11a.1759485668.git.geert+renesas@glider.be>
 <CAL_JsqJACXgfgLBn4bpz9uG2zEsoH+FX+8wHmTSj2rLVV59=hg@mail.gmail.com>
In-Reply-To: <CAL_JsqJACXgfgLBn4bpz9uG2zEsoH+FX+8wHmTSj2rLVV59=hg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 09:35:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBGzLmpNeYtSe7SW64X7EQ8chUxrjKQpfhBdz0tHTRdA@mail.gmail.com>
X-Gm-Features: AS18NWCQxcI8Hk_xi-9INpQRnbcE9GVTQoTyTKCepWEClduajoLppt0iBQuvTmQ
Message-ID: <CAMuHMdWBGzLmpNeYtSe7SW64X7EQ8chUxrjKQpfhBdz0tHTRdA@mail.gmail.com>
Subject: Re: [PATCH/RFC 1/2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, 3 Oct 2025 at 15:33, Rob Herring <robh@kernel.org> wrote:
> On Fri, Oct 3, 2025 at 5:08=E2=80=AFAM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > The Devicetree Specification states:
> >
> >     The root of the interrupt tree is determined when traversal of the
> >     interrupt tree reaches an interrupt controller node without an
> >     interrupts property and thus no explicit interrupt parent.
> >
> > However, of_irq_init() gratuitously assumes that a node without
> > interrupts has an actual interrupt parent if it finds an
> > interrupt-parent property higher up in the device tree.  Hence when suc=
h
> > a property is present (e.g. in the root node), the root interrupt
> > controller may not be detected as such, causing a panic:
> >
> >     OF: of_irq_init: children remain, but no parents
> >     Kernel panic - not syncing: No interrupt controller found.
> >
> > Commit e91033621d56e055 ("of/irq: Use interrupts-extended to find
> > parent") already fixed a first part, by checking for the presence of an
> > interrupts-extended property.  Fix the second part by only calling
> > of_irq_find_parent() when an interrupts property is present.
>
> Seems reasonable. Why the RFC tag?

Perhaps you might object to putting interrupt-parent in the root node
if it does not point to the root interrupt controller, or if it does
not help to simplify interrupts-extended to interrupts (like e.g. for
ARM arch timer)?

Thanks!

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

