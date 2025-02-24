Return-Path: <linux-renesas-soc+bounces-13560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EC5A41BA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 11:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EF5318942EA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 10:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86317257ACC;
	Mon, 24 Feb 2025 10:51:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5252C25744C;
	Mon, 24 Feb 2025 10:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740394261; cv=none; b=jpn73/7bGK+oc0FghStsHy3Ft5Fa3lu5quX8iJ9jbd5bDzRy45TMk3FPar80pmdRGOeZ3HJ3DIjOI/Cfncd2ueIx+iVcTQ4LGSiIjhIFMu/+5CJScNwkCDXNugKJaPahq5Q+cvQnzbppBnO3j772ud4nBstcPiar5kTbOlmc6UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740394261; c=relaxed/simple;
	bh=GyFOcA3OxwgMZUZIIm2ABMUKjnz5n6CvNzprvOPG1Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6PtP+Zd2vN3Kqd/58kThFa4DRUXIWnDfNC3yt3jwSLeIMb4CtJTPBOoVR9HwVQBn5iBKmByIBQ1nu7F0lu1H0C5835J8hbHFnNhVuGxq7rqED0FNc466nuBtmma/oOUgKqYAbMfi3PxX3WvQkz5y66h5WIFLSrcjzLB+IM7O9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-520ac2b9b7bso995739e0c.3;
        Mon, 24 Feb 2025 02:50:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740394258; x=1740999058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eti4nso2xAHeppArihbMeS6OLJQJG9XodfItlumAHDY=;
        b=VEMk6Xu6l8TUMglHkpeD4+Dts/eEM5byHnMUUPOa7aktfzoouG1j+IDCSHMQFZK4mX
         tpxfpdR0Sa+K17NRbC+nML9wThJ8RvVABUQyQnU/AatPFFHoIjtW1JZlRoWghPiL9VsT
         AJkBCNnppVPYIz6h5O/41gw/eXgypy/ZXz0e8uVTXxwNxKx1lLFwLKxR+9sI7wvfV7qU
         tHqqF/sqb3inwt9kotNWXmUQWRfm03R268I3i0zt9ondfMbm6wrbYJlpG+o1q1CYNiB5
         kc9Aq6JXcpAXVbmPwGY+SpC1i2fu4kQAIYM4SQiko5nMZ3uei99nUJM8QSCg0ABSz+ez
         CWlw==
X-Forwarded-Encrypted: i=1; AJvYcCUL0s1jDU112k6lmbH5ZsHBsT1UOvY8BVW5I+k3caBOqGbF+101V/Y8KxQzh52MReWlFzJULqEu1U4P6KSt/7rAojA=@vger.kernel.org, AJvYcCUaGzGS8EkaiUy4uYr7NdXNHDyCi4z13ugQ16aZ4hFCe0lNBNLBzbyQz6PM0E58yZMsVuYfRt6481M=@vger.kernel.org, AJvYcCWD1+VNPUyR6mEp5zoPrM2AMx2FBhPDM16pKvK7yxDN0Ieuknq+Jmq1LyOyVZjKmeQJSaSHvOzmgkqDXoyt@vger.kernel.org
X-Gm-Message-State: AOJu0YwRGDofoG8s4U1jLTnyCP+HvV6waYDTPGh05fTTf5QFxSe6J1mU
	+hFgZ/ZtscXWI15FAQKI3GPOBup3lEhAKGS4bG3W1sqNjLlktWQto5mKQmngIQ4=
X-Gm-Gg: ASbGncsYr1YR1fql3y0xHpTbIw++M5Trl9+4HvbyCDwyAxmCCEYo4k9OHHYJ5Cw7Pmd
	WZ7mXdmdq+fDaM8ekWqCFfL7cdOjFJRSOg5F4dzBgNHQNuKW9XJ3F/6cznkmeWGvpfminBD3Xfx
	cICGzEcWmU7JbtEJbn4XPUV7H7Dn3IuSRaOfwFa1oHqOGeeDURPcgZadscooIPwuTol2knRsUiK
	4dSyFybEcuFQa7M9H2MLC9jrhSzCAh/Y48U/xyDwMuJ8h1GtWxL31zAcMfSktq3aI1nx4JbuXsM
	PtqeXSb1S0Q9TXL/EnY0dqizDAr3Wns00d0TQw/FWiY7nWsfGOVae/ZKULtzygwW
X-Google-Smtp-Source: AGHT+IG649r7BHF+rPLYgkvEorG8KIuXFkp9hGuIpPx1reufVmsFCAHmMpChNSjpzjI+Gq7H2euZLQ==
X-Received: by 2002:a05:6122:608a:b0:520:60c2:3f1 with SMTP id 71dfb90a1353d-521ef8ad527mr5361913e0c.0.1740394257715;
        Mon, 24 Feb 2025 02:50:57 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-520ba1193aesm3130326e0c.23.2025.02.24.02.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 02:50:57 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4be75b2bbceso1460418137.1;
        Mon, 24 Feb 2025 02:50:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWogoWT7cHccg6BQBIiPLVGnC8N4pGb5wUwgBNrTV2Aliy0Lzix9YXe9GYNwAGq8rdQJr24EH8sylDgRO4@vger.kernel.org, AJvYcCUtC9lWDcwCWGWCoOR+nI0lxAbGfnGew+lyUK+03y06Va4JCCmVWD8tGgcnR9nqfs5sMCmg4iMcaW3mWfgL33EMs2g=@vger.kernel.org, AJvYcCXXw/M5jFWcW9rMJaolGFZxodJ2MTSDKJYdoeF5a9N1ZRTYwTUmnvrouWXJUUDOAZx2ucT5xLXctaM=@vger.kernel.org
X-Received: by 2002:a05:6102:41a7:b0:4bb:c9bd:8dc5 with SMTP id
 ada2fe7eead31-4bfc279eea6mr5617678137.3.1740394257211; Mon, 24 Feb 2025
 02:50:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220150110.738619-1-fabrizio.castro.jz@renesas.com> <20250220150110.738619-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250220150110.738619-2-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Feb 2025 11:50:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjbuTJyonB1paY+chwMORG4WroZG0qsGCR1DW7wuV37w@mail.gmail.com>
X-Gm-Features: AWEUYZkfQB1or1RpUu8mR2qJmTsSi282VL77AdsyOUW_0x5sxUAP1llZIUU63FU
Message-ID: <CAMuHMdVjbuTJyonB1paY+chwMORG4WroZG0qsGCR1DW7wuV37w@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] clk: renesas: r9a09g057: Add entries for the DMACs
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Feb 2025 at 16:01, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Add clock and reset entries for the Renesas RZ/V2H(P) DMAC IPs.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

