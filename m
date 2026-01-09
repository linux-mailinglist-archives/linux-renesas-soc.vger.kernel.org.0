Return-Path: <linux-renesas-soc+bounces-26533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63773D0ADCC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 16:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19A8C30139AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 15:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B7633B6EA;
	Fri,  9 Jan 2026 15:23:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B0B2877FE
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 15:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972186; cv=none; b=etFmVs1HGlSHr+PH2khx9YI741fwaWuR8GEUuejKdMbTUueTdK+xo9+hGITPgqCY2fhfkP86bwcn7dpk/Hgu5aKWz20f95uYOmf56p7VG3PPUZLmFnrCwc7acGg8bX1mqY/HoumGICT2aVEs9g9xcRrZpXkcifevYzfv/vx2N7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972186; c=relaxed/simple;
	bh=w+jdZUVVwjV+PWegTFQC8k6OIH6RStJrT4z0XZT8ub4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uoc1PSoZlVefmBMJ1wCiV+BWooCbJrSSGdCXFl5f8UrYVcJO1KKY0FYLXvLgwUDLgq2B/TE7Ffcvr5Xtudp/6EdFyXhm/jVeDDCF/Le9fpTGxjVcfPLm0O8hTm3Rt2GfQZJPZ8IT3F0/Uz0e++qMxBR4LuQHHNIMlJtiup5v9n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-563497c549cso1971251e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 07:23:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767972184; x=1768576984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Yk9dSVnKNdMvFrF2qz2ohn6VtZ07d1DNjC5g6zs10A=;
        b=ksDZb9l1VG1CuKMrgO2eiQl+8IiQj/WxaJ67y4cEsStm6QD8qHcnIlkly2KEqfc7ih
         +JA+xZa8AvNTgh2af5XX1yWOz6baoDB33d+d3pe/Obx0haoFDnFVFeJHbZe+OhJGMKeL
         8PsTngj5626f3vB0LyVr7J3ozJpIXYnKy5pwgNDF5MxB4aAkE5FfSHDCFVKipNTV7m1S
         nrSAZPczoVmCD15obxfF/hQBPKKTngDTr9lMKelRnDGPqfPrTxfkKZDF/mNuZ2gRmETt
         r+KgSTrtA8w2pel/M/SsDDTnwKgI0rWLSavxwLDzioj4yW8Xz/BKbgI+Lr7fDr7TH3ri
         Slvg==
X-Forwarded-Encrypted: i=1; AJvYcCU6Ks9nPVVdrYF9po3VMo7NrjV7z8juNz/y7eA2UHfl9RiOVD9O6JqQ5OAFkBN+bCMfo1X4zL581Gxp8ljQgVX7oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0HJemoNpcm03+aP4355vAI0o3QDqI9o17sRJidoqLJ74yBUWE
	wt+iISxsg9jLvyqh8p/KwhD1uDPfjgN93uOq/u4JQ+Br9MH0DeoSSjcdVxgQa8/5
X-Gm-Gg: AY/fxX71QWqL7sDRbNUpOsAZDj4oEwfjHTK+eqCYr58FvVY4TudSmCtH+LYL+0KpgWF
	ivtoZDfU/qFkAgSCSEWQcGPf/9771T6dXfqQRoBlszfVVA5Fv9iGV8fcrVMYr0RTYSJVqB9vkcg
	l6dsJhFuVEdv3P3nJFFpQZDOqC39weo8b7h2HlX3/1xZ0RtM141J8EsJ/ftitABsYDdvV3d16DK
	4UkG31xqOKkIsmuBXicILmcXvNgyeb+08lAonMyOvYB5pcMxbf23R0rXFwQdd1ZI7PwOLokcs/x
	oYKGV6C0EfyVXDcw91x7QZoAQbJxkJVSMXikGzhgxpgHweezG1QPEq6MhJR66f/6ia5U2YDCgwN
	rySDChpPeflSJXiAkaHlUukrSpY/o5eVf6G+oZcaes5LxiRx493UKjOMZjZGMC1DB6VKAw1gOyh
	q2fWIxZ+CETOIZiPkkpWbVkV7JJYAfR0UgSVNDEtOisxrkBk8d
X-Google-Smtp-Source: AGHT+IEu9xQYuzBORwyIFekcX6A2cyc0r4TlgeIjPUde6iq+I6WMBR1rDoM6rDjJSYfy2f9oWN0Sqw==
X-Received: by 2002:a05:6122:421b:b0:55e:452f:7af0 with SMTP id 71dfb90a1353d-56347d63649mr3492849e0c.2.1767972184217;
        Fri, 09 Jan 2026 07:23:04 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a1ea48bsm9437661e0c.3.2026.01.09.07.23.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 07:23:03 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93f5667f944so2743563241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 07:23:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXSLVB3vY51KEowSSDbcxfGbNPEDR4X6blkczsyWDNtFSLST8iwJY5LLVzigSsNiNcSJNTulOhAZ+9+xUhgmLH0+Q==@vger.kernel.org
X-Received: by 2002:a05:6102:509f:b0:5ef:a8da:8b26 with SMTP id
 ada2fe7eead31-5efa8da8bfdmr108598137.27.1767972182710; Fri, 09 Jan 2026
 07:23:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223152358.152533-3-krzysztof.kozlowski@oss.qualcomm.com> <20251223152358.152533-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251223152358.152533-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 16:22:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV8juJgq6jX-ESXvBSPTKNx2mq2WrGgVwpr1Bq-c7D7oQ@mail.gmail.com>
X-Gm-Features: AZwV_QicpQ7GT1hCJKQZF9H0_G4o3xzdCzGbwbgl5SK7llEp_u0_daC0SmeUxmA
Message-ID: <CAMuHMdV8juJgq6jX-ESXvBSPTKNx2mq2WrGgVwpr1Bq-c7D7oQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Use lowercase hex
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Dec 2025 at 16:24, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> The DTS code coding style expects lowercase hex for values and unit
> addresses.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

