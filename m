Return-Path: <linux-renesas-soc+bounces-11262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF16F9EEBDF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 16:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0A70283ACE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 15:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F230215764;
	Thu, 12 Dec 2024 15:29:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840A320969B;
	Thu, 12 Dec 2024 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017363; cv=none; b=iFDYpWsdzXPfQlxgrVI6GyI8Bh/Z7bKvY3rrRBuC1/mL1oFAqe5vCq0gMcJ5fZhJ8UXRwiRraAN3/BLHsBb3VnozEEIElQN2YpeyrzJrHmQKysbOaXCkPhru4VE9bS9FVPTBFRYg375Pnl6f4wPmsGCMkpEeymVjvBAGvMkK/ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017363; c=relaxed/simple;
	bh=N7JyC24jCutU4HV2fQBh1VxLh59FGqmDx/1Ycy1gPe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qY/mSdo3w0/AirhiKMnCo3iPZOQ0oav0LlXTyaBj1ZyTME7Sest7qH2up/Can60Mz89eh9OAd39J1zXSVpNxQm1UnwSL/rCNK1PDeS+h5WUEMwe4E4qvhTarvh2ZqHxik3cWXyGZBXBb05JAFbNoOP8R3Kf9A+xMNwCHF2PaS+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4affd0fb6adso150186137.1;
        Thu, 12 Dec 2024 07:29:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017359; x=1734622159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/pLyU9DSDmmH7CeVu2jmMIutOHbrWQV9qNZEezcsa8=;
        b=qPaJz6QXrWOcNugz2QDwb/p0U9N7jCdtS7QWRtyFwHSe68ani0wS6MrKl9EXOXOHBk
         D1Ub9OY4kNDFUako2oA9op/YgQGFqfcvd37CWdqiMqmWn8DRWqZa8EpzUAoDn77M6r0+
         S9MqclZK5tZvsJp1lEiQZ3p9GEvdIQiTAO8r/wt8aluc8FnXdP6Frx1krt345Lqz7Tuw
         KwjfF2dWE1jAXHlOKjScxJStGFhMQxRRpXvVZZ7XA/zvbqMnvE7UZUURhDEXupO+Z1Js
         28JpMLDbQ6Tv0+k5rbbukDeYdY8dPwo2VeTrzkZUpvxZHz3cUdh0+3oIhn81Gr0pugu2
         08RQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9gW08CWkLOLZqaT0xSaQRMPVx7u75YFjD/FfjfNczir0dxQP3ad4wMtEYTyjdxtoTuzcFfY8tQ2e6Hh3PgTXGlPA=@vger.kernel.org, AJvYcCUn84nbeTG3DXS+jujtaAxH4REhY58d913Z9OjEb/s4atvyC9RA0r8wZI+x2VNMngMokcpMCJnLEP8Q@vger.kernel.org, AJvYcCVkIM50wbatSrbGFJAUmVVcEzvBUAjtLUAGc/EO17/RJpnVoCYDxdgwKIWxq64mOoMDypT30g4QeQ8e@vger.kernel.org
X-Gm-Message-State: AOJu0YxfQEql8FuCvDjaZQlpSvI7LGLkdQ+ZZqVpJOHC5G4+7WzJN5QE
	guufKswn5hNWaJEoT2bzITmfYGFyVSRO6RQDhe0ZLVD5B9wKgcp2Q6XnJsFOwvo=
X-Gm-Gg: ASbGncsl8z9CUv6/soQsxUIzzvTSYfzOHkEL39pgxVJ87JyEHRR6vm5CFGKJh0osLGh
	sIbzbqUzSTFXZLhpP4lq/ICnGxfTUXnm+VGKrW/tbh7xzsOsX011S7Uce4LJeYXquZYJApJDake
	Ruph9wAd59OYCqy8V2OgEnSzPaAI6FbDFiYhFZ/YoPQli3QWDHeEyPOlmXB8+IL9n+Lpn23zLOD
	l0303NXcBk4MddRd8ly8W4M3yLW+gmxkg/4tbinnCUuTLa4EY+hIgkCheIrrH9kVS0IfNzCWicV
	DqpYFc8pwpt28m3NVR4=
X-Google-Smtp-Source: AGHT+IEEQeFmWwMs2Hf9JLa0KeSuekIFXw3GM2vMWU/SoDa/TLVj8UFKJN6I8gAkcsZBUQmjMdlugQ==
X-Received: by 2002:a05:6102:1486:b0:4af:de38:dff7 with SMTP id ada2fe7eead31-4b257d334ffmr1572784137.0.1734017359100;
        Thu, 12 Dec 2024 07:29:19 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c66b1ee44sm1434780241.11.2024.12.12.07.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:29:18 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afefc876c6so170164137.2;
        Thu, 12 Dec 2024 07:29:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXV+QKSTIaPOztd7is1jcwnFC40Yrg0asmSJ1/ldE0EGrTibhxtnfY4L0Rdrj1iyPZPPAkV52oW9sm@vger.kernel.org, AJvYcCX86TSbJB2Ff2QHaHapzeYJjsOTl4soM5h9pnfU0NoRn9ZPGx1o9KiASPJJCauL7uqhHtQrZ78htDTO1ZRtMRVxI1M=@vger.kernel.org, AJvYcCXdiJBJdpemlgxi+6lo7KqnXbaXpsDrtD2ID2FqryD7iJSVo6LP0dr2uA+K3O2ylSRAKm+TxDjAGCxb@vger.kernel.org
X-Received: by 2002:a05:6102:3712:b0:4af:ad76:fec8 with SMTP id
 ada2fe7eead31-4b257f33bafmr1244942137.5.1734017358780; Thu, 12 Dec 2024
 07:29:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com> <20241203105005.103927-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241203105005.103927-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 16:29:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2v+FqOewXb7t3EJO1VGSn-4YVT52Bfyj2vH4Z0HTcNw@mail.gmail.com>
Message-ID: <CAMuHMdU2v+FqOewXb7t3EJO1VGSn-4YVT52Bfyj2vH4Z0HTcNw@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] dt-bindings: clock: renesas: Document RZ/G3E SoC CPG
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.au@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Document the device tree bindings for the Renesas RZ/G3E SoC
> Clock Pulse Generator (CPG).
>
> Also define constants for the core clocks of the RZ/G3E SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added Ack from Conor Dooley.
>  * Fixed typo "CORE_CLK*"->"CORECLK*" to match with hardware manual.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a shared renesas-r9a09g047-dt-binding-defs branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

