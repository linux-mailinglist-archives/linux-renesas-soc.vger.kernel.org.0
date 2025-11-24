Return-Path: <linux-renesas-soc+bounces-25078-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A86C80E2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 14:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 682133A88B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 13:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDC730CD9F;
	Mon, 24 Nov 2025 13:58:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CDC30BF5D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 13:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763992691; cv=none; b=lKLQGBePNC4gMkSZm3raRXEyoTip9M9CGA010Fv8Efieo2yL6vnFoQ1eXbBGQM0IRT2SMSZroCqJoxEt0I2OWOlZzvZZqBHQ86GJ0SsiaT5T0ZJMo6KvXffICOaW6Gij27t1IaZk2OlyTF15IxSli4M2u544uf0lff2FgjAtjs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763992691; c=relaxed/simple;
	bh=iws3eva23TPXW+rh5mIO5/IOoVHz8oaNGl6pbntaMuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhaJ2kiaTsQ4rFNqM7PUs63fr/zkMDp+SbeN0Z8neQH8q2D5HNL6iFBdw3tZvx8iZaIMPqHfHT/JqP9uX8p5D2zTtsV2carcIWfx3LAIPq0Dcjw4w6XoTRaUjuPpvwHkEnASX2wvVXnpGhvIPi/IJqIMHLBUdKpFiERBDuLckO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55982d04792so3214550e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 05:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763992688; x=1764597488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykucdFE59L9Nevr96eV8Z6/LL0QSMldnSXeLmS52148=;
        b=d5uwls2iIQdpzEi3Ip/ON3NKPEDmCuUWJP/WfBz9BcaHqdHUrqwfgnrc7TQpsy1UCZ
         bCwGSLAbMq+lQg2WfXVHFBZn1ENK3Mf6hBunh9pfyliRmnkFMgJwV0P83DBR0+/N3XpJ
         aIBY/+cSg+bH5GiKzoNeiZ5fqlcSVYRlHzX9/WccxNB5ts9tqNSyJbPcrIVSmGxSuxab
         +zfihqI0Bs3UuWBzs9HWzofGeruSZ2AOtuTjqW8uUdY1V3qiChdIKf2F3v3HJt/8mPr+
         xEfSvI5H6yY4hNEf6RXAPzbB8QeqBfv1AD5DiPe03mUstHg2LfEtcdjQ+NmMq8GAukrT
         +Fuw==
X-Forwarded-Encrypted: i=1; AJvYcCXhxvK+6Vq4BCJm45+aA/ZAvScVdRdede7GMoANfHz+raExS53n2D9hwc1MWehEfqKB/2Y0vnIGVz7zFhHwkWuC/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVNK5wQjFHuu39noDMm5JT+cO1TrMJE9FNy3mx2Wv8XRVlgl7r
	RyS5RsyBBtUTBF4dkYZwg1s8+toltpLV0Ch4ozxAvuUhNEMD4/A9NVQ6O36kpw0X
X-Gm-Gg: ASbGnctDdBchI66Sy9NMsxJ5KYGiVgB2GAMmpHTV7g7wz1eNgQolQ+JzM3CCFJ75XnR
	AsUGGLqPG1I5CObJ+M7QAjL6JEbkJ9wl/JKI+XpMJkWwsgtdedmUHWkdQKfr/saFpFIG6mTHOw3
	oujvAKVvLGRECUzefqDmPfu0FG5hai9S8w2ZsPdKC9FmJ7LuTTUfxg7R+d//zLL855iWGLYn4HS
	O9UgYWc/JjihxHiPrwq26qOebGUNSPxr6wXBFow+33h/TnSgHnnTVZ89CwDPutY6ZmDyW92aSbH
	6diytXd5xjtxvbYaSUFmJKLiL3hFTRzUDufbuzj2/tXzm/NjD+9cIlWpizvyVzXLRfp0MAD+T8D
	qXKmVsShY1DrfN9ZeqXTsqdNLojXfWQ8TLdlB7s2hUq4Sdoa2SiqQILRMvD0IHh+BQMBU/EAsCF
	EnTPciZ8MCZgLFXOwcO4GDVD/j5p40tXoAUTVcgRR119xdA7NE
X-Google-Smtp-Source: AGHT+IGST4yOYv4GDR22xMTrVQvHZCjheCJxMlqXk9SOuD1HmWK8G7zDvWZ+ckZzfEijYq1aMdewrw==
X-Received: by 2002:a05:6122:7cb:b0:55b:305b:4e34 with SMTP id 71dfb90a1353d-55b8d80ca12mr3622935e0c.20.1763992687591;
        Mon, 24 Nov 2025 05:58:07 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f63aba4sm5987666e0c.7.2025.11.24.05.58.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:58:03 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5e18598b9b1so3066782137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 05:58:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJVJUeKt4wOw1fSNudwzdkMXty958F013lTCdripq50omUH/Namtes1rhHbxX+ysaX6RmPumLiHNQ3zNZg9wN6Bw==@vger.kernel.org
X-Received: by 2002:a05:6102:2c1a:b0:534:cfe0:f86c with SMTP id
 ada2fe7eead31-5e1de0881aemr3833668137.15.1763992682241; Mon, 24 Nov 2025
 05:58:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119110505.100253-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251119110505.100253-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251119110505.100253-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 14:57:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWOBcbBuOuWfGOhWz1B=smyCfn7B85x7+GrpzOtjxU_XA@mail.gmail.com>
X-Gm-Features: AWmQ_bn3eruhhSU649jBikvDseueVwHpIt-LD0RrfDio-L_YtIrX7MMwJtyBjo0
Message-ID: <CAMuHMdWOBcbBuOuWfGOhWz1B=smyCfn7B85x7+GrpzOtjxU_XA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable
 USB3.0 PHY and xHCI controller
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Nov 2025 at 12:05, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the USB3.0 (CH0) host controllers on the RZ/V2N Evaluation Kit.
> The CN4 connector on the EVK provides access to the USB3.0 channel.
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

