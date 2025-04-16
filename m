Return-Path: <linux-renesas-soc+bounces-16054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DA1A8B645
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 12:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C636440A27
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 09:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E18D23D2BD;
	Wed, 16 Apr 2025 09:59:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1757723DE8F;
	Wed, 16 Apr 2025 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797541; cv=none; b=tA3UQYFstbjAqQ80pJLy6l78gDVyClefoXTZn9AGHy0OFxExAnUJo75mmNu/M0tdEZleFAYlJBHEEUBXYeB2cGZ76hQYG1+dPLHhfUPdgrbe4u6NLHbLjCN0f0A869BBDbwu8EciEyx1Vm3PVCTMmWeoyv5mIS5QkYNUiViy9JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797541; c=relaxed/simple;
	bh=gRi3A/2m/mZRqdDke9Xyql6H8L1cxr4BkXWEdaoia0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZXyHCBmfL3lgv8Kt85ojYW3IY25vU1P80UXqGmgWHEeMr+/gTkQqKHORSVsNbUmr89CFx2KvoXp2ZIoxoh/dxq8A8K6nfEz9q798tu4waJbhl9C34bHu0j0ycj+maSL613btyY0Ut90buweKgl13MND4TXaULt2Ycoz/UF0iB4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-523dc190f95so3048490e0c.1;
        Wed, 16 Apr 2025 02:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744797536; x=1745402336;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBkh2fiknS0/u+Semiz3ZJnX30HbrqJMnEkz6+qwWBM=;
        b=AfGLeOlLEy+WNo7lpNvC3O9ETOF51wjdu3jAQaB0SgaSdOwG2Gdnee31RvpS7FDL4d
         haUQ8luXmcEbxOsPEwvZ03CwhW50O2bMHJC7NxG+0Dbrd/r4yJa26s1BusHrGhhv3g5H
         JeasUGeO09G4459mV/FGezeEbwqF397A99RxAd10No9nwLsCR8LEx+WjMqDXJl8UzS1o
         mu2RFcnKe8UQ8a/MrJfeakK039Qd4cdfukGzKAx02QXkvCEW0ratvYF2y2GAyCYWk1Hg
         Whz8Gp+H2K/76bCDXaayD2vHKoS4X7Y06V5V9qE7oam82bQ8YD5ci1V9YpqH0YnhL3mt
         LnIw==
X-Forwarded-Encrypted: i=1; AJvYcCUxLHE7TNaFE1KSqnQxPxCsdnIGfKZKBFkxrD28EU/0Xf3K7p/HlqRvU1VDlOG9S4BrUEOR3fwsVL0d@vger.kernel.org, AJvYcCVH9Z1m+qyfovP5tzlzZQv/h4PSA0PUkYnE2UKf3602LPDu4XVY0hFObDBvpOMpDQlODo1/aFBqSsna/OJd@vger.kernel.org, AJvYcCXAaSjNFAFeUl62bhj4XfbSHA3+znngeflrM9fmF/5zSrTXgK8SzUwqqKXWYJLwfC8EYw9uH9ricB5foOmgv37x6UQ=@vger.kernel.org, AJvYcCXR8jUDP2eVKdCN1fdpDFGc1um0AxbwbYWPoji+B0QrpmayqA4yi1ZRuoyH6GGgBzS66ZDAIwwZosaO@vger.kernel.org
X-Gm-Message-State: AOJu0YxL9c3Ia4PA4fTdsD/V6QUyjQJaxfjS8Mfstq06JA8VgyRUqD/c
	S6CdZnSSz6FA2uUA3mBiIdOykbjQHJ+MRTg8aPFGckHPf+4uvtPKUTKYc3Cx
