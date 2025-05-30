Return-Path: <linux-renesas-soc+bounces-17665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C43B9AC896B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 09:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9D033A6194
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 07:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D8F211491;
	Fri, 30 May 2025 07:51:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43C52AE6F;
	Fri, 30 May 2025 07:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748591485; cv=none; b=kATe9Ynn/xe1bLMxifm5r/CiaRE82VPPsL0LCAAzK7wYKsYiFQyaqs/a+re5fWPzqZx1lErt1k5eJcp6TAkDJVIkvgIYM/2nYMWtjkUqroX77xK2cltrKCZcXQ2xp4g9vMne/KJxJxQ0VzJg6JbD31R4CXrIuO7HWvR9mIwzNOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748591485; c=relaxed/simple;
	bh=kg16i4Orfl2Vn03xor4gIQua0MLqSkj3tvVWVzEOlc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzCFIvNMlWOUTIMASdtiU2mD5a2FHEh8wYXSUQLiP7/tJYWSA4j8QL/OpmCod7x+8GaDQRMqK69ZmGfKeCoynabQ4p+CDRrjsoBerc4gt9PoE+gpaGmEcDJKWG0v+2qpk7eB5QGuGESUSB6SnFbd3W8GDIPsfEUx6xMbv1WnI2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5240764f7c1so522309e0c.2;
        Fri, 30 May 2025 00:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748591480; x=1749196280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2WzxSo6sYbiM6b0F2XSBjn+T4nA2ds5QVgGNEvrhj8=;
        b=xHsdA8/Rj7+wsUYEeR2PT8FPGDb22RcZSvHw8IA9DM5WrptQemciadUn6WuHZGbOGm
         qyOzbP+dTTh0JLKwkIGizybAiKjvO7CZy9TG+jlO8bdIPFs6QYz9bajzhfW2inhYNNyi
         +tiwOIah2LQoLdtCa7nYnhcT+XhqgczrhjDx/hwrCpaK5CUzUEHNDDuBsUmd7uS0gUCo
         HD5BdiQ3FvopP0iE/tOavE+7VRDuUXF/f1WZl+vCU+YDF3IHgIM3jU0MRFzePXNsT6pF
         EEeWwtpnjSJZRzPkkqu2ZMgYllybgS8BxY5FPMr+xTAjEQzCoog8/HCmruaMBjdX44EO
         3gjA==
X-Forwarded-Encrypted: i=1; AJvYcCU13Y1UDUtMmrV/v3GFfVLb3YkVTCW8OOsFPFNTionOH/4cnq1ElQTi4/OKaXjXi6BCJVx7KftQzmGY8cOpIT8EfbQ=@vger.kernel.org, AJvYcCV8BN3XDxsBNjwbUbNeoMaXf8GcuM2cFMf7uvtAE1JEnIz0MsuBjoG9fcUIDGcr+c2oJkTqVdjs0Gi0@vger.kernel.org, AJvYcCWHfn42hJK4zUh5OLFzw9haNwtZacLFMp6TOIIwNI3HJw6di7nz7Wyu2Qt2o7bQswQnzYIxh+iSTpJhMuUvgQ==@vger.kernel.org, AJvYcCWhwFEE5Y2w/4ZG9bFnZgUT3uussrkUsO3/Zs6J9qPRuEV0ewiXtLcxadoGQA+TKN0xQFHhZfUxg+WWcVxx@vger.kernel.org
X-Gm-Message-State: AOJu0YxPARXJzmjdNayBbkLQXWpOX1+yzOOkIqNfOn3mh8JaNaPyONlK
	1MZC+m+XEW9Njxi7gDSB+mguxN7z9ftwj33y4HbnBtjLiPMT0KpjFPjD801UQwOl
X-Gm-Gg: ASbGncuiiGFswlZc+q/P9nbzL2CXIYfZHaUTJ15Jx/8QRVrKhxyhpiAF35DFE9NFy+B
	t33vqpGGa+Lh/Mfa0ZPF6QH1PaKwNUN9pFyF4fzQFQJq7lTWT5gWnXk+m5HVpDvflDGiNX2Fwnn
	OBhJlJ/ODLMn8xbRrtDFdhl1YVvEXScoZHhqqzUHIrLbF9I5EHt4OksLSoPk6SuI3E5qfrbipRm
	aO/FEmphIOzQAfBPYOrwypkSSllNlpyn30i89CRxsJRy0Qm5rqTvnFWNpGe+WaQgGRxAQL1cvNF
	evwSVq3KduVF/MEFMg/6Hx5nHN94derMiEXythBlrmok/4heip0vvUcOzSzVK4jIUB7caeM9WdU
	89JivQUGjkJdLVTn9Qw==
