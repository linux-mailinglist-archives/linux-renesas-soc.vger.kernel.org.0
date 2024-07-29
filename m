Return-Path: <linux-renesas-soc+bounces-7602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC9C93FDBB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 20:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80880282D6E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 18:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4B416DEDA;
	Mon, 29 Jul 2024 18:50:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC8E161321
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722279038; cv=none; b=gOLg44RBN4xJrOO3n2WSJAXATUSc0JtdVPbULFjWTz0cRA4CvSD5WJwqQoIUb86UOwYPWMZw2fYBj5jl4shEYQpW4zvF6zADzdcgw/sbe1uJDRJO3O5La6UlWPq65FqmQOAxTYrVo54r1ZQ2DKWAB56txIxlPvItFVGWF9f7nQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722279038; c=relaxed/simple;
	bh=GnNENaWbSwxp25hzm3654ZDtFhuPiFbN3X4Lm2cTwh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+/xwa62+yRxVuKKMQKp/D/0X0gcAeEk31Ul5uHkvFSpLOswdaQ+YD4sNfJpFBBlrh8KCBDBwam0hI752EKe3jKQ/gINaBoI3nPmf1q8aPP/BuLN/s26mP/pe8c9pjJYsjAR0j3UMbl3jBjarjnVlDxSwUBIbO2bC9fkYhQ9RsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e05f913e382so2094733276.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722279035; x=1722883835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5P+kbpe+kxRuC9lySW2OhUZ2W8/Li+SefD3XTcDC/Y=;
        b=bl3tEgEXOPesSwmk/kYLdJv0b2Oe4LHgpETOIa8BdDGVGGC6/5caAxlquRqjKm0qb2
         3VjF9xUl/qkKYJAzq7q6MM0VkiYyaehgeuh0kNxXrtwfjMuw5UOShHaSLToL9MbPy6rp
         ITgCBCZ0ebuT9+DnYNtlHiO6gbPllo/zP4/W8AgRAedFZgdQqXKTeRHCr7wOEou4IwGG
         BoMJjb3GF9AgTOSQKZhIrB+ganj2Ndkz7jUvzELJk77PtvQ7el+yiNyhyDt7+itAz7tH
         ylFV3Vyq5H7KHw/0W3UeLPZ1ElQ5eUpQrdapH+vO0lMHH5QvT2brketcvh9FRLVh8vQZ
         6Jqw==
X-Gm-Message-State: AOJu0Yx36Dm2AwVaaU1EotC+mcNZ9uPRwT4hjJh3Rrth71rGFBNjuCSb
	WyFFIqo3ETuyGrxEkwLGlAFKeSdwuOZdtSzt6Zkocf+8V/igSqmrPgMADEyn
X-Google-Smtp-Source: AGHT+IHad2vnmAdzQl5ZxqXYrunAPZp0eBVw3VVgtrPhLZSPgMUedFYwcr853FIaebmh00bZV7HR5Q==
X-Received: by 2002:a25:8546:0:b0:e08:5b12:f957 with SMTP id 3f1490d57ef6-e0b544024f4mr8824366276.8.1722279035534;
        Mon, 29 Jul 2024 11:50:35 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0b29f793fcsm2044705276.22.2024.07.29.11.50.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 11:50:35 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-66526e430e0so24297587b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:50:35 -0700 (PDT)
X-Received: by 2002:a81:8a06:0:b0:61b:1f0e:10 with SMTP id 00721157ae682-67a051e8431mr90275587b3.4.1722279035179;
 Mon, 29 Jul 2024 11:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com> <20240725194906.14644-13-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240725194906.14644-13-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jul 2024 20:50:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtstrSNPZ6N_UjN=VSYH=NnAguOesL-=wEiONocUmGWw@mail.gmail.com>
Message-ID: <CAMuHMdVtstrSNPZ6N_UjN=VSYH=NnAguOesL-=wEiONocUmGWw@mail.gmail.com>
Subject: Re: [PATCH RFT 5/6] arm64: dts: r8a779h0-gray-hawk-single: Add PWM support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Jul 25, 2024 at 9:49=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This patch enables PWM channels 1+2 on the GrayHawk board. Only for
> testing, not for upstream.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I looked at PWM1 and PWM2 with an oscilloscope on test points CP174
and CP175, and played with them using sysfs. Period and duty cycle
look fine, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

I had hoped to test PWM0, PWM3, and PWM4, too, as they are all available
on test points, but I couldn't locate CP238, CP240, and CP241.  The silk
screen for CP239 points underneath the heatsink, so probably all four
of them are obscured by the heatsink and/or switch board...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

