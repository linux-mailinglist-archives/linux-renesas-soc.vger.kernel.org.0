Return-Path: <linux-renesas-soc+bounces-22013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7018FB83C7B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 11:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F8E91662FA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 09:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD342D77ED;
	Thu, 18 Sep 2025 09:26:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5414F2EF670
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 09:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758187616; cv=none; b=iZoas99u7XUGmUHt00BhQUvb6GXDqOUtGjdJghEQJ2SFasmJ4wWLL2AvIdwNHrA09XKDj8Ou+wTKbduR7jfzYLOgEalZ3gU7er4Irhaffceh50eGW/TEG2SVs5gCsASKgZlhztkC6Xn0uSnybRtMfm5Zv06nXHnpm8xbRyqM/EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758187616; c=relaxed/simple;
	bh=F+7UwolL+d5M3u3SJQMdS/JoH4KAhipm+vZbdTiVTtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8oTGH6YX7OKA0wSotVP5o715wMIzX3VowJqSk/7oYc1VdHS8J12RGShic3iTIfNoWlCUwLx4EnxFuHp6wXkvYq5fmoNSc128WApjGkJWIWcmq/a0XmlC0U1Xeazj+pUfvfefBFgWE7KtJZ43blkXTys35GZhu7g1NsCzBGsJhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-544acb1f41dso254096e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 02:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758187613; x=1758792413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thwzdmTgqO/aYIbO/EaYexBbO6rJAeT6rezea+eeFXA=;
        b=l4maToublZjpY/U+JD4anEWxR6DLkybxYmD1I8NNX9EQf2zSHvC4DXGQY3dUmLilMh
         WlDOMqt7DEQ1s+xsvOxjHoeBo8N/FOEyvLc/VIKdpzAHOgacKQLPSKH23vtn7wVeDIZw
         VluWFuVtOd9eY3eip5TW8VJ+Gmo1WuWLK4CqrlBPIO4+KmqjWdaAZNIfSuOd2gul2awg
         z/Pb7KoDbKvDq7/6qm3M4NJVchKJw7+9ddH35birQjM9DjeVOc/ftpk6uD5+0i2mFoR0
         7ck202UtWwbOFoPZYcZ6KfD8DywqjIelh6guKNrrE6j9NuyFY2lxLefiDeqb4gTNC3nP
         itmA==
X-Forwarded-Encrypted: i=1; AJvYcCXhGF97GD3qB1pJ7nACZJu9rhOK0iOYgLmZRVMh8giCVSKgOEHpI2r7IhC/mRHDbJuw7ZNtzWeKVxG8CGLuNDMDzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNY4cnd7WRpmlp1MLjE6hNMk7OBDmNq+L1NImqop1MqH701u8T
	emEJJBohk70kYKoa3zHxZO8gGthkJYVO5OvVaXnyKSIwOr45r7sQBRbcv+c2Ht/v
X-Gm-Gg: ASbGncs+qobsjFoQs0h7Qn67X4GnoxlAik02PN2JhKQ+UO8tvcOM9OFSnbuNyE2vhUM
	N5OedyqMD8WSqPec+eqEqo3IAh8l+HZZYmsGsr6fwfDIz5+cMT/QgCzVO+YW5nGndAHXd8UgjLx
	dbXG0M1kh14akVJD6NW0SwLiY15nzjmZk5VZ1M9THEg8aVJfchLZLlQtkAcBrhzHU18EzLigspY
	Z2E88kpIJ+4STRB/llqTYLd6MDu6sygVli6/Guo+vH3ZwKClsVJYnWZhKJRvYDOG1xB1nv9bb3L
	KCMDvjZQfRcbCrTXkXqfNYXA4iLeUVgYPOm2si7LG9eJj8aHiQic9X6UBpRQksYN34HeIGbVl/G
	NSRyToRi9SFalu7zgJuHrECXfboW3H+Kez+N9yJHLx84LcDkCxZ/3Ui/VfiakBm7qkdvxptDGq3
	QS2TI=
X-Google-Smtp-Source: AGHT+IEm04pRopGSKTx0n28xuX/hAuKbZnwCl5P+YEaohF8NeapvojxU/tOAsib2yI6FiRBWG7ErmA==
X-Received: by 2002:a05:6122:828e:b0:53c:6d68:1cce with SMTP id 71dfb90a1353d-54a60b80718mr1813008e0c.16.1758187613461;
        Thu, 18 Sep 2025 02:26:53 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a7275991asm446703e0c.9.2025.09.18.02.26.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 02:26:52 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-529da1b07b5so136402137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 02:26:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIykPjdcbci9z/QDPE3f8Kh1GDnBFK5eL7PwfEfic+vzKEMERaL1w5/HLmlKm0vhVmwDYLV4Lj8Qd5eacPnWntDA==@vger.kernel.org
X-Received: by 2002:a05:6102:80a6:b0:51e:92cc:6e6a with SMTP id
 ada2fe7eead31-56d6d57bf75mr1452834137.33.1758187611708; Thu, 18 Sep 2025
 02:26:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com> <87jz1wnunm.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87jz1wnunm.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Sep 2025 11:26:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVfhMKrdnQCjf_Z90EnH_gb-RpdxPiVUjEe3C5ZyuTfUw@mail.gmail.com>
X-Gm-Features: AS18NWDTdMprA4ImYjVf-zjtYmKdsmDO9RIvez5aKcVZCW3WJ100X4TbNjepaRg
Message-ID: <CAMuHMdVfhMKrdnQCjf_Z90EnH_gb-RpdxPiVUjEe3C5ZyuTfUw@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: serial: sh-sci: don't required "power-domain"
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang, Kan" <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ian Rogers <irogers@google.com>, 
	Ingo Molnar <mingo@redhat.com>, James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Leo Yan <leo.yan@linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Namhyung Kim <namhyung@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, 
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Will Deacon <will@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Thu, 18 Sept 2025 at 08:26, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> {H}SCIF is in the always-on power area. "power-domain" property is not
> mandatory. Remove it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> I'm not sure this is acceptable patch. This is optional patch.

(H)SCIF is indeed part of the always-on power area.  However, like
for many other modules, its power management is handled similarly
through a clock/module controller.  Hence it falls under the PM Domain
abstraction, and the power-domains property is justified.

What this power-domains property will point to on R-ar X5H is a
different question, as there are no DT bindings and no driver for the
clock/module controller yet...

> --- a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
> @@ -116,7 +116,6 @@ required:
>    - interrupts
>    - clocks
>    - clock-names
> -  - power-domains
>
>  if:
>    properties:

> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -168,7 +168,6 @@ required:
>    - interrupts
>    - clocks
>    - clock-names
> -  - power-domains
>
>  allOf:
>    - $ref: serial.yaml#

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

