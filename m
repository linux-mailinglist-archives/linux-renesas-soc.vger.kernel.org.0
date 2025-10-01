Return-Path: <linux-renesas-soc+bounces-22497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EFEBAF831
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 09:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A231E1C1968
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 07:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC612765FB;
	Wed,  1 Oct 2025 07:55:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F782773D4
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 07:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759305338; cv=none; b=aczEt+LTeEW2+R3aUdxbxFZTGyBgPTsvUEpwwgrVGntpsZBu8Jb5vD8LvCIKOKzY5AspuyKVfrPXkXWQc1tjbPzAfcplqWGzp+DHSQDWOTLR5tnuIE5cafOQ1kDQN3DdYSWSxJamoeKXdrZEW3fLAf3okixqbNuw4m2lBx2q7WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759305338; c=relaxed/simple;
	bh=b8AgCRlya9OQ9CBRMXjlO38VhsfoP2czQE9ot4OwTSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdprq7YIt+f9dT8qohNabvWPP6rT0nQofrCJYsshmGI+WwgUt0XFoY1WKGuWo9YhS+BfyNnw2s9mcNjlnFFJO8YK/q85uLd7ffxN4P1wssz6gLEcJ4zK8bQIA/x/rWgu76D5NbN76PzX0uXbKuUaO8juO6jauJY70PqtfcwCPpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8c0e2d1efd5so2169392241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 00:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759305335; x=1759910135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvnNDopHOFz1JF/fDICYOtzGd9DeoBLkKWAzTubP1lE=;
        b=H1OkMA6vZU4pzAJTbhZsMxy6EUCQb3mLJ3JfkPZ0WBrCJkn9iZSK/i85eknMuKrfl4
         jUZM8UgsFsJun+CUzCsPdZoaN+zOVUXAzojHwHZ5uPrgjhqaVkSxNmvjWErfYVKA8c7x
         mOIVFc7TX1ftVN473E/WmnDvLxC5wV3jiCp/t+yjLe9u/28/6p8NyeJiOMAYYMQm0tjR
         6iHEp0i+n4cI9JsrAl80rIak5dJzsZfEuuI//JPxI5n/7mtgcgCBUFs5S9+UDh7CbP2l
         oyU1KV6M805XCnJWwZARAC5NwOShddM5xIydvaAr7BF3uvGqGA2LQKvyyINCxODtIkNB
         +Z2A==
X-Gm-Message-State: AOJu0Yx4zJjUqnPvbWJrElHj4CKi9FMZQwZjMunuaZiVW5o59nwZgRBM
	cUYiqIEX03HPzuDS6oaaCWWO6k3rIFHOpJYofpX4lyj5+Q16W5PKYXWHs2KINYIy
X-Gm-Gg: ASbGncths1rlLOMfmZSFWF5+1KrsUhKVhYCL5gwHiQ3KJAmuc+m0FmP0zow0v/BywXI
	WX12Rh4VYreyPDY+BYkmvhdpHpyXcvt7GxPA8AkOzDnEwyNdTGHHFHZlBNUBFuVvVkeje+f1plI
	IYK3pL0TuZhXj/LEM9wnOdnPVJLg/SXNMdR3RXil6N+W8hLC8cYhCvkeKoIxig9UG0d6gFcVVjo
	HDgub5lPyDgjO4XXpuFJsbcpqo338FcoBP0jmm6+6vvL6Fei+sBmwg3Rme9ufZDazO2+Dc/Yzpy
	9pLhsVkJrVVA7UZwm+vKeoztDctGjFqIsMvRWuoeFBV54ro2iN+xtaLJ74/5FJtxf6MHypRQnUr
	RFmw2IswqZtdjE/cB0N07592TFhMU1IGTV/1hjpCm5qXogczwqihjMelxVUoEs87c6IYhiKix+Z
	UxtAancPNXlHye+49MRjs=
X-Google-Smtp-Source: AGHT+IEJZGj3MdA+949/Nn6WCbmIZIdM8PM6Oxe5OKwOftQeFTf8l1NhKYbXvD/R0BbRxh2wcdlq1Q==
X-Received: by 2002:a05:6122:a28:b0:54a:23dd:5a9e with SMTP id 71dfb90a1353d-5522d18aac7mr817350e0c.3.1759305335242;
        Wed, 01 Oct 2025 00:55:35 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bedca0480sm3586125e0c.14.2025.10.01.00.55.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 00:55:34 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-59a8c1eb90cso4064905137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 00:55:33 -0700 (PDT)
X-Received: by 2002:a05:6102:26cc:b0:529:fc9e:84a0 with SMTP id
 ada2fe7eead31-5d3fe737ad4mr874548137.32.1759305333725; Wed, 01 Oct 2025
 00:55:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930101656.33435-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250930101656.33435-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Oct 2025 09:55:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjPCO=zVcY-XYWrPMy8sQ0iVM6_H5OETp3Z7sF7-XuYw@mail.gmail.com>
X-Gm-Features: AS18NWC6bgPbihdC7TOCws8KQBD_RqLtxEbixdifNkAXI7livEOC4tq90cZshW8
Message-ID: <CAMuHMdUjPCO=zVcY-XYWrPMy8sQ0iVM6_H5OETp3Z7sF7-XuYw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] ARM: dts: renesas: mtd-rom has no clock and power domain
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 30 Sept 2025 at 12:17, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Addressing this dtb_check...
>
> arch/arm/boot/dts/renesas/r7s72100-genmai.dtb: flash@18000000 (mtd-rom): Unevaluated properties are not allowed ('clocks', 'power-domains' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>
> ... I came to the solution proposed here that the clocks we cannot
> define will be marked as critical. We could also try to add 'clocks' and
> 'power-domains' to MTD physmap but I could understand some objection to
> that. Opinions?

I would rather add clocks and power-domains to the DT bindings, for
two reasons:
  1. It describes the hardware better,
  2. It avoids keeping the clock running on systems where the FLASH
     is not used.

Does mtd-rom go through drivers/mtd/maps/physmap-core.c?
Then the clock domain is handled through Runtime PM since commit
0bc448b49e8a017e ("mtd: maps: physmap: Add minimal Runtime PM support").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

