Return-Path: <linux-renesas-soc+bounces-16763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CC5AAE55D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 17:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 389841C44207
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 15:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6319728C5D9;
	Wed,  7 May 2025 15:47:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CBF28B50A;
	Wed,  7 May 2025 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632868; cv=none; b=kuN+CopNeXFQQBfij8BpC2nuoV2sSl8y6ZG/fHTzzHEU6b5MbAIctypNHWnu/g2P7+XS/R5u5kQhGN7ABcpH9T7LmE/xe52CvA+ouSjvq9TrYmazMbq2alVcMnxInHjUvC1ADtmHpbVNBvS4piczjilVCe1vyNHmoU0fYZB5Wss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632868; c=relaxed/simple;
	bh=Z4xfUuRPwg+8T9n0Ut4Omo/Fa771zcSxf5NA+FwJrTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cId01u0uY2FfLGjzckKGIelmlvCXgY9LrbCefe23e4NP1M1J+Ei1hhGtnjgJ0ot5wirjdFOG9yPmNajQjVvSwNTJ+Kgo14yooxRjfgvHVO+JuQCxgpJv2tGO5NoZw2FpOVr7YcauYVEp4sua4dZZgZGCM7c3gpFAdUIhM1XXKrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-523dc190f95so2524261e0c.1;
        Wed, 07 May 2025 08:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632863; x=1747237663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NX61842Xcehih96DKmizUZ+/nW7mZduWkg4pn0lYhM=;
        b=vc5Oap+UfLpVd2U/hYRZlpr1myP+qDtAX0Bl2vgjjHEqPXtbnWjGxcjY1bbtixaUCZ
         yKipDjkl7L9f52zhOtaiMj5EIoibEnPHwxjYSIpgsyudTMY2CmmsCeuOMrq9WbQbWkTS
         ASVGNqkJY0aEJ4IkUlHQwVulkPwsk+RzB2Ny6Gki9XVV0Nh2OCPSp7J6ywlCaD6hnFkV
         mlBVsGJVDuVk7klhiyy0F6eEcqkCczV/YZm4YnSU3tnO1Q+mHbSuRMCYnNsbmr4G/Ep7
         +rK1l26kS+gPeB1LgqDHhi28MN5/4NLJFPKFC+MUd1AsmXNMi0EptEPn0HTqnuQA6TaD
         XzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9s0NMUZP87BIioK7fivsAH61Y9+oP3fTsBLrFK0EWGzNRBLmQKJFwC5tKCa1X4rXyhgORVaSsQ8ZJf61O@vger.kernel.org, AJvYcCWvYMiSw8PKLYTS8Nnb9PiY4kVb+zZTC5ieH2tQioH0XJYhYNZ7DuQelGKrmUUIouL+MomsFjFTx9lo@vger.kernel.org, AJvYcCXKZLBtaF2RP5QCBI8y0GnVWSibRXqHoPe0iSGlnx8QYpXZZjUbG8ee39jLPwurF9ysVeUAfsHeMmUw@vger.kernel.org, AJvYcCXNK3irv8kNW2v3iy7iwOM9EZqIbUqbQFclPch8LI4Z0nRUdknU+F/867c507R2WMp2q1QsletOecIbuFFHuY3YYPs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqnn+xImGi8I9oeEXtmXAHf1cTBDotu1YBtHwQiHp7MRQCadbf
	X0Aq15DWvOWzgIFDN4zKOCFxNjT3JzrUYXuowmBS7tKz8Nx56xD0L2NKE+gY
X-Gm-Gg: ASbGncuiKhtOWKCoMBPpk2iC+2JWGAE+mVkrre/hT//pnvnA1IYyU5l+hkfAet25qyp
	LdpM5QwL+LcSUuzJdga12qii/HSPRIJq3AuwCtSGod7yshTD8wKsZBRPnXt98wgXSP3OPKhFOCy
	+8LtYpDfn88v0rX/XSx5y9DJkudnLApPBh01+C1Eilh+FbYhhAqZNlHGHH2Td52kwWcm+WFnh17
	CldftCWeeTyTOWmsuQ853Q0LINTfQyra+5TqOAX6KskWs0JSIHU/c/DcgH3YB7JX0POPMYWEz+n
	D0oCkMjzPYjWCTixO6S8KHROYKrVwx89Pog4xlFnIxd5QBmP3QAjWOd9/I29zmSnIyAgmWoekgT
	Aj9c=
