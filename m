Return-Path: <linux-renesas-soc+bounces-9512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DB2992B07
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 14:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DFD3281029
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 12:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20A51B78F3;
	Mon,  7 Oct 2024 12:04:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12FD18B483;
	Mon,  7 Oct 2024 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728302677; cv=none; b=hIpoDmw+NUcpPdPQ1BPTvnKRXEyPGt8xYxnVCnqMyyu5fLOMkHmdFLuo6+uibRfMIqg8bMoKGJpaSj8H/n09dxfccJ/Ay73tyOJqxYEYGeV8I0u8ZPLHIc8dhObZY8IJTKzSzbCh0NTdYugqkrvCzkVsAJNmzxgc9T/FPyrAANQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728302677; c=relaxed/simple;
	bh=OO5L3AkTwwSxScX+wqF0fbIjeOOiGboLV7Xk4UoN/Lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JeiJ6+rhdHbKMk3tdFNDF+tX7kG7P+wwcE0vnoF+R1xxdUpy6Jkxgclw6OD9BKgfP1MFpqepVbJdLRUFl8bdQ+LgISreLhwA8PvERXYJQG1u2zwYXisTBrLE4h4gEBbw4KXgBHnp9Kry95d8oOPGTQ4+YRv4aehxJeZ13eTP/lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e2e41bd08bso12552057b3.2;
        Mon, 07 Oct 2024 05:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728302674; x=1728907474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHR+VjwhqLd7anH5JbP5AfAXaIeHrCmlq5Jd4+j8LMo=;
        b=euoBZTw0hAAA3Q82PIK1BFjoSCYLVHZWcPrvDlHWPxUyyDEcQZ1fQfGePLQQXIEB1P
         ZTo96ykXu72DVCb9r6WC1lvcee74Pq7XjlimhzsUQhW9FK2isBrwxe1lp7ogTVfvdFHK
         sK21l6a/csnScp7D20dUk2I1/2U3d/DDOO3hsc8p77qtTHkLd0a2DwoJrj4MkNtPbgNa
         dzr0ZpSL06vWENnAIjZzO6bJGcJlR70MhkqlvFYvn+WdOv6vaIAVFbKWtwzdWlDspbCs
         Ropuq4MncsLm9uE13maJGoLES1VOfD5MPiGNpRzwA0DlzPbZuZsmyYH+4ggPY5rDI4hk
         kf1g==
X-Forwarded-Encrypted: i=1; AJvYcCUoDIbHQD/LzzPY5hcDzHctIxPPE+9mjner/Qa6x54Gvrphcv2vB1EMWsu1UnitzI3Idyh2FiD5T3yx@vger.kernel.org, AJvYcCXyKG+H0sX4K8BqBRclER8QgO6SfLh3mUoCTG0wHXmoka//rBeJFo6tpJhPhgBVdEsQCJ/8rx4VfJIcGeMRPddinL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0WyERMlKi/MaXoYbwJdQGqZyEh1Und69E1P+V+tjh/LKnyeJH
	sI4A2wGMECKxdUrAGdT35EkwAaRqPaLW3cO3c0bzT0oT1ZxXQDKxo0+Z5sCj
X-Google-Smtp-Source: AGHT+IGhyUpVRau6aFGdv/gmvvaO8ozGTic7v/+E9zkZtsf5/rL0+Oa7Tv5GRZLDnVRMUyp6SDlG7w==
X-Received: by 2002:a05:690c:dc7:b0:6e3:bbc:338c with SMTP id 00721157ae682-6e30bbc3735mr458797b3.6.1728302673968;
        Mon, 07 Oct 2024 05:04:33 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d93e6134sm10065997b3.116.2024.10.07.05.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 05:04:33 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e2e4d16c2fso10595877b3.3;
        Mon, 07 Oct 2024 05:04:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWI1xcE7Q7FXPdZ8eiCFudQ6suaoKpFlqJqBPlGsfmD/fMHURALwAWMuDr6RVKtnUz3h9/A7XgbD3XnHw48uZWmds=@vger.kernel.org, AJvYcCXI9lM33G3UsFo2qMyknGb6VmBixNYGLXhJp8rd6U+5RxbTWBoEgVzRxwMP9pEjK9kOkl/Ck67Ed6FP@vger.kernel.org
X-Received: by 2002:a05:690c:2a41:b0:699:7d04:c7b4 with SMTP id
 00721157ae682-6e2c7295014mr63104137b3.31.1728302673050; Mon, 07 Oct 2024
 05:04:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004173235.74307-1-biju.das.jz@bp.renesas.com> <20241004173235.74307-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241004173235.74307-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2024 14:04:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiHAfZ8=USSiC+mwG7czcBHizCc16GMmrJ0R6EUNihdQ@mail.gmail.com>
Message-ID: <CAMuHMdWiHAfZ8=USSiC+mwG7czcBHizCc16GMmrJ0R6EUNihdQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] arm64: dts: renesas: rzg2ul-smarc-som: Enable
 serial NOR flash
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 7:32=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Enable Renesas at25ql128a flash connected to QSPI0. Also disable
> the node from rzfive-smarc-som as it is untested.
>
> Tested the flash by flashing bootloaders:
> flash_erase /dev/mtd0  0 0
> flash_erase /dev/mtd1  0 0
> mtd_debug write /dev/mtd0 0 ${BL2_FILE_SIZE} ${BL2_IMAGE}
> mtd_debug write /dev/mtd1 512 ${FIP_FILE_SIZE} ${FIP_IMAGE}
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * Updated bl2 size to 0x1d000

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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

