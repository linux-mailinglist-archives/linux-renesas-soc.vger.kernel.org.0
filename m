Return-Path: <linux-renesas-soc+bounces-19016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8F6AF0EAC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 11:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A2C53A6523
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 09:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5492405F9;
	Wed,  2 Jul 2025 09:01:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F87022F757;
	Wed,  2 Jul 2025 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446867; cv=none; b=nMpdOBCftjrscxBE87m/IKqbOo9vIyldK+r0JoAVl8/M8Ad+GPHzqXnpTWq87DZ5zdQne8UhB3mheUDJG0PWzFX0XNK1Z/E3HdVzBiBcS16jg+mNvdcu+Rfu3wnhke8tc7LGxvSWGHk81TO0p9S+VYN2cY/wlH7J7iV2kXW2XTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446867; c=relaxed/simple;
	bh=fZJzccDw6bL7Ls2PWdWua6e8l4VI/x3Ji22ej+rNsn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9IJEZk2YQqpVpopN29VFqWBrqtY94Wu5NYyWHdUx3J5UupK6MogepCSVjmmBnX9BBm5mAMwJjPfXBVqf+TUbaJrBt0sUBcholD+sZaoPw86DOGgFfa2nu7OA4cubVmRY5OvINJu48nyYJjWGJf+te4tWSypMRM/REs7epUqM/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-88131f0badcso2516816241.2;
        Wed, 02 Jul 2025 02:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751446863; x=1752051663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4ZaC8SZJJEqARXDIgMWg4EN0MjgSfBPCqeNJPMbVto=;
        b=TQsShQ8Sn8syJahugGrGr2eLeVNXR1I0EU0XdNuQvtN2LwNzBNNeGFv/xx7QDUUMGF
         eERgxEQMgEqtxVuJoOw2siMUDXLkTWv9iJpFCG3qzUHxWjGXDY82TaP2b3Q7nKU6eC6E
         LmmeTTIGX9/zKl3ELHH6vNuwl2QpY37fnhD3ZcLMrGAcyPZwKJmOhlANu3g4Xm2Ih4/a
         QVQM0ZuCfGvRp6F4ERHSNaikXe3gcGBy0X2Br5QIH2eGQKpbBsQsyei054U39U/oSnv2
         EL/Vqg40ygSa7Q0qpNMjKoykWUQyDR+Jp2Xibd8d3y+BLfWlhy98bZbfxx6HVFVosCqw
         uuog==
X-Forwarded-Encrypted: i=1; AJvYcCVdNHh5WNQsXgNVG82ThtjsvoI7WoMe9p6FD+Bokn7Rsc+LTg4FXPJyD3HH1Gt4dfcB/KNrUU1Bcj2uLq/Hk1eRh5g=@vger.kernel.org, AJvYcCVwBjHDxQ0UoD2tbMIAWf4zNbgGxKfKIZxZ8avFeVJoBFrhJrdjSrYcfW/40gIWWrAaOPPMxo7q@vger.kernel.org, AJvYcCWZPybX0iZGinZsIHqJI6SmaJnYeGh8uqQoKD5rlVfHZ905YuFuocYva7fij2r5jeKjjiPb7a6A6pt7@vger.kernel.org, AJvYcCXbVBq+CVKbhchxYrJvzVhsfT38xndE3sU6Jyyb56bCmnlQUK8xusg8sh6U3HV7pom7RpWq2XQQt+5U@vger.kernel.org, AJvYcCXebHz5UMKPjQoN7dcgvt5YsCK9GUjiaFsSpzl6oMaU+hjOoIQJNl06psYooZuBxMQCouQ0mkLiFMhVV7z7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7vt55ZKJsCn/Qt2Re6jM2kPk/6GPqOqa/HHDqeMCcrFGiB1zr
	xYRLWGuD6nslI8hq4ICXBCtCaBcm7dWcJbsrwS0CczaPEIxn0duZ/3n2nqrGviIY
