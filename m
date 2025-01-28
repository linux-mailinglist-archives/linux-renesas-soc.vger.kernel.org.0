Return-Path: <linux-renesas-soc+bounces-12676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2707A20CC5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 16:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28FA6160A58
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB64F1C831A;
	Tue, 28 Jan 2025 15:17:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4540E1B4F3D;
	Tue, 28 Jan 2025 15:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738077462; cv=none; b=MNDIoN34pvsTOD7EvF6BFbm6CBLfvo8nsSkLEj03x86q/n0t47czVTXyENjLwpSSNA06ZIdu7pBEzzlnf1YcKiknjIyFc9ShkYZCXyoyqUsRcA8P3mGEoCFvjjdez70bXJxbGFTpDzqOO8ArKfuOF6ildox+GWH+o04FG/tZ8Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738077462; c=relaxed/simple;
	bh=K1mfat7yZZDuXM07aBjw1kgeOuQMu7giijSpVBzogGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fykFKKmbD74a9dipxXUMrOrIL96bi8FVa8fqjZasr9iL3Le1ogAffRVV49GY4A0W8l8efsffi0sR0yWiNwY9OM02dS1tRsAHnVoxPqqglAr+pvyT5U7c5LYGYvxNdWXzlQu5GEGuMcODOu6fXh+NC3k1xMa6fpn8EDvilzQpbyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b6e9317a2aso588378785a.0;
        Tue, 28 Jan 2025 07:17:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738077458; x=1738682258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGuWHyiF9ctoAje4s+46RUnL3RpuwHxdw+4GO7WuRkk=;
        b=plaJByDAs3sECVEpc2zLKB9vDK06Ne2NvaUnm4Q08QkkTmWFyp63RN6QEa96HvGVtk
         XTWsmn482dJThUTVM81KPObIebzhdRq+bJqdQsrRO4r8rnwSccFtSRwWJPg6yOo8Kdf/
         50K0Cf4uiipdvPDQKs477K6qV535Bhcx9L3X5wlhDBaPXQnjsrrfY9KRdn6gNXPlNzP/
         /W9r0QGetOexdsjddgKZxQyfu9VMvpNqJwaO6dI6IsuA8H5BxXUYxGVsYX0QdL8YC41G
         kHnAITeNaVLTIE2iqfwBsE7BbMWyfWbO9APVhuOa5ty32akIHp/hQ0FvZ0EIdPMFiJ/H
         HDog==
X-Forwarded-Encrypted: i=1; AJvYcCW2zeU8kDhq9u9WwWiwqebyhJqn7khu3TF30/owrVtpky9StCyBeOHZJMYluLMQ4UqeqVp0vp5DMSgo@vger.kernel.org, AJvYcCWvJ8qMPuwj/Uk2QlHn2tc96XcO7wfWc5OR7H002TIsjNQhtMKlgdmvxL0wocSTTaT1/29jD/gmITrf9NNhRX8BGjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxydgPAU5Cbo7VOB3k+taVD3lm6C5sBNkkMEb3Zhq44ghK6lBjX
	AFTIoEEFrvEdudKli8eGfTSo2hy5+gnh7A3bltIH75GMTyldBr+NeX1pfTB1
X-Gm-Gg: ASbGncuIaGGB4AX1TuaRMhIaoAhFcE+JSNjjrOlasOU9Ojf8GjKawrLFzQfk3NDi7DA
	U2uq4F+MQIWBk/7vv4cx9eWP4o2GXZi7d8YU3xSAuG1J5WYowxL2da+vpT+g+WZSu+7oQiRotcV
	9fe3/9hQWER56MV6qgYgZR/G1gGVYIYH8X8G11xCmSZSS/4B4AWOF/mDXEez2VZ5utReWBSvvEq
	d9DfUe6Jxqe4CVTk0HtfWUvlVFcU9hMZoTUJbpiw0QTxmjaNj12LdUcw1j5+HgecfBq6AAIz7x5
	KfMgUv77dGq71pvk6b/csA1mAJr2fQao9628EXKF0ihb5SseeCHwet/nKg==
X-Google-Smtp-Source: AGHT+IGR2hexxyDqVT12fHCVmJpuVzxG62gHQ6Nq2S7m9rTQXt9LTEfDg5yu3WG82q3W7roCy44sqA==
X-Received: by 2002:a05:620a:408f:b0:7b6:d7be:2e4 with SMTP id af79cd13be357-7bff402e32amr474874585a.26.1738077458008;
        Tue, 28 Jan 2025 07:17:38 -0800 (PST)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e66b67fe5sm51614071cf.57.2025.01.28.07.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 07:17:37 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4679d366adeso57299891cf.1;
        Tue, 28 Jan 2025 07:17:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/mYn28TaJ+7RKwrHpy9KXMWqmEZ7K+sqKxRwjIDosNqWTz3WAhFtiHhrmhBNqz+GR8IZCTracW4Y6CkPQZjSr6Ok=@vger.kernel.org, AJvYcCUlKE66IPScS/wvS0uP7avO2OR9u8lVbbjlcVxiRAnI7nHdfwTNnkkyCsWiCqpWtcJzDgv5a8qckwkD@vger.kernel.org
X-Received: by 2002:ac8:5703:0:b0:467:5734:da89 with SMTP id
 d75a77b69052e-46fc4a93034mr46919631cf.23.1738077457405; Tue, 28 Jan 2025
 07:17:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com> <20250128104714.80807-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250128104714.80807-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 16:17:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwxpK+6fVfwkYWFvRF5kzpY3tp6FH3Or=grJsxojO64w@mail.gmail.com>
X-Gm-Features: AWEUYZm6mxOAun8F224kiPtEivUrP340BRXHyz28XvR3L7aNmcVHfWnWPpjH6x8
Message-ID: <CAMuHMdVwxpK+6fVfwkYWFvRF5kzpY3tp6FH3Or=grJsxojO64w@mail.gmail.com>
Subject: Re: [PATCH v3 01/13] dt-bindings: interrupt-controller:
 renesas,rzv2h-icu: Document RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

Thanks for your patch!

On Tue, 28 Jan 2025 at 11:47, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document RZ/G3E (R9A09G047) ICU bindings. The ICU block on the RZ/G3E
> SoC is almost identical to the one found on the RZ/V2H SoC, with the
> following differences:
>  - The TINT register offset is 0x830 compared to 0x30 on RZ/V2H.

The first TINT register is at offset 0x820 vs. 0x20.
Perhaps:

   - The TINT register base offset is 0x800 instead of zero.

>  - The number of supported GPIO interrupts for TINT selection is 141
>    instead of 86.
>  - The pin index and TINT selection index are not in the 1:1 map
>  - The number of TSSR registers is 15 instead of 8
>  - Each TSSR register can program 2 TINTs instead of 4 TINTs
>
> Hence new compatible string "renesas,r9a09g047-icu" is added for RZ/G3E
> SoC.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

The rest LGTM, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