X-Google-Smtp-Source: AGHT+IEstrrA3la+AiH30C5AF1WySOXn/Q6K3Bzx4bhaCAWauhSzpbx/Egb8H0qdLRUFoLvIGGaq3w==
X-Received: by 2002:a05:6122:1acd:b0:530:52d0:d021 with SMTP id 71dfb90a1353d-530810e3e2cmr2158145e0c.7.1748591480032;
        Fri, 30 May 2025 00:51:20 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074b09342sm2670817e0c.28.2025.05.30.00.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 00:51:18 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52ee2242b24so488930e0c.0;
        Fri, 30 May 2025 00:51:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0ipy2s4Ef++Lc0kvAFzIj1gvy7iS17f+h5raFDHRbD2wh7rleROmhRRpN0ZuAp+SzDrETEvQMJXryqsCj/A==@vger.kernel.org, AJvYcCUNpyUWzfUprmCtR7rs6XWMrUezDio6hLSxLrTs+DhESwxnAFVphdisgs3bRclGP/Bhj2bxOGoZP9N3b86vZRumssA=@vger.kernel.org, AJvYcCUqpjln3kms1QRa6AWFbYNM5JGW9CwrnXq68B/tFL0Sn5lxSnA+uqzv3C55TQIH93GhirlxCqr375Itc72/@vger.kernel.org, AJvYcCVrEfxDwzR0H9/LJaYVDGFZuZojZSB1ELmQbCxq5KJ2h7tF+FPpnDh9/Kif1Nr4BiXqLkSGR9LpKeEx@vger.kernel.org
X-Received: by 2002:a05:6122:2188:b0:52f:724a:c748 with SMTP id
 71dfb90a1353d-53080f5955bmr1748247e0c.1.1748591478153; Fri, 30 May 2025
 00:51:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529112423.484232-1-j-choudhary@ti.com>
In-Reply-To: <20250529112423.484232-1-j-choudhary@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 May 2025 09:51:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFrPanoO4CcRKVWhDsXCUm6ty3oayZ6yLs6AksZZJaBg@mail.gmail.com>
X-Gm-Features: AX0GCFu5SrfJ6XEYDFBe1Hbl2dYZBDrGAQ09XF6wFfWGxGH0eSYgcybRaCFnqRc
Message-ID: <CAMuHMdVFrPanoO4CcRKVWhDsXCUm6ty3oayZ6yLs6AksZZJaBg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Add no-hpd property for all ti-sn65dsi86
 bridge consumers
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, devicetree@vger.kernel.org, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	cros-qcom-dts-watchers@chromium.org, andersson@kernel.org, 
	konradybcio@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, dianders@chromium.org, 
	linux-kernel@vger.kernel.org, max.krummenacher@toradex.com, 
	ernestvanhoecke@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Jayesh,

Thanks for your patch!

On Thu, 29 May 2025 at 13:24, Jayesh Choudhary <j-choudhary@ti.com> wrote:
> In the SN65DSI86 DSI-2-eDP bridge, HPD is not supported as of now.
> But DisplayPort connector_type usecases does need hpd to be enabled.
> In order not to break any platform from those driver changes, add
> "no-hpd" property to all the existing sn65dsi86 nodes (that don't
> have it already) as hpd is not being used there anyways.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

DT bindings day:

  no-hpd:
    type: boolean
    description:
      Set if the HPD line on the bridge isn't hooked up to anything or is
      otherwise unusable.

On all Renesas platforms listed below, the DP bridge's HPD pin is wired
to the HPD pin on the mini-DP connector.  What am I missing?

> Upcoming driver changes that will break platforms if we do not have this
> property in all the existing sn65dsi86 nodes that assumes hpd is disabled:
> <https://lore.kernel.org/all/20250529110418.481756-1-j-choudhary@ti.com/>

Breaking backwards-compatibility with existing DTBs is definitely a no-go.
I'll reply there, too...

>  .../boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts     | 1 +
>  arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts             | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts                 | 1 +
>  arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi             | 1 +
>  arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts            | 1 +
>  arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts        | 1 +
>  arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi           | 1 +
>  7 files changed, 7 insertions(+)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

