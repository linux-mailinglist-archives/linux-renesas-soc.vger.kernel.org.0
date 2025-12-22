Return-Path: <linux-renesas-soc+bounces-25982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDB1CD62B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAA83300D648
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3C32F361A;
	Mon, 22 Dec 2025 13:35:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F612D0C9F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766410546; cv=none; b=MqHMoXh/VNfsvv5NiENfhX0JFLyVMThEmccrljAIHAPH3AZZzBAQZVvnWbqF9gTnQoPg6j9E2+Osx2S6W3FtA3YHoqU0CBtCyKVgrquK9vpoiDJH3OKludtFShpRJa0rAKQh4OzzEE6YdYemQinU/ntPpgwO9XF41a//6pw8D2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766410546; c=relaxed/simple;
	bh=c5GGKTBa1YdXkviDC/a3zrwxMQRkENiptboYE0Yhpik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhOFQ5Yv3YssfIqjiUnnwAWMgMpPSM3wvCBfztqbxdEC8wEicv2nwxvT0VvBKYcLNMUCbiPPROAWDg7wG4/oNiN2BUu6RZWb0prHbQ3BjcTnCH6jsEs/crahsufYOgkNK3UhsL8q90wJ6rOgfY/15CceqlUryeO8BrVl9172LtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56021f047d6so1105562e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766410544; x=1767015344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9NcMOMiMfJ2J68KTpFEUPkBlcj/EOF1JiBmguWQUTc=;
        b=coE3sUcWt+iQMEyOe8E7//1lI+0UYCXTP994Bg6BPeisSCBLt+nVI4NMnbQ2VrJ633
         p142bn3vND7lqJZPbVmHahxKpgozMC/OxzkxCeKYTqvD+PcA/5+L4gcmvXtRUTk4Ni9b
         ZTmKD+VUne5ZNtnLZIGnwI01cnx1EjY0OKLzF//lJSJuHXuG+8FeJf0gVWxZNiTqoS0b
         5OPRJYXxEFPZvewGkm+n+Y677TJvbUz0HJF9F4mxZKVWqDMC8dIpvlxnfdq9fU+FrAzb
         I+dGlWoDtH0bUwSKEb7z9V1XsUYQd/tEyl23hn/qK0nJfex72lZuzgkXht+joFgQXlS3
         DtTA==
X-Forwarded-Encrypted: i=1; AJvYcCVzv34M5rCD2vD9aelznBQ6ETNhaQsxpAGi380uaFwI6ZSibvwgwdgp81bcAH59cV3VyaSlwHtc8aYBtsATQGQ8iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0rIEggUM4FC3lG9RvnSnoWkXouL4ddk0ZaNSDil4DJzobr6jw
	wB1L5w6LifELoLk305MGhpy6Cjv/08yhuHXX33TYJnyUHTspjvMuBLJAwJIMWXlc
X-Gm-Gg: AY/fxX4iEMspBoNNXs/rljiezZXRjYKW44TJZqjwpCEJgLMrkf1T6HbhnlQ9uc0vXR7
	ySemFqzJKyjeQwL3evYCNdeYG224rjMhfZ1OsxtWcJKIqdC5GwwNG3HyEkbw64RmN3mRh18BYie
	K8GbB8RbsoO73dqloAOkNWypuJOoQqLr3lpwGSTsO5lSJnuqrr/EljieutI2DUypyPjq9A8eaOP
	+YyR3fAmTgITydZAW/bomm/J9yL43Z/DnAAm4jDWGSG/pUGi+meLx5kLBpfSJTCdFNL75Gq7mxB
	qIiRyJzbmS3Cmtoe3SofujI2PoZ53uxT/FdTatelwp/PNmhrLHqqSb7nhPLkJaQg7VKSOPJiFfH
	UnzrDiA+uvFL0E0C58CK+jxM+TzArM51M0rn6FWHKEHEUOxLc1QInqzpA41LlfA1VO8piuLNGey
	GGbKeIfKegzLY5lZsevlC3dtx/gZdFhyBtxdNUkPcCq/KrEN2G
X-Google-Smtp-Source: AGHT+IHasKBb63vz6uXyX9hfQMDAFDX9sZwxul8DIueDavw7ineROeIjpKYZuNogz0z8GMSgli6edA==
X-Received: by 2002:a05:6122:250c:b0:55f:c975:bd9 with SMTP id 71dfb90a1353d-5615bde8d81mr2929348e0c.8.1766410543994;
        Mon, 22 Dec 2025 05:35:43 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d132efesm3388110e0c.11.2025.12.22.05.35.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 05:35:42 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9412512e9f3so1098960241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:35:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVa+43BTQDdJ0l2VpGY/ELYWvIN8Yv+BnNey4KJWNvqac4q86X/WXG9UXW2LZksSg+KVmLZBXUOUS/P4/w2pbX7MQ==@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:5db:cc69:739c with SMTP id
 ada2fe7eead31-5eb1a67d6f5mr3004540137.17.1766410541913; Mon, 22 Dec 2025
 05:35:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023212314.679303-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251023212314.679303-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251023212314.679303-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 14:35:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWmakH92vvuooV12Ad=nnF7ujuAn6ga6_y0-0Yo+wTvgw@mail.gmail.com>
X-Gm-Features: AQt7F2oJ3cfLiw_0b_v_DXw8QTxfiEIG8ptx2ZrgeIzVsgXhg_-kQxq8V9KQCqE
Message-ID: <CAMuHMdWmakH92vvuooV12Ad=nnF7ujuAn6ga6_y0-0Yo+wTvgw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a09g057: Add FCPV and VSPD nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 23:23, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add FCPV and VSPD nodes to RZ/V2H(P) SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

