Return-Path: <linux-renesas-soc+bounces-18537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DE8AE05F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 14:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD537189437F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 12:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCC623956A;
	Thu, 19 Jun 2025 12:32:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DFA23A9A0;
	Thu, 19 Jun 2025 12:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336321; cv=none; b=JsndPn+ltDOQLyA4k5+8jwSjWX4BMUcivBTZX0aU9gGhUEEYri0uoLgaK+Nf40xixrm41G0K7ra4pOmN+nMmIiTByaExTxJGMHf2yxbl8Im4XPp4iI7QDTc+WgnOri+shLiaAaTWgeW3/+3ze7whhUS60peJ86442VtUbluIByk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336321; c=relaxed/simple;
	bh=TuWc2gteeCn9bPk1V5VbCx4VcPSZODMsA6cJxeH76S8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCfC8O6YvRqrl8kT43bCjw1NXeqG4zEAPNwqnNWAITFogOYCr8SNQAfS5hawzDQdmMflotI6WrMIHKPKXdqAEpToHXIGcOqaq7s0EjbCbFfMaJ2XNRUT8kimpuJZ4Cvkdb0JRhSxgwRvoHI9g4m5pLHJloKEXshChjmhiHTxhsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d09a17d2f7so64025285a.1;
        Thu, 19 Jun 2025 05:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750336318; x=1750941118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdezoP6+r7u+5o/tBpXidEx/QULTI+P05i/+mWD8YlA=;
        b=F/ZpSZtAE9cgBlhkdremNL4W/Bszg2h/myiSdu+5n0iwiEiU0W9g6l8kNUPrjNgngh
         uJVnJT9bvhgKRu96Yiyyq64MBqkIvjQoLXqVz5WfeMVv326rTJd8ZKSaJ13SPR4ZGcxb
         qS+LSZif5H86q/9y0x4c3SxUd1BKFjydqXjB4NDmo7fk07AoAoqLfIYIoU/Ljo81QGG0
         1H3eUQorAsEAxDX7seWUP9JHI9t0Oeo8aHb16y5jbrT0EAMFEKod3CwrG2cXm+jSFkBV
         lQ455JYnQRgWlXNRXN0wzrNvhvR8sKUUTlH1XzRcTd4fre8NJvZMvFA0Ed7CF4xlfisZ
         wyHg==
X-Forwarded-Encrypted: i=1; AJvYcCUKhVnywA3YPg6BA+ASfk+b6H3YVPjC6dHGOq9ugUjp8IE08uQtLOOYM0grhCneDCYrNhxsgD+/9cwe0e1f@vger.kernel.org, AJvYcCV+WXEaPseoSF84WHe2m14tQd7uutC8oJqpujveGrJWu5p6VbrJP9uSsaJP/bcqv+zuZK5/k96eYQ8e@vger.kernel.org, AJvYcCVkNr3EJwsGy8uAE9vsFVay5aEin5QV40tp2O03CkXPOxhnz6k+EkhvZQCsoFoBQjivnCrai2HI/Gsb/3M1D6sc77w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGFhzh2oWfiTU81KOGGSUumkS3b7aw4dNlcTxTf63s77kUAxPo
	tah5/0et/pwbBKV5AlHiZbsp5iJQhVFmugH1VLvfrIcgVRdVHmBPSLm5ovwpqL0x
X-Gm-Gg: ASbGncsW7SvSdXpubMSZY3brySThEBqKYnjt7yV+B5bLQpybV40V1GmzN4hXH7vFyXP
	/oZ9RhPkBEkb8IZSbg7jmz0647Q8mItyHtPA1j1s4fpk6YAgmOEUausVq/KEpWOeZ9ZXNI2dRZC
	OLkhyV4Le2upVoejRAR7lLteWoWxsnxQ7OfR3unRK5DSOk4aTWijxlDJpgoNnHWT+qoMKXmgjZF
	cHAdf4vJv+FbJKtx881FmcNEuaZunW0MAaYSNjaMzmvTRGj0Ii5qHowcDmzdIKSgqDlTUJBlr24
	UiWQVz7wj1Udc2Qw1rbm9ubDUgJ19SFZD8MqMtBD3tnJ9i/VaHJk2V87KHywjV0DloHVuL3JJ69
	d3ZoAFEKPbLKcyLMlYrDcACCfwJsm
X-Google-Smtp-Source: AGHT+IFcsyslwfOnPmjPLQGN8q99vY8b4wMVpioQEU4QZGd6B/VP8kOMGKUvsgGEqk1FTY9XeI6YUQ==
X-Received: by 2002:a05:620a:1713:b0:7d3:ed55:c92b with SMTP id af79cd13be357-7d3ed55ca6cmr675625285a.38.1750336318518;
        Thu, 19 Jun 2025 05:31:58 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8efa74dsm878816185a.99.2025.06.19.05.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 05:31:58 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d38d562a55so99552285a.2;
        Thu, 19 Jun 2025 05:31:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6LHLxd0mmftu2DaVRKSLvZ0kTS1/cAKQ4NinXBqUVPqtwMTm+yFWGEKN6ulMpEsbOJ8lLnJj4gdZzKzxpU11qORY=@vger.kernel.org, AJvYcCXAKZ7KecDLQW34RqN5ycQI3XvDI+roNJG9qhDxQUvENEMK52EYE22f1ZWhJ4dT4rwpaU06a96xSwY0yth6@vger.kernel.org, AJvYcCXH5SdMRwDLR2ORLo3qNZzk8Qcy8e5tivaJqWRrzXmRHw2XcUvjcWUBNS2jjjZPywCs+NytvaDwHspU@vger.kernel.org
X-Received: by 2002:a05:620a:2989:b0:7ce:c604:3f53 with SMTP id
 af79cd13be357-7d3c6c1cd42mr2933343085a.24.1750336317977; Thu, 19 Jun 2025
 05:31:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613152216.201957-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250613152216.201957-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 14:31:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBvS_j6bvMWZKhYj78jLV+cED-MfUCTBmqMiBACK6ehQ@mail.gmail.com>
X-Gm-Features: Ac12FXwr3BDO0g2KX9pNGQQLtU264potN6sVsGQaoyvRq7mfpYbwfXp1zdXuwoo
Message-ID: <CAMuHMdVBvS_j6bvMWZKhYj78jLV+cED-MfUCTBmqMiBACK6ehQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Drop
 `bias-pull-up` from OVC pins
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 13 Jun 2025 at 17:22, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The USB20/21_OVRCUR pins on the RZ/V2H EVK has an external pull-up resistor
> on the board. Therefore, the internal pull-up configuration via the
> `bias-pull-up` property is redundant and should be removed.

Thanks for your patch!

> Fixes: 7548897ad4ae3 ("arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2.0 support")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
As I haven't sent a PR for this yet, I will fold it into the offending commit.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

