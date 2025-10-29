Return-Path: <linux-renesas-soc+bounces-23870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23311C1BBD0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 16:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5923D5C6262
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8244B2D8391;
	Wed, 29 Oct 2025 14:52:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ABB21ABAC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749530; cv=none; b=cVHt404LtNenOlrLViW4uWcWBsrSlJY1sIEufhPK4WVJP0L/KaJfPVFHXOsGFQP0hLHj4oMYy1N1zL2a1mRE5ilq9uDCtJ6a9TBI5qO9z6ixi5X3gK7oXd1gbAjjmdytWWmBZlmjc97PZTiT2HcZFVRNNvCl+zPFO0srqrvffYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749530; c=relaxed/simple;
	bh=x8Q6phZmuf/56rhTPcAI9gNeRvjsr//c9Go6x2HJnsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nqKWBq1Dzf81X2m76+jq7jwIIpnVOMpU7zZQS6CXwWQtQ42pzSaULxFhrT/NXNq39trz4Fj5teOWfeNI9I8nE3pYWr6yuYuk7zYjqIAYUsSQpWif6l3ktwvXGJvEbmNZC3O+kDEZK2CM3M2sg1IIHk5DKYpLnaYmkKfLDXHpiVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-934e487a957so1967301241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749527; x=1762354327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6X2VdOjut9PuIWiMUTBESV6nSJnAJvEj2IyZk3vIzkk=;
        b=EmPF0u8IE7+iNqdSk4oKxzfJZL8m5jkbwLmaWInIrZptDjU75APrsIqrN9W0vniu+O
         ri0rwxKcJBwmZEEdH4/r7jqQgDP+QqiAWL5dvMZSI44MDUPxJBCqjigvgWTQEDBTRlYu
         BZsGv5C/KVDXdm0rGSYClRZNS0XRsf/SalQILyiAoNVKgUe2qHznaZbMAgVQCCVOPspR
         ufiFfqWc5u7Cy8T+pOvWL/5b3E+ZGINmBHVxea6OUrkdF/DdryECFyeyv1qOqM1eUD02
         kgyc2HyPtQ6t5pgmGE3AaRD1oIvUyAdcuIk+k2zYIMlIP8EKjm56bZqF/NAb+fFkmlcM
         F8mA==
X-Forwarded-Encrypted: i=1; AJvYcCWimeL7Agei2x8rxh8P2IMV5zz0fBDJaV608CgaD6SeRLukbOoT0mSaimvCIxngZm+Z1vy+oSnimUo9i516SvTf8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQBPziBNNqlj7K4rliwvRpIIJLTkUrBgTqwnR+lomUXPVMhXgV
	ZuNLXf7KhDusv8jfSX3xROvAGUdJJCeuhwIOS0fa1PWTcwpWG+zJPP14988Je6La
X-Gm-Gg: ASbGncvanXAl0weLzcIj9a9xeMDeKkH+7MVjoD/etoRSJBF8bTZI360LcrsnmeW+aYv
	T+0MC8DO+VZUyWvsR4/J6wW9B0Ws+dz2QyL7lvLoGt69tAjEAi+0UCc7Fr6JzrufKUTEMR2UApc
	NFWNypfKonU8mTg+YL5Y2YVBvvwGCCT8iVbqM1Mb7+f9oUDi6wA0+qPqr1r3wv2T/+4zVYB1IsZ
	0l91kjvEPz5tT9sACCsLRksm2vqTONr+/yJY62dlcXhYzFaKGxpnZhDMNMQriL0ICG1a72Y75Ku
	LlRxXm5K9YZWPoIs7ggHqyRZOW2wGjyFpfrDpkym/zxJddHWtQ29s4P6Qy08hFOWSSfLoSRrgOz
	+i1s646KGEnPw876uiKD2mNZGYQeQKg2e+Q1mJvbvCRIXkNzdSrY861j5H5nromAQw68VYMNJ47
	MlWu2fxrluKf3FzKbVKrcgVVUV/a45IW22rVuYO8Zuvw==
X-Google-Smtp-Source: AGHT+IEJDCZEDK5iGeCpd6Ubg2Y1bW9mAPu+yc6PvckxleFWOAk7jX7gKHL7wk20z2cPJT2tnsDs8A==
X-Received: by 2002:a05:6102:549f:b0:529:fc9e:84ae with SMTP id ada2fe7eead31-5db9064ee34mr1035744137.24.1761749527494;
        Wed, 29 Oct 2025 07:52:07 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934c4098715sm5197630241.13.2025.10.29.07.52.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:52:06 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5db308cddf0so7596953137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:52:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvBI4N/9yUIBOOr1XRzZDwdvwegaaLbQaZdwPNygTZwA3KWu66Rvucz8ZdW7VsAjRwWrT5AypXNUDdCWApAax9eA==@vger.kernel.org
X-Received: by 2002:a05:6102:2927:b0:59d:ad3:e1e4 with SMTP id
 ada2fe7eead31-5db90575883mr955429137.5.1761749525479; Wed, 29 Oct 2025
 07:52:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:51:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwXjE0Bq1KjENkN4m2h0_nN0F2S=CC8mW3B92NdpN2_g@mail.gmail.com>
X-Gm-Features: AWmQ_bmfWRMn93VJbp2i3KyknET1ZJrYFFCyir3HovrKjiX49vnsC4NYomuCi4I
Message-ID: <CAMuHMdVwXjE0Bq1KjENkN4m2h0_nN0F2S=CC8mW3B92NdpN2_g@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r8a77960-ulcb: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Oct 2025 at 22:13, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on M3ULCB with R-Car M3-W.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

