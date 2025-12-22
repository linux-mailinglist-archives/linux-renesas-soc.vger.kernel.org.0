Return-Path: <linux-renesas-soc+bounces-25980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11099CD61BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6022B3035A4F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FB83112C2;
	Mon, 22 Dec 2025 13:15:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9C319D081
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 13:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766409321; cv=none; b=EI8ONuiaQJznNPWDyEb86B8uItK2eMTnPHqiAP7z/SOMbSJhqTs6bI2Mo9f9hG6Dao0LlLgiSCl1acj5dnSq8Ba2UBfiknFTu1fPe9gs6/o2s0FaiQlrbTow547WXBf/7doxCcsIVdz58nijD3TEQuNOcjr/W5WUMgsJTBMNpsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766409321; c=relaxed/simple;
	bh=ZhHsW3S9YUoSjegy62mPLAlBStOAyYM9jqR/nYd8tPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gwM8EWD1HZhr/yrJq5LfbcPRv7F5qy08H5cdHXOvwzlSzlA76xDvfQbS9gRnh3OP2Ybw+CgofxNcK7L/M9lOJaCdpih9SCBCIC4+8pk4M8liirR8i5Hh3t8cqIZbjpzg1fPB4bVtda/ZvyVvxEbH0b4MhyjnFbDVyvXLLzWDmCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-55b6a642a4cso2684423e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766409318; x=1767014118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcUiSgx3pQkHLSSfq6LWa0UZZHW6mL//z+OpK/t8OrY=;
        b=pMhspwesKPHqreBNlTdvxH2TEYyZKgj6f8iuHXNQWjTU8ZkUtA2Xfi5RdbhXs7v1Y2
         dNwN6fMNM1gRKkyftBlmqtvwnlwu+y3TQjd6VF41mc/ghWx6ebhPZRiL/h6Y8pWw6idK
         zaRrUds4p3h1I97HbDwis0yF8Dhs8ADw0VDikCdYa6gDlc533iXv0VNDbgotnR/ZKhkC
         J8Oo+eqVwtkIMMcHHMYshR5Czs7hdiyvHKYtBe0d2kYZUddOOHfK3Ae0gTGVNmyUameJ
         GMJVOuqLjK1e0aGX7UX11HqIdNZ1wM+kREF/f9fvS9Cmi884x8oQ/eAHRupqYuhuFlFC
         q/LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTNKD94VbIMRKwynQE4J+zWtsmhjvMtQPUjcBfB2V72vv4ySwcXPkvcYuhILlochaNyQgstBa0m4GwG3F2JcHygg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuaClPdrTp/GftTqgM0PoyUWtPJQgTQU0yqlr6t3PAHjBaN3x2
	xfpvqfgCcrq6GZDHuYmQObZtzjnCQ5xPl94FHe2XNeACQV7iSB/4VOPVenFRnFPE
X-Gm-Gg: AY/fxX5IvM8knNltuah8gV240DHU/RZzUVYmzFBQN7b/PqIB1OqoXQclCJgAm0vHPIK
	1GJnDUHzlRXBSRmjRYwFuxMeYHZDRzC7VWwaFzMQVe1HIBLBecBrxs7BSgDXSCpsJWor9QByjH9
	XhbScBHxyhiXGdoYK4VYawSM4O7hjkYoiRiNOnw8bnpGqgeNCAvwSogSDMZ+hRsZmOz8kfICwD3
	OGU1putqxJAYUgxZSR5BR8LQCRGfqn75rJ2yxXmpmnPJPZK1XndCnPYmIxeR6Sq6sofbmCIis2C
	lfkLc15sQACSjb2VMAIf8+KXxZSzF/miECXfECL2rwD2r9Z2lryI1xbqmbGpDakHf2GGRWga8jW
	tJX01oGaYxfpA3HrIlcO64pYTuisRnQ6jnhkdY2QQ3FPVoa7/P7NjGeAq7xoNY+z6UazOyMPuKE
	KOJknGBbElZJy/WoG8P5Da4cPJn0a56cJwVAVA4B8tGH4m3V3uYPUo
X-Google-Smtp-Source: AGHT+IEU9c0jLcKKoPYtmS3B37Yihl2hM4uMQjgD6MWvzc7hIUKW0PEZyY5ZOlXmWzYv4HWoSXVEmQ==
X-Received: by 2002:a05:6122:8c0f:b0:55f:e6f5:4794 with SMTP id 71dfb90a1353d-5615bd70f29mr3870484e0c.6.1766409318332;
        Mon, 22 Dec 2025 05:15:18 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d15fd35sm3316973e0c.19.2025.12.22.05.15.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 05:15:18 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55e8c539b11so2717452e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:15:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/kpvIVt5JEhWhnbQ/F7prHrtwAKOWoLIYW39yQenBnhE+MyycRkumBaL+uT5UhhDLtlgLU5cwstUFJdST0fp77g==@vger.kernel.org
X-Received: by 2002:a05:6122:884:b0:55b:d85:5073 with SMTP id
 71dfb90a1353d-5615bd1b390mr3957926e0c.4.1766409317545; Mon, 22 Dec 2025
 05:15:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201112933.488801-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251201112933.488801-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251201112933.488801-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 14:15:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=EZ91vbSy6ERqAaqw1NS84YcSb=U+vpn1HOgfD7gc4g@mail.gmail.com>
X-Gm-Features: AQt7F2qs0dzE7Djz_tZTnMZpD2dpNyOacgpQC-w98qVoDCy5Yl_6g5hk_uTc-es
Message-ID: <CAMuHMdV=EZ91vbSy6ERqAaqw1NS84YcSb=U+vpn1HOgfD7gc4g@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: r9a09g077: add ICU support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 1 Dec 2025 at 12:30, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) SoC has an Interrupt Controller (ICU)
> block that routes external interrupts to the GIC's SPIs, with the
> ability of level-translation, and can also produce software
> and aggregate error interrupts.
>
> Add support for it.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> @@ -862,6 +862,79 @@ cpg: clock-controller@80280000 {
>                         #power-domain-cells = <0>;
>                 };
>
> +               icu: interrupt-controller@802a0000 {
> +                       compatible = "renesas,r9a09g077-icu";
> +                       reg = <0 0x802a0000 0 0x10000>,
> +                             <0 0x812a0000 0 0x50>;

"<0 0x812a0000 0 0x10000>", as per Figure 5.1 ("Unified memory map").

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

