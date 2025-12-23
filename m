Return-Path: <linux-renesas-soc+bounces-26052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F72CCD8F8D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47B553041CE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 10:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB96A302157;
	Tue, 23 Dec 2025 10:48:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BBD30AAA6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486906; cv=none; b=EVtlOAm2+zknnASRign4h4DMV/EB1HlFNGcHUgwmoFgQY08QWykP3QTlnbDyIdLRi+TXGVjSNVpHXnmpEMfb3WedTNSOnOTMrV7nYHZYX8IkWF6ljgQ4Oet+U9AIuZDETJzX6XmK387j+aC5xz7ocIn6108O88ehaX/9GLWwJTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486906; c=relaxed/simple;
	bh=He4BjfuJKlOVZCSqBFYthIZfM2I1ZkSLAml5bdxckng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WcASnCloUGFyf8HPa6Q5jlKTdGJZyTKYcs7LbKfiSOj3BBbj94wwri6jLC3O48GgWbzaSriDUxEE/pQfPhyjf5m22djt4zIgdk2gz0KhvtWwoZ52YtB7mi710Fgkn3LHaZ8XfJ4Z1T/1FpXYUsKz9opVhmVaLGK9FpZ+lwTiVIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f65.google.com with SMTP id ada2fe7eead31-5dbd1421182so3915638137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766486904; x=1767091704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ju2WEPZhFSwJDfyX+hF0G6cQfKmw2zuzSQc8O9oxIig=;
        b=S56xc2ikVpncZuR1wgkL4pBqLsZGuQtb6Vbl52AHyNe5k/s6uLjoRk77wd7w65DV/8
         au5q8RuFViOMJ0jBki48bMl24N6GBCniJQHJ5wlQngSI6990TGISfITFcvgrSOy4k/PC
         3LPQwIu8v6brmY6jOY3K3b7EQ9iST1ddGscyrvuHlDZV+FvMFL2j5XHHGXhY3iIV9Yir
         SL1tc62dgTcSVzQj3FgsQ7A81th26lja7bUpYWKU9AZpfZtXnZgMQhcItGS2b99P8f3K
         v9JFfpwKfB8+AUJ4z+B4x+/cRreLE1HM1bHBRSFzRZgwORvMIosgSBsvrXtRK5AVNci8
         AdTw==
X-Forwarded-Encrypted: i=1; AJvYcCWXl5rNcRZFxl8Wxgs1I2cE3g7kLgrZzx9yRiZwqj+r3OutPnL+bKOGowgeSWHpAb2JS125xuWwTtP4r+u9iZZt3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnoChuJQp3yi/4jzrngIHabxp5ShoVy5sCkQUUh1jR+hxxO6NU
	jn+udeJLErpWn1K2KXTN4ZHkM1yknbhlsMrMBEO0XDi9TuYlg++u/HyiRqd7Uj7qbqY=
X-Gm-Gg: AY/fxX7Y0iQJWUfdsrW9uUp6zlpDjtS7NGL4oITD2VptZze56FO2nmJ0sbJ59wFa6ZU
	ywcZYSs91v/peolcWp0KOUwMu/r7ZCDvSoLwgJKpkN9tCtqj/uM3XBY6Wh6MZF4k7uKA3KP2+In
	AjZqpcLP0DAb4vNI9pGF/4Ayt+WBovmYigjOO6KKXXPljf/AI4DKYoLk2zMCdYAHC9Bbj7IM01k
	/IL4Hyhd1zWfQ4rxf2Oox4GhWz7JS2CFAuBUR8cxhD9B55SB5Oi+QYNyQ3hBtcYISOLp4yQy9e8
	hZaFFDIk/X0u8f5senqMNmxV+hLfL2bTll0qLOT2dzTlQ5BL93gPXztVTUpwhykafxP2EIjh/LG
	Kc8qJ8QI1UwNr2ALG7gE9ApIDACtbCsmn2TSHPKAXSPT+vJ9pI0P6sC1Xbuka7BkNt+N1V6PYJd
	M6gYnw1225b+8ooBeUvyW06pen9kuNntICIFyD+K7KRIXl97Hz
X-Google-Smtp-Source: AGHT+IFQ3fBDFiZCgeXNfXSGzGNtUrwkNM2Oxtqm4Q6xoB3oo163xjQyTL1dTOzd+HeYV+IvhZLhGA==
X-Received: by 2002:a67:e70d:0:b0:5db:cf38:f506 with SMTP id ada2fe7eead31-5eb1a7d5f3amr4804623137.23.1766486903657;
        Tue, 23 Dec 2025 02:48:23 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1ac94ed0sm4208726137.14.2025.12.23.02.48.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 02:48:23 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9413e5ee53eso2805001241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:48:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdJFBwPLQUriGTsYUMgwAyzFxRFPYSxbcNFU1rrU86RDcZk9bkkrylZPeMA3tKAQz+jGYFiLkpENRtSsLRb+harQ==@vger.kernel.org
X-Received: by 2002:a05:6102:688c:b0:5df:c10a:6683 with SMTP id
 ada2fe7eead31-5eb1a817ff8mr4650551137.35.1766486449690; Tue, 23 Dec 2025
 02:40:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209091115.8541-1-ovidiu.panait.rb@renesas.com> <20251209091115.8541-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251209091115.8541-2-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 11:40:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1QQWf4mTDRPgOdRGLttUMPewbRaq1GrksBK6xA-mi+Q@mail.gmail.com>
X-Gm-Features: AQt7F2rxebZz2lpc976a4wNX_gG9-mxMoPf2hgGvnyD8PTUzp05nnW-kYeuYB18
Message-ID: <CAMuHMdX1QQWf4mTDRPgOdRGLttUMPewbRaq1GrksBK6xA-mi+Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: thermal: r9a09g047-tsu: Document RZ/V2N TSU
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
> The Renesas RZ/V2N SoC includes a Thermal Sensor Unit (TSU) block designed
> to measure the junction temperature. The device provides real-time
> temperature measurements for thermal management, utilizing two dedicated
> channels for temperature sensing.
>
> The Renesas RZ/V2N SoC is using the same TSU IP found on the RZ/G3E SoC,
> the only difference being that it has two channels instead of one.
>
> Add new compatible string "renesas,r9a09g056-tsu" for RZ/V2N and use
> "renesas,r9a09g047-tsu" as a fallback compatible to indicate hardware
> compatibility with the RZ/G3E implementation.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

