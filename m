Return-Path: <linux-renesas-soc+bounces-24955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F34DEC7A704
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 228FB3A0794
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E7A2C11D3;
	Fri, 21 Nov 2025 15:08:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7847527B35F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 15:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737698; cv=none; b=dw+h53tZpQwWcAltdfBGQ8QNd8wESYuyJsdvNKaVw4BzBaFV1dAYnQbZHLlNM+4+UbwBZVkerAqczKdM0NMmyLWBcTYp7pF/gYMT6E4KVhk0V9mGHPqZxgAmkNFNyZctv/ujwm9LVv/GGeRI7kINYIjZqlnmL3Wd1LNBwsMoKF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737698; c=relaxed/simple;
	bh=vI3VJBqMB6UVFPD9Ba7gDnFi+751P10wK1XAYBA0uLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/l6DZerjQkg4FXui8LBtdTFunYodz+nnevyQ63EU5FT1bkxUmus5X1/R14nccNOT3TvXjtxyBwwEOzlv+vtyL1iL+8u8isTf6SIEwHZ+LmI9v+qsOdygbiCJljI0tZtGQIkMnV+xaOtXX7ATxWn6YLpi2QfTHklHwyTiSrqhdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7c6d1ebb0c4so1363854a34.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 07:08:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763737696; x=1764342496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Hu9/ZOjaCVFQuFvvSTQPc5EwpvfeC5sctnt4yJdwpo=;
        b=BFhbp9HqWW9qU0MuwmAd+1pm4grqLH/83V3+g3Y46O9Sg9r68pGj2/gZ4CpVVSAfSr
         dmk4rONWjfJpb+vS1K3hY7U/OujV6LHI1DwMq42PcxjWesjtIlb6ExXnSdFMWkSsWJCu
         qmyzlMnnlA1muFsu7KqYQTQ9DYijBUL7T1Jy77Z/K4HxACEzKOUao3cR2JMEjCHCEyM7
         IkmZxdpeLLW7ZsUwYhkpFx+NE15HL2f1qV/Mcge5t+rNmjaVLW+RL+1Qav5O3lB7rQg5
         VsIYqV+mlbSvWp64GSPWreKs/5r1vBaeCrlf2ACk2bFFAsc2BWeTBOz4zkqR2AkuR3GJ
         P9NA==
X-Forwarded-Encrypted: i=1; AJvYcCUKpq0GpkJsQjDgeo7mBs2gHrba9MD0mYk+LwyfMGNBUKAv1Ll/p7YTWJ5y5i+SjjffibfbjE8jE2tjnqIA6nZhqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzktBlZz1veTfMl2GsRuLJCB/ex29YijXNx2mRr795IchFlUP0f
	O1fEdUJaZZXhoftQer2itLYF6AKiuX/mx80A1xzhQgzN4Tkh0jtHZd+tg8Vmd63a
X-Gm-Gg: ASbGncuTeTKlqUokzmja+vjUvoiLoHG9fGBPl04KLO85jSIm67uDo+R8b3tAHhlygyl
	a/Jo5GVRC5xQrcQgC53PQxSnUA2aYHn0vQL15CxkEp0fVFwOCl/fKoZTcnOBgz1ejYQOcx+mwY8
	YOTh/9gGD50gZbcScelZxm7hIOZudNOgc7ZdMlR7wFxe1a0ZBM2hxEElE5GkjfMPRp5CAsXzYD8
	QCTCFFRP8Mn0X2sX86XXAjGz+L6TZxUKg0XbX/G/RczNEWZcgBPyfrGYGnEQGXApiCnMZsm+PsW
	HSYs9V6wi2SJ5adMd3vXDv3PFD7ZQGcqv191vZUnWu9wEyaD3i6DAy/wIc9+xVfkUmHCJQzKJWN
	L0GlcTP37LdDqfsk1/FdFbxmLOHxg1AL6qvlDQfZMRVxUnCXZmt5D8nZFxAvEgqmViWB181dUIp
	4mfvPNnYrkjj2dYnSjQ27CSyAx3UIo0HWsVeMYablYKRnusj7y
X-Google-Smtp-Source: AGHT+IFEvSboOwkeD2z4I5yWcnBoBHxmJmPc5R4mW5rAYS0BPAj/zRFOR13mskN6d3XFKfOuIYQabQ==
X-Received: by 2002:a05:6808:c40b:b0:450:489a:6f92 with SMTP id 5614622812f47-45112d0b54bmr1015709b6e.50.1763737696359;
        Fri, 21 Nov 2025 07:08:16 -0800 (PST)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com. [209.85.160.51])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3eca814da76sm2158101fac.1.2025.11.21.07.08.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 07:08:16 -0800 (PST)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-3e83c40e9dfso1316754fac.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 07:08:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsf9Dk8IdusJRnagJbbDts4eP63H/2CGTXYVTgdd6HbtPBT7CmUHGpNMLry/toMNoG4wpuxUnjwkPZb1GOLlBpfg==@vger.kernel.org
X-Received: by 2002:a05:6102:644a:b0:5d5:f6ae:38ce with SMTP id
 ada2fe7eead31-5e1de41851dmr731948137.45.1763737292917; Fri, 21 Nov 2025
 07:01:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com> <20251114105201.107406-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251114105201.107406-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 16:01:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXEvF1Yj3UQdiOGSUS5XvebTGgxNYL6aXO=eot4pVWTfQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkASQlYZ1Tl7IpB3SsrSPHfV8TVI0-GSyVXBwHUiWQ3H1THbLLQ3yOuRbE
Message-ID: <CAMuHMdXEvF1Yj3UQdiOGSUS5XvebTGgxNYL6aXO=eot4pVWTfQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] serial: sh-sci: Use devm_reset_control_array_get_exclusive()
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 at 11:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace devm_*_get_exclusive()->devm_*_array_get_exclusive() to support
> existing SoCs along with RZ/G3E as RZ/G3E has 2 resets.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

