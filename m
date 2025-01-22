Return-Path: <linux-renesas-soc+bounces-12313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0584A18EFB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 10:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AA363AB49C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 09:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C1C2101BE;
	Wed, 22 Jan 2025 09:57:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85471210190;
	Wed, 22 Jan 2025 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737539824; cv=none; b=tRWZy1VEzQpq7JC4TnTz5wE+9fxF2wL8VUkIAqMrNCT7zuoKCP6HyKFl8F6Zyh4yClOBcq3JurDYGUAf1tabedS4E5C7HflTAkE7ImdSXn0Yk7L3db6f4MAsRUp7b5MAbYZSQ2KPedmgJv7g4vJHNB7AHKhIgiWyWlnxVsIe6pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737539824; c=relaxed/simple;
	bh=bQItIC9OMhkwNciZtvw/Y85t+lW3PH9iS0vi8IEpgUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qSGL+kND645x6l8FKSZXUZDLsNwIQRqceEAD4NAZY5TJiWdzKVa+7kcOMzdBZ/ELS/IbiRY+YWg1PgXw32C0akHqxa+tGZBpznoofAn4DVEoHWGuFXxDIiCZfQsUKYJj+JtsjG1hx6q9zyWy2DLjIPmrF0UfzQIZyTK4UZ/ytiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85b95896cefso1156337241.2;
        Wed, 22 Jan 2025 01:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737539821; x=1738144621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Me3Jqra0wJNLZUqRxXUXHKeEureOarGNmBw0jL34Frc=;
        b=sdfrSLckfQxwOCLC/1qCRNVmL8scuQFm8pt4PBtYtmo1SiwkGiAGKRS/NrAGxuWyMy
         8QMFP9+99c4wOeW8hGKeJ6kcEDGgl9YaMKJO7mMVJuR7JWt0IJU2wUOalnn3grqw2Ko+
         2Bxj1hY1UuqKlx1j7DpmY4duZNo7Utt9hMGQ1davVHRQ36acm6dkgF/GayCz11O1XwcE
         3uZMlrZvN3g2X356kXxrzuEXBIlVZpDfkGqf0gfrD6ttOhW+wnZm8+cuByG1aaqHyCtL
         /pxSZkrySU9329VmItpb7D/w+sPzcj3AvVk4KW7oueV6vW0F+teYg95UT5I8NAiLvLdO
         fncw==
X-Forwarded-Encrypted: i=1; AJvYcCWZffBHepN8YFn3tjLW5c7uJiZUL6f3JSv7rrIC13Efq/SgWD9BWYjRyfIbmAJu+yKYODbfBnZyvT9l7iKb2HOvCFA=@vger.kernel.org, AJvYcCXZdWpDHiTnAso1EVK25nb/dGMZUCe/mkQ+NIne6Eica973B0x64aQ7D1IYaXiiQPOWwQM7H0857u32ME6S@vger.kernel.org, AJvYcCXzXPmlTXO+oU4lgdy23bnn5+yzEfNJ+qspjhZxxUNy8FFSqlSQUKtS3RZcXT1t3opKmouyaRYnKHg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+iVXHKiw0v+Iqt2ScEs1s24Lo3P5+8oOjSNdWSz4ZR6XZYHoa
	XCPzIDRKylFbA1e59SHs2WLrj/+6BhVZiU3CFeaCRyvmF821pgKg0YcGSCEf
X-Gm-Gg: ASbGncsBqZor/eEN+2PJhpR2uOlhGz/yhen3xeIA44fY5MzLKYxe2txMdY1BOxLvLvj
	Yn2aVM8/94r5oC8m4ZX/8QvQMt0FUOky6Hfu6PPOBpjG3L9hfyVdDIY+ziN3dgFjCkLq7ypqokA
	irXSq0pUOv6xmXFet6ZgPgryMrQDUqThSGZZvtOCcfvXP+6Ox7aPe/C6CxkFaZVqxhP7QhcJun9
	1Ug4u26dxLXTO0HChrLZB/eTpKEy8psrC83pwGjIfrqTlwrHVHWUs8OlU0+HZaL+uQYk7CheNXm
	sSuh8hUC1PlEXvEjdH3ewdXWz+aYQ+A7
X-Google-Smtp-Source: AGHT+IFGGTyXISy6L6ewDSZgkHz7Sw63GBJsRj8HL7FofKSa2sTTrRKWwQh5QGKXlw3kySkHOdUqMg==
X-Received: by 2002:a05:6102:b02:b0:4b1:3409:93dd with SMTP id ada2fe7eead31-4b690cde1f1mr16214786137.18.1737539821025;
        Wed, 22 Jan 2025 01:57:01 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a33f5d7sm2613705137.27.2025.01.22.01.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 01:57:00 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4affd0fb6adso1911399137.1;
        Wed, 22 Jan 2025 01:57:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVE/qdf/BUAPJKbFVBWlXItChTDzuILddyv/6q62/L0ACbhQjYGVxlNL7adeWYYXhHGK1RNwl2s+bWB+FORkjmuQQ=@vger.kernel.org, AJvYcCW6gi0yQPAA6zefNReasPwbsr0FWLrvEchstCKax4IL/vJrPxTjVL3GqGq5pt6eXkUWr08Q2IeMF1nBA/kp@vger.kernel.org, AJvYcCWBmv7/MRlvWKx4l2HCU4JxQys1rsW+pL33YJ5mj6MorEAd+IVPLTxeayBCtvCKJH7lK0DdWyOs9Bs=@vger.kernel.org
X-Received: by 2002:a05:6102:a47:b0:4b6:1ce1:30a4 with SMTP id
 ada2fe7eead31-4b690d1233fmr14880755137.21.1737539820170; Wed, 22 Jan 2025
 01:57:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115142059.1833063-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250115142059.1833063-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Jan 2025 10:56:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU_zLGJUWj-58ESJr41Vh1vuxcB_NGU1KQUb0cKEJTtUA@mail.gmail.com>
X-Gm-Features: AWEUYZlWR9X3PMqN3mR_5o4BFUWL7637w4s5j_LDRbFwcQ4YepNQoOsHPiLskHM
Message-ID: <CAMuHMdU_zLGJUWj-58ESJr41Vh1vuxcB_NGU1KQUb0cKEJTtUA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r8a08g045: Check the source of the CPU
 PLL settings
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 3:21=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On the RZ/G3S SoC, the CPU PLL settings can be set and retrieved through
> the CPG_PLL1_CLK1 and CPG_PLL1_CLK2 registers. However, these settings ar=
e
> applied only when CPG_PLL1_SETTING.SEL_PLL1 is set to 0. Otherwise, the
> CPU PLL operates at the default frequency of 1.1 GHz. This patch adds
> support to the PLL driver to return the 1.1 GHz frequency when the CPU PL=
L
> is configured with the default frequency.
>
> Fixes: 01eabef547e6 ("clk: renesas: rzg2l: Add support for RZ/G3S PLL")
> Fixes: de60a3ebe410 ("clk: renesas: Add minimal boot support for RZ/G3S S=
oC")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

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

