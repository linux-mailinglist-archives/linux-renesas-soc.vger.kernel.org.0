Return-Path: <linux-renesas-soc+bounces-17355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C700AC087C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 11:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 833341BC59F0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 09:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F132868AA;
	Thu, 22 May 2025 09:20:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622EB286895;
	Thu, 22 May 2025 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747905654; cv=none; b=ppL8wZYnJuHMznx2Q6AtkzMyalZ4Pwqbj8roxBpHDlSPILxH7mDo4GyvCtqpD1ukEev7Fxqi1bWxfoeXbXdryHRsx1odQu9PJsSbUvn3TzEDa0qfgel43GYsnhr0HBNO1/He4g/vQWFbGHGH3imHBYoEXZaiM8MzLUK2Nufs5No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747905654; c=relaxed/simple;
	bh=8hjrQ4o99phj5n8LXNouI7NQKRxGtSxPnWReZhMKRWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGJW8ceLUe7G69vYKTQmnvf/Sq5TBxwOq5sAPfwGt18rfcsSG6wy2adp8QxcokueNropgYzv53IrAnw5V48MMXMTkM1dBj8gVjS8FnYtUFgH6MHFRAsaNK1gceSRuD70pQYV7qltHwFD4q/vX40wo0eiZ2qjrjPdmPk5fCz4Vs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-52e728960c3so1734556e0c.2;
        Thu, 22 May 2025 02:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747905650; x=1748510450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9FyqBtIcUriSr6/yzV0Dp4PFK+1KKR8JLNCAZ04quo=;
        b=nweERMDJo8gLWRFQIaDt2RRwmrlRa2QBpE18kTwi71xWXs4mywo96j1aEvFuh/FZ/f
         Pg98q7qSMjjhOgVbx8GOPdi2aDjGYIRvpMNLLTf79v2yv5Z3HVT8q+RLygacyv0vP1jE
         SpDiLrOq9zqfFciUIlU+MIB1nHvSj8K3ChHZFoa4n534lQjY9qSXdCVUkUOAYrfZvA8u
         8wWm/F42QHp6XL6f+bfLn6/AIP/qFOBNAmlnBdZ9BmwsxsbYhH2D9N8x3Egv/CAS5dO2
         aAOMruyIfNBDBauxQH9xvXpkCYeuW/GqOnuzwJh2e0nba0s7ejf1a2Ak83P7J5CUk9Bg
         OzCA==
X-Forwarded-Encrypted: i=1; AJvYcCVDFYJ7NI+cwbB64SirQ1OEsjN/bkrT6o6OqmumBjxd+Ri83KyVS4zk+eQYNmyVKQ6kd3/6p9IBIcG9@vger.kernel.org, AJvYcCVMIGhbxCbkttt5PbwwxPK87MmEg1VQdYOAsw2iMpnKengv/sVfYv+tMvl5JVIbjGI9eP1NYM3hOcZXBk/+6o9jtzM=@vger.kernel.org, AJvYcCVSLV35EaWKLOUiRcREXyst5qw6tiLDEi/pEGmV3xxP4IhQvSAdG3wD8Y7wM1+nLCURQg++5+BYPRtnK1J2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9GT15Pcjbth4RtBuEO4rhtYbNrebCcNV2Tbw3ZT4NyZr3aENI
	ciTC3d/qp9mSLubztycSoC+3uSdISSapWEpNs4JJ/j/B5UcJDx6lb/GUVW3ZQQ4D
X-Gm-Gg: ASbGncsukrHip8oyufvmnH4gmp9RLR0HrsJNCSMVhqvrPI07Q1hoLBelpUjQ6SCxwBE
	9gEVB+1S18BR51T6OKK5Kytr+6TLFUU7yxA7h/ahtf0xLzChtvmqkEPyDzhMPfUfUl6SOCFBbIL
	K8XulM2d2KCblODoRwir/NxseXUHrIpGhyOFcMhX3SoiNlstmZlPNmIxvuniNf+6zu54FHcn/Sc
	8iclS7Hp8AdXw3kOOnLkPmFG1jTFF8Z8H5kWDRONb0yWIWf/MGxVDt97fLnr9EyCoBrs3EVqVhF
	Ab6q7ll+RnmVXWJTP3nrh48PvNga53/WMqMzn4wzqrVm5ZGQ24swFlePiobgq5zI/hbnVwAir04
	YFg4/gpB9d58XIA==
X-Google-Smtp-Source: AGHT+IHgxN4cXqvTw5PI54D6ZeCMIasqPA0qVj9E8911qaFnzm9YvOYGy52bYNjNlvs/iMBU69vYxw==
X-Received: by 2002:a05:6122:3bd5:b0:520:5185:1c31 with SMTP id 71dfb90a1353d-52dba94ac39mr22402586e0c.9.1747905650132;
        Thu, 22 May 2025 02:20:50 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e983sm11464661e0c.31.2025.05.22.02.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 02:20:49 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-87beb9976e5so1217552241.3;
        Thu, 22 May 2025 02:20:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWe31s86yzK+oLSvnWfJcQ/eB2NbZi+d1oQFJFNJtJVmshD6+MJKAQKs1UzWyI9f510WmVP84SGXrb50FuxxJ287HQ=@vger.kernel.org, AJvYcCWsTeS4DBOEhHZBLtq6A62L2b8T+jS3pZRZXXpmPnJ1vTDqhE6WKYgEgT1bd526TWY++TBQze6Yx/64ocin@vger.kernel.org, AJvYcCXgsgsF/WpGdD4QqZ1x8G9/4/VajwbLlrQz7OIOiJ0ihWgA9aNcc062wgRFC6yovdaHOeQrscV5l4wx@vger.kernel.org
X-Received: by 2002:a05:6102:105c:b0:4e2:83c4:92a0 with SMTP id
 ada2fe7eead31-4e283c495b7mr11218776137.16.1747905649098; Thu, 22 May 2025
 02:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250514101528.41663-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250514101528.41663-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 11:20:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWaZaScRihVk5d7cAzFTh-730MwZf84MEdFFBFNzzhw1w@mail.gmail.com>
X-Gm-Features: AX0GCFuTLnS3jBwXIku3alhVwmphmPKcurd-weN5o7EoVvqwjDFOcpVZOtoW8hk
Message-ID: <CAMuHMdWaZaScRihVk5d7cAzFTh-730MwZf84MEdFFBFNzzhw1w@mail.gmail.com>
Subject: Re: [PATCH 09/10] arm64: dts: renesas: r9a09g056: Add Mali-G31 GPU node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 12:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the device tree node for the ARM Mali-G31 GPU found on selected
> variants of the Renesas RZ/V2N (R9A09G056) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

