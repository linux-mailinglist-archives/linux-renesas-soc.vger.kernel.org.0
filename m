Return-Path: <linux-renesas-soc+bounces-15994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC0BA89DDF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A279B17BB47
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 12:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23582973DD;
	Tue, 15 Apr 2025 12:20:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9697127B509;
	Tue, 15 Apr 2025 12:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719600; cv=none; b=RYjVgN5K5boNAMgLio8P+qE1xlo2T5TX24C2y8Kyvne914041ubneOYYO0wDfuU8x0/+7RfBlWqCXnpGrsuSzteihk6+2CfcB8ZGeYu4YdpolujT5DERBlcGPqs/olCzfnOd/arvwjDrB9b9ZbwK2FAv1A/vfySlgMvWq1eSxSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719600; c=relaxed/simple;
	bh=rHyvAHy87o8YK32YTDCQoPojU/LLd83jT+O2Lb0lMyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNUsfAEdkcC5UVnNykcXNsDSb3EjCvW/ANUKUviJD+TyUp7+KtyTkl3huKPDr3kNR5os56nlD6pNLnnWHAJqu7ZD6Ud4AAZlQlox4kFCD4Hp/ewMp3OZBuF5fUrR5YRIDgyueBewtP3NAK5KtlnLhj0x2j+ycEmyI+/2XjDzHhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4c315dd9252so259486137.1;
        Tue, 15 Apr 2025 05:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744719597; x=1745324397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=no/Eok31sk2EZ2vY4EXOj+z7BfV0O6ffw0mIU9CJuLc=;
        b=XczjM6PmNN0sPtP7lIeTILF/+he/kw867yVUE1hqd4/lHVPTWVg+B+08sEjnXcViq1
         RhWDBZMzXncxXxPUl5UYdNNZ9r1Fbgj61GcBmZwHmQm5eUj6YtwyEjTQGtIA2Dwoh6/L
         EQmUe9R7/pR90MFKALmjZwcA3TZ3OCXS+iSsmJJau6WyP73RWC44V33U5/swq0ESjdBQ
         XZ1kfFLVfqOlv1gXU7Zp8+3zRNT+PwVl47NHVrDjRAIOPfLU/kzEvxiuN3WefpO8+D3f
         Y+qRZPV6ORNjAnoJqyZkyDG3agxHLPweGbb3xUFkUChneNOqRxu7LN6ikWVYlhCeWITI
         jYGg==
X-Forwarded-Encrypted: i=1; AJvYcCW3Zw7NpSjsUYtKv0Ux0HCZn/emzi5cSgvnNu2gw8H0yiXwYEJWygaVrVX9oRwx7CUTY87xD6ST5lKsNd6CZ7W8ePc=@vger.kernel.org, AJvYcCXlbYPcrfi7DQxY8YRlsUm/4wBScPTfsKzD0FPNrK2uHn1sNyCHGDDJwMJPubnu78vWEWAQaTS0VLxCMe5e@vger.kernel.org, AJvYcCXtN0rZz4i1M1VZaAjsp3jxEmcPalA5wTsbcRMG2YyzAXiopLSlWK4YrFegTBrdm51D88dRAgmEYWFd@vger.kernel.org
X-Gm-Message-State: AOJu0YxW35wt3F579nMeVF4GuXSae0l/d1jPsJEx4Cp4//NinNo1KpPQ
	ewS2cAyDHrnuLkJkbn10NmR0jWGxHeWpa4g1YbaPdIblrfpMu+UgpBMUIjWB
X-Gm-Gg: ASbGncvhWAtwABTX8HtXhG9oDlNa3bz9uJCzAnY0ZdB1a0cTOIGbiTRuprjFDVR5Lh1
	Q/gaADkbXHPsD4fD/zBBMBsSuN+PNm1HL/Ym1vCuK80ypyBqXXkR1WWdOC7RJT7Wrg4WCv+JI4B
	OPhkIFnwomPdgmLD8dIR9g6VrJwr+JApZKCVe0uhs1FnvUDf1evn4lBf39gUVn0E+6z57gip6kY
	R9P0vtAFYXI+Ct7NOw1tiNjMkzr2zVAUAUqVMfEzXhEtbGTIcf89l4W4qETQSohgLvowzv6idCS
	vZC9NNhiLvzPFi0HrO+KizUXMM+LZ4e8B+BXCJlk2Eh0zt6tws5n5oMJRr0Yhvcv7rQ+CXrvDlx
	/P5U=
X-Google-Smtp-Source: AGHT+IGzEgX6yU3eYd7NEIdIrfCyIOYSCQDY2XSlVbWyRsRYskfDcMmueeK1f6pOGNlzZzWjMNt9MQ==
X-Received: by 2002:a05:6102:32cc:b0:4bb:dfd8:4195 with SMTP id ada2fe7eead31-4cb42d3ede7mr2100655137.3.1744719597190;
        Tue, 15 Apr 2025 05:19:57 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c9738490sm2661893137.1.2025.04.15.05.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 05:19:56 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4c315dd9252so259480137.1;
        Tue, 15 Apr 2025 05:19:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVogE36qwc3gTuUGkBQ1TowFdBUDWT2LKQOFeK/gVxbt0PgG5L5gUJe+M4OX+d5q3aXPjoE3ljZO+AXOeUl@vger.kernel.org, AJvYcCWPhJKKF4lNUR3yd6YAen9VwjgP0KFDL3yF3ocnJ2CAVX0Oo+zCzB3yt/7cRKZxRBbYYzfcQg7thTTl@vger.kernel.org, AJvYcCWs7HK6SQwtiOrn2bHzY+Un1UHUazKahJsTOJI3QiDkMcuNhCy3XKA5yrCXZSH4Gyolg1qpeqx4E3y09AUmUP+vHR8=@vger.kernel.org
X-Received: by 2002:a05:6102:4a08:b0:4c3:69f:5be with SMTP id
 ada2fe7eead31-4cb42e70f68mr1520007137.7.1744719596714; Tue, 15 Apr 2025
 05:19:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250329121258.172099-1-john.madieu.xa@bp.renesas.com> <20250329121258.172099-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250329121258.172099-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 14:19:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKXbsy25c4287aOCtiJ8PzMu7xqPhfrSu+_UGaxLiWPQ@mail.gmail.com>
X-Gm-Features: ATxdqUExH8rYrWVwACLU5pkYzEfWeUqbdV3fTVfBtp2jaIn_s3Yrc7HUmpuWcBA
Message-ID: <CAMuHMdXKXbsy25c4287aOCtiJ8PzMu7xqPhfrSu+_UGaxLiWPQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: rzg3e-smarc-som: Add I2C2 device pincontrol
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, magnus.damm@gmail.com, 
	robh@kernel.org, biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org, 
	john.madieu@gmail.com, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Mar 2025 at 13:13, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add device node for i2c2 pincontrol. Also enable i2c2 device node on dtsi
> with 1MHz clock frequency as it is connected to PMIC raa215300 on RZ/G3E
> SoM.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

