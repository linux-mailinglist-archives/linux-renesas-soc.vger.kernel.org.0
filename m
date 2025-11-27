Return-Path: <linux-renesas-soc+bounces-25300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 81402C8F943
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 18:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EAC4034F6B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFF42D8DB7;
	Thu, 27 Nov 2025 17:02:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A18F2DAFB4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 17:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764262928; cv=none; b=Ub9mBDNreupNkCQTjyD2D3AUxO+Kg2Tf7+oj/6h92KXsEDvWybzPuziisqD6H/mfmPyoomnbG5P8tmSH+cGkqcyvJg/irgEuyq/yYSDADowRxVdV8Q3Xaq4jKzSSjacSO2lDxcX5XeU5BNRYUsXB+Yd4K6xEWPdkZt7L083kd68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764262928; c=relaxed/simple;
	bh=HnW7Q7QVwG6FXsg9cOfQjIJ/kbLicLKBwlgZHTci/Fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8B3A7nLeQ9zfOMXQpuzD92RSW94AI0i8B4hNlQ/cTva1RWgUnvnSfASmw9Ibm/wijHkFn6NKAFNpZ46pdrj2JpumHMVt3fw80QKy53HP9UERqPVKqssJmoEUQb9zFUcWhxZZRzeRjxG91neMYLsf5y5Sdllhpqrr5FXqX3pfHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5e18598b9b1so730922137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 09:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764262924; x=1764867724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+tNcnMAcw9M7rle1Cb/PdOj9DMI/j+2GuvwBiAD1H8=;
        b=kLkUyu+6OsJZchPtDjBgzQYusW63P5iQkYPMHqaAgxaLluaOQlpre8ZohZgvogYCk+
         eH5eRENe1iSEGa1FbS8e5tWlorTNPIP+zZXPkwmP9ZO+sMJetSWdosS55N7i2rudNqM/
         WCLGSurHc/nAWBEA2wIa0evV8DaVUlxOJd6sLaL8vTXDGlXf4ALDOanpQaKvLIQoReJl
         njebzWfRjvCJeYmFCyDHXVvIulh1lu8hO8Qugr6FrofmgwRYzGMO632zbcGgjcBOlkWN
         OT3O6/uMQo12XkiWoYSZK+Q8WMryfIZMd52Czc+3y1VlAFS2xud+HczKSHX283uDHnqn
         EKEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV46IjY1fmjunHqxv3yi5YihTuc2ON53XmelGHJKh+zsSuLpKi3qEsg3lAE5/dQ7WyeycLHZJB+vMlawI4VsL11hA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8oUWChqTQjJ412ZzTJXvcka+DVAsVVEg3q+uvAKPQzwVK8KFO
	qRY0lF3bkzUVKydNILX0Qu7F4H9DkhFrtp7VGNQrw/l5mQb79Bk5L3lUHJu6cG/U
X-Gm-Gg: ASbGncu5e5HFX27b7BBTgLJaNBNEDK6z62AAg74yB2GS7f1DFk11Z7RaZOdhH43dsR+
	FxlPUrm287v4cylw+xC9WwBKIUemk6zI+rHYTNAJ/9p1trlfMlr88fjQ8E7tLM3Oq9UUtYuJY64
	YwQ7gcmwEZMEAWLOO1N7003YrAoo+Qhx3EF2t/wZ/AFZyGfRAeRsnAyk73zKh1VA0vH/piCqy7A
	6dBrCRg8DKbXXmmkXyoTH2say3H5qqr4+f6xUWwiszZIQL/JFzHv6g/INuxzxSmCUSPyEmTcRT8
	offHcvYFih9opL5QKZZx4Ixy+6oc2OIFPE4znZmui/Gmhu/3Wzxu1cjoTsiBsvG0ws88S55h3+1
	EzKjeY6au0/4M5aNATxtaDQK67wKZeyWQ6LuAMKeDxuKm2R/OQhIiJwlGtRNXnfcep/fA0vKA8U
	pI9YfJU9Cwk12LmOl2NrX0e3zkTmWmdYuejTJP0JfHJLdvfFr3
X-Google-Smtp-Source: AGHT+IFe4xjUMx7bHE5Y/A/zXxu+7qecKoGObn+xW25h6g5WdkBtxLmwXIAs6i45ZifQuBPikwQBVA==
X-Received: by 2002:a05:6102:26cb:b0:5db:ca9e:b57d with SMTP id ada2fe7eead31-5e1de0f5106mr8892828137.19.1764262924065;
        Thu, 27 Nov 2025 09:02:04 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93cd6ce2180sm856561241.5.2025.11.27.09.02.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 09:02:00 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5dfd380cd9eso649620137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 09:02:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhESJiookEp9k/7gqS6P1VBeRx88NvlWGXh07waVPTMpVfLKWBub11IewDLq3llsvYXKpggJ3pA3YhVpOSzF8j0w==@vger.kernel.org
X-Received: by 2002:a05:6102:5a8d:b0:5db:f5d1:5799 with SMTP id
 ada2fe7eead31-5e1de2d543fmr9392802137.33.1764262920106; Thu, 27 Nov 2025
 09:02:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125224533.294235-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251125224533.294235-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251125224533.294235-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 18:01:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBg-1amO4CJenoz+1pFRY-EUDFWncVKj1iJZLHeYXgnw@mail.gmail.com>
X-Gm-Features: AWmQ_bl-sLAuEi0vqmBQ4eHdpjIgt9LqzoM-QwU9HvSo7PS2_tjhHaAZM07D9Bs
Message-ID: <CAMuHMdVBg-1amO4CJenoz+1pFRY-EUDFWncVKj1iJZLHeYXgnw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r9a09g056: Add RSPI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 23:45, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add nodes for the RSPI IPs found in the Renesas RZ/V2N SoC.
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

