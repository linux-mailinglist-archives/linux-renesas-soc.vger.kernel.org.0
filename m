Return-Path: <linux-renesas-soc+bounces-18091-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E696FAD50BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 12:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE68A3A847B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 10:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC922367B0;
	Wed, 11 Jun 2025 10:00:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E16220F33;
	Wed, 11 Jun 2025 10:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749636042; cv=none; b=sxfNXy+IZFnpgjmlwLVuVApvDy42dBUar5qdgL8yek3f8Lg7B2VVxft27QYZMPy+/B4J7yKUP9mjTkSUU5GUzHwFwUPTP1spQguOAcW57N/SHpLR/T3ahwEpW/mdq8GaHh9kaWDhQrNApZlhcowP5tYAasaS3RlMsYDSDxGlnAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749636042; c=relaxed/simple;
	bh=lLpBVWJviBGG4OM+Gf15b45ueWAxWDj3Bz8Bqt9hHw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iXQAXA+n99FVfmcGKMN0mhw2KJPGgi6s1RmoI83gekXjhLU4bsya2PcTxhFah8XgEgSyVQZLlduRRhZoIGuQIDKlG7uaZ1dUl+BegKutfg/oS62obZIR3qMTcqjkm6ir7U7tYJa0QaSVe+NDdoekVQ1Tu5gADjE5RZREPzQzLyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5308b451df0so1958412e0c.2;
        Wed, 11 Jun 2025 03:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749636038; x=1750240838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVNUt1zXJa9mOFl6PLZWhV0CAuJbuq8CgZxL2ha14hg=;
        b=BUPH2tRcgdsYAvCUUadSxInkUVeotnY+nMEqlKkYkvm3v4IGLzmeGRvacjWX+oBqxM
         FXYN5dfurxN+XBLbQsdyc3TP3Zb/BIvjEA+EzcuEtsWmF4ltmT55RysHt8xP2Rb9ao64
         lSraExolSXrssrttVTSYbsdwQF7YrfLzE+luhcwIG0Aywnot+Sa2NUcRUtJp14q53GGG
         xFx4gqCk3HpQrwCMCKo97Gvw3ftyhFTXYgN0byK2eB+Udv7b4hDXbPMo3nGsdXwANASu
         CpjrusQ8GHxQ6dNhS4vyoUvMVJ7m5ppaPd8SGxiwvZpmtnDoQPL2b+oxcLU0m001Ai3h
         nPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1ZnLP5iEkBjN2+LKGTp1ZXIlm8fBAfCcRn51TbOpjpIkgCeE0/9r13+1oI6+jwx8lIKys6MPYFCsu@vger.kernel.org, AJvYcCXv7Eiot4s5/vGnUBRL/LNahyT9TNCLx1o3fOMLGxwky+JMO+SEQqVaV5Em11djCEB+DVHFVdNO2WOx3ukxIkOs+Oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcBVOq3JEwqb7ugdyjpC9XZlB9FhmzaNUqFDup9bMpRP/PlBMM
	BnLMUNoAS0F20yAdRx77OtS8HYt7uUv/I8hbJXzzwFyMlPze+kxtlmDUsfgjEv+8
X-Gm-Gg: ASbGncs9coMzfJNPi6M8gXgBdV6R+1DPcg3u+LmiJbHNNYQOphkoAo/9D7kUznAxOF/
	kvgYIuM2mxsPc2NRxw7jmU+FG8/LEowTl7pRYx8u5XQSHnHhhgQbId4CnkV7nrYYfm7aX1aWMER
	HshdMEV410AxqyHmJYEttzzk1EokDXt5DmrFDOlYjldcBbjMAXKlJviRJmL/O/kdGs+YJLaXKLR
	Z+9J/2Vyuy8EdjQ1dIu5ZYw9XPmRORbRABK2xiSLo77/eeZp19pm3/yqg3BCL3pTeGbjCbTCyiG
	tc5e3yPFAgTlQhiXFAINldOSMlOsiMLTxLJ4mZ1PZQBCT7bfZW/NuS5dOO43aKyYOgqO4rJkCB/
	m+D1YCzkH7yJrVSqxDNEuUW6E
X-Google-Smtp-Source: AGHT+IE3w6r8DOMw+g6S1dMSYXO9IpZ460scIGQbPLWs/sztZRplSPwYceosafwA6YV0k/qbNdsVbg==
X-Received: by 2002:a05:6122:318f:b0:523:e9d2:404d with SMTP id 71dfb90a1353d-53122deb3f2mr1637711e0c.11.1749636037943;
        Wed, 11 Jun 2025 03:00:37 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53113c0d475sm2522180e0c.33.2025.06.11.03.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 03:00:36 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87ecca2dc48so1070843241.1;
        Wed, 11 Jun 2025 03:00:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0Ah2Vh4qyJCi+y5CD2tCqlR32Ucc1Zf3zjgbIZ9rtCCM2xf9hazryXOlxL2qimPDy+s0wvLOhyRCqgflXa6wCBlY=@vger.kernel.org, AJvYcCVBHS1Wf88FcvH4dYT2LHs3jekc4oS6Wpd9flD/zCzIUVBCYRq58kKcJSnCKUcvbd+O7q00mCUFw2jU@vger.kernel.org
X-Received: by 2002:a05:6102:4406:b0:4e4:5ed0:19b2 with SMTP id
 ada2fe7eead31-4e7bba2aa59mr1703833137.9.1749636036730; Wed, 11 Jun 2025
 03:00:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org> <20250608142908.54121-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250608142908.54121-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Jun 2025 12:00:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3zezC8X3Z1vSd2PuauaafQ1-3DdFueRu1UgYGy13Y=A@mail.gmail.com>
X-Gm-Features: AX0GCFtdl7eJYuvMUpMJQIJMqzcl4oDAUWuBYo46PLBnsCr9DCEg3l2ekpjPOiM
Message-ID: <CAMuHMdU3zezC8X3Z1vSd2PuauaafQ1-3DdFueRu1UgYGy13Y=A@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/panel: ilitek-ili9881c: Allow configuration of
 the number of lanes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 8 Jun 2025 at 23:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Not all panels use all 4 data lanes, so allow configuration based
> on the compatible string.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -43,6 +43,7 @@ struct ili9881c_desc {
>         const struct drm_display_mode *mode;
>         const unsigned long mode_flags;
>         u8 default_address_mode;
> +       unsigned int lanes;

You may want to use u8 instead, so this fits into the existing hole
on 32-bit systems.

>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

