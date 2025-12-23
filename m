Return-Path: <linux-renesas-soc+bounces-26062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB42CD971E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 14:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1716A301C960
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 13:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119CA340A47;
	Tue, 23 Dec 2025 13:33:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE2B33123B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 13:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766496830; cv=none; b=TgyBU2vQFO/9jp7riY3usJh7ckT0Zvs7z1N3FTxjYRGk0mZNczo5Haw/7UKLmpfM1nYlOx6hfPHDVWSgJdqw1uUM/coKhd+QsBrw76FGrma87G6AAreB42ExGEaLv0YWd/4Fg7jorT8EY8ZzJfAP+3xJOKYpjb+4NYlR8tSK3jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766496830; c=relaxed/simple;
	bh=d+EZghonelPXBgUA78BQ/tWJ6ckYSNKpR9OnMalTYvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFfC5uDrY5QMl0+s63acJtEj9FpwZefPp0EfqIEyxJF+a/Y1rQ1vNwtr5LSGYOvMPFvmreHTyPYzwpez5Oe/vBbwf1W76z/Qb7vep9y/tgopHmbs0TSCC8PAjT97QAOzwSzPUUbRSYSzQXt2+RMBerGSHrLNomfU66A7YXCEoW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56021f047d6so1473315e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:33:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766496826; x=1767101626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2q1TCGysZZkk+GHmS8vt4l47rdLT3znEaGV/tAdcUUc=;
        b=izC/w8/I6PCdO95xknfXnLj38lMjmX5WKcZssfUZ184P9vHstAfs1FGmHcjjPt6r1d
         oA83tvZts9KEixx2QTS5HFS1p08/LE11+L1D98tJRh4EQiZtsEJ3aFs7uPia7QdV8i6+
         y9lzl7PA90QYXdtIcOb52sHE+CpQC8XXgQqC93RfO6gZbWJPOXAOGi+xvzUQqBbuE1iy
         K6kmmwzbwSxPLdeJf+xq+30k0mmgb1wcLwd+tCjbti2wzKSK2qvLEnwz8cZuEfYAudue
         05d1SAgBXq9f6u7In7L40FBVwoGDKcQvcN8qCsVSch4Wr4Nf8w0vrE53y6pWRoYfX+Zi
         gjpg==
X-Forwarded-Encrypted: i=1; AJvYcCWwGkYmc+O1u6VxscGhTONs45F8MmDb09dxOvROTTYsZUeenbYdWkytzfviD/tk+dNk6OYpBnb163tq+7j9iFU+sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL/gdztlgo25qCyQhJxXFpOzWYF2x+C97+h5OeWWlJyPbQvl6B
	tSzK6RFSSffS2/pGAMPhhaj8j3E2mVC0NKJ8Nx/vCClAY4JEurGQbVBbqwKSl4Y/
X-Gm-Gg: AY/fxX7oEBBXNVAS9K5xlbYumA/qf+yB8vHAkglsvlClsTUAvpTy1WNijLJZWxQk/6j
	VT3/Sf/VW/HwXBrLmqYHKiWQOuzgALcNxISdRb/0WM+aP9KWjgH0lqB2JEZxT3iiTWi7MibVWjH
	l7Q32xPwvnmSCMiO1NVuqso8dMKtb9jqdIfzzoFqJ6iXLaZlk47eh4A4VDMfG5NzJfDv3Rl7+8N
	SCJo3wy9DMKfu/HzOm+wQx4ACDuPEmpIYes/X15f0+2kL3PBd9US1JWkkCzU0ZveJjrTF+ama81
	/4hchh8S9u91EurSe5plgzZSK+8hzdjbIEyJRSHvVH8JZk8rXvD7Kl6/C2P+U9E+eAZC1FsEwKU
	bnlNUH2VwmHKeuZ8Ce7f2JNOhEcY8Yjn79hlwHJxhvL3I/3/AJLBqu6zwK6V+PcoEQdhrv3vaNB
	y8M8yXnjYn5MN9/bObzim+2DrEXUbOyxRQuRT8EWJ99JgJTDasFn7YpAh/xRg=
X-Google-Smtp-Source: AGHT+IFHfZc5tUQ3Cu7oZBGyzF0+7X9erComXzvwu0BC9IhMCp4mZkP2svuev0IkAJupe3R/jJSa3g==
X-Received: by 2002:a05:6122:468a:b0:55e:64d7:ae76 with SMTP id 71dfb90a1353d-5615bf4c131mr4265619e0c.20.1766496826230;
        Tue, 23 Dec 2025 05:33:46 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d1329f2sm4579965e0c.14.2025.12.23.05.33.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 05:33:45 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5e186858102so1722577137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:33:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6qWGq1G0rkgMbMKg6SDXkUXKkZR3fVvuuffJ2N57MU5ybe7hItySL7+BYm/28CYxG7RRzne383jaOJ7as9aHMAw==@vger.kernel.org
X-Received: by 2002:a05:6102:c07:b0:5db:f573:a2c with SMTP id
 ada2fe7eead31-5eb1a67d804mr4132076137.13.1766496825417; Tue, 23 Dec 2025
 05:33:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201124911.572395-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251201124911.572395-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251201124911.572395-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 14:33:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW8WK9EXjJ8bkUV_f3OgG2wv+QWgPQi-rPLFh7qcxjptw@mail.gmail.com>
X-Gm-Features: AQt7F2oA8sVMWIIIOjyLh788W_awCND3GcqvNsIMfjLaN-ARF4rTf9K4TdiA6zg
Message-ID: <CAMuHMdW8WK9EXjJ8bkUV_f3OgG2wv+QWgPQi-rPLFh7qcxjptw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dmaengine: sh: rz_dmac: make error interrupt optional
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Johan Hovold <johan@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Dec 2025 at 13:50, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs do not have
> an error interrupt for the DMACs, and the current driver implementation
> does not make much use of it.
>
> To prepare for adding support for these SoCs, do not error out if the
> error interrupt is missing.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

