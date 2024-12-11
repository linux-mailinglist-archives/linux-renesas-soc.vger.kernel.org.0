Return-Path: <linux-renesas-soc+bounces-11220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 167DE9ECC2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 13:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BA1F2828CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 12:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853D5229124;
	Wed, 11 Dec 2024 12:39:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4070238E23;
	Wed, 11 Dec 2024 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733920749; cv=none; b=ofE1H3XNTQsoLanMxMsIzZg8HwFAyBAF3/3S4f/VHPfOKhkgicdJZRdp0aErQBCBoqS2Wbe9INyBdMuV7CVk3h+zi/1ouSZf8O3mgapFR7r/x/kSFlyyp26jSWqL9kEjXuIw71Gs6YEKkJmT6EKlTXLxsdve9C0G8SZJIupbTGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733920749; c=relaxed/simple;
	bh=2oPVCiOpfzdgUocAiOmCaUCA+McSWuIVDnTGbrhLjag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9n0DM5Y9TIqDQhfWnLgNLNA0qQZ7zG8EmBr2wxlghOtgfZ6GBq38bKgTYqICFlGD1ta8A2D4F9MkrV6ZPbgvujF6OfRt4n9N5XY1h3Hon4G1Fdpw9FLpM0sDq2J7VEAKLq6rzZcvlYhnfdXMuI134idZImeynWgTsygE5xF4fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4affab62589so1015610137.1;
        Wed, 11 Dec 2024 04:39:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733920743; x=1734525543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8clGLSswQIYjPop5dRjsL3kTCtkKbt4z9Zj1iJmYdk=;
        b=lyAqRTIdC+UVF2+8rX45BoW+WIo0ulhMOzTLiEzAxwiL0SnXPS57CLW8rR6XyB4/DP
         gafkD25QaVRRLcpefK3X04WaePcyoqdexwtfx8vUU/+XxfqJYwQNgpfVKZiFp9JZ2pHo
         FzeEEFmtCK8XPGhtLqvsPzABlrhlLfqJIKzM8DV855slCXYNAtlJ6i6i1xWXg6AKe7Bx
         VJTnZxOuJ+vo1iPx7x3D4GD+Aypa1TrJoHgS+Yca3tHHm77oZZlerGsRuqmkTOvePU+n
         AyTylbhFW2cxPH++EVNXPmG+Py8F1tf6i9lOvgkGSym4vVnnqwFF6mPDw40My8wkGQc1
         ZmDw==
X-Forwarded-Encrypted: i=1; AJvYcCU3z+C4QO1qZRzXQNdHJVKL/c4Wg9avId9vQ4UqDALVb5IB2Gy8mNP5N+GyT6Qkn8BzdGHqBXoEqorG@vger.kernel.org, AJvYcCUIXqbufP1uiq+IlS77gZb6yEllRJtTNAJjo6GWktByB37Ah645QRAF+0/mWUOey/71Ra2TV61y6eWwNJxFQJAuzSE=@vger.kernel.org, AJvYcCUsiJMb/X3Uk64crsjiGF/LahJWZRw0W80NC7XlNxEsTXWjYa5miIYzwhG6ym83G+fCDiItisPfx61Izt5N@vger.kernel.org, AJvYcCXTr4srh3bHDBNv4WRLa5KuzU1W0A8CpT9cRw+++MQmVPFs1VFGJLY2RRUPQs3CP5/wmRuAhmmdwTfr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4rHDHFIB8rsNHP+xm6qDLBtv4kl7xDds1ChRxS9RKcJitw3Sb
	vbQJVZTMh3AOie9OXm6KVzNxvD505PN5qGPYdht7FC8+vDkUS6+8rFCLi/HW
X-Gm-Gg: ASbGncu85MxmbeKIB4DsmtXTmiMB13g603CBgm+kyKRIjecGWInMdkudYuXjrVynADP
	d3fZop0FS22A4f8GISc+RnvvJKS9T1Qt8MoETUD3X5L0VDwf3MivNsQpA6UGefcHXYQzIbhdQWn
	xUTLdOT8+wBfh80qb5dBO7Qy76QyC57hdKUnV5Ov1Dg1ZC4Run7a3LvH0yzrsiuJPbJLvVGvHnh
	KXz+wkhUyqff/ICGAeJiEhta8dnFzir7A64scXWXBWtw8GczFX2ryJ8olITtxwSCFDverSQlyvJ
	mvFJR8CGZaDGTDIR
X-Google-Smtp-Source: AGHT+IHueB9pq60ljnqj2PUmQ7dZ4hPGnGiC9wHluCJ2kJ+U1mDzAD4AH/GF3C8dv5OCjy1jXYI7bg==
X-Received: by 2002:a05:6102:cd3:b0:4b1:1a3b:a62a with SMTP id ada2fe7eead31-4b1291a544fmr2457873137.26.1733920743716;
        Wed, 11 Dec 2024 04:39:03 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c66b1ee44sm1031206241.11.2024.12.11.04.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 04:39:03 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afed7b7d1bso1066583137.2;
        Wed, 11 Dec 2024 04:39:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiHLUp2Ouav7Zktn4o2xlTiC98V7kVPzz6AcMFNUlgd6IXOY/J+WfIIirzvL8f8OAflbF01exQunlp@vger.kernel.org, AJvYcCWDFglzv2N1VNajPCDNoCLEknVBTUQTrqFRZh/8Fesqu9Fu0V6CjeLYPanU6bXhNBIVGqISDWeFxPhp@vger.kernel.org, AJvYcCWDVDqjj74iutKZaApxQeq4C2EccCQZPxeYPprIJ/51djAU9dLqpjSUrIDBKYuBhEcyehrzya5Cn+mk+eE6@vger.kernel.org, AJvYcCXvf1MMPifHbVNvsxb3Ga1+N6y+ImkxBpoFJgGiq8v66ieKqJmHZyKdDJHb639DxBDkRvTjSc1CTlwyRmB/M/VOuNQ=@vger.kernel.org
X-Received: by 2002:a05:6102:5125:b0:4b1:1def:3d10 with SMTP id
 ada2fe7eead31-4b12913b56cmr2358595137.19.1733920742652; Wed, 11 Dec 2024
 04:39:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com> <20241210170953.2936724-20-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241210170953.2936724-20-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Dec 2024 13:38:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVPkq6SgQ4rQHf=_LeqhMP6fm_45mpfLUf8apuCoJCFSA@mail.gmail.com>
Message-ID: <CAMuHMdVPkq6SgQ4rQHf=_LeqhMP6fm_45mpfLUf8apuCoJCFSA@mail.gmail.com>
Subject: Re: [PATCH v4 19/24] ASoC: dt-bindings: renesas,rz-ssi: Document the
 Renesas RZ/G3S SoC
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, magnus.damm@gmail.com, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 6:10=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The SSI IP variant present on the Renesas RZ/G3S SoC is similar to the
> one found on the Renesas RZ/G2{UL, L, LC} SoCs. Add documentation for
> it.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

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