X-Gm-Gg: ASbGncsd7Jyu/VRpOXL7QpAgF/Diu+8JqBZdp3sU4hmL+ZtW2xLuXp6KYd03TH8JEJm
	pGykvj/AOWttLaHQAhNCpnrQp88cxjZEmJE+ohyNySvYzFtEY1wIi3XpyzDtFLWk672LmZk8/A4
	mjoYV84cEWQXbyIfgnHdn6QzlQkfdTQr2kDSQVKr0/5sQpQPZQXg3DuFNJRl7SDwgWxUrNO29pd
	i9qWjSphchfSAqS7iwoNNBIy3mKX7SZoCWf+DUeu4jOzDUbw/WD8P8UuJK5BUFja5VohvoP40kc
	Cs+1daOlJGrgsK7a88YsldGPOkkLCX2t2ywvErtw6qnrhOiEERJIrAiatDsxGmJ1oONCY6kk6FD
	4NqpDvcM=
X-Google-Smtp-Source: AGHT+IEPESX4CNm2RQJHrYprL0FV+OBKylZeh/3vcVPgNndu9o5wMPsIeRCl7fm/qL7ImQpZXKVbCg==
X-Received: by 2002:a05:6122:181f:b0:50d:a31c:678c with SMTP id 71dfb90a1353d-5290dd6fa20mr520863e0c.2.1744797535930;
        Wed, 16 Apr 2025 02:58:55 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd4e8fdsm3020790e0c.2.2025.04.16.02.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:58:55 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-523dc190f95so3048483e0c.1;
        Wed, 16 Apr 2025 02:58:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4x8shfWCZ4/gLs87+Zv8ggChWJmjbJLaSg7rPUfy+4YSe1SJjdQ2czfJfD+mpYSaGgW4x+8qlbNQkBzMm5x463YM=@vger.kernel.org, AJvYcCWB+Obs7USp/aq+vxZOMrzCtKLxQgOUZqj8ARORyARMziTnR7lO3jsf8wb2gI1NrHb+J6QUrDNqupo7hJX2@vger.kernel.org, AJvYcCWXIVMT8sV7XAmKXgEBTF68W0drMeReGFxM/YHLdVE+/KYisIDRARhwGcTy0uWmOoKT7eBWlBgVO5Co@vger.kernel.org, AJvYcCXs+mQcbzP+oygoKjr5oVGA5g3jLOyYpZakfhGmhUXYHktF7VPKZRWSL5/CmvKg/qXwqn9rIodW/PS6@vger.kernel.org
X-Received: by 2002:a05:6122:1d44:b0:520:4996:7d2a with SMTP id
 71dfb90a1353d-5290e1eea86mr367433e0c.10.1744797535493; Wed, 16 Apr 2025
 02:58:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com> <20250402131142.1270701-5-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250402131142.1270701-5-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Apr 2025 11:58:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcOPMg31yY5q3pqgjZb4Bx9zrtgSDar0-ut41OZdEjEQ@mail.gmail.com>
X-Gm-Features: ATxdqUHwo8bqMkdepthnzAgZ27DgG8q5lckdz3ykD3ZnY4X4q2c0k0RAd6RYpa0
Message-ID: <CAMuHMdVcOPMg31yY5q3pqgjZb4Bx9zrtgSDar0-ut41OZdEjEQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable Mali-G52
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 2 Apr 2025 at 15:13, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable Mali-G52 (GPU) node on RZ/G3E SMARC SoM board.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -45,6 +45,16 @@ reg_3p3v: regulator-3p3v {
>                 regulator-boot-on;
>                 regulator-always-on;
>         };
> +
> +       reg_vdd0p8v_others: regulator-vdd0p8v-others {
> +               compatible = "regulator-fixed";
> +
> +               regulator-name = "fixed-0.8V";
> +               regulator-min-microvolt = <800000>;
> +               regulator-max-microvolt = <800000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
>  };
>
>  &audio_extal_clk {
> @@ -123,6 +133,11 @@ sd2-pwen {
>         };
>  };
>
> +&gpu {

Moving up to preserve sort order (alphabetical).

> +       status = "okay";
> +       mali-supply = <&reg_vdd0p8v_others>;
> +};
> +
>  &qextal_clk {
>         clock-frequency = <24000000>;
>  };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

