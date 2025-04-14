Return-Path: <linux-renesas-soc+bounces-15918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EED05A8849A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 16:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 217F1564078
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 14:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CB827A93B;
	Mon, 14 Apr 2025 13:42:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4656284695;
	Mon, 14 Apr 2025 13:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638136; cv=none; b=NF1TyouY+02DT+Sd8fTRIfMc9REy9nEM25xOHvoI76OyghR4BiMefBR33nNvWOQ8RoTSPBJJvmEgqq69WnO7ajLnk0qGvCuC7cI8UIKs+Z5H4hufP8cmO+h8zdyX0ZwfGZJEfAN6VAxGNBsthWjGgdJ6ynrK3WwEo2cbVVdpMuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638136; c=relaxed/simple;
	bh=Y7Po647lxzZjEgUcmbVD344uhdEPi73pRnYP3SGHaik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3wqQCM21X80dytW+unKjaMHjPD7g6wqslIrt++B5RN2I3kO5DC1xX2BWrTrGUPWzjgoY7E0mgxMJoi5Qjav8rsGpspdCNM9cVtYRJt/Ti6hivg96dbwhUZc2PrNiQrW/yYJJ3xn6xoGjdFYaBwxIHv1w7yzZHSfYWso5OpXCg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523fa0df55dso4896658e0c.1;
        Mon, 14 Apr 2025 06:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744638133; x=1745242933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2WTtl9nCoaqklCsRdRE8aL5OKeItqRULfJefKrJuZc=;
        b=RLbhncYZpVeTfluel1fCR9P8pjZ77xcTzTmxiU9M3oV9a969z3IdiJCEb/EQOOzbXA
         VujsoEzH9/akRdgUB3NLJxyhBNi+q3dTBcNn7CElBS5g5UNIRhI0c4ZA9q0rOg64nV9/
         eDzTT/rD+e5LBN9vGQ5cYXg6UKnoqEs4pQUdTQ0glI0wR8C1I+t1HHU9o15xwKRsrlyh
         l0LvfCiIi9iYkYXuh51zQF3zjnebOrarfEMObNBs1ymtrvDNonOyw7yxJUdjp1DnU3I3
         PmzCs3l0Y92nF4qtMynmQHNcVBKmXCumj0010UW0weERCMIfyHh/YgomEVxZT3/qxO38
         WRNw==
X-Forwarded-Encrypted: i=1; AJvYcCUNm9fP2xlj5pGI2G7AOIYsYwI+zW63gyY06OyvcExu6VYBTUFkGhYa4bWIyjFDy9JG+eyrZWYqmkWD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm02kB9UqHpozvZwzwWpUTsb2tccUVXmLxK0pEbicVH2x4pgBl
	s/tL8ACovPoGnyjK8xFMsVnhCjeKKaEbZDmuK4CiKfyi37tqpnj97KpAPRFj
X-Gm-Gg: ASbGncvMO5UjXkizunocF9xre4bR72dj1TviOZTz4h+BuXnOq3jgPTlixzoLPQ2izyo
	HTXF6JrI2G0rg/P0eltRUnvdo/l60uD2u95ChyrUDhIrRUaGGDURMNANjwMvtcRU8N4cD3/gQ8s
	9AIOAbJ9LijC8jPPWuEortFtZ/Liadrp+ylmCa+/s4k1LIOGeScVaVLvr5CvRXOYeCcq2S4Tz30
	DDnV9JQ8nZAJxCBy/2lA0q8Ho6UvS3ZxlJVqxt0AJRHICobdpWnEV5tul4bckwmheT4jsfd7nqG
	Dqjtelcfl/AjFD3plmOh7iYfeTG3HusPFo1KdyA73ZYndWdfucIuSvGCRm4RbqXsim9xn1GWcWL
	G8Fc=
X-Google-Smtp-Source: AGHT+IEMN/AugvEUNnNhnaDCZk43OdbPs6stfqstXyu6AteUyG97deueHwFm/efhux1Nkd3lDvCx2g==
X-Received: by 2002:a05:6122:318f:b0:50d:39aa:7881 with SMTP id 71dfb90a1353d-527c2d2a282mr8507229e0c.0.1744638133093;
        Mon, 14 Apr 2025 06:42:13 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abe8e6fasm2303317e0c.36.2025.04.14.06.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:42:12 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so3948725241.1;
        Mon, 14 Apr 2025 06:42:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIbnKMLL4aTpKWdlj9dHmKvlhSJ+ABc1TxShn8BV3Gctven5fcnpXpVeuGKz92gri8+7yfHIL4NF79@vger.kernel.org
X-Received: by 2002:a67:bc0b:0:b0:4c2:fccb:a647 with SMTP id
 ada2fe7eead31-4c9d3eac9b8mr11785330137.5.1744638132215; Mon, 14 Apr 2025
 06:42:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328153134.2881-7-wsa+renesas@sang-engineering.com>
 <20250328153134.2881-11-wsa+renesas@sang-engineering.com> <CAMuHMdWO0662Qk7BxgMW8nr9OpP-mjPSxYKT6Z-pp+syacrtOg@mail.gmail.com>
 <Z_j_t92QksnSjg-c@shikoro>
In-Reply-To: <Z_j_t92QksnSjg-c@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Apr 2025 15:41:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWHoqnxGeyMXZ+krrRUNcPeYWVqYs0xtNsPSwk5zxCNQ@mail.gmail.com>
X-Gm-Features: ATxdqUHunaAt1mHwoGVS8cdO0TRxr7CsXm973ePJ-FbTINDxdL-ec-IbEZki1Fo
Message-ID: <CAMuHMdXWHoqnxGeyMXZ+krrRUNcPeYWVqYs0xtNsPSwk5zxCNQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe LEDs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 11 Apr 2025 at 13:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > These are called LED1-LED8 in the Board Setup Notes.
>
> Oh, where? I have a version from "Dec 14, 2020" which only calls them
> Software-LEDs or "Port0 BitX". Schematics call them DBG_LEDx. I don't
> care much. The "db" board has a "USER LED2", as long as we don't
> conflict with that name, I am fine.
>
> >     color = <LED_COLOR_ID_ORANGE>;
>
> Hmmm, they are definitely GREEN here.
>
> >     function = LED_FUNCTION_INDICATOR;
>
> LED_FUNCTION_PROGRAMMING?
>
> > Perhaps you want the first one to be a heartbeat?
> >
> >     linux,default-trigger = "heartbeat";
>
> I recently removed a default-trigger on another board because it was in
> the way. So, I'd rather not.
>
> Phew, starting with the PHY LEDs on this board, didn't know LED were so
> troublesome...
>
> Shall I resend only this patch and rebased on the keyboard patch? Or
> resend the both?

Please just resend a new version of this patch.
I have applied all your other RZ/N1 patches that arrived before the
weekend. Please check renesas-next or -devel.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

