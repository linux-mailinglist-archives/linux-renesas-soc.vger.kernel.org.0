Return-Path: <linux-renesas-soc+bounces-11224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9446D9ECC4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 13:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06232163256
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 12:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCBE2368E5;
	Wed, 11 Dec 2024 12:42:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EE72336AD;
	Wed, 11 Dec 2024 12:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733920928; cv=none; b=fcxJ994bHX7XBB6kZVLVsbeDQYDajLbrRitm6HDU8YYhYPEnC+hKdDD4Kgql2RcCIt7+8nCrIysFZYoUQqwy+SYBByaCP5TjaHgFr8Ap414vd8uN6uTwrep5uuv+ddEokoji3XkT7h34Af156WfuTheTBK7cc3GlEmL0nimExpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733920928; c=relaxed/simple;
	bh=pCrnFWl9qk9VOVOQzq/ZUQHHi5QCS7nCqkeJpUcwJnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C0YMgFiQ+6Uofo7asKwW1irBDhDLGSbWmgJj2Pn0Wml/Fary1dZapuJBkMPZp7WiCt8FGHrRNtvehrw92hMzKppI/D4roXYkIQ0krdiEjvrw7+kTzzJNokqJc4CwQ/NKQgTPt84tGPrGWql14eZDpATmhz2889PRhLhlZGgGlHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85bafa89d73so1027801241.2;
        Wed, 11 Dec 2024 04:42:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733920923; x=1734525723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BDSnq8xcYZhg4ixe82LPtNR03KdprjXeey0ZFOStPw=;
        b=TbXr40h4vsQ/uJKp95VJIkeK/1klrm+k2QOxpp3tPWHubaiRk0Sp2h+9OGQps/oAjx
         iUOiXC7b4ufQgdIY/Z94/ATSe1J7L4pm7qY7aViL5ofKRJLh42Z9P71WSxY6Kgkkzy6p
         CJ+HZLByHqcKbOddCIjdnRqkPJN40XaTuHKH9RR+lfcdVMNwzRsIo0lz2Umx2nXFqKOb
         MZLoSAX4F0CyruTvXnK+llo32XBZBlDPEXKtWZXSEMeIwb4mwXIpmfL6O6QAo+TPQubk
         MePHERuTkBDYMQnsbDpIrYHbXgt8aqoMSgf45J1iRdNYmrpWVNbFZtgE5TL3E70qt5yj
         PS1w==
X-Forwarded-Encrypted: i=1; AJvYcCVmNk/xPkTfCmTHIQDmiOH5fL33PQpjL2LZr7k7K9Qxx+cjwKlyrSMwA8KUb1lFNB4kJY4M43lOtZOi@vger.kernel.org, AJvYcCVqE3i1xBQAos/Z57uJIGT2m0psWLp+/M/6O5MMFbPurFmREjfF0PYrjDFeugoIYre4oEFXoL3kc5Jy@vger.kernel.org, AJvYcCWYokCRkXHFmUzFYfvvnN5gpubB3xAXYNmTZX3+0Uao0FIad+wZzC3lXDi/IwJkkj2bO7vq91YkreAlPKUW@vger.kernel.org, AJvYcCXbXWtzp5qTtgLJKfUH4iNc8pqOyu45F6CmkapEXY58uQX/tlBhxWdvwTd8eSOLDnSy5wC9dSQpCgdZe9EknZ9LzSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy42VWr8fCntptOhrybZgFW4SJ/wwA8O0p+Wcgt3OQfEmoklrWe
	MwL1tbSEPyGi9TPRw7iZBMlHKu9pHK76KZMtGBYQIHUfiYJHuK04rOvamwA8
X-Gm-Gg: ASbGncutGzEC8sPEQQB+dx3RD6ExbbgZfsFWmqZl3eiXteTyOc1VxJIMGG3tlu6jBTy
	0TeWVgSOk4Z/jjGq5jxWG20lwfKrHVTHUbTUOsb9oBG88ypKnSaRTcxSI1E5IekQ7cuhlzFFl/x
	2EdBOZUl+RCZoMoSWVmjY7eJFvtHl5EfXtDMXANmYQKZkoexnaM7Pg+8EnPVjC1K6UXvmiiaoq/
	g03BKJrqXT4qiekWFYx/jlZJRzE1Mid2Let7mGqvr0PEtT/T9SEnqXB6rE5sXf8iRjNe8Vrt64u
	lEGEMP7KchGYjkUq
X-Google-Smtp-Source: AGHT+IFBeAwZ5QX7mIUaa551OL9Q1HX0P1qqH2VB32uujgc+oMvlv73IqmvodeOQm64HBHBtqxhxbg==
X-Received: by 2002:a67:eec7:0:b0:4b1:8b53:2987 with SMTP id ada2fe7eead31-4b18b532a92mr1485304137.1.1733920923270;
        Wed, 11 Dec 2024 04:42:03 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afe6969140sm1074686137.7.2024.12.11.04.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 04:42:02 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4aff620b232so1090864137.0;
        Wed, 11 Dec 2024 04:42:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUu2nFW73mxV05tsUJTC7Aw92TQgtsS1KHwvxa2+jcemg0IrLecG2bEjsi2Lj4Z8eakxtzzugLU27DL@vger.kernel.org, AJvYcCVvvsNTz6AHjL9Yse+UPu5yNFlvC31OkgaTjpNQgTmavj+a8guoesFdgqZOFuGHARWC7BGDCUp9Nvtu+Gmo@vger.kernel.org, AJvYcCWlTbj4ZqmSe+WjteGSvlmDIDsodbCRLrAerPGS4UltinHehwSkccNjV5SOXuoFJOiKvd53Kkxmdmq/@vger.kernel.org, AJvYcCWnma1sYdqWwN4NksXbjgFjUkP3jTttPxbXixExd9r5qzOac+Rb+J6YKjVBp0Vy3mbisnf2Frum+UzDab85+9qWs0w=@vger.kernel.org
X-Received: by 2002:a05:6102:ccb:b0:4b0:2d7c:43e1 with SMTP id
 ada2fe7eead31-4b12913b88fmr2367405137.20.1733920921942; Wed, 11 Dec 2024
 04:42:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com> <20241210170953.2936724-23-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241210170953.2936724-23-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Dec 2024 13:41:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWk-KYbzifGfk9hLrEXVoPLrZys2A=ULyLzZarJybCKmg@mail.gmail.com>
Message-ID: <CAMuHMdWk-KYbzifGfk9hLrEXVoPLrZys2A=ULyLzZarJybCKmg@mail.gmail.com>
Subject: Re: [PATCH v4 22/24] arm64: dts: renesas: Add da7212 audio codec node
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, magnus.damm@gmail.com, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 6:10=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add the da7212 audio codec node. Along with it regulators nodes were
> reworked to be able to re-use them on da7212.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - collected tags
> - dropped #address-cells, #size-cells
> - moved #sound-dai-cells after clock names to align with the
>   documentation example

Thanks, will queue in renesas-devel for v6.14.

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

