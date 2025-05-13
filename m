Return-Path: <linux-renesas-soc+bounces-17049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 644F0AB5646
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E79BA16EA8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 13:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F36E28DF0F;
	Tue, 13 May 2025 13:39:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422C728640E;
	Tue, 13 May 2025 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143546; cv=none; b=B7ydVMG7tD93Q+bLo17AtgAMwwwfO7cn+ykGyDNRFYbIXc+EWVOpyrCdKeUGMY2U7sq7nZBmglZkBSl1FaNSnSt9EFW/EW/rvCZcimlUGOscOTvWc0nXJQNOVHmBnhuuy+EW7b20vj0ZF9CyNXMOmiYur4I/t9jVGHavQfJ3mDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143546; c=relaxed/simple;
	bh=w/zWZ92yzc6YUkiZeb6+MrsktIw7OQGZTLwAU32pCxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJSuf/Sg1I5bREko0MkBXoB1rNL9/zwjomq+bQHK68GmLMSyd51mSA6+iXLnmszXZemnV502raijZnwh5Siu50/TntYpotMxqHSxNJ5PSf33iSWgSnTiFJhmXOGLHMjvNqkBXYYINZ/ovb139YZEHCHqxbj+GK/mVlI+9+0IWUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-879ed601971so1363432241.1;
        Tue, 13 May 2025 06:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143542; x=1747748342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otMogSOyvc+azXfG2zQ9PW31C7giKBuO4YtLeGYVjBA=;
        b=SqGGDyPLacpX72rLCoeLCPJg9F4qq2oSu6kkkYGuMd0jZpgOBgZ9HFvlkjxSpeWqRE
         6e1ULszt+p04y4Hlo1BN06ULANgjNOF2rv/3xpD+9ZrazsRkFWGREWuE+m4DxCdR2Q88
         pgAmQEzndr/buwaqd9IjXG5Qlh0ui4jeLJrri7gaUV+K8bCznJCVDy6ZuuXLeJrgSs75
         aaufdmZT+kqdTMrGaQ1UgO02GQQ+Afmf7bT3bjGwxbVu8FY2rgelb+ZU/xO8NHrM67gG
         hYHp43eKcwEEwDhZmYWz4hQ30ibW1hQsynAx8KP/o0RmjqosJ22hNHi5icWBY4QtnqZl
         DOrw==
X-Forwarded-Encrypted: i=1; AJvYcCVN/a6T8ePNUKQp7/VIDa9m4B+LH855PYdG8KQAAsx8TE5m1D2zbDme1Dm+JW/f4G/nwCf+sXeqMN1OZAmp@vger.kernel.org, AJvYcCWKrIlspR0nv1RVe91gHIYkSYHvT0e6AO4jHR8kCGGlBBy727MGG53hj0vUTZQKQW0mchCd3+xxer9YoNGVPVFKhbw=@vger.kernel.org, AJvYcCXISG+VUqWB5MEn8/2+NsXR6IfLnyHKDGXd7uOCn5GPJxsJ9iECUIsFxLQ/AANZyYtPMPFG/xpJH/Wn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz8/MF1p7s8WzwX4Xhq8BpB9B/7LKNEB0a0tRcU96D1kfGAXpm
	0flzt3KDU8HlIMvLVIUj5wu0TbdrcZjg6/Pgxp0oyaEKzSb/jLsSeL2WWgCS
X-Gm-Gg: ASbGncs1xNnrx4wEiFcSWzJZWjGGEYP3km3hE++fHPlVY1rWpyNSuwTXtXjCL3sHkFx
	r+pxIiw0xALyGLEOh2KlKHJZVZ/YEKzUSviMX536eYHXYdgnGksaYy0L9txyVcTrR3tDNrMvEb0
	PfH/fwO+siyPkxPwWs5BcgIr932jqNrDyaU4BPxx0d+FNA1leJIvc8LgbYeC3CuUGTB/vDiO5us
	fRswxkhRqtOWgKQlFDSZDQjvhMT7fGWC3EN5BxO0iaWyuIz8Y85Invw8mts+xkgvPUePektYqaN
	5kel6LvdnEm7gG5gzQW5QQ05RLwJZHHDTWf82UpAf+p+R8Mzrs4gRIl4oUxenHtK58jtcivqU6z
	y3LRbRuwI2tqhlA==
X-Google-Smtp-Source: AGHT+IE/EhzF6TBjNH4i+Mqkn+GleNMj3ux/pNzFWLyvHinHSG31SQd/lhemIZBXjY1SFs5unwgGSw==
X-Received: by 2002:a05:6102:4b19:b0:4c1:76a4:aee4 with SMTP id ada2fe7eead31-4deed3d366fmr15206965137.19.1747143542495;
        Tue, 13 May 2025 06:39:02 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea857f73fsm6732930137.3.2025.05.13.06.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 06:39:02 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4def2473a58so1493523137.2;
        Tue, 13 May 2025 06:39:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjuxD8wLOWI4tW2LKEsZlzh8BajIaj5Q4rhbFpNgQ37XR6M640T7YPpt71AM9bxSv/fAQPsyPreGxE3Ws/KOyqLnY=@vger.kernel.org, AJvYcCVr2Ara8s/YlI3skt7dnmM/yqGvwFkob3De+lktzFsQq1sSvbFCI7d5vB220shJUL0m0+Jj8iqhXc3u@vger.kernel.org, AJvYcCXiRrulHUUDPQJXZIa3QVM2tqYGtx23XlTxySwiFCFL7zoSH4XcZq4FXNfCdRLK9ksBVxFlRM+nuAEXBq3f@vger.kernel.org
X-Received: by 2002:a05:6102:4a92:b0:4da:fc9d:f0c with SMTP id
 ada2fe7eead31-4deed35dc84mr15321354137.12.1747143542024; Tue, 13 May 2025
 06:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com> <20250429081956.3804621-11-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250429081956.3804621-11-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 15:38:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw9GNv1_jtjnfjL1x38-Snhdie41s5=9DZhQA5NMjVtA@mail.gmail.com>
X-Gm-Features: AX0GCFsLHBRN64p-uZIQMVjwi0yO7Y1WSMGqfYnyWXgWneRfxfyFamwGYreAKAE
Message-ID: <CAMuHMdUw9GNv1_jtjnfjL1x38-Snhdie41s5=9DZhQA5NMjVtA@mail.gmail.com>
Subject: Re: [PATCH v8 10/11] arm64: dts: renesas: Add initial support for
 renesas RZ/T2H eval board
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Tue, 29 Apr 2025 at 10:20, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add the initial device tree for the RZ/T2H evaluation board.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v7->v8:
>   - removed loco clock
>   - fixed checkpatch warning

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -152,6 +152,7 @@ dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
>
>  dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc.dtb
>
> +dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-rzt2h-evk.dtb

Please preserve alphabetical sort order.

>  dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
>  dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb

The rest LGTM, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

