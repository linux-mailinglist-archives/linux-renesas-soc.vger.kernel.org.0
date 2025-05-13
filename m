Return-Path: <linux-renesas-soc+bounces-17050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B35AB564F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 525501B46DBF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 13:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1A52918D1;
	Tue, 13 May 2025 13:39:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8447828DF0F;
	Tue, 13 May 2025 13:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143594; cv=none; b=Ue16clPV5quZL9egtVp8e1rDfRPZZLMjCdbQ33CFaPnLgUFD1ZUO6cTjF0WmPmxCf+LsQzfvGEn+4jKUzT83kN6wFTRKS172QoiysLEYkkM+i8YVdtcxznYFeF2dEpkHJwGkyFEc7nmlK2oTv/F9IHwKOCFCTKNexiohlYxeXFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143594; c=relaxed/simple;
	bh=alEfZBTUiQ5eQcM5SD3jMTqywI/sL7dgdzdcL8AOAL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQd7pqD3EsKwzcJboc1UQfPdmIjPJU/3go9HtzJOaPMmR8ho0jf7rtyGwNU8BnGN2V7clUOg95/kv8so/MtFLLMRHlGa9+ZYQgDIANSU1yoUcOtItf6GjpagMRqdWmXykT91jApPRfAyebbUGqqoawf+2WByH2xea0b0zWD4Al4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-879e8e2237dso3030582241.0;
        Tue, 13 May 2025 06:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143590; x=1747748390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPt+qXySw7ZEMaJVxGkIVNj27tNOPdt+uw4OFj4bA+c=;
        b=SVC8y59vWC90OYZiulObvJqGUbZ+H8vVmkjcO5xuUFsJH02t9pDQ/lnUCKVMvreWul
         sE+E40xYyNeXRMj5qNR7RI+OIdz/1NDbUKG4Ozu/mgqEdtzNyUuxCOdhFSnqrdnegiH/
         tjGvQK4NUhUiaxezoi6K8VtodTZeWRlKMgRkEjOF+tGpjbseSRyLUAOf6zNOFTOd2yBF
         2SpR3ar3e6iBLAC39aMBrWdgzJvsalJWm8ITAG8CTTcQwcUMQuQPIHP2zcNGLcoGlRwk
         EKzGHdVDw7CFHiwWhbfOigl15O2UwJTsthQRTr+XNi/CxkfBaQ9Km7nEsw0BbaQGNlHt
         4Glg==
X-Forwarded-Encrypted: i=1; AJvYcCUPRmlqoriBtwEtoydu4Twumfs7kWLmcPGnEijr+3P9EZBbKoxk10V76V2zBa6IJVGWNQBARQerkK4ke4U=@vger.kernel.org, AJvYcCX8wuBnxNEy0sXAZcm77GJX+E43PCa4BKC6utceF9UtEh9VhJUGoKbQ8Z8IQynf6QI9mcAvvEMaJEKY4NfryUmWOhE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZyF43ms7TxLC1HfXPjCarHJ94GcRJkar6CbhbH1wXUneTVBRn
	0zrREeYoCFK+IaTft+6zHK9CwTMBwOifLrkvHC2SN6pp8Qnb7y9UAXD62Udx
X-Gm-Gg: ASbGnct1hIHtMa67j3iYcl8EugwMTd7cjJimZMTJeJ0ZIhLmF/Q/7+5t0tbG6wMq4zB
	Q/GXo6NZt5PrvEdZZZ1X/hM6oE3/4qrca2jBZBBs75EV7+XDEEKmJoR+YSY848tao1r51FeufPn
	8vl8isQulVr2uRvOoVMWJAumhmVZcv/7RZ5NIhxZIq426l+6W5/RA33w8UFbXlvehjI/aCFH9YF
	PDtcjPbJWSwxzLpsbPnK/ygDTXll2daMBfzQIFg6/F92gZkI2FlFzItZoLiIyOa+eSjL1fnval1
	w2Fl0/ZaAukq4P5AfbQLT/iYUfoy33R5kT70m4DQ8GD91xlFMeFclhWGpubgwS9Psn3MUK7zsGJ
	uFaBXAZka3L0ArQ==
X-Google-Smtp-Source: AGHT+IGJtxCkGcihaZUMJ4S0pHprscsdTeGLrt1tqrQ+zRQ1Ha8hxxl8jrXUA6fnp7k/EwHVOGbgGg==
X-Received: by 2002:a05:6122:549:b0:520:6773:e5ba with SMTP id 71dfb90a1353d-52c53ae69f5mr15167968e0c.2.1747143590225;
        Tue, 13 May 2025 06:39:50 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c5375bcdcsm7505695e0c.25.2025.05.13.06.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 06:39:49 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-877d7fa49e0so3757283241.2;
        Tue, 13 May 2025 06:39:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/zPXE0Fd5iYG+gQZQ8/lNpzAMY+rKHa5NX/xV7ykpLC3uq5kKfRz+Qy78/LrRDgANS4Ovqg1cqx1V454=@vger.kernel.org, AJvYcCWk7fZSvnB9WfODwQzVh77Hz8UUZYBt3N92OK4o3X9aKrTdahQmphf2R2krkyN2CdXdrezDeBHCU+Jpg/cOCBdOdCk=@vger.kernel.org
X-Received: by 2002:a05:6102:2b99:b0:4c4:e414:b4e4 with SMTP id
 ada2fe7eead31-4deed36da70mr15522546137.11.1747143589629; Tue, 13 May 2025
 06:39:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com> <20250429081956.3804621-12-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250429081956.3804621-12-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 15:39:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdCGYrUaMPdNvzD2Lcp2RJFMzwmN5tb3wasVa2DObKRQ@mail.gmail.com>
X-Gm-Features: AX0GCFvMLa1kXPZnWuwR5TOMI1wbgRjuUFZJPPmXlHQ_ypkloLtkrcosTv73jQk
Message-ID: <CAMuHMdUdCGYrUaMPdNvzD2Lcp2RJFMzwmN5tb3wasVa2DObKRQ@mail.gmail.com>
Subject: Re: [PATCH v8 11/11] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 10:20, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

