Return-Path: <linux-renesas-soc+bounces-24874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D29C7319D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 10:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0EF9F4E196A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 09:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DDB30DEC8;
	Thu, 20 Nov 2025 09:24:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97C22E8B64
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 09:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630648; cv=none; b=Z4szPhse2B8r/w80z+o9ooMEi27bsiqKsUvE+XC6f4wTbt1XWjxi2Vkyz/fdMe4jv9TPFKVwl4Xy6rMnnEFprSqUTajWrCYQ5NlnLDakMQi6gRuSWoYAbBHQJsQMQtfTeSoVwwsMVWfxbN9Fr8GLEw2k9txXhZMoAKhitibLsHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630648; c=relaxed/simple;
	bh=a10FwSnZ6h7O4JzPBUE1cuLWvlgXV6UArWx6wdtuhPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h4u2AQbJpObfskeSyfv7c/T1ljBdYmMna6/OobArK3N7EcSnXsEIQ6RVYmD4pLAbaggkfVupdoH71OngHm1Pk5chyrkRoHOeHpjkPU2UKYkKp4qKbS6ODht24FlAUDjyirQsjc81+1ZnTFztxB44r+dy6faxAq+k4b0GR+pfZ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-559836d04f6so430891e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 01:24:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630645; x=1764235445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8o8r1GpDwUJORRxm63Ljl6au/ReuZjA8RcKLwzb8wA=;
        b=gV9BoxC3ijh4ZeJ1Uta2tlbWTqbzVJ9ujp/WFEroOmOARviw1DAcJKkIV1lUK+Mpiv
         ++za77y4W9eG5KDHhDuFfZlQz3Zlc+aLxXNQjFycv/GB2SG76WrLK4KcQBrA8jcP/kvu
         np58QffHtI0qGHvsNHWg4mT+M5Sk3aI/HyrSJ4L2DC5v+oOYpSWrKfM1ceQCY6tEpmvd
         fvMuSR9vjjNEZbqpesqpf5m0ui17ZLBP6EVneRpbjrGx0pYyGLpI0gzIj1VbsQTo5MaJ
         Zq6uEeMY+UUOddh4WbvThhDwbGkI42W2ZBGrm918yuPeQF8U3zuICQlU/MPDG0S6eODf
         FYow==
X-Forwarded-Encrypted: i=1; AJvYcCWFy11I07XDOzOjwcTds9/vZALiqY+pF6ASJ0CS0gNa6c/AVaJ69Nmg8eMlYhGbzdANgVtHjNA8ttktb1oGKsVr8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQy+vi8ILOxjrqSlQm6rSk89zpUmx2PThbGDyBmdkZAGL6fFqB
	6gKwn8ratYZB957UVfuXOe61YoBPfp1mbmZJZ8odgmdEdye49aEMLx+6SjnkBlWO
X-Gm-Gg: ASbGncub+7w2dBGnH6u8nhsv+D4eNXRNdGH2w7GVhesIXee84Hv0S+a33ZNMg39uPWl
	4R5e3hzqqm61dfgHLeBbhLtrpn95OQ9c4LoyTDeW+/a9YCnvzhO5w5a3fWQ2jmFTTpoNhrJSL8Y
	KA4HH+8lic4jQjfLUlgEOWCLfOP4MU/ph8cFo88qsdEdil93wUX1se5z9mXHxO4xJEVh+OGviP5
	s52mDP5+I6zrPD64mBD0G9Q5eGoIqi3fXjLYyrpuVPRtsp4E8Ar5h5kERGvavW3Lk5w+fT2BddP
	UIMYbmyaAHgFmj4LJgXQ47jiuTfaussdrHHS9LXdy2XsksnV6cpurRkSAgvDlKEU7PiX6ocZzhT
	Luu/gQVyMIL8MxhOTm6RV2eYPdxQJqFTyCAxO+nbypGWYSMBPaNYLT+ulmbCvgS6rM8gWlOO4Jc
	Hf7zmbiA9cyZaPH9+5oSKehWCOXuurMmw4UyoJGyqJr5wgdRhARsb5
X-Google-Smtp-Source: AGHT+IGJwqlHr4EA1F1zsAQsN0e1s2n9IIcUcmXedkUZoaeE/0sFkidOMaGrJicr1elsjpQ4g2a2Bw==
X-Received: by 2002:a05:6102:3584:b0:5db:deb6:b261 with SMTP id ada2fe7eead31-5e1bbbe7f80mr866587137.13.1763630645402;
        Thu, 20 Nov 2025 01:24:05 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bd968762sm768951137.4.2025.11.20.01.24.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:24:05 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-93728bac144so389025241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 01:24:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUx0+SuGcpHHISD7LRZKQUWYITTL6VQqExU/23ruNfhXdHGfqfOIAOAqIYsJ6aVAIZ2VTacB4Fn6WZEXcT9zwZUGg==@vger.kernel.org
X-Received: by 2002:a67:e7cb:0:b0:5de:8ce:3cb0 with SMTP id
 ada2fe7eead31-5e1bbb4a766mr909180137.1.1763630644874; Thu, 20 Nov 2025
 01:24:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
 <20250916150255.4231-8-biju.das.jz@bp.renesas.com> <CAMuHMdX6+ckjLwZ0Bf1F-JcOUs1PU64vosv_bBkjcekE+b+VzA@mail.gmail.com>
In-Reply-To: <CAMuHMdX6+ckjLwZ0Bf1F-JcOUs1PU64vosv_bBkjcekE+b+VzA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Nov 2025 10:23:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXHqvfUXWKSpYhzNQX+k2PmhxPXkj7dMzvhKDqHWRjNQ@mail.gmail.com>
X-Gm-Features: AWmQ_blZPoy4tg_dDksEbJSM2lMk_66tIgBDCIw5C43-P-2vA3yIGiX_rm6d-3Q
Message-ID: <CAMuHMdXXHqvfUXWKSpYhzNQX+k2PmhxPXkj7dMzvhKDqHWRjNQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] arm64: dts: renesas: r9a09g047: Add USB3 PHY/Host nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Sept 2025 at 14:22, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 16 Sept 2025 at 17:03, Biju <biju.das.au@gmail.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add USB3 PHY/Host nodes to RZ/G3E ("R9A09G047") SoC DTSI.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

