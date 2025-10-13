Return-Path: <linux-renesas-soc+bounces-22909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DDABD2431
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 11:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 424CF3C3794
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 09:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6EC2FD1D9;
	Mon, 13 Oct 2025 09:22:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE722E8B69
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760347333; cv=none; b=r4BFfNPVM5xuKx5IjrKly7GlVXZ3cOec8fHAJLwo2zU4zkzBGzjZ+eN42WuXuPS5pe1DZKW/CAvR0MMcw/fVBGddWl1XXdAsLB5RZhlcH8w21jqT71boKB5WLLkrz6eb+H0Bpjl3DBufKBjvo+OY2NDq+wwcPVyYUPu61EsL260=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760347333; c=relaxed/simple;
	bh=RjZxcAfi3V9A5U9SAZfg5Y9LkVVCiWAYMVhIYAGJi8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbHm5f2GyBGeRxyTN7expcOOOEOdlq0rqqNl9ZsljYpjn+balrQBw5u3TQWmaOjw5S3c+EFrLSi7OmLzqFideBbYpJZfYBRJdzCSndKiijZ+0wLrPbyQNbRR9tzTvxSqM4NCgok4NBtATkJq5kfQbH46kcUArtkjuPsghN0kQh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-54aa0792200so2905698e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 02:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760347329; x=1760952129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LE7TmgC2chzOeWrOmbf8+Owl4JMPcc5AVh1uFAo2uoc=;
        b=poTUF9newWKwhFQL8oiJQqPIszrAiPsVLFsyoZRaNTcyiX+fDNthQ+5L0Kl7GRMvTX
         7e5OQTwkzNds6vtNXNpnMOYt536yylpZTki1ib9htUl6QNYkZxxDhyK5XJYBg9IhbkDR
         gEubVh+EA80mqGHfv8FSZ0Htyk/CuuDKeIv8bUX7YKz2S0phv0lzczYI3rptyYvvOIzj
         JCF9KJnylz5KnurHDCZPtA4ScQyeP7GoJKUcVn1gKu/m5mH8gxuiG+anubJS0Ad6ElKL
         sFi8SgCnh2tVyeBxwZztCKUsjjMrgWLL0jc0C2q/F/8h2D+D9IPkJJL8frUal5WDCPf1
         jhtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUco3aB1KeHjCl0leLWTne0hffOvUFgmXiLC7mp+GcLtzBovjo0VKjoylD+shCEb9vw7FUDCje9cEaSHpiGUD2oEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx067eFYNNrT0VTukVcS1w+JRk+z/XjhW8R25Acr+ndZt69Pfzk
	vmItoq3gIOFxRY6ZDe06a7ah3MAZm/ptkxL26u+hV0BhV+7WVw37qWmnBbb+fEh3
X-Gm-Gg: ASbGncsgs34wv3R38NkGAQlD4+EW01H6GqngD5vyKZuaM2XJY87bfPWRBnnPIq3tCx+
	EUJolx/3fz2F/JzMLbOiqaiHsGR3wUTAlv/abEBw4B5XqfHBojafw6mztTISrxbfqBUixW1MzDM
	cGdV2hhWfgUnRutL9Z8P0VWEm+defHrt/PCIsPIWLCpuc1Y3ZtOZ+fSiVQnjBj3dOU3fs8gADd7
	rfJ+XXPWLE/jGx94NlPon/v1mUJea6zHF0LfSAv6KzyLyx6dP2tjglZMskgwNSAB0eHlmXvASzs
	CCzvnTdkK4WHwcndxmC/u1t8RCmS7+52NaDmQmSM0zGZV856SQOA3s8pvP+hfQ6pu1qVQiT2WKl
	nVa6ZOMpc2GO4XT5VXSFT71VKPhOEh6waOgGh3DYli1xEg6RDQaY+zT5tPIexH/mPVjPdjalWkb
	N1T/VH1bIYFZ5ioH/HKQ==
X-Google-Smtp-Source: AGHT+IGrDZD7cLhPJiZVttGTODGxBOQP98TSQGgKunpBW/u+rsW8GCQ1DlzYwWu9KYBDEg0CYhAlIQ==
X-Received: by 2002:a05:6122:469b:b0:54a:70d3:66b0 with SMTP id 71dfb90a1353d-554b8bba5d5mr7300924e0c.12.1760347329492;
        Mon, 13 Oct 2025 02:22:09 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554dc835063sm2688162e0c.9.2025.10.13.02.22.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 02:22:09 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-8fb58f2b820so2487293241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 02:22:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1tGTuIO1iVmlAykSHXtQurAmkZVL2U8dKrzZ4axF444UCqfn+hOG8eSLQw/l130rWV5gjEmamAxBCP4Kvuv9igQ==@vger.kernel.org
X-Received: by 2002:a05:6102:580a:b0:5d3:fed4:b012 with SMTP id
 ada2fe7eead31-5d5e225c578mr7941230137.15.1760347328805; Mon, 13 Oct 2025
 02:22:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com> <20250812214620.30425-73-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250812214620.30425-73-laurent.pinchart@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 11:21:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYvJFKuauJZyJqZe61G5TYpHMnaX_fFkRW-n63r5t8CQ@mail.gmail.com>
X-Gm-Features: AS18NWAAm_gDezINKRgnhFXgpTjwG25pxtXA25pOO4Uvov585HnEMLG2OoHJPA4
Message-ID: <CAMuHMdVYvJFKuauJZyJqZe61G5TYpHMnaX_fFkRW-n63r5t8CQ@mail.gmail.com>
Subject: Re: [PATCH v2 72/72] arm64: dts: renesas: rzg2l-smarc: Drop
 clock-frequency from camera sensor node
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Aug 2025 at 23:48, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> The clock-frequency for camera sensors has been deprecated in favour of
> the assigned-clocks and assigned-clock-rates properties. As the clock
> source for the sensor is a fixed-frequency oscillator, simply drop the
> clock-frequency.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This patch depends on "media: i2c: ov5645: Use V4L2 legacy sensor clock
> helper", which we tentatively plan to merge for v6.18. It should
> therefore be postponed to v6.19.

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

