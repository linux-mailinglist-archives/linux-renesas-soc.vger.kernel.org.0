Return-Path: <linux-renesas-soc+bounces-21111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3741CB3DFC6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 12:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6834E7A578E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 10:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7843E20DD48;
	Mon,  1 Sep 2025 10:09:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC3A2FB975;
	Mon,  1 Sep 2025 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756721357; cv=none; b=qBf7zOv4z1gkYZTYjTqu/96zW19IXBz/DzRcCuN+rZPJ3cWInleEfLnnBvNSvp4pGhCVwUg0AByXB7pqFvSJGafsYpo7+Qf7z7AaueHZdQFMP3EJY7L6KwA2leQZwolYrDRaQykkShyg3GnCsZNcoIyMV8P4ghffHI0YuqguL5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756721357; c=relaxed/simple;
	bh=zwItX95Fc1EG9PSQlSd+Lkeepw9bh7NAFqwlWjx/GTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+FZ6HHtYPK7mFfG4pYdU/RMTMLaLDOljl5dX3g/18ti636c7/yoVOeCzF1xzi93Ju5E06HY4BBDYNWzeGUKEhUxu5U8Wh6/CRTC++RGfcR73tbTeiOKyITvBctJ7lDnXknNZPlTPZoNW9aFToUjchgtkOy3tJphFflBwtRGbxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-544a1485979so533948e0c.3;
        Mon, 01 Sep 2025 03:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756721354; x=1757326154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNkmbz+e9G8pqYiq1crlwIhSDSnA/lqqZPkk2oqPra4=;
        b=fAhqv62N3rop0Kwe82qLa7D1XaH3AUZCG2HoLOd5KWJkvJlEoNtXKO1BFbHJP1g+2T
         9f6vKN7UTC0KS1664ZYiDz4mLCjb9M2N6WEvdDdJyIognTUq/U+SG59tpDRuShGWTNxv
         MCDtHrIvDJq/sofuX3ojNa/kifo6whZUg32ZOkWVryS8phjpnpYKiSMGgKfnpeMy2BX7
         i0kir+98s7XeGSsme4ar1bGQeFBggFvd6ebqE2G4eqTtP3K0AVHjCVoANlXSCu4GSKo3
         YWz4Vc3N7fhSOoJxU0Gj7ZLcvxAzraNPVCuIRBAOTLTx3/Z1QhLodDq0mndAAX9kK6Lt
         Gb1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1cqoJTZSHTSRPDo1XUoRHNEy13rMO9W7F2S2dFnSEZ91PCeIVg/WbfheNE2AvvuHlUec8n74fwis=@vger.kernel.org, AJvYcCW78umjEp7Z9wtyiD4mZwRZL6Ma0LvReS7ryyuI1MNsfyDjXIZcowSf/6OmrW6kHF/aO1FeONTd8QEZSZHQ@vger.kernel.org, AJvYcCXZepCdR4hY7pSz3F6uwGMAXcSKYVuI0zYJAys+yUa5qJeIsdDXIEJXmpCmgOJXsaYvvS/bDRRGVMjkb/cN8YtSCtU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp2nTnp16/QlmoAj83spfxHsMdFE5FGjbfO3fWTEAmzOhjeKUM
	7qJgmZw/1KixclXarHPGrzeTbruYdRio75Btlb8oaQAz2Zxr0biXNxDSj5192E4d
X-Gm-Gg: ASbGncso+fAlugXzjbbR9s4f96YOawfyUqLkzFec2Kw89VE0I+V+bkA+MpSUHV6hk+i
	qpdJhZ1oQvKLV7gnIB60RMRoYIqRKQniwfyMI3D6OAwaXT2p49p4w6Ny5LZqFw0box+sO5ue8wE
	LeYEOqQejs/HyTOcYg9slEZk1bTQ8PKzz+awTjCdqPkfgG+U0fa+QBYIrUWYCpplrTOsfvBHJWY
	POTJEmjvjOYP5xy4+zETlqRAH5uPk+QFdwNdNOAJ2vLBmhVJaF05yKE6w95FSr9u/SVpXJ4q+aN
	POw7nyrDYM9BwvwNk4dA3c3J8mkxo1YM5CfI7FodVPJgkZ4UEXh+5/4MRQN5++iDLxUazSgjPF6
	QH8RDJbPjhAiJ223y4ek5wk5OKlC71IBaMtXSMqjneSK/E0cgU1J9smzQryBiBQ9D3zxQfZ880I
	r+B+fVPw==
X-Google-Smtp-Source: AGHT+IFYRDqopAMmD+dSF3eyJ6wu3JAGHhky9CYcNkiHmcACReitWsAojqLJ4W7L/562Ot1vmBs2kw==
X-Received: by 2002:a05:6122:218d:b0:544:8c57:6516 with SMTP id 71dfb90a1353d-544a02a8b67mr1531782e0c.11.1756721354332;
        Mon, 01 Sep 2025 03:09:14 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54491464bd1sm4072707e0c.19.2025.09.01.03.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 03:09:13 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-528d8aa2f3bso1329856137.2;
        Mon, 01 Sep 2025 03:09:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3WtpdQkuRWbDtjR/Z0u4pki2nPaxLb88trcUvdDQjiaHHDAj5pcN+PWBUInXV0PNY5ez0T086g7cGe4MIFXShBmU=@vger.kernel.org, AJvYcCWn27Fz1UODjsy5TmuYvZADHpFhYawuUx0uzTYOifMSd0DOQa7fBX0h5fFHlNIhIXA6vVIgGhZGBupjWSES@vger.kernel.org, AJvYcCXAv6UnNmImvXWOT8xhKvB4P9ypkAq7n8Lv+d9Wxhmf4gNOn3WsRYwuRsC2eTqy1Cvo8DzrBGWit3E=@vger.kernel.org
