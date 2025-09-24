Return-Path: <linux-renesas-soc+bounces-22316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9FCB99D02
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 14:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A59F319C71F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 12:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CF9302144;
	Wed, 24 Sep 2025 12:22:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5DB301039
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758716550; cv=none; b=un9Tr6Z7VMPLf0junfzBQvUIabtEfCUa8F51ZWd8pcz7CAO5WOo2BajNFKPkGNjm8b3GWhMt7gbk+VcCoPqhPWfyPG9Juy+4I0jduQMbEb38duEnLx5LJiTN3loNT9SQU44s2HItIZ2sy1mnjn9ipSuO3c++kvfpbxNFRY4WV5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758716550; c=relaxed/simple;
	bh=J+bHTCrNvT6JUuzJJC8KJ5RBgdPM1Xs3UX01bYjGbnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKlgWmGx06oyokilhQo3TtMqOU7qksCIZqZpNx6QMBCk41WsElugCzo2VyxawmYfFPIT9JnbV2iL2n7UkdqBGe5vIhKCAOPUH/6qtKHQvxl86efHIh+MAtHpskRvCaEmGXvySFplaEmRHtAG/nbIvALOvC4bRlcAz/bMU1kASp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-50f8bf5c518so4861239137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 05:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716548; x=1759321348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXklmRbRcjEr8jgTuTVa6QuOaAAvv4IbKTLeIHUSW68=;
        b=GJ77CMm8BbG+ZSpl9RDFDpd8GCA1Umq1aq7TySZMLvR4UXC2CCkVfCN9RrTaki4Uri
         LFdcr3AxhOI46VUM3U2A6TTcProSn4H2OdPPQD+1vXjHMdF+Ss7SfDr2SoYC73nKKT0y
         /zAC2cAfxXThlYGW1x22SDSoaWJurnpGrEmsZNfLv1WGbt/v200KINL5iOj+b9SuwfZC
         8xTlWbW2zIlFL7iHQRk0y/p6le6Ah5dsgcJHwERmPoQGWsOCqVdhQ6B516/m++aaVh1a
         R8Oxi9UjaQ1HXpRzvQiGYpn48Bf9Pd3AhH/jaXfSu/ABgTTZl6O3ZrLi+vAooRz8GXqo
         9ZQw==
X-Forwarded-Encrypted: i=1; AJvYcCU+oNf6pxIjRWJe/Eq/CX845AnN+xQALBX9rW3tziUofgm0P4Y1c+Indyo40UcUIC66B7fde7Rgl9p+GFWqxkbU/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFMfQ7UhIFt5XBBcgWLhfxv7dJ6L5GsRdXmkmaU6jxLxFDo4At
	5th98eG4ulhF0JUbMkoojgQXf5jTrIJlRoL/fN4ynUPc+n2w7ryGYRf+koiJyBUa
X-Gm-Gg: ASbGncvhJsPCXZwH5y58A1oQ0dpTBHmsYiEls5dcFPgpgK1FeuQkVXZ8tNPSv2DXMbE
	K0PSrAPfav/kihluO3Cgldt9I91bOGlnSuOkb1ERtXF7LoLFz3BDCOhUHX5hbFPaoZi7CCPaoqL
	X/YPeWkhZBFi2wEwItSUG6G6XCII2gJUYVUaRg1HsA1ANtOBgFICQedbb6kV2567Upx4ZLeFwau
	zA7DBDrWzqS0wE/LwKQ0seP3345NyfXYYUwGdkdQPf0BWSLzozxPxmoEE28Hfi9LCAZ5NOZTL1J
	VUq+DwiZ87qfsfMkPpWb1Qdg5lI1jzpdDdZlby7xmkVYWpOTR4pgsVbWg4/PzBuAn//hzQs9n4S
	atkRzt9KC3D9ulgZl0ioduYwEeyDy1VCh2pOzOn9CCK2FJxqvMF+Qq0dgA2Ymi2fz
X-Google-Smtp-Source: AGHT+IFd+LDHg/vX0GYmuz8bHOP5mmmTRHT8hEJN7WkveHREDHMxKH8yM6fvxLW9xQTGLX99gi8aow==
X-Received: by 2002:a05:6102:374c:b0:521:356e:2883 with SMTP id ada2fe7eead31-5a5750be4e6mr2222191137.7.1758716547632;
        Wed, 24 Sep 2025 05:22:27 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-598f2cc03bcsm3333450137.4.2025.09.24.05.22.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 05:22:27 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-54a9482f832so3064597e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 05:22:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrMSEZ4r7KJAJo3EWH7BPt+sheeh4/6IJaymu9LUIOAmsC5Q8+x494kBZ5Ib8X74gB2s2BsfIHTvk4a0AWB8dRbw==@vger.kernel.org
X-Received: by 2002:a05:6122:1d45:b0:54a:9433:2aa9 with SMTP id
 71dfb90a1353d-54bcb0d4fc2mr2193731e0c.2.1758716546950; Wed, 24 Sep 2025
 05:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com> <20250916150255.4231-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250916150255.4231-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 14:22:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6+ckjLwZ0Bf1F-JcOUs1PU64vosv_bBkjcekE+b+VzA@mail.gmail.com>
X-Gm-Features: AS18NWA93dITivbXBnRhyAUt72W9JLfoCXO5SKCmeeTaB-m6uWGCJUFKL32jSiw
Message-ID: <CAMuHMdX6+ckjLwZ0Bf1F-JcOUs1PU64vosv_bBkjcekE+b+VzA@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] arm64: dts: renesas: r9a09g047: Add USB3 PHY/Host nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Sept 2025 at 17:03, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add USB3 PHY/Host nodes to RZ/G3E ("R9A09G047") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

