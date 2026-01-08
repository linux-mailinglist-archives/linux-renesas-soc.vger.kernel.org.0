Return-Path: <linux-renesas-soc+bounces-26437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC0FD04285
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 17:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EE2435D4631
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700B528C00D;
	Thu,  8 Jan 2026 15:42:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB2B22424E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767886926; cv=none; b=qMbrOWKvKkXjpOUvikBqGQIqdwjwjhZihADawWfWfRvXFvxO5+YO14zmYDPIxvG84Aop6C1bWzRBqntoFeKSe4bl8R4oAs6RU7lQvrT2BZB8aJo0AzL7X7d2brFs/5JasRZYdYXXx2RkMtnOSaXP5eC8jjJW/H2/06wJivBdivM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767886926; c=relaxed/simple;
	bh=T9TwGPbtb/Jk65sCRD6p+Z4CpjSXQctqiN+jSbkE11s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RjPFdIrgzQeCshc4takUKeHPm7XTjvBxIWxlU0V7LENkx2tntixK7m5lAIzS3/Ajc3gpehlmVN49Ol+i1utWaLJyuHvcEqIiBqLILHZUHWb6b0kGnOWJ7YtIgrk2yAijXhwqMTO/Y4V90tgnmOuWhz1ShnQ+tENdrdcn9vxvcWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5eea3fe88bdso144930137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767886924; x=1768491724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdIqtM+rBkxv36T/mfvwWrTjJhzVX0CXMe7ykzjRBh4=;
        b=XVRLFwQWIF9vV8ZypYlnIiLvDGLpmCL28fozGpmFYKVA5iwxihRlJbEBNNWWn7ZFN7
         rnEqH+EE2GXPv9oKTmFfWemgHEfxu5KgbiufMZVLSVodOVJGR4fMXoiopLZq0JNI4i6i
         VCkcWAFabAZuWdv9o2VY8wq/nA/DvdykdcjWX+iDDPX/Sq2ponyZ/4hvNrbEHbacBSDT
         JgY6qrUs4ln1G+IQTCrafNI7q3QoZRVlbzAPDrQ9hEXrD7LJrA0FpLlxZTn9dS4G/APL
         HcBAPelik0qIuT1WQpnLa1AselfxJm4dSXWVnMhJ32VcVE+FrePgPVre5Ljje7SgOQoQ
         mazQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx0WJEK+ZW/iIyguyGPZ3I5XjidIb1tDTe5Ogitw8DC6p9v7rDfTdv6N32CiSrLQ55ojiRLJd9jCv1lhw7/VhFLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwibSZulej9wM2ZijgvZA3rTGkzdba+I1Up8mOR6QWWxAphGj4I
	mhb65SxHqCWoYtjHlnUlg6VDlu9skNZ6cp3SZFTSUzKYwfBf9obeTNFoXy/ZKNbm
X-Gm-Gg: AY/fxX69e829YyG6OFWIaC/oYwbbu52eQaLGLGn0rNibbtGn0/gCjwq5H4IyHTj2SHJ
	L3ax0NPIwHX0SkeLSkO+Y1AgOZxTtqD3NmDCXZwBcfb7Nor4aoFVQ2j/EArdsY25e8YscL1cwod
	Sc8b4d2e6YHnOTQGil1ACEIfxfAH4SLBrxUSwzWcnzDbQzdrBGeZUDcs1cY44dZPU8K+adDHx1o
	2mBp0ToIG26VWOKow04DpAPfev5WE0lO13KTDHcQgzrrIl2Xzs70PzK3Z03pi7yC2pgKkRd+xZU
	9/YWNlEw/NTYkWevHcazXPHbaT+P+4k8oLakH6iuWsJUHykUVrrB3xkqm+TrBNVBdLOtbmujvas
	3cSHO0hc3BFRvVh9eh4BXPzKP2M76FkWSOzrT90XrB1myw7gLXKjXOw/Y4cCxdPcq12e202VsjZ
	uduKP4uU6uxdthDH4fNDCfeFdAWCQsNY0jLkxKVjT4KcBF/ggQ4hbqL4IM3yM=
X-Google-Smtp-Source: AGHT+IFNMSX6oVshbhbzhQfSSaf3NL+2jo4wWXE/RoCDB4IOEAS85GegSfA1jbMM2vTltlPrKasPzQ==
X-Received: by 2002:a05:6102:604f:b0:5ed:f26:55f4 with SMTP id ada2fe7eead31-5ed0f26580cmr1860851137.34.1767886923711;
        Thu, 08 Jan 2026 07:42:03 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec7702eb72sm6560016137.4.2026.01.08.07.42.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 07:42:03 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94388cfa259so1056428241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:42:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqjFTgcavKriHGt+bzzoGGzqNpQJCahKRmx6fBMtlfHiVsTDBxkCeTq67jrCcTYWwe9dA1Crx/xXUUvJz4HeVMUg==@vger.kernel.org
X-Received: by 2002:a67:e112:0:b0:5ee:9e4b:a81c with SMTP id
 ada2fe7eead31-5ee9e4baa91mr722934137.22.1767886923130; Thu, 08 Jan 2026
 07:42:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126130356.2768625-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251126130356.2768625-8-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251126130356.2768625-8-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 16:41:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUVhHZgd7MugxMk85gvzTXPj7GsgmWRef6KjH2j8WUkEw@mail.gmail.com>
X-Gm-Features: AQt7F2oqUJcYTOpHjX-h4M0p98Sgtm1uZRHOlAe1Y5tgQeYww1060qUHgkV9uew
Message-ID: <CAMuHMdUVhHZgd7MugxMk85gvzTXPj7GsgmWRef6KjH2j8WUkEw@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] arm64: dts: renesas: r9a09g087: add OPP table
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 14:05, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Add OPP table for RZ/N2H SoC.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

