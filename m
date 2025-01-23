Return-Path: <linux-renesas-soc+bounces-12383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56243A1A252
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 11:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E0563A8E80
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE7420E009;
	Thu, 23 Jan 2025 10:58:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA0920DD7E;
	Thu, 23 Jan 2025 10:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737629891; cv=none; b=ZwkTxsKKNYdne0eJ71YoTNP0kYUB+53/1GfULqi9d/FW/hIHA5WAD8cUCxnGiIMPZFVB4F+A3BuBW4jWk32EvLyJs84oROVQIwq2x5kksW2HoMFtEiORBSr+d0XR+cxmNuw/yt4nIo8YHhZqlcqgqHo+SRd6tFF2eJcaGyEMhzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737629891; c=relaxed/simple;
	bh=kzN1iPS05c08XIS5N8FhwFcahqh/Vzc/wu9+I2HFx3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KC7sTI8leVERwN2KtcoP7cOHx03zoRtLN5aJiNmqEGBmb0DxKP/YufyR9HAS+O5GgEYB9WzhPsDTpIPFeATarj8CFaxITY9a9uxEIDbGemrUTbHZUaVwYpeFQPnphkBbT0YQG9I6MMhakyL+EOyJqfXuq35H1CnwrW194WoSFXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5174db4e34eso1083156e0c.0;
        Thu, 23 Jan 2025 02:58:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737629887; x=1738234687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEqnjUqnJvNRVIsnXUAtnL2nqKQ5PJvu7eehgiPdbTo=;
        b=aEX10DpbyzsEtcs7r8vDw6a45tIZVtGMx9KfzRIcnbc0j856S4rSdO6gds/KLdu4AA
         nnJhDHsO0h4gWjD2+L1O5moQ0Mb+9FXu377Coy+vEbB1p+aGb35fSJRb1rijO1Jlc1kI
         5e3sZeoqJkqRAZOLbMOTg8egUGJhaGLQzNSqmwdQ6Zuao7M9hOPmaDkMD6tTMWhc/Oon
         6wqNwN1VM8IIenPUEsdh2WbC3aAd40Pa4jYedRCbbOSPAilj7F1FPn2pWl/d6BusIfg9
         43ghH53jr/OGZgM3HOXzsOGGI+zKBgmC4jp7rxC8ACvtKFxBoAUKljsHaHn2yDbmu+4f
         4EXg==
X-Forwarded-Encrypted: i=1; AJvYcCW/SOgoN2JfFkgvPXvYojNYSvuCu+EXk4ZgD58d46Cs4IOKDzoFYbEa0Y+Sv6QTOSB5IZ/biq88DCOufiTjNu/Mx4o=@vger.kernel.org, AJvYcCX+KIAYGRATqm5GLhWZkgccnzUmEdrAKeI6lmNg7WSjHWbHK/+7N7xihUh9CrDzOOlCYlRaZM2toAtkfkt7@vger.kernel.org, AJvYcCXwGCcDV6THjriCSHim/TYfLcyfCN2UZ+UgAcUNzEQd63zHqSQHSnaidZn+m8sfA3IyOE2bF8Sgvybt@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhsjknyigcd7MAoToyngIwCLcAy0CSrP8QHc8YJpExd7XZTzoV
	LCa5bh4bysjqP9doaUnT6chQMSWshE9AAarmPWALubGaS89Ap08CiE+rl/b5
X-Gm-Gg: ASbGnctGJ07nEQiq855xhL7nKLgceghqTVvn/816K2ss65/Okakghu90nYKmUrKE/yK
	J+zveFfxW9+nRdxsiRtiERUQfDilux2kWGBPpI9DB9UT28D5kk9vih1dCre7SXiRScDjEuzmZGK
	rarKKi6D0nlDAaYawbjf26ZsoYM5q60800VST/vlV3IqtSqxJJzOTPpyrcm+2hKGgo4B/562ziy
	ZWAIJUckUUf76V+M9yFjxhoPBIBKoFmT9qkEWxD2Ku1I5FGxI9uiODy+UiMtf8HqpSqLIrxj+/9
	lZsGbZAlcXEqjk46Jj84V+905MUvVAMIP/jxWLnAEnooOZciJrHg/w==
X-Google-Smtp-Source: AGHT+IGkbQHU6z8P/lN8OlAzDb5SSq7KzZ2H4/bTS4Rx4S4IEWSBzsEKoGKP+/1zh/MxE7r0Ul6ygQ==
X-Received: by 2002:a05:6122:d1f:b0:516:1e32:f8c7 with SMTP id 71dfb90a1353d-51e3db3b80fmr1137814e0c.0.1737629887316;
        Thu, 23 Jan 2025 02:58:07 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642cb09232sm3328939241.19.2025.01.23.02.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 02:58:07 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afe2f6cecdso933098137.1;
        Thu, 23 Jan 2025 02:58:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgn1TBM/iwsCDPyx4an12FVhAWa1C6vKrluiedsLnvCyR9b18xHe8Ny1kZggBx4z0YSq5PkYzCq/cV9bac@vger.kernel.org, AJvYcCVDHhogD+g5KW+fgXgG3ejsE1kM+DgHEeQCfx6NFI8ybMakGFhiPAj4q7mtaVvFMuiWkHIQ4heXZv4fNoMjviBhIb0=@vger.kernel.org, AJvYcCWAYtNDLOQz7oYcuweoCmIjPHaaO4EAU7AQnzbXM4gXC1RmnS/slFqqvbnRZ9/m0KzPQU5oK8+rLpqb@vger.kernel.org
X-Received: by 2002:a05:6102:3f55:b0:4b6:8bd1:6b5d with SMTP id
 ada2fe7eead31-4b6f79c80a5mr268733137.1.1737629886920; Thu, 23 Jan 2025
 02:58:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116144752.1738574-1-iwamatsu@nigauri.org> <20250116144752.1738574-2-iwamatsu@nigauri.org>
In-Reply-To: <20250116144752.1738574-2-iwamatsu@nigauri.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 11:57:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWMi3sBNO3axxuZx8J3W7ANkYK+J03+-HYixjyn58fpjQ@mail.gmail.com>
X-Gm-Features: AWEUYZndAqy8oIXiwOY5eOj1ZVKizXyp_gpeGKrmfMIjmGd0ho0gO4T1W-Nbb90
Message-ID: <CAMuHMdWMi3sBNO3axxuZx8J3W7ANkYK+J03+-HYixjyn58fpjQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: renesas: Document Renesas RZ/V2H
 SoC variants
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Masato Kiuchi <kiuchi_masato@yuridenki.co.jp>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 3:48=E2=80=AFPM Nobuhiro Iwamatsu <iwamatsu@nigauri=
.org> wrote:
> Add SoC documentation for Renesas RZ/V2H(P) (r9a09g057h4[568]) SoC.
>
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

