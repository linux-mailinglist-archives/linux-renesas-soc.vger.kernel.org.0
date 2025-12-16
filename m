Return-Path: <linux-renesas-soc+bounces-25810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29689CC3965
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 15:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 362E6300076D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 14:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185222C1786;
	Tue, 16 Dec 2025 14:25:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E554D2459D7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895143; cv=none; b=bjBNpyFiHqp05PjhklIo2IOfVyiTQUIeMsUvaGYaNJbsFF8CikVjTw4sRTV/XMxRizcsh9ZBxpQ81q3znfTbirNb744LNcJrcRw4e7SvlNrdB6nu02DKW6SVG7ReLXaR8WONATR0BUfpShaFpGlZYxxqkgClInphcCN9Aa9I30A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895143; c=relaxed/simple;
	bh=BU0zza5eePiaDoU7h5zrOBtSSlpOrs01neJX6MwHa5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMNjD7oCIpTiBsH2/5WSTtUiFPXfSiqindXMK14ML1hrIBcaKTLl/mUcajiggAKvXBbOXmU7Ir4eyXOlXddcwmc5LvWEybSHGfzWAscGkLHDRu6nuIoARr0Z3CFAvhHVpkdumgN7l7IPV8xJ7D1cfh7qnvQfLfZgYW8Sjke2hX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-55b265f5122so1325828e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 06:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895140; x=1766499940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmGEgPuORdt944lP1ts1khomkIbW9gpZnOcj49yyNCw=;
        b=H8PM6EndhJNdL+gXfp4l8qQUXiyPDFJUK4XsmGPEf7OiHs0Dui/9Pnw6styVzGQsU7
         fWl9U/Z83RgERnQZtk+MMmdHyHVcmro/YnpSOwfXS2IjvypN8PDiDZLMtHIdvXk+ybAa
         vsMIHFt09MqjEK7F5Rs99lKvKaNmkiIQ3iYznOAX5ISfgnmhBt0TRqmbShSTUBVFvaH4
         IkeuWHCZa1T4fr9THrLfuHekg+l38YMQbF+K7sustYTg2FjBgNoaLMcYQCeWD96RUT6v
         WRusxFuh4IMu8aokh3cTGbhW+sIup26OSwHlJgMInsfYegZDx1jg4l2f7MLcAQ/HHGzL
         fYvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiem2yo9vsDcTRgEK+lA5G0VbpjJMccDpF57gbNI4FXcaO/o2WwewJ54mwJHtlV3ljT0+x/RuRR8X/vNk+um47cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL2zRhZgenJVE1tYco8/u0a5vWbDaJAopR0ztwMqKHDgUk5wuA
	7vH7uDyeKyPAUPLSXziVHL5ZIzT1vsThsqayOeZX9LMIulb7L2og1AH8U6KfR67L
X-Gm-Gg: AY/fxX5YGU69QLNfUvdnNxBeWmu2xJ2PUYy0TK1DCPuarNvIc4CkVRcCKOuusTXxOg0
	AcW0+1bCs43MoIcON8f7qiC8asWTqOC0GzF1J6wWmakU/9cc4vJ8OsflltR3OHcZT0Nf4jZ9Zju
	+WgCgQUaWNMZIDyuTzK1TiC1b9f9KgIn42Lw/BgfKKxoKTvxJ5SQt59OZ+lXVoyVhWJEk78Ursp
	nw87enSlm22QWMpccGY9B8I6jZQtTKq8WVH77kKP7BCurnMTqxKlWyx9LM/k60hs7HgQwDO/nKz
	IUpbZfdxl4eIe4RN7gmhAnXUzUrM0GPvBlg9MTNhMucY4sC9amLdW/ExbfluEchY6LWwb2/rXc7
	C+5nNp4zp4Yexg5sjhuIB4JTARrUha21gbdtwWmWoTrLurtCWB64149K8wIvuqBkMNztDf6fb2R
	VnmZy3Kc+axExveG8HqldE4w0rz7cFsshGSxs4wJlxzE9li7yk
X-Google-Smtp-Source: AGHT+IEz5Br9Lm+PYUHxI/yTrIZTiabRmzvW2U9YpAynOrjqw80MpwhdiqlLbniye+9ZKXV5EDw7hw==
X-Received: by 2002:a05:6122:d81:b0:559:7294:da85 with SMTP id 71dfb90a1353d-55fed626550mr3872425e0c.12.1765895139669;
        Tue, 16 Dec 2025 06:25:39 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93f5af350b4sm5897324241.15.2025.12.16.06.25.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:25:38 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5dbd150efe8so1733983137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 06:25:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkgugnu8Z7tKSEko0ZLJT9rZq/3RnOav8IirvHsoLJ+Pd/lansiQHOHyNb/oKtkGNpC+sfl+IxfHj42fITuP/WOA==@vger.kernel.org
X-Received: by 2002:a05:6102:644d:b0:5dd:b288:61af with SMTP id
 ada2fe7eead31-5e82729e0dfmr4099799137.0.1765895137738; Tue, 16 Dec 2025
 06:25:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210160047.201379-1-Jonathan.Cameron@huawei.com> <20251210160047.201379-3-Jonathan.Cameron@huawei.com>
In-Reply-To: <20251210160047.201379-3-Jonathan.Cameron@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Dec 2025 15:25:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUQ1hwrm5E_2SY4re0iC74JO+50D4BJ09+gf+0L_iviEQ@mail.gmail.com>
X-Gm-Features: AQt7F2pv1730SuULqPlL-sSgQJGnjNI8Ry8UB7f0qPfx1ycQ__W1ZVy2e2HJ270
Message-ID: <CAMuHMdUQ1hwrm5E_2SY4re0iC74JO+50D4BJ09+gf+0L_iviEQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: renesas: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxarm@huawei.com, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

On Wed, 10 Dec 2025 at 17:01, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
> The Kconfig menu entry was converted to a menuconfig to allow it to be
> hidden for !CONFIG_RISCV. The drivers under this new option were selected
> by some other Kconfig symbols and so an extra select CACHEMAINT_FOR_DMA is
> needed.
>
> Fixes: 4d1608d0ab33 ("cache: Make top level Kconfig menu a boolean dependent on RISCV")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512100411.WxJU2No9-lkp@intel.com/
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I assume Conor will take the two patches in this series?
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

If not, please let me know, and I will queue it in renesas-fixes.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

