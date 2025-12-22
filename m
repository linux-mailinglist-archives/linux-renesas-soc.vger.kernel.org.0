Return-Path: <linux-renesas-soc+bounces-26010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B132CCD6700
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 15:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EAC830AACB4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22203016E0;
	Mon, 22 Dec 2025 14:53:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D352E8B67
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 14:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766415202; cv=none; b=oaZHr6zEYEoSUQCRXddtZXfGXobU4yFa4omSDUWVJEKD6OIpXKmP1/wJJw56v4CI3NeDZRJsmmcyp49D2LOGFijwx3YvCYPlWTvbRoLwwCxjoOBxtjuW3V5GqbUjpbEfYpdEk643GaDrm1u/ZinUjOTxMZQfxY7oPRJkg0IdA+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766415202; c=relaxed/simple;
	bh=KSRSuFHH2PJSD/CckpNMs8AU7IpdEg1Y2+TdEVv+dv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqScjm52h7zUDFJO0irs2qUsvZLVOKHAoNJQ0AnM8EwkO8Qyi9JDN8A5CiXA93k3b0j4t3GRx1RScr7ov8P3abonffVzCiPQrcH9/buT7ZfVij9Ps75Zh+CBwV0Np/cMudwEFgCX0TzJqW0tgL36Pqj21cjsEN93E60xKvvLv3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-55ae07cf627so1058428e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 06:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766415200; x=1767020000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSOJB1gMOn5xy6gb3TiloSuayTyzA5AxEWeYO3ZY3ZA=;
        b=VlD+rxnLpLDvZQDQDW+4nSu05Iu8BSCvQbhY8G7/7fiPPSK7eG8DzcJwIph9mBhfUh
         bizvhvmWC4z2ZUatMiWAEUXQSLSnmNBD6xWwn3535mpJKdUwwIulcWkU0a05Cs7P8Fu+
         HxN2ahl0Fvy7xJ1QpydfXMOfLm/vpVG5LmiBDKPP/Ma0XzDfdYvD0t8RqiQI1RR00OEP
         8/76cUtBjQZlllsnW1FxMoOLvqsH15vlsoDYsuc6l+u/Ya4rK4tOkkPTfxf/EbFSfD5I
         YhkeZpn7atsHspHd8whKjVM+IV96ACrQw0jJWWikWDlsClP7mshfnkOqFYX0Q5alCG82
         pPeA==
X-Forwarded-Encrypted: i=1; AJvYcCWZtb963ekJrp9AQZqaPMn6O/G9GaMk1VBJqVcQnLeGdQM2xi/r1i2RUBCQvnhYm0u1M6+yYM2L4cUv+usIEIfr7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi5FsmqG/3CQ2QlZYb/7+lM49NW54f/CzI0lYnzwb+MHjTeGPc
	xW7djWiywzJw9pDrRzOi//GoAkZxBF7Ttfm3Q390LTh7UdadLi4RJWviJa+39zWNZhI=
X-Gm-Gg: AY/fxX7lZvSnnrbxmZi7CT5C2cMRT6O40gTJGdAU+W8slIdzPpiD2kG348B39EaOPk+
	Y/TcSvZpWCFKiNLq20HnhA1EeJm46yOXskh+F4Q+wJBz10CHU89KSENW3GfkBTh2tXu6tL+BFbS
	KwekENa4YtPcjkQZHJma6oxDTn5LoiYLYjnMbfpbRUSf0hjxG6XZwnV2YFFN2hfx+g3Nlf4UU+R
	/M0ktzgXOcEkzk/6pyr7Nyb29TX8Rykx/1X/VeNU6bgO6RcRl7DkVONKbpyt9S/DUelbUoCtZWS
	SVjdB3h9BGRT4EUn6DV3z2hJVH5hndgmamc1XFqBi4tISbM1u6DwcfreBvQkrLIILoB38HmCr6r
	ACr8xzA3NOq2JwmBTsrLbFqkCd5CF7K/AlmT8XGZmNclG4iGzoLubIaYwpRrK51UF1YHSSB9V5J
	dGFLgmoU2WM00yrf5J81KfWvvl0SDnvw1en0QhQcbOx3p7ZUqt
X-Google-Smtp-Source: AGHT+IEDBo/i3+gBDrp/HH8mskEdRcU8V7mTeS0Wkb0xdcOFGBCWmoNW+SaQ3rSbNwb08g09NBTqug==
X-Received: by 2002:a05:6122:459f:b0:559:3b8a:70ce with SMTP id 71dfb90a1353d-5615bd3c074mr3476981e0c.7.1766415199700;
        Mon, 22 Dec 2025 06:53:19 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d04b90esm3448940e0c.2.2025.12.22.06.53.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 06:53:19 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-93f64ae67dbso932040241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 06:53:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWOL5KoviKIT/HraSWJAZbycCUALhUwAzrbFcdRt6TiYjaUr4L6R1Dn7dFYmQyl3LYsqcMWFUOhR8gHQWjNDVNz4Q==@vger.kernel.org
X-Received: by 2002:a05:6102:290f:b0:5e1:866c:4f8e with SMTP id
 ada2fe7eead31-5eb1a83832cmr2847910137.39.1766415199038; Mon, 22 Dec 2025
 06:53:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129185203.380002-1-biju.das.jz@bp.renesas.com> <20251129185203.380002-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251129185203.380002-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 15:53:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXSxYirOtmurtJOCmNMGr=t9R4MfFbM7b+Z0MPZnC9C0g@mail.gmail.com>
X-Gm-Features: AQt7F2qlEkm1wnEZIhCe2vD7ICNydnEQ79zcdK2_BhnMHX0Wu6QyxXQ6x9vYF7I
Message-ID: <CAMuHMdXSxYirOtmurtJOCmNMGr=t9R4MfFbM7b+Z0MPZnC9C0g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: renesas-smarc2: Move aliases
 to board DTS
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Nov 2025 at 19:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> SMARC2 board dtsi is common for multiple SoCs. So Move aliases
> to board DTS as SoC may have different IPs for a given alias.
> eg: RZ/G3S does not have RSCI interface.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Collected tag.

Thanks, will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

