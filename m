Return-Path: <linux-renesas-soc+bounces-16634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F22BAA7112
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 14:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD8F94C39E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 12:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53EA246775;
	Fri,  2 May 2025 12:02:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19C022A4F8;
	Fri,  2 May 2025 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746187324; cv=none; b=rhq2UfcjOxezNygql3Myb731a6sL0BfX7uY2bchdBHrD+mQBv1Y2oBbjiMCXHeJiYRbnFrpnhGWI835Ki+Aj+U+KQ8wnTog06cnSL75o/xXvFtdSsJriLgeQyJQXe4wbRX1TTGAwcxzQxXsa9wc+aJnPrZvdCJeXVa264TxrXhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746187324; c=relaxed/simple;
	bh=Ov3TH6/gAc95Pzt0yjU/p7c0Mol+Jpj/Ok88KS9RzAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Au0ULsNeabTOrc46/Ji1eKSa+3WgRLHl+p11XJQ8i73CT3zdCs4xQWWfIVfsdlQqEd4EX4eZbTmCFtUY1wi+ZqOCQC9wtuBYISmtasV9xX6zHHbUxC4Rsp/aMIxxVy2BFHAJltSvUeayHWvzoGRyDt6zCb2PgXDShIOfDXYN2pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-60657f417c4so932977eaf.0;
        Fri, 02 May 2025 05:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746187320; x=1746792120;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MY8XikeU0AVzM/KkOL4D4V6UOM1fbLtQGUrNKfsnaxY=;
        b=vU46DGhbU/+aUDWFvrfmXOArrhAuIf5TgQpyIsDByGsNNKgFuHyz7jF40UdBNg2Vqz
         U/1+qmlXg4BV3YoZe8XZziTUVO8IS65sWpxjHuf5tKFDUDkmiIYHbte79YX1ODEVkbMR
         5zHE1Ye5UhEF3o9ntShuJWPhkDIv8ACruC2y7U5CTHgyCP9oeCS2+2bTys0+qd7CFIEX
         kkL4yLDMNL6ZUgcMA6BU2GNq59BDzfp6a76vZxH9OoQz2DQ6KC4p4Wx4EhXZL5Yt8r1A
         aNlnLZPfGW1tmiM9KQBm1+IxVpSaIUXSFU45KCZbEo2+KlApTjA0rArRW3D99vPN2O9W
         qdGA==
X-Forwarded-Encrypted: i=1; AJvYcCUCt5E5K8k71hj1JR1gV5BC9ufs75kDAksW/tfrb++JMRuWr/dRrS5TKsttw83nrxkEFoZimkFxvkNNx2QDOvG/h7o=@vger.kernel.org, AJvYcCVZRucraizZ3I1hwhVuZgMmmb51iQidKy9loy85iG5H0/iNNfIU5tSSrGeJLMh38Oh6goo0/k1NBJe8s2oL@vger.kernel.org, AJvYcCVc99QgWSIFBpX17gvo8MQr0EarVCEuI183w7xMJ/f9U3LJseJaPuOITHd1C6rklDu3gSLmyANwJAFo@vger.kernel.org
X-Gm-Message-State: AOJu0YzFQPkqknbAZhRTmFERcXhStgvd5PcNFYc6mqF4NpAdVwr3Nnh6
	bGit1m9cQi0uVPVlVp6nFpqogSytIzfXKzaqhmuxd1HldH4bhCHjDZPU6VkK
X-Gm-Gg: ASbGncs/+ysRyPJoJ4dsHnuM/rdfM/xyhMhZ+SePGtNR1jXboR3mMdLJOBwydUvSzh/
	JK4E70RUhlabefTwN1NyleYtWhAGMio7kJI7yVSxOTI45upX6BVdSZK0kUN456EhtaHZZ7FzHnI
	i8Gcl5ayJQ6jjJIrbjnTvZZj5tsUhBAdFFopdWirMcYsgK3jVFCM89naHhADrCqlQ7vPjdq6NK2
	8WoLu+3yfJ4L7MD+CX/HRkyNE6dUKUF+a6Z0Zrd450DeXwFh/peR01MiFiA4cAoyYEA8OsxwyKI
	7G1BqRevS36vlvApu7Yhaouf6Cty7CKu6zqDtFKwiBYdYDYvl1fh3y54mh4u9LB5+VXi8C1Jr34
	yfCNuHV7bEMe9odbpgQ==
X-Google-Smtp-Source: AGHT+IEgmSfyUoIkcrKdmZldJXPZErYnzwDhNF8r6srwlVHmkgz/O/GLn1gsa4i9gvpaRaBqBucZFQ==
X-Received: by 2002:a05:6820:a0b:b0:607:8929:4501 with SMTP id 006d021491bc7-607ee6c3948mr1249539eaf.1.1746187320376;
        Fri, 02 May 2025 05:02:00 -0700 (PDT)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com. [209.85.167.176])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7fb6466sm485161eaf.26.2025.05.02.05.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:01:59 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4033c70577fso719628b6e.0;
        Fri, 02 May 2025 05:01:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8ARwF3TaRZ2e2r/H1tMeUq7kYM5c7V2hLKkINPOHj2912rO8dvkOkjTcLwrdGnEur8i35JHl3gnrGwRzZcx36jMI=@vger.kernel.org, AJvYcCWg71gOOx3gQ5oz3+9bDTiHwWwn7hgJRR6V2AE90dLrFFI48+kjVRqnYjZJ5ymmFtIqz7vRDSLut0RJ@vger.kernel.org, AJvYcCWoUof2u/8y9xP/qoYenYxuojSEsXeR35ttkqIF5QinpEocZii4tCqk4Oacw4WPiGHWElpGdl9H0hb1XxHA@vger.kernel.org
X-Received: by 2002:a05:6808:182a:b0:401:f4e4:5e0e with SMTP id
 5614622812f47-403414b6397mr1305952b6e.33.1746187318706; Fri, 02 May 2025
 05:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250501123709.56513-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250501123709.56513-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 14:01:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWCEgwQ39f8wN2FobZK+0BoyXNm=eKfmYs50sABwomvA@mail.gmail.com>
X-Gm-Features: ATxdqUGawMLisO3F1rvM5sjYPkJMq15HZKLhxKiBy_fyPwGI47XSqoAGJERmrvE
Message-ID: <CAMuHMdUWCEgwQ39f8wN2FobZK+0BoyXNm=eKfmYs50sABwomvA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clocksource/drivers/renesas-ostm: Enable OSTM reprobe
 for RZ/V2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 1 May 2025 at 14:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add CONFIG_ARCH_R9A09G056 to the probe condition in renesas-ostm.c so that
> the OSTM platform driver can reprobe for the RZ/V2N (R9A09G056) SoC. Like
> RZ/G2L and RZ/V2H(P), the RZ/V2N contains the Generic Timer Module (OSTM)
> which requires its reset to be deasserted before any register access.
> Enabling the platform_device probe path ensures the driver defers until
> resets are available.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clocksource/renesas-ostm.c
> +++ b/drivers/clocksource/renesas-ostm.c
> @@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
>
>  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
>
> -#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
> +#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057) || defined(CONFIG_ARCH_R9A09G056)

What about simplifying this to a check for CONFIG_ARM64?
The only SoCs which don't want this are RZ/A1 and RZ/A2, because they
are Cortex-A9 and thus do not have the architectured timer, which is
mandatory on ARM64.

>  static int __init ostm_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

