Return-Path: <linux-renesas-soc+bounces-13043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9539DA30BFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 13:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44A44164895
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 12:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915E71F0E32;
	Tue, 11 Feb 2025 12:48:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26431EB9E3;
	Tue, 11 Feb 2025 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278099; cv=none; b=NUTQuBolxC7UfvIjty3/0x/Dd1yUvdr0S+FFVzUEO3WMCIXLbBxMCD58bUO3d/PlncxbR7trnHnTrGsUkWm57iUnpiCvZjZwB16E0KoQDnD+1AIs+D5zQ0J3+ocHv10tw0fWFbcJrX7dISUq9vf+NDO/KKfMfjO8BqkPB4hRGSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278099; c=relaxed/simple;
	bh=bIRnXBPnxp0mlgDzA2ENHfw/HzaBM3vpvky5rLTZIiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVwu+Yr6m+ZrBV0YaSdekLZJC0ymWS7rmwQET1K7/g3PVsHNpedc2ZMpfJ9udsXdYMBb32eIq2cAvVcUcoV4hoWK0fZClziXLqlybWfaXFv/U7NuoIQx+o7s0HBXkVM9lfu79FwM95CAH9Ans57MhISsqx9t34GBVFtsaRAubWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8641bc78952so1242088241.0;
        Tue, 11 Feb 2025 04:48:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278096; x=1739882896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1pGj5VfAlWQnP5MBc8ufUlmkxOwOpyZKtidvnD0rLI=;
        b=T/2RKJfjDnkFBZIo1iynprfipE7EcyLOfM98pGyWv4jRKOIoGnA4IO0UkvBKf/5Afz
         18yjM6+lt+IFRrIIJMtzi3r7TR4RTw7joOFEeIgcFx61Tpc/QtUlyJu2XLN5LOAZsYCs
         KL85NWRmIxvaYpBFdGlzXQlvdJ3ETSh7+8li7LvMQptbM3O818mojnivpYxhUziwlETK
         evtWl/AdCZHE80xP9BsVShSVHbemyc6DWORQ4o568qo09p8zJB8V9Q+IOSKZ53r9CTxY
         FB9ij36CDq35zq84vmL4jT18iA5hXRjmKumsVeqHg1M7VK1S+sktsEHyq6l1OFSQ3vIc
         3ltw==
X-Forwarded-Encrypted: i=1; AJvYcCVVTQLBujCxiR8h3Mm5AGkwKkO8N9/H5Uq7b1Lu1g3DZkyKhEZw7l107nqCnGHmlMTrYgWxnyU9pHcO@vger.kernel.org, AJvYcCXi6LeBrTZvGYzIO+2g7xB/YhxxDcUScf/Noh/j+Mfueugh0iCCsdgGC+dAEvXiZl4wySk1L0iiL6wYeUddWMlIo40=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPsdiPabz8Kg4URRwSdK3AnXUSyR9kmVnMUzn6AZc85PYf+7E4
	ntrrGiZF8fS9ZoRJSvwLJZO9YSY72jOFZswUqdQxB37VPmo6QIuDqJXttBtUvOc=
X-Gm-Gg: ASbGncvg1F4UPnS0AKy/aAPxoZGPF2LJKccZg5fgtLPIwLzpfjpEZONN9FNYuOQIhXa
	q0u35BoJatsTuEIbTW0N0KZyEtFOveUA7sZUyfx5K+H815VdaOXXzBVSwjGU+G/gvbnvaoFFg2c
	loRMxwqNOsDizSMXLR+CLoiJxXZd/9olwLlithnCRIfPdnenswmgZjitdtohdxUKRpXHR530Lma
	I2j1p61eUMHlZH9U0k4gmKoG6sCYXJCu+XRwhOiPLCuE43V2e/IYpELSrLFKUDxDOVAz7IGKhoW
	XJG/VFMist859ZhUj+wwLfIDaKKgJfSKACpbR8RCLjDyAK2tOYSpBg==
X-Google-Smtp-Source: AGHT+IEDD6MTUENPihR696vESwLaz9fjeHHZlAvaRT55UQVb/y5HEG4zNbYU5yc6qME4Q2ZJ5WDKoA==
X-Received: by 2002:a05:6102:15a9:b0:4bb:bf49:9088 with SMTP id ada2fe7eead31-4bbe0522487mr2274991137.16.1739278096040;
        Tue, 11 Feb 2025 04:48:16 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bad405e46dsm1269936137.20.2025.02.11.04.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 04:48:15 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86708ac8e2cso794543241.3;
        Tue, 11 Feb 2025 04:48:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQSb8NMxnSsI0YKlhHrXcQlZl7M5k+YmhqC+UqlgLF/RrGMkLH+fwUiWuNGDCALuIAXeyxxSXRXfyB10nv/qMw3Jk=@vger.kernel.org, AJvYcCWPtholQkeQAscVBV1naJlgyYPBWIUippOZkxXp/pwMkSbSsWRqlWM/zXXDgezZbTKRMfQsy9YYcoIX@vger.kernel.org
X-Received: by 2002:a05:6102:14a0:b0:4bb:becc:c7c7 with SMTP id
 ada2fe7eead31-4bbe04ad41dmr2467939137.15.1739278095170; Tue, 11 Feb 2025
 04:48:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com> <20250206134047.67866-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250206134047.67866-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 13:48:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXYs-YBb7BVvj-U4L5253jm2tcFkmTEF3MxQVrfpLx54Q@mail.gmail.com>
X-Gm-Features: AWEUYZnOhvFwesAaO0TUnztjcseuFv-bSk9TZ8XPjQSQAyG-1A4FRRopfEb5gWw
Message-ID: <CAMuHMdXYs-YBb7BVvj-U4L5253jm2tcFkmTEF3MxQVrfpLx54Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] arm64: dts: renesas: r9a09g057: Add support for
 enabling SDHI internal regulator
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 14:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for enabling SDHI internal regulator, by overriding the
> status on the board DTS, when needed.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  * Updated commit description
>  * Renamed internal regulator labels vqmmc_sdhi{0..2}->sdhi{0..2}_vqmmc.
>  * Dropped renaming the gpio regulator label vqmmc_sdhi1->vqmmc_sdhi1_gpio.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Queueing in renesas-devel is postponed, pending acceptance of the DT
bindings by the MMC maintainer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

