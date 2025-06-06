Return-Path: <linux-renesas-soc+bounces-17891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E4EAD0159
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 13:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40D5517615E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 11:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D74F214A79;
	Fri,  6 Jun 2025 11:45:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DE31E47B3;
	Fri,  6 Jun 2025 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749210332; cv=none; b=pfPN7YihBRI+n6QwUBRTwej/IGo4GEUDpCzrWFfgaKO2yHF4KqlnsgVe+Uvl2EzmTq0dx6zAFJGvBJykmjpe3ygjqqqaTZiZQu0LodrF/k7jKKDuImo4LLdp2Wn0jK6WmfZq6YmPk5n/mKo6VS6f9IRndQcYqyOupIetule/ZQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749210332; c=relaxed/simple;
	bh=pBBtJFnYmIG50xs6IyBYD32IyjLEgxGwTo8+5EbdyKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FrE41LRdAA+9b0Buz+BevMAWj0vwag8U7NnwFIK1euakPxrBFDrTzuBa+NT7ZWSwtINXxqhkGbqxCCYjlomjh1WXHcvrEm1fUxGrhhwaadSF/OmAE4IIxaLqj4EtTrKEfUdVx2yGBPA0Ce6Xp/06I+6xBP9r16dzOlj8Lmtee2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-52413efd0d3so682787e0c.2;
        Fri, 06 Jun 2025 04:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749210328; x=1749815128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/AA2thBkYBRTSrmKbacqRtsRcQ9H4ZTCKUlsZiT20c=;
        b=wI2aHHRLk98Xa+l065EX1/VFYQN5bLXu7wuftG34p4DiknreiDk18rm+dqDCZh0lKO
         kr2XoQmZtGEAwVktdurJlt8gpcWp/czQBfstuI5qHvyy2vdtYZwM4xXB5Hgfnul80iBv
         sZHUmacceIEEaFEWufQv5szakCY+zei6PjR8SxNG8iOHVAD4HHD3Wl62NRy5d50V/0qR
         Y5s4RWjn/v9GC7K4Qd7NINWkLjcDv9iReBK9MUBTe8FwuXWzuHgxqHoiJf77Q84+XaB+
         MT15+tVIlyRmrNO5NtQ9D54AFk2fftzdajZId/ZcarztAJhvDtWIsdcQPI8WFKyk8oxz
         amiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSTa5rKMTDZaCkg8RlRiBlwLe/9ysFhXvTRJu8RWgEljGbm4kC4CTKICy1u+XPbx8EVfTf5lAv1TN88qtjF+3zOy8=@vger.kernel.org, AJvYcCWw4TW7fya5LDXvFl6zswg0UGw3iwYcKVcZzG/8NAhU24xGiH1wQs1Q7o/NnFR6VPT5J3G2Us5oHht3ZHtc@vger.kernel.org, AJvYcCX3IAPFNxLn1FcPohm7nHFouxN/E3gg0P3eQTR2m2FdOlEjS/X+2sZR/O/GATW0/UPTbMVqxcEONo0U@vger.kernel.org
X-Gm-Message-State: AOJu0YyRo41MVVsYeSDZDFAKziATQ/oZcx2CcB9NiEXg8GxJ/75mX9Kl
	iJLODlDHK9pe9DunsmuMHxg0SxwzVp+2zYfSPjAL8W6QOKd8VSSQgrWpNNtV6Lud
X-Gm-Gg: ASbGnctRbv9axXurtSS6eNSzTpYzJvcd7Jybf8ZSSfEHKooBxE/0dVe37nKjPOYYtb2
	/4t57t71UybjDqyP+Ffv9uA88rjlc6QAIuPu8AA6GbFI/43s+URp+iScJ3oU7bOGO2bo303vZzx
	WWs8t2s29upMZfHCxqVGL8EhSyT0EIS4joiJjWFmRy9c8mVMVbZq+C0bxyiXfF5f0YxShQ1qUYe
	REtEKqoUCIhK/E1f6+qxq6Tnx5O6pPK43VY7sm/oM9nEVjexq7NR43wACZgTuodgB33TEUyL8V0
	cddkeCOB75h9osvaI2+h96wpkmeokpWDACBMs1tL15UyMSalR1ZmVz7hrwFvudfN7KKN94S5TyW
	JYxDhDmtItTKydA==
X-Google-Smtp-Source: AGHT+IH71oNIxZ+UBxKRrJzzaHrRgTJrTF9CvkgGAT71mGaGsN/hNJFpUYlqcho7DryKfzfnuQf0Xw==
X-Received: by 2002:a05:6122:3c8c:b0:530:5f5a:1362 with SMTP id 71dfb90a1353d-530e48ca52bmr2299372e0c.10.1749210327664;
        Fri, 06 Jun 2025 04:45:27 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-530e6427aefsm932909e0c.42.2025.06.06.04.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 04:45:27 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e6312895d0so542901137.3;
        Fri, 06 Jun 2025 04:45:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBoL6/YVOMtAi+agx8St4gQ41xX9TOhyJipKGhgrw7E9Od7U2LNIuCD3EjvIHCApjLchMrgdXcKBAOGFFu5ZuEXUs=@vger.kernel.org, AJvYcCWqJ7O0qPB1Dm87APSmB12+r6BTNTLLVAviaWW6QElwp0yrSnBuxDf77SkosP2OC1g8Ucsn4k9fvGlR@vger.kernel.org, AJvYcCXL2osFaUMfXt0opJujsWWnVBoUKZRmELG+K3G7Z2M7y+HOO9rr55Wlh63NHLo5lk9fLDLvmUbhB5VQTO2g@vger.kernel.org
X-Received: by 2002:a05:6102:8082:b0:4e4:5e11:6848 with SMTP id
 ada2fe7eead31-4e772a02124mr2374263137.23.1749210326790; Fri, 06 Jun 2025
 04:45:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528133031.167647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250528133031.167647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jun 2025 13:45:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6SSTV-O5ejf5zWH+ZP--g2R8OYLoBSrYU3b0dKqVGWw@mail.gmail.com>
X-Gm-Features: AX0GCFvscKZ744xaTrPRPezQ-0dPxGY5ctzKoeJh9okkP8uwXsx7PAhDIZbjQrE
Message-ID: <CAMuHMdW6SSTV-O5ejf5zWH+ZP--g2R8OYLoBSrYU3b0dKqVGWw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: reset: renesas,rzv2h-usb2phy: Document
 RZ/V2N SoC support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 May 2025 at 15:30, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document support for the USB2PHY reset controller found on the Renesas
> RZ/V2N (R9A09G056) SoC. The reset controller IP is functionally identical
> to that on the RZ/V2H(P) SoC, so no driver changes are needed. The existing
> `renesas,r9a09g057-usb2phy-reset` compatible will be used as a fallback
> for the RZ/V2N SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

LGTM (I don't have the User's Manual Additional Document for RZ/V2N)
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

