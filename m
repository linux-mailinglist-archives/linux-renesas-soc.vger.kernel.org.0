Return-Path: <linux-renesas-soc+bounces-11609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A785B9F8E39
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B06016C403
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 08:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28EA11AA1E5;
	Fri, 20 Dec 2024 08:50:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB651A840D;
	Fri, 20 Dec 2024 08:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734684647; cv=none; b=kBz40wCKJBemWqAq/YPmShsKdDhGwXIIrHFxQM2PO31f2l3XlFxx0D/wx3eK+m+bpP3o/WE0QTe5O/0Fc1T/ymoG7wIY8z9QVMXn8vwtM7tqBKTM9/vmF2npfO40JMErFProrlODpWWKqACW8J9TkNtDvCkua1CNwA348okve/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734684647; c=relaxed/simple;
	bh=xj2zq9embZmO4wxWrvdz+DoBTLBnEK7n08kWDImzghQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7h3PiHNitUDyyd9AD18p29DYvmGdXFBjVtB3QDSTwlL1RNe/AJZPRYhDR3QtLv8X3WaGaS1cwLPnWW3AFbrNwQULt57cX7LW+y1kVUbl8c2hg1cHdA+NhjDQqSAbw6bq67dahKI3Gm81U/ni8MB/vA9V4ak2RQRGFFEnolZwA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afeccfeda2so895068137.1;
        Fri, 20 Dec 2024 00:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734684644; x=1735289444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uomuG0a84SysqD5KXJ0nuWs1i4ZIil1VflhD9lAxFT4=;
        b=ITVAVMfqtkeGypNPx9RQp6FpfsNDiaolDplpKbjqR4tmWhujEz3dPcfl7KLAx2+nCq
         JJEdzB/3g7TrHCqYLBAlU4bsptcUVuqHlDur5CeBW4nZGEWq4jLF1seCRks6H3t1a+0K
         M4aLk6lFWUMcVGp46XihDPt6Ewhq2kMwFvgW6P5qFqfxv6UEaDnTNcKEsmf1wPKbkgY2
         EVSzHA9tNdx2Dh7sulaM9CH/9BUIffGHgkQIQZlgu2BEkSFC+aompK03/2lFuh7OeRAe
         n/IwV2u7Uk5B9wYLOvMtWSA7z5aFFGBwk3Jtj4kMPhBt0w29F68/nS5wLF/0edoDbT0n
         czCw==
X-Forwarded-Encrypted: i=1; AJvYcCX6KK/4XgIdMXpbRgb7UkDuGvWpoNB0glLXOksPCbwuhBW6/ulpvE+Un/aWd5wOdNxoAiYRxryqBV7nvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB23CJLWagp1mDVf4ZV9z4PMeXSgRl3T25batOtMAXNmkKi69+
	sza0yNTeg4/zt+DuB8/mXV/utac4FTTiu0NNbdxNMTQwuIVfNBfm4q+fGGx2
X-Gm-Gg: ASbGncvVyFZjphT84jh7HKPeL0U69Gh7qX/lru8gHTLgLVoylc4WV4U8R61+TBD/kQb
	8OLiqMdZzw7jSsPEQw7C3Cs9E7EVJwwtORtzqmBthWdWVSXbXY/UQ2ronQk3bS2rcIjHgfSUUB9
	PcsQK/wRpapWAB2KH0Y6Xe56y1y5qZynDmbmlvrhLDPLkCvxKuh/bwiewsQeVt2e+MzfAIf9FPY
	YY4U7uyLaZBm53TO8MpNAKbYJdNvMEmW7SyUDomeK9rNOfwReNgfhHN8br25ueYqcjeVuuYR2p4
	L2tsoTzQtEGwp/mJZwc=
X-Google-Smtp-Source: AGHT+IFbG1/T60/FICsD5kgC8NTlJRSXRLGv/qNt+noGTmvDqt/2dIwGHFV52rkoSsIR4z9qe3haig==
X-Received: by 2002:a05:6102:160e:b0:4af:de39:8daa with SMTP id ada2fe7eead31-4b2cc31ed8fmr2065050137.4.1734684643911;
        Fri, 20 Dec 2024 00:50:43 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac1f8a8sm507839241.7.2024.12.20.00.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 00:50:43 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afe2a1849bso930240137.3;
        Fri, 20 Dec 2024 00:50:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUHdUjyS2vsI9MziF8iY1yOMhbLspBfjtxS/0f7HMVpsejeYb9ZFlENzBTRw6QOIvDSCXsgVsItMvY7/Q==@vger.kernel.org
X-Received: by 2002:a05:6102:3a0b:b0:4b1:1eb5:8ee5 with SMTP id
 ada2fe7eead31-4b2cc47782amr2007087137.25.1734684643484; Fri, 20 Dec 2024
 00:50:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219225522.3490-7-wsa+renesas@sang-engineering.com> <20241219225522.3490-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241219225522.3490-9-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Dec 2024 09:50:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWnrY1nTD92mOYLnH3kUnN58gpW63uak=rDPGQ7isVrXg@mail.gmail.com>
Message-ID: <CAMuHMdWnrY1nTD92mOYLnH3kUnN58gpW63uak=rDPGQ7isVrXg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/5] hwmon: (lm75) simplify regulator handling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 11:55=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> devm_regulator_get_enable() was introduced exactly to avoid open coding
> regulator handling like in this driver. Make use of this helper.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