X-Gm-Gg: ASbGncvWIM30SMiDi7XrKtYtRxqPkCQMVQRLiGe9/BAbsBRECeEycBqiuODyNcbt2CR
	Xish0WKpk67GBu+xNx23+YZJnNBvGwsqwbvxpF8GcmSGwO5d0xvt0vvZTWbTmkJI3e8CEVCVMFV
	q8dCaA6MWS5Pe1aMSIAcmMDX5ZrtPXSCcdERuS+pFLDTMbZaU/YNU5bUKM2/SvXHUYoxUvj14CK
	yKcLOK6sn1dU5mfBojTsfZd5j5TPpcSzudY3CjHHJrxlyil2Tc6A5rDYMoSVwyUbBI8BaOtZ03z
	Y9fYAwwHrwYW1uFGyRcuZNiFK6fbkIxv87afzodAVLoIAmpDb26X40D1u28UuTiFoWMHEgiq1s5
	tAwL12gx7FGY4wFgBb364kaaKZauZ
X-Google-Smtp-Source: AGHT+IGb/rdNczI7QkiwvzRrWHUozdrj2zm43+tzc1dsU7VwW1ZJW013I7vK9mQManbUXzrSz0VO+g==
X-Received: by 2002:a05:6102:2d04:b0:4f1:37f4:8c32 with SMTP id ada2fe7eead31-4f1611617bbmr757041137.11.1751446862899;
        Wed, 02 Jul 2025 02:01:02 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-884f3b2430fsm1444383241.9.2025.07.02.02.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 02:01:02 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-532dbe71e4eso2826478e0c.2;
        Wed, 02 Jul 2025 02:01:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFlDm2PqSkM1+MG5Ce0omji3QHarmDRFB+Qyb/J8Kp/nquTw7VdrGd4aRgYvPVkCaEskQDnr8rH+RdluWa@vger.kernel.org, AJvYcCVY+7Se18RfXi9VdEOC8y0esOHagnZid3JRBIyCVPXgePTOsakwZdSjCHkT/ZxKkvv+2dTNFF5R@vger.kernel.org, AJvYcCWcCrj906ieO0MTk1RQG4RCv9hulfgcTe9JISFaWMa4OI0luijzvWoDbdvYd7jmdv4B0T9jWhbGXJ5bM9tUnMHIqwI=@vger.kernel.org, AJvYcCWdtqqYUkvhIDd9cM1iAW/xgwHMzgAOKFjxEru+IMfzom+9B6Js7ke+eXPKVYm2aNr4ZwOPA/S5i5qA@vger.kernel.org, AJvYcCWfCeiTQI7eA1o13+qWjTb7x2lg73tCeBcxN1CAkUJZ8aC+8hhI49Y3vY/USuIVQSAJq+NsmTnRzUkL@vger.kernel.org
X-Received: by 2002:a05:6122:8c8f:b0:52f:4776:f6a7 with SMTP id
 71dfb90a1353d-53457c1c1afmr1365164e0c.0.1751446861289; Wed, 02 Jul 2025
 02:01:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702005706.1200059-1-john.madieu.xa@bp.renesas.com> <20250702005706.1200059-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250702005706.1200059-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jul 2025 11:00:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWN7K===8+a_xjbROXXwt31y=D9EhhtW0dcWhOW-xi3Fw@mail.gmail.com>
X-Gm-Features: Ac12FXy3qvRlCCOU1J9rVOyXjvrgTG4HaTQsme_N6hvHGBENHVYbBkeMw8lB4F0
Message-ID: <CAMuHMdWN7K===8+a_xjbROXXwt31y=D9EhhtW0dcWhOW-xi3Fw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] clk: renesas: r9a09g047: Add clock and reset
 signals for the GBETH IPs
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	richardcochran@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	netdev@vger.kernel.org, biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Jul 2025 at 02:57, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add clock and reset entries for the Gigabit Ethernet Interfaces (GBETH 0-1)
> IPs found on the RZ/G3E SoC. This includes various PLLs, dividers, and mux
> clocks needed by these two GBETH IPs.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> v4:
>  - Renames clock names to match V2Hs
>  - Uses DEF_MOD_MUX_EXTERNAL instead of DEF_MOD for Tx and Rx clks
>  - Drops Tested-by tag from Biju

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

