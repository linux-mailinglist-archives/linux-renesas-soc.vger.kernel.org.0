Return-Path: <linux-renesas-soc+bounces-13047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83784A30C0B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 13:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BE6F3A300B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 12:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EFC204859;
	Tue, 11 Feb 2025 12:50:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87A5320F;
	Tue, 11 Feb 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278243; cv=none; b=APa4F2a9mmA3MFoyjTcy7npGodumQCXPbWMq1p7q8nVf43c67iBistucmFzc01Xv6GXmUbt3F5cmKhv4i6uAkmxzLgJF4MmSsNZBNm5PT+UHCpEWpGvzpIjufaFVqe4pJwNwj6VtnmAh+G3uGZdfp7MQFscJyrHtxV1FQEXWU4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278243; c=relaxed/simple;
	bh=yunBSt/nigkQXI6Mi6FpAg9HAYUB6txNT6LN3lAjozQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCcT5qaEJXk/VsCYpnx2IkAFTHWT9u5p5ZzRnVKhLE1uxOr9iU57aYps3p43ZIWUelMAZETpPwtjx7tHivN0Q/9uzie2soQ3PHp3U9IxhOy/CyAWaCDo82JsnKxJlxJ3+rNhH7SU9MupivkFdxvqg7/w5OB7dhpDOTLb8NQ1R5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-866fe7d07d0so1320500241.0;
        Tue, 11 Feb 2025 04:50:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278240; x=1739883040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3J5ARP+69nEEkzNAUY9ILaAxe/rz6jrbIqbWrp9o6k=;
        b=XrhVm7+77h+JznZSbdF4sKIAnY3alsNM7Z/A1BpWx1mHA9qXDX78zqWcem1XFbgw3n
         vZ686a+qVKkE24o/a8oJEzOONeNTonVQOyzwCizIPVmTM/MEEXIjoyizB7JArDIOMZkj
         ukFMGk7kr/gRAF+vIjdbu8N2PgfngnDfDwYzlcJIlyreAyumCyX7V3XcR6fF7qi3cu2l
         P0+InLDcDIdwBnjLeBDDdRBKwydLHcQn1V9nxV19hz/kahEokFrQ2svvHTeMMZ2cPg0O
         d2wjPGHHHUs3pTYFZKUqFOAnSUjBBBihOyrmJcrhuzthuFhWUEnhLYj7lSt48mdRvPW/
         nwpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd4gzRI0gamDySUeTn+mfxJW3sPgDe+xAMtAVM2lRhvrU4h/dBmMTutfKm8mARQuvF3uSdXGyJjnVA@vger.kernel.org, AJvYcCUhH4dkgX/hkQ3H9JVhpCDKpr9MpjVyxP91+pmHHy0M19rL3xGK1wA3gRJykJWVa5QvBcOB+DyGS1GOQxFe1I4cKwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWDXuVIOCSaUxq+v72uZ0IhRv+3DKl1SIj0nkgOuzRgBIG2NEM
	b9Gpi6io7CzRqYohaIjAn0juBR9ZJpRJyfIppUOJjZwF6ab0WwuF0EBocDk/aaI=
X-Gm-Gg: ASbGncv0yNUoM5OvQeARWNY8iuXfqzq/ak91zWvO4R+JZ2SecNYow7qPU0BwjN4fFcy
	QVmlFGGHcWbj2AprscvJmasAXUrwMRWQquhiUG8c95FPEI9pvRljQdyT+3Qc3NxPJjuAkiUZIrL
	0VuD7VlskOw5JrQk/77OjspSPJNmTynP+HsPYVoqWbku8uLU7zidiYPGFN8Rw0Nf3HyDifKCKhi
	XKLK9r/QHgdxVLr+l/ZO7WBCiphruz/RASfO3qg0ldvlSrpDRaA7oppznHRBwolkeHgv1VqHLRB
	sZk5TQlNzTWaDDAW8AzRQXs7X23JeSgBqrv5eEoFhUlpefY067SN/Q==
X-Google-Smtp-Source: AGHT+IFKq2WjezhUFGEKyC/fiXRSZZGVXb2ZOZo1TSk5/ehjKCzS2ScXWVjNEP7C6m5Frk0hLBbaew==
X-Received: by 2002:a05:6102:a4c:b0:4bb:d962:62b with SMTP id ada2fe7eead31-4bbd9620b82mr3344493137.24.1739278240150;
        Tue, 11 Feb 2025 04:50:40 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba772d7239sm1975359137.19.2025.02.11.04.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 04:50:39 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4bbe5bfb68fso133344137.3;
        Tue, 11 Feb 2025 04:50:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULt5zII4gKK2d/sswY+/jumhgVErLtY4qs705M5nUkZBJnTc5SOSI6CJhmKXvI9+aGayTYqI2ci9xN@vger.kernel.org, AJvYcCVD20Usp4KoyHbG7BU9mLcpo+87nrfbeezsrbgkZw1LC7pBd/uUc3O/w7zi5x+aIL16QJNMwua+477zLqGaMhAPaeo=@vger.kernel.org
X-Received: by 2002:a05:6102:2c8a:b0:4bb:e8c5:b173 with SMTP id
 ada2fe7eead31-4bbe8c5bb8amr478499137.21.1739278239354; Tue, 11 Feb 2025
 04:50:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com> <20250206134047.67866-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250206134047.67866-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 13:50:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSy0bvu42p=+kxkaoOzVAZo0h4MEyJ=4AuNgqDJs_t=A@mail.gmail.com>
X-Gm-Features: AWEUYZkN0dSadnXTeJFp3NuyjN1BxIbMo-Ubk2ta5c__ODTGqtiDWlGywBC1BoU
Message-ID: <CAMuHMdWSy0bvu42p=+kxkaoOzVAZo0h4MEyJ=4AuNgqDJs_t=A@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 14:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable SDHI1 on the RZ/G3E SMARC EVK platform using gpio regulator for
> voltage switching.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Added header file gpio.h.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Queueing in renesas-devel is postponed, pending acceptance of the DT
bindings by the MMC maintainer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