X-Google-Smtp-Source: AGHT+IFCA/zzgIJWfQpveD7iS3SU3qBoqVVn+82LVTwM7gDImNEH946a0TJKgRoJA0kLiFFuvqGdkA==
X-Received: by 2002:a05:6122:90f:b0:52a:cdda:f2a5 with SMTP id 71dfb90a1353d-52c378a18c4mr2506907e0c.0.1746632863481;
        Wed, 07 May 2025 08:47:43 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae41f2134sm2407760e0c.44.2025.05.07.08.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 08:47:42 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4c9cea30173so1854407137.3;
        Wed, 07 May 2025 08:47:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcINC8w/JRiIdrrYNVoEsmpL8lX0SIr4oUnkx7BxUki4kU1qqFQaLpSrfC4C5S90XXi/mNy/vhfres@vger.kernel.org, AJvYcCVBfNgn4SFhN9uEI80RjnzZFZEG7HBElkNITvb4c36o4hhzxzyoi18LOns1xJCTBoJG6YMIbyLKr6+xRHwRTB8LP/I=@vger.kernel.org, AJvYcCWRJZL5i+nQXT8Bvt2eODZEpNosvvJ/FL6CXbQyC4mZG5WZfE3rpIVV4+tJsYJ0xvj8pRuToMxd+5Mt@vger.kernel.org, AJvYcCWh8CLONqwVubumnljnMJ1ms3fQdWToeXyHsgIxIDonP2D8tHMjUZ+8B5jtuLoMkNkWXxpPXJSJ4v/FdYXx@vger.kernel.org
X-Received: by 2002:a05:6102:5794:b0:4da:fc9d:f0a with SMTP id
 ada2fe7eead31-4dc738070afmr2809737137.15.1746632862634; Wed, 07 May 2025
 08:47:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com> <20250410140628.4124896-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250410140628.4124896-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 May 2025 17:47:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU00apiWYCPiwqGr66Ucg9KgWMhhm8FW_KBoeN2ceos+w@mail.gmail.com>
X-Gm-Features: ATxdqUEPvMf-mwyHfKPxbObOMsBB9zp7l1DVjNEqfU_robJh7lehTsH5CJLC9MU
Message-ID: <CAMuHMdU00apiWYCPiwqGr66Ucg9KgWMhhm8FW_KBoeN2ceos+w@mail.gmail.com>
Subject: Re: [PATCH 3/7] clk: renesas: rzg2l-cpg: Add support for MSTOP in
 clock enable/disable API
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
> module has one or more MSTOP bits associated with it, and these bits need
> to be configured along with the module clocks. Setting the MSTOP bits
> switches the module between normal and standby states.
>
> Previously, MSTOP support was abstracted through power domains
> (struct generic_pm_domain::{power_on, power_off} APIs). With this
> abstraction, the order of setting the MSTOP and CLKON bits was as follows:
>
> Previous Order:
> A/ Switching to Normal State (e.g., during probe):
> 1/ Clear module MSTOP bits
> 2/ Set module CLKON bits
>
> B/ Switching to Standby State (e.g., during remove):
> 1/ Clear CLKON bits
> 2/ Set MSTOP bits
>
> However, in some cases (when the clock is disabled through devres), the
> order may have been (due to the issue described in link section):
>
> 1/ Set MSTOP bits
> 2/ Clear CLKON bits
>
> Recently, the hardware team has suggested that the correct order to set
> the MSTOP and CLKON bits is:
>
> Updated Order:
> A/ Switching to Normal State (e.g., during probe):
> 1/ Set CLKON bits
> 2/ Clear MSTOP bits

What is the recommended order in case multiple clocks map to
the same module? Clear the MSTOP bit(s) after enabling the first clock,
or clear the MSTOP bit(s) after enabling all clocks?
I believe the code implements the former?

>
> B/ Switching to Standby State (e.g., during remove):
> 1/ Set MSTOP bits
> 2/ Clear CLKON bits
>
> To prevent future issues due to incorrect ordering, the MSTOP setup has
> now been implemented in rzg2l_mod_clock_endisable(), ensuring compliance
> with the sequence suggested in Figure 41.5: Module Standby Mode Procedure
> from the RZ/G3S HW manual.
>
> Additionally, since multiple clocks of a single module may be mapped to a
> single MSTOP bit, MSTOP setup is reference-counted.
>
> Furthermore, as all modules start in the normal state after reset, if the
> module clocks are disabled, the module state is switched to standby. This
> prevents keeping the module in an invalid state, as recommended by the
> hardware team.
>
> Link: https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

