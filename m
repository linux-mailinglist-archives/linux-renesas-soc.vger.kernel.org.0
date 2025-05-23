Return-Path: <linux-renesas-soc+bounces-17432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D99DDAC2214
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 13:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6EF5189BBE0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 11:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260CA235067;
	Fri, 23 May 2025 11:37:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72F0221D87;
	Fri, 23 May 2025 11:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748000255; cv=none; b=gqvQ9ywY4UB/PlA9EaDr4hgxUGDK94YzdDIdDkeEc42Z3cwX7KaEurPcCQDKE7Qn9UeKOq7H75r0R6njWljPG6Xfcjdt3XgyfhGVcsSXiY5JxZylqyZNBlhSLQdx80T9yccNfLvNVL7H1HW3mBZHCs1x3ulsYlTBZsAwBq8wbWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748000255; c=relaxed/simple;
	bh=RPNi1QDrDr0oLkHY3jiUnnyxRMbcBwEqM+TlcWJLhmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BuuLdVjkHp5HfwuF5kyzvINkAXFz7jdJcRGYX5X15+f0fXTPnw1g/EJVzTbi3cLAVbttLjaad0a89scd5d014aTIG22a8lckr4gB0u/ckY0AikPclrXlx9lMjZMCNYGuKrHY+iEgzp8p/vuElbYB2fleKpVtUZNcw16uBbDiMtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-85dac9729c3so866195139f.2;
        Fri, 23 May 2025 04:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748000250; x=1748605050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wlzvB2Q8r8iVI++Q756y7sEw+0J/OE0zl08HpFQmKI=;
        b=IFZwEXCBSidXRRD9LqASXnje2ptY/TbQOkgvAe/cUKR9wjcBO7R//JCYxLQjs6m2mI
         orLVcu+DLa5qWRdxMrWW0xJj4Odgw7AuHVGtdBEXpWfRK1p2krzm71ozd9pfm8/Y0GaD
         0rkKf4CEXxZ1J9yK/uFlPCXbldK4YrSOfVYSV7xN853zjmLdR4/eH4sNlsnZtU7gFr4y
         df4InMuR23AhkxvPuDBnD8Ly9VowdvgyPwXixebb8T0eFNwM0DNWxZj81yuw8833lIWO
         y/y9+CkC12ncZYpgWbwfxxYK0dGj+pvAHUjgjDWhWfVHG+txWoUB2Ob5xnSAhM5l482X
         1tVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzRNUn6oJgsMYUR5PBBkbeDR9Ro3iJQ+LbehagzEzyuVWbKXYliGgS8nLnQXx+g8anitvYwER1SeZ0mng=@vger.kernel.org, AJvYcCXu8E7zVBpTz6nHQGa3MrmTbxMswPgzp7Mqq/MTJ3FwzaV7JZHDwgzxwEDhFVrqA2bZppaYo1XxALu4bwQxH/5rFRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1xSX+/2GNRZOTw4V0sLZ/tpIxkfbGZ7CkANp/7S2xZsgD1iOu
	K/MNsGJr8R1mYE5BWuVAEJHcnxhYdTu0mJF8Qn5AVxK0rvi5odI3YBrcpWNE1O9f
X-Gm-Gg: ASbGncu+oLVmUeR+L59Zcnvz5BPYyBOs63qsPpmkaatix+93wdpboX3QmuXGjQHBwSB
	zztLBfX5ose2MhkFALvMEFs5im59YBV46yyiOnJOsg8TXI0ZYP5ejM2jP+9gRsNWFO0vQC57GI3
	uApmFqGMz/TnA5qCBNgrnuto4jyDiNkvInS9o23KkP8vJUWEQuagxJ2xD1ECyDmNLXiyCbKv5oj
	1AdcmQgT0K4G0gjG6kmBLQr6u7+irczPgQEu3DxnAYcySkNlKBXT2YzehFQWhkEa7ex1z/t6ZUN
	QIHLX1cXX1/sVe8a2thg+ZeNEf4RzeLrhlkCumcTmA3Pz700gHUG09ZO1fwZezx4FFI+k9U0S12
	m3ttRQqrcur7m1SmAbQ==
X-Google-Smtp-Source: AGHT+IH2uEsHE/YAObvEt/LSD6+nx4WMqZ1snpyvAr5Jwsf7Iwj2NQBWE5VLPgWfDFloVuIKNExfuQ==
X-Received: by 2002:a05:6602:4186:b0:85c:c7f9:9a1c with SMTP id ca18e2360f4ac-86a23283c78mr3814209339f.13.1748000250611;
        Fri, 23 May 2025 04:37:30 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc48c5cdsm3585753173.84.2025.05.23.04.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 04:37:30 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3dc6dbb3d58so45312415ab.3;
        Fri, 23 May 2025 04:37:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5bT7uPu2u449LTaor+TXGV+xQnMEd4p/hQxeo9erZgTmx3mlC4k1g5Y9mNly4tW0WL6qZFhgGgSuI0kAs377D6y0=@vger.kernel.org, AJvYcCVfwBaPgjZQrKPv6q66Bv9eaS5wHYqGDvl0ueD/rR0oyzk16Sow40A7sugEq9nlohIP141m31UV7RBnU58=@vger.kernel.org
X-Received: by 2002:a05:6102:370a:b0:4c1:9b88:5c30 with SMTP id
 ada2fe7eead31-4dfa6c62d03mr28083060137.19.1748000239515; Fri, 23 May 2025
 04:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513125858.251064-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250513125858.251064-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 13:37:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLYuwVU=9FnXoYYXzA+XYoSc89MBsTzAyZQAGF2cVvFA@mail.gmail.com>
X-Gm-Features: AX0GCFsYAsYC7rTS4r0G9iHcLPTnjlp95PDD1ysnF-SrRgCKFmwYpC3XJI0oK_c
Message-ID: <CAMuHMdWLYuwVU=9FnXoYYXzA+XYoSc89MBsTzAyZQAGF2cVvFA@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable RZ/V2H(P) USB2 PHY controller
 reset driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 14:59, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the `CONFIG_RESET_RZV2H_USB2PHY` option in the arm64 defconfig to
> support the USB2 PHY controller reset driver on the Renesas RZ/V2H(P) SoC.
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

