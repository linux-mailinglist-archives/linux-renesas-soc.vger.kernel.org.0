Return-Path: <linux-renesas-soc+bounces-18778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF33AE9D62
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 14:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DA443A75E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 12:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BC32580F3;
	Thu, 26 Jun 2025 12:21:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AFB1E9B04;
	Thu, 26 Jun 2025 12:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750940510; cv=none; b=PEV+e3Dhru6y1HrwMLyBWKlB3UkOZLYp1u2wsp3z980MIb5sFPa1hMglbanRzsTxt3mxKEHQl+XsY/iFC4v0lbnI8lokoS0j9+xL7mnw0yT1LGkXFoGiQLJviRY/UN0cNtNpFkkfuxMYd8NHkvBQS27y/uSQtQDLvu6fHmS7puc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750940510; c=relaxed/simple;
	bh=IvwD9enofwaWHk5EKV3xYw7xtkO0TsUXpoVn0G7Fgn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bY7zJS3Q3ZjeQWqQrtGNzNB9dKmK1LxkT/tt94Rh92fJxvBghNK5gcm3+NHudoOFNvcRbJuxyrotgoiss0KKTZhyLxsNHHwxYo/LNFdTs8LR7iXi1jj1yAV5IrJ/CnEkPdTCyBQtIAomBk8z5ANkgBVEm9y+9EAFq4eUC5GfmcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-531426c7143so305437e0c.0;
        Thu, 26 Jun 2025 05:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750940508; x=1751545308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpiBJAJen5FnxRnRmJkJFwp8KsGawuNPRUHHa/PQ1oE=;
        b=K8wjbmggr2aiChl0TVAL8qYB14p3lCS/l5rUZ3g21ZR2DjnYxQvT0RNQTWvYEsLFtN
         tch8FcoB5KLqh7iGJCcYyP7472MaLdKsU+Gi4SIlrBfAg4pNQAijmM1dq8DQ5msVli6Q
         QyxyOC67ziUDQ4eOnSp/vruXGOe6KnA63spwMr85/WVAe3gqlpt5+8qNRXE4IrSAxgqg
         rAaG5uuffnGLQJcy0iPOB5OTmS0hXLPewieNnsCH93G82hVkeRn4lD/0oyNUPBgNcOYE
         x+Ur7uot5KGNXfEpI/2GvGbKCcAMCC2BxMIyrssIFJZOO7Xvc41BD+gFkDatoWCj9QoA
         G8AA==
X-Forwarded-Encrypted: i=1; AJvYcCU4MWvXEjQ7UA4xTIUnGaKpVjKveXYPWdd0v4viVeXWWccHc+1BtPjdvBn9w2N9cpMKj/J1MtGV16PiLBmfvprrb+M=@vger.kernel.org, AJvYcCUw7m6emeUJ+8/RPaOYG02eZZp7YABp6LSNOScPJ4wh4wVu69FLkFrvCnHhj3feqRO9qKGmu87ISfQd@vger.kernel.org, AJvYcCXo7Rza+WONTUdunQt5gJ0xx1CV3NKplkZBz6LmwJzp68Ym7nEL+eMa+C4Oh1/eECj8uN6mvlAipUHTTLvn@vger.kernel.org
X-Gm-Message-State: AOJu0YxIfd5fT3QYl1FSAE/kmWJfHROlINQo+/tzEe82NW1HRs5eFCRT
	cJFJGDTaPnGt7cMgFi09fnMXbsFUIsA9UmsBNMSirIaNth7Dsvs6EtOoDmnFaBWd
X-Gm-Gg: ASbGncueshjr8xtynRSK/UoZz0qsQfP0TeVMKOWV9a2aUTHUmjHo0voabL41eQNTZ9q
	0XeBtQB1Kh+cXYtnx/yFKpG80rJdLA7Rl9vER3Q0iwg1x+7R3v+sLKmqZWQJcMzyymTAGGE6/mv
	WcgI7tBx6GTXy4YbnXt8l1aXzoC/4CXy4KQ/ON9yC+sLH3EvR4t4FS1u4Lj+jkp+5xxU/72HsAo
	8QWn0G9b0NASCvMo41r6t0sujDFuIKDozrL+DsaPqBbqD73lBPry7gDPUn1j33dltKEtI4fO2eH
	zVSzJ6YfHyz45bEs+46Sx6fWuWTTgcLpitSmHS2fL/rlhAKLpeCzc6iU4MYdM+DDIic/aw18fJr
	nJjs3Vl0K9kHFFBP5LO19JxuX
X-Google-Smtp-Source: AGHT+IFnUl//LCizgT2LRzYik6uLFBUhxVLcQ9SP+9bmHMdVqzjk+4omzpus0OUdkM+liFESxGYIAg==
X-Received: by 2002:a05:6122:3214:b0:531:2afc:463a with SMTP id 71dfb90a1353d-532ef6aefcfmr5577237e0c.7.1750940507704;
        Thu, 26 Jun 2025 05:21:47 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531ab37fd36sm2270170e0c.38.2025.06.26.05.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 05:21:47 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4dfa2aeec86so281358137.1;
        Thu, 26 Jun 2025 05:21:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWU3OEbAupFlvKfmlbeklD4Xh5ajXdsGI/U6TqVEGGCyGHEzVEtPGUafHfsTB3kkRXivqw6POc8HwpW8qvqlzS5zqY=@vger.kernel.org, AJvYcCWU4nD6IVHCv/xYDQK7but6LHsNonTzqoF2HmdR75HvmL5Flyz4eQDbS9qM1fzBpzU3Xvj3/2wGWS2Z@vger.kernel.org, AJvYcCXbNLuZQNAC6GST9N8m/6m0Q5dbes0Zq5CG6j3XDu3HROiXa4iuzNQNulU9dsSnuEqxJMsKmaPZIe3y1BIC@vger.kernel.org
X-Received: by 2002:a05:6102:3910:b0:4e9:d847:edb8 with SMTP id
 ada2fe7eead31-4ecc6a723e4mr4928978137.7.1750940507361; Thu, 26 Jun 2025
 05:21:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619135539.207828-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250619135539.207828-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250619135539.207828-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 14:21:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVeiPbUkmwSkDtULRC6izrexgHF=6vOEiLTRD9pPnQoOA@mail.gmail.com>
X-Gm-Features: Ac12FXzFVI6KdbkRdIaH-XkbIqRgphSSH2nVuf-k98kJDTGUV9HJUJ8R2v9mCLM
Message-ID: <CAMuHMdVeiPbUkmwSkDtULRC6izrexgHF=6vOEiLTRD9pPnQoOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add
 RAA215300 PMIC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Jun 2025 at 15:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for the Renesas RAA215300 PMIC to the RZ/V2N EVK. The PMIC is
> connected to I2C8 and uses a 32.768kHz fixed clock source (x6).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

