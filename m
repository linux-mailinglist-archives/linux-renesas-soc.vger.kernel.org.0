Return-Path: <linux-renesas-soc+bounces-26050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B1DCD8DEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B028C30004FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 10:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FF732AAA5;
	Tue, 23 Dec 2025 10:41:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F03E238C3A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486462; cv=none; b=QcpXZC+quUJwY1eIcWWGIxv1xII0+lsqq9/D8+oaBGhvds6Gb3C9iohOmrcfYvX61bMpZCRhIqbPUEf9ry3vpTNlmJFi9Bg9+vCKeuVqVJ3275nmwOTehsceZ3+i9B7AGzJLjNKeWRl5OZpZEath8t6aZUslGDUsB0Z8oB3yKZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486462; c=relaxed/simple;
	bh=66jVhePVgbDY99R/UaDytJcux4TaSRR0e9iC1VpGw7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YsctXtMLQ9D9ALX5/GUOs8TugYxW5ZLLjtWwmoVUDiYrsQOOTkQOOV+9/HrvBt0c8z7MlsHsRTBuTwBrRhaInyG3XLKnOwOwKADQTUofzDdn5CIeH6Ha6FRIPQGyUWWUE+uaqJNuuMNEm048R+fDgFIDH+YXfI7GmAVq92OyV8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5dbddd71c46so1666223137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:40:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766486458; x=1767091258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXELbjF6YF4DeXko/6RU1bv5uamffDsE6H3g1pKMitA=;
        b=c8iomHOoSexLe7h5PqvnOpP3RmyFAc6TBLzDI28TdpQnJxz78yu8A55TL+1XKRQq9F
         X7Hs5Or8oJiQA8hHm9lwI6q0SCqRs0uawgiqZ1674Z6+Wp1XYwYFXHbOkSFUfgwnm7TO
         HBNAmZfrIeZ/+rjqTgYYDly1B1e945PfQUuhFAOsJwDVi6ElHQYVGgvWe6kwP4ucX36H
         AQ0MlayM92DdRn0KiAwBV7jxeMqP8mqg1zitLlqFxT6+q5NlJZMQzSBy+Fvjf4mZkNTk
         vtYUqKNV9IJIYEVf5Ql2esH/KAr/SQF2SK18/GlTUgF05Bym30T66Fr/SmlmCXzaO4/U
         B4wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR52DJr6RdtTxBDkVMWrTuSGF01F1zhZcpMiC/nNGkBLXh0QV2auClduOV/Uk6WE/INFu5tly596+iTnJXsj7YwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPr7aBpSUJ8jpdQNv0NgczghHvfCPrwcL+R60FK8ZEpEAx88lv
	MJcTtNUIlb6T8/WwXirEIxZV8PQhv9SxVCIGJ2pMuNwN/WCiuYDG1dAOyLFIugdF
X-Gm-Gg: AY/fxX5VvYhPITlvu4jib4wDNNL4HnG7Iwoz3b7jTHcask3I5CKK99l86IJLEgKPyg6
	7PFWGfAFtmhR9VOnZT4Yu78D1Vb8pxhksnnwAmPS0/xhyACbfepc9+eXtRRdp+V6IaCoT1D/2Ls
	8EpG4nqkIMIAiRgtpN9Q+k9DrMIy7WfH1XqGFXiyPht6VifTCkeWpwIJ4hsiLliZ2r8fkQwipOK
	YJL2mmmwmwNbmBW2Ue18M2/+5ICRVNmY6o/uHiHE9lKb1ErPXOrV2ET8O+IEYhw/RSQSeKN3NGZ
	hxV3ay4Fz4g9LDjdW5RLbpcEE/Fe7MJbIbTudiGi294pUjrAd2S6XlKwx4EvYkrrzZNvfFARj4H
	XI1DfKcIJmpuAqun5vYGxus8+GCYuA4Eme3yWnNgxzhUiaXKZ/3GCs1Z6yfnfVwwUJTK9RlBQac
	3oiMNu+r20Qmv9qBanEEPOxRTg8zfN6eQM+liQd9FjeKMPLxFZYsu0ODykuqY=
X-Google-Smtp-Source: AGHT+IHoXwZGVwpGy9UufcMPi+55zBut/0o0VmMDzUQTSPBgMaHo0WjJTlpApIT+VTqt1f8sQhd2mQ==
X-Received: by 2002:a05:6102:4193:b0:5dd:84f1:b51a with SMTP id ada2fe7eead31-5eb1a838ddbmr3510834137.43.1766486458272;
        Tue, 23 Dec 2025 02:40:58 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1ac90a6asm4201979137.13.2025.12.23.02.40.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 02:40:57 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5dd88eef2f3so1716256137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:40:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUR+kl4pDTTg2AYCl7bsK7tP9EN3TkvZ/J2DFEqiw1YcyD3RcfpyUjYBSyic5wD4r5S4wRZITfEGi6bhMyWR8a86A==@vger.kernel.org
X-Received: by 2002:a05:6102:2c83:b0:5db:cba0:941 with SMTP id
 ada2fe7eead31-5eb1a833fdamr4565375137.38.1766486456463; Tue, 23 Dec 2025
 02:40:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209091115.8541-1-ovidiu.panait.rb@renesas.com> <20251209091115.8541-3-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251209091115.8541-3-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 11:40:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUqntcjKsJN=-hiVcXfan5Ps6bBjknQ3aYbc8+z7+1eRA@mail.gmail.com>
X-Gm-Features: AQt7F2r-712B74ouLs8f-R2peKEALS9-alhfFATxSjlyRwz2ItMteJAgsFd78_E
Message-ID: <CAMuHMdUqntcjKsJN=-hiVcXfan5Ps6bBjknQ3aYbc8+z7+1eRA@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r9a09g056: Add clock and reset entries
 for TSU
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: john.madieu.xa@bp.renesas.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Dec 2025 at 10:11, Ovidiu Panait <ovidiu.panait.rb@renesas.com> wrote:
> Add module clock and reset entries for the TSU0 and TSU1 blocks on the
> Renesas RZ/V2N (R9A09G056) SoC.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

