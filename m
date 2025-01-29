Return-Path: <linux-renesas-soc+bounces-12696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3933A21FDD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C292165D2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 15:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AE217BB21;
	Wed, 29 Jan 2025 15:00:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AF54C83;
	Wed, 29 Jan 2025 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162819; cv=none; b=jIQs+O80WEOiT2+Sy/9RA1jMo32VSGcaKLIgcaRcn49EQukY7Gb5Ggf4fowWtUc0CFogQAFHI/btc5CNtq7kLAG9bUILj/CvC+YBQIkaVjWX8U3mRUtzLopifxYMhClRl+nbzm7RpKLGBSaDobwzdyxgXv5+Suwzykm7zuQUy6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162819; c=relaxed/simple;
	bh=Bf41afkMEWvaTknCq3tMKtgUQZfTzAcH0pj4e7Hp2K4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGjTJTm0fLZlwl66PzRFhUrjgr71yj+gs96up5caTpJRImZzKFtOZKvy1Qu1+n5IhY+zGiYsP5l4kpI9sBrOqLFsVzmiEkuaSuvxkCePZfaid5l+UimyMWB/gGFoeR2N/IExZFGFztz7RLb4bSJr30JyJgjmPBA2Wc/EFra4Ulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4b24d969db1so1441502137.0;
        Wed, 29 Jan 2025 07:00:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738162815; x=1738767615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElvdjKyBEMOPcL6ckmA/XAZGxm7FHL632sWJDdNIxEw=;
        b=eg4xp4lD7leLt7d4GHMJqtupcE7mby9p4DI8A/BA6srUGD0CE3Zjt8sh67bxpoi5rL
         Ad+8+dF6t8qXFD4isDTOz25P1sGVr/0t+aWaCKgsGvM83BiDyebU2ywKA9HHASUb5WdC
         FAaKv86wtJn5BibW9vfJg6+Nr3gRntdpVKrgpeTsnDk1Ee4GJBMo0tN6dhNdViIlAwD1
         WCaPCh/CRbTYzxQl9WVWqYuvd4AnYQW1HrlCsiGMyAkrcAQqEXbF1IoS+jAdYsS9tdUQ
         7u64ZX8JGHjIo4fFauCyqX0JmnUq/ybp5HJKpjYqREfaQfDpG49WIZx68IKfJ7Q3zwOQ
         I+hg==
X-Forwarded-Encrypted: i=1; AJvYcCV3IIknz1F0nCeMe9OK66qLRXezDMnpaYo9NF7I4eVq7mCN4VKQwN/l6SAzW9LqyMdPDsL6l4/m6nQa@vger.kernel.org, AJvYcCWABzRiKaC5seKpgswu8Og+p0S29wOdaPMOgVz4A72puKM8Em8A6jbKhHWqsyDRKrao3q/jhoSffhVNjPRIVeb98ZY=@vger.kernel.org, AJvYcCXqZSizjXyoEPuulNAldutaMfBhHMFyqldWaG0RBGn+gF4uHHJpdgUy+rev+lrcMYz+iox0MstcM8A7rjPw@vger.kernel.org
X-Gm-Message-State: AOJu0YzpxqLYeuRrUQHZ4F7TDma87yrvn3CxPwhc3LUMRtLyupuS2gqF
	T3JK1RfxaCCQsRNf218wxm8gDM+IHdDvQr42iDSPT9x4ilJBHfcV0BiofQat
X-Gm-Gg: ASbGnctYJ7Qt7BUy6nSeels7KQqnwN8cTMKTFqgMe/x+64WUpr7u7u4KuRR9nxWHL4M
	HeTCoB4lvpldwns94PRH0TUD4HojnlNLN+fBargt8OBE+Q2b58mrRqI0x8kjynsCsQHtryc5cmP
	sBoSlMgchPMSJaxtUCowXPcrFn24P8EtW7DJtC3TrGfb+BSBosmAaASn8naqShT8/Uh+PIhrXS7
	Xr06wlraVFVeLObLVnbgVpMv/JsZst75n9H6KpVA1Ai6DRAX2dyKEvSQmFM/cmbYp3SXMVOsoK+
	6DaP3T1F5XmtrtCAqRZqLlNCV7ciK5PggsC/ie3JC4NpcXKQLPW7iQ==
X-Google-Smtp-Source: AGHT+IGocIOFDG+nyNHU1FNqqNBFPwkIqmDfMNS1ZN+AKWD4jMP/fxE5obU4QsGwO795aVQalKVaSQ==
X-Received: by 2002:a05:6102:c13:b0:4b2:75a3:2267 with SMTP id ada2fe7eead31-4b9a4f81fe2mr2615732137.10.1738162815288;
        Wed, 29 Jan 2025 07:00:15 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9af5a02sm2802624241.14.2025.01.29.07.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 07:00:14 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-864e4f5b253so650370241.1;
        Wed, 29 Jan 2025 07:00:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV4I3T5AJLbTE0TfcQkGlZwYIoG4GV0H0MeCVhmj/S5fYY21oOIWPxYinpaoduIsvH+i/hJsAO/yvhD@vger.kernel.org, AJvYcCVTTrDKsGiJVdAm8r29EKhjI0RCezp5t/6lx9875NtdWSvwb7Z3xhMQNtRYyg3BdoIunC7sE+MLTEV5ydFW@vger.kernel.org, AJvYcCVWZsmYhorGhVPZA6xUjgyjlr9WVnYev/aiFl9//af+UZ1jdg3heVFx4FvbHAT2hjz3ufr3wguZzxTvmhmvQ3TxXJs=@vger.kernel.org
X-Received: by 2002:a05:6102:32d6:b0:4b1:20b1:bff3 with SMTP id
 ada2fe7eead31-4b9a524fccfmr2562705137.16.1738162814721; Wed, 29 Jan 2025
 07:00:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128031342.52675-1-john.madieu.xa@bp.renesas.com> <20250128031342.52675-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250128031342.52675-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Jan 2025 16:00:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPU_p7M7OCwDUzFKimDHm17Yji1FHGdBkYYz3R2eapVA@mail.gmail.com>
X-Gm-Features: AWEUYZn3triGo_YF10-MJyZ7-fcp4HF0ja6CsdmsvNE7qG8y_5OUsSqJ_qnGSVk
Message-ID: <CAMuHMdWPU_p7M7OCwDUzFKimDHm17Yji1FHGdBkYYz3R2eapVA@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] soc: renesas: rz-sysc: Move RZ/G3S SoC detection
 to the SYSC driver
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, biju.das.jz@bp.renesas.com, 
	claudiu.beznea.uj@bp.renesas.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jan 2025 at 04:14, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Now that we have SoC detection in the RZ SYSC driver, move the RZ/G3S SoC
> detection to it. The SYSC provides SoC ID in its own registers.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> Changes:
> v5: Hardcoded SoC-specific register offsets and masks

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

> --- /dev/null
> +++ b/drivers/soc/renesas/r9a08g045-sysc.c

> +static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initconst = {
> +       .family = "RZ/G3S",
> +       .id = 0x85e0447,
> +       .devid_offset = 0xa04,
> +       .revision_mask = 0xf0000000,
> +       .specific_id_mask = 0x0fffffff,

I'll replace these two lines by

    .revision_mask = GENMASK(31, 28),
    .specific_id_mask = GENMASK(27, 0),

while applying, here and in all subsequent patches.

> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