X-Received: by 2002:a05:6102:2c0f:b0:519:534a:6c5f with SMTP id
 ada2fe7eead31-52b1c779168mr1938501137.34.1756721353630; Mon, 01 Sep 2025
 03:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <OS7PR01MB137037775991BBBDB29E54105A77BA@OS7PR01MB13703.jpnprd01.prod.outlook.com>
 <87zfdw2wlt.wl-kuninori.morimoto.gx@renesas.com> <OS7PR01MB13703B662D2AE6ECB77F59584A77BA@OS7PR01MB13703.jpnprd01.prod.outlook.com>
 <877c0z2vz3.wl-kuninori.morimoto.gx@renesas.com> <OS7PR01MB13703654640293E4F1F95B694A730A@OS7PR01MB13703.jpnprd01.prod.outlook.com>
 <877byyzjcm.wl-kuninori.morimoto.gx@renesas.com> <OS7PR01MB137031EFD84919AA36666E1FAA732A@OS7PR01MB13703.jpnprd01.prod.outlook.com>
 <87bjo971ns.wl-kuninori.morimoto.gx@renesas.com> <OS7PR01MB13703647C4AABD03C6345F221A732A@OS7PR01MB13703.jpnprd01.prod.outlook.com>
 <87cy8k2uf1.wl-kuninori.morimoto.gx@renesas.com> <OS7PR01MB1370314F7F5D7548A573D8B25A73EA@OS7PR01MB13703.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB1370314F7F5D7548A573D8B25A73EA@OS7PR01MB13703.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 12:09:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXTqhjqr2E7XtyamtzGf=t1vSdz+0urRY+=BVYgF_qdMg@mail.gmail.com>
X-Gm-Features: Ac12FXyxG_qBUG6hY3bFlvz7jPXsAaPCcrAOZW8TziKArEfKm3993Scf8-XbiaA
Message-ID: <CAMuHMdXTqhjqr2E7XtyamtzGf=t1vSdz+0urRY+=BVYgF_qdMg@mail.gmail.com>
Subject: Re: [PATCH v1] clk: renesas: r8a779g0: Add ZG clocks
To: Anh Nguyen <anh.nguyen.pv@renesas.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Duy Dang <duy.dang.yw@renesas.com>, 
	Duy Nguyen <duy.nguyen.rh@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Anh,

On Mon, 25 Aug 2025 at 06:33, Anh Nguyen <anh.nguyen.pv@renesas.com> wrote:
> From decde7c45060327ecb24df8218cd58b9ffd3c45d Mon Sep 17 00:00:00 2001
> From: Anh Nguyen <anh.nguyen.pv@renesas.com>
> Date: Thu, 21 Aug 2025 09:54:00 +0700
> Subject: [PATCH 1/2] clk: renesas: r8a779g0: Add ZG clocks
>
> Add ZG related clocks for GSX
>
> Signed-off-by: Anh Nguyen <anh.nguyen.pv@renesas.com>
> Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> @@ -151,6 +151,7 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
>         DEF_FIXED("dsiref",     R8A779G0_CLK_DSIREF,    CLK_PLL5_DIV4,  48, 1),
>         DEF_DIV6P1("dsiext",    R8A779G0_CLK_DSIEXT,    CLK_PLL5_DIV4,  CPG_DSIEXTCKCR),
>
> +       DEF_FIXED("zg",         R8A779G0_CLK_ZG,        CLK_PLL4_DIV2,  2, 1),

According to the documentation, this is not a fixed clock, but uses
a programmable divider in the FRQCRB register.

>         DEF_GEN4_SDH("sd0h",    R8A779G0_CLK_SD0H,      CLK_SDSRC,         CPG_SD0CKCR),
>         DEF_GEN4_SD("sd0",      R8A779G0_CLK_SD0,       R8A779G0_CLK_SD0H, CPG_SD0CKCR),
>         DEF_DIV6P1("mso",       R8A779G0_CLK_MSO,       CLK_PLL5_DIV4,  CPG_MSOCKCR),
> @@ -163,6 +164,7 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
>  };
>
>  static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
> +       DEF_MOD("rgx",            0,    R8A779G0_CLK_ZG),

Perhaps "3dge", to match the documentation?

>         DEF_MOD("isp0",          16,    R8A779G0_CLK_S0D2_VIO),
>         DEF_MOD("isp1",          17,    R8A779G0_CLK_S0D2_VIO),
>         DEF_MOD("avb0",         211,    R8A779G0_CLK_S0D4_HSC),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

