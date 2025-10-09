Return-Path: <linux-renesas-soc+bounces-22831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C3BC93D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 15:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A2893E3EBD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 13:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1BD4C9D;
	Thu,  9 Oct 2025 13:18:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D6E2C3774
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015906; cv=none; b=KcwNglfcM5Elh4MVPy/w39TholGYadRummVDhWSI9nGVFtKmb1MbAWHGq9ecnJnFG8eFZCr5GuSroKqpVom75DbaCJkvX7Z2TC/l5EuFQiRviQ4xJ7oweav92imlkMV7x2vRMCREJ0Z5pNJVnKXWE3Wh2aLUwwYDDXTaMoNIwVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015906; c=relaxed/simple;
	bh=1CeK1ONk4l3PgT2t43KHT03ww7YEEaFbS2gXJDuFeUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U3vy90Q0lMlpgbZBInSaUrDvyfYYhbFX63Tdzq5hHvmiofQCkdRIGBZOkf/4u08hHk17Kg1888nb5PYPULkj9iWkm0wbZvxm6mRRTGc/xY87c4ZDwYMDqm+KU0N1zEUfdtdXAHXAqpO7GcpQRrxU85v63VyDJ6n4aFQ+38omUXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5522bd69e14so469717e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015903; x=1760620703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgvNWQNEUEnsMKiNO7Z+h7b3CLJoE8XkViqUQ7M5aKo=;
        b=SSXrm3PacPdP3V1lj+90E4qQ4JBPzCF5jwUsBuCHjGOZri0z4HWcaGQhxrzJuwIIuL
         px0iQHz1bCvKE4xH7z6HmZnwtRnIzY/0qyVF+5bRtDq9RqffjuvqV7hGGoF8umXcb4qJ
         RfiUkVWXg9xgsD+6zkp5M7oE415arF9aFw179TKHYb+VXdoKhDyYP4lk44KTmRNVWAML
         Rlx+VHeMt5mRS/+hNyFS2V72Zju2yVUBuC9LinxeffXNhAskm+cWOf5i5/hcBjBOcMNt
         REV7DEe2tXSI0ngShqRGWrQU7iU8xBNsM+m+rrBMoO2iaqMtrseWtVlJvz7f+uHKZo/e
         njMg==
X-Forwarded-Encrypted: i=1; AJvYcCUAHrBtiCJLPUIRwnjnbhJOpQxRz4qLWfFZ51f2CIrKi779ENyNuyL8cfchgyfQW4QGTI8ywmOHQkqmCvnCM/aUSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUp1HQktlmpzjA7M2kuTpE5n6VvdjMv9lrcVJiydZogEs3ageS
	iZFtXWuCoD3XNjZ0yU9ZiX42iab/dn18UDurN7fl9VLFBgFvwFrQhWUQXGycCHZh
X-Gm-Gg: ASbGncshGRjM/bxh67DkhkBtY3MCtHuzDswpNWMqhuo3tQyYuasO6Tuhj4pWH39si2p
	eAZ3mnSt4Tg66+N3AVKEEUWpNQG0C9hZ4SNolrFx9k6sedOt04NWdzNDsPD9xLhoxPlhNRzKxnI
	kHzYiitA3cmRZ0SXdbEg0TNa6oaQYv10gVdSmq5TU/E7NMO+BLMG0hgHf4a+1xDT7bussc/e3rM
	mCJ//x81bxo2hQif8H4UT9bz+/qYIXJleHMpawQ95zFq6F2lknpsmE/quxvH6zpU+Y85QJUsZkj
	uenFqPmUYyvrtPBhY7AxHVozSzlWyL69xspLjWjrXzAOTFI1EUW+EfDZLjTr3QJgzKZRItR5Iy7
	Ysz2VBJ4+ihMocddHTDcu1Q6U7GFofaljhWum6UhP23zFGsCsteyB/S+3S39pLQ+zvt7v72AXHA
	XJsVTMM9deWgZVniy+4Bw=
X-Google-Smtp-Source: AGHT+IEZO5JKbwS7Rm7o4LsQwqTWbSHqoIIS+wod7zQaU8rlE31O52V54wrzyMotD8OR0T88gPFVXA==
X-Received: by 2002:a05:6122:2a53:b0:54c:385c:831e with SMTP id 71dfb90a1353d-554b8a7ec79mr3024817e0c.1.1760015903381;
        Thu, 09 Oct 2025 06:18:23 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce694ffsm5237238e0c.10.2025.10.09.06.18.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:18:22 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5a265e0ec25so763147137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:18:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGR0q+AHQxmH2qzB2fIB53fqatzncGStCe5ZltSyX+gM32NFvsIfo0Wt8ZjUdQSFPU3KacZWt5ynqNhpSVhNRCIw==@vger.kernel.org
X-Received: by 2002:a05:6102:32c2:b0:5a3:5b69:b963 with SMTP id
 ada2fe7eead31-5d5e2212895mr3581618137.7.1760015900637; Thu, 09 Oct 2025
 06:18:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007121508.1595889-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251007121508.1595889-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251007121508.1595889-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 15:18:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUo3qQwOBbrTuJMyfcvXfVX4ydTg=m+Evw-2rhD6z_kWQ@mail.gmail.com>
X-Gm-Features: AS18NWAFR_tuOqkjGc0mazaTQNfKABk5-3eOVxgykm60ReYpXtwRlPobaHKvywo
Message-ID: <CAMuHMdUo3qQwOBbrTuJMyfcvXfVX4ydTg=m+Evw-2rhD6z_kWQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a09g087: Add Cortex-A55 PMU node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 at 14:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the performance monitor unit for the Cortex-A55 cores on the
> RZ/N2H (R9A09G087) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

