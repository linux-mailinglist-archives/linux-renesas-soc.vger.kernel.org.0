Return-Path: <linux-renesas-soc+bounces-25987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2259CCD6318
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 901C73016FA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F9C30E0EF;
	Mon, 22 Dec 2025 13:40:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33C631AAA9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 13:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766410803; cv=none; b=EoP3s00P1/jFUJehhYVJM2jKCpRFqztHMJzPXP3AdH0JaCgguKZDLLuUrZ5YtHFgbX52DhMmUiBlcvkVycUEEH6o5I/1t5hQXluHgAaffxRE6fbfhAjH9YPH8vkWIAStbAQYRxafsC6DORovcYctQr2ATszMyxKuDPiPQAUy4pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766410803; c=relaxed/simple;
	bh=haY2EZxD5ZAXKTFe/y85B3MveSLT607huJg7ABgwLyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M28Uw1hT03Drr0TLfED/otoaTRefKRkcIRHUeLk4KY0PaWgdTSshVvhzudRz9yB48eWBKBpy/qG7BPzHU0iq0o5CgAJRNU3WzPRK7VfnSZ76w0zOye6eIDaTUHSFY5mFAWLlCX83SYS4gJBtyE7c3M8toKDXd1M+rniItBzkgfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55b302b8369so3206423e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766410801; x=1767015601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2tpyO4ynoLOcQsCwYkZ7r+s6TAoCfYanIoViD10XPI=;
        b=OjmM/vRWWE8S4TQmUqepWUDyQX5DLIIi4SeJU+vA8fnlQsaw8gmVrvSS/U1QMWhoRM
         6gAyra0MyIVQwbvlszmsf2AP33jTdphXObVNLKzYmksz2MdlpmYfLovuFqJQiFOwqq4p
         3BmNcUJazOvmvAYhw1HQX/yIC/edTIFhdUmfQA6qk5d9tIsscC19Ay4fXQW/TWhejvtU
         mPVCmV7ShN7VU9n56EVKlaDz7zvvyfGBxLFIo+voOb4FsoQJlCrO+nRVia27vJt15QDv
         Yf9mBllQxZyGrsVBURWX5P6YncQwW9K/lutkdZ76VxBTPzsXpZVp5PyfW/gEk+XXdJUz
         Tjhw==
X-Forwarded-Encrypted: i=1; AJvYcCXUf5eWsnqadHLDR+2ClfqeTdIjp8Y4KwOuyR4y+6/B4ma8RsGPyVymSexzKx4mHk0f3dKHhe6M3SY7ID1ckQYCdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp+NN/VRfMh7Uyjsgxk5+qs7HAl8mkuN6sMH0tF1AcmA0z+V2+
	vhphdiEonW8oct1k+Ebzyh4BIyBXCWnwknhT30ugw2G4h/KXoZE33slA8g6EVvsU
X-Gm-Gg: AY/fxX61aWXUTyFnhvqM6Gt6ggKFGeZ38JRLc8QStM1m7s7hZygp05taOcBBqrJnrKM
	+n+GNoDbcWrBY/s7Qpcw9KSmZ3154niz/yYCw0o466aamKzUG6lTi33ym1pLVIIujN31/9rKqZQ
	f+EvUSJPlRAOFUtrn4m51bS3wV5IgaF6usI/H2l1DbHe+jX4jpktAR5UfkQy/BISL8UVtPXW9Nu
	TFox0EPkI4WO6MThN2PHsCnWN8v1WsIi/Zs4zMAirpYgeOvqKRtGYxkuNdDfzCYn7JfbsFwRObp
	csAgSS3IJ5qoh83/huQWZ3QXKobujviaAohhQdb31NNjHLCFRIXaPqtrJI0dj2XbptwEJGMpl9x
	cGp5kvEzHKVVqeX3480VxJ8ifEhXUgx7fEdRdqn0u8I4zBe86AS3x8kAB+jJ2CTnF4rTwyE5uyv
	oKsgCHz+rMwxXjRio+LqD8y5q11itSTf+OvM9wKwvzYThdBqhf
X-Google-Smtp-Source: AGHT+IGB3zJFnTj9tXyDzbFYFF0LvyLkGnDFbaJfqSTOzBZTZMdL0+H0nAJFV20s6z5IOadrvvfvHw==
X-Received: by 2002:a05:6122:884:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-5615bd1b390mr3978757e0c.4.1766410800885;
        Mon, 22 Dec 2025 05:40:00 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d1329f2sm3529998e0c.14.2025.12.22.05.39.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 05:40:00 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9413e5ee53eso2317710241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:39:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2Z96SZeFX8LaIoQIEyGlEQs6RAEQrP562Wd5bMW1xZhJgT3Z9qF6t7ZOe9+cSYXimKQgh44/ajsUDyzZYqUn2PQ==@vger.kernel.org
X-Received: by 2002:a05:6102:9d9:b0:5df:b7f3:5875 with SMTP id
 ada2fe7eead31-5eb1a6259a2mr3626342137.3.1766410799575; Mon, 22 Dec 2025
 05:39:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103200349.62087-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251103200349.62087-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251103200349.62087-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 14:39:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRYhGHq5qFBRtWruf5FveffOrPJJSMNt+4Ve9OWvM9xQ@mail.gmail.com>
X-Gm-Features: AQt7F2oo05AhR-xHy_XZXzBD3Ev-y1asyTFzj1xlOLbGOAKbkqifg7BU0ORAwMY
Message-ID: <CAMuHMdVRYhGHq5qFBRtWruf5FveffOrPJJSMNt+4Ve9OWvM9xQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable
 DU and DSI
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Nov 2025 at 21:04, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable DU, DSI and adv7535 HDMI encoder on RZ/V2N Evaluation Kit.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

