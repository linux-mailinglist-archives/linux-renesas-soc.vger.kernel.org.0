Return-Path: <linux-renesas-soc+bounces-24697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 427A1C6435B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 13:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F09433B34D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 12:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C69432AAD1;
	Mon, 17 Nov 2025 12:47:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D6030C629
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383624; cv=none; b=bQNlREQAKf8fMgJUKmhBmd2oV18vaJDnW/wiUoiKYk95Ei7srd6cdpFRbHdENWiqKHpN00RIyzt8iDL8Z1ng6i8CEIT3yvbFxRdmhvXzGh2jbRYEFQ96gW+lrlJJHNVLyXPzphhUaU22KKVRxOPFd5xVJjrESgN6THsvwETAjDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383624; c=relaxed/simple;
	bh=hlVSYLJZeXbokXYqxTqoelESsy6EahEWkhtY8fstHS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgHsxGVZemQiHAZ303EMi4wUVFaKJydzgMYR6htWXwtyfSN37fh6r9c/9o6MvAZS+q3B1MkyCyAofzT37+g3XHMgj4BfXJaWBOXzvkX5NbCkURk0bfXAMpwXQEOUHYU2oe5ekMFbUL6XeRpCcFarHTCz2FAyDQqfrjqj3qNzKY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9372410c6faso1142320241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 04:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383621; x=1763988421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/p/Naewd06ZpfwXTsVxBKCB8QRO4G0RLjGNPdM0LwUs=;
        b=ab9Tou/02kK2BSE7lwJmcH3zArt0AizoOS+eaadb1koLog6VgQl/3wLvQyT0Ab6jaq
         dh38U5Jo4BY2jjJR3wx315QklAtmc+3CUo0Vbh6t1XBfeD74KqVlwfByWbCk39XvNc96
         GAC7Cuj94ab3Op8s8JMgH2yl2NC7K0g7ENZgDsIkCQ5taH8QR8ClZ7m2d/2a454VuYij
         KvDDd+/dxvMpqcufYDL5ZULCAJATk8p0UVz6Uqq9xcjCN97/BXB+eLdiXmjrWrZzIEyg
         ISTZqXictViH/xREvX7X5L6Tqqtq21kdb4v01YTw95EB16tio9vikS+4kIDn3QIOuuYD
         oD8w==
X-Forwarded-Encrypted: i=1; AJvYcCVRBnEBw8WEYqDU09l0O3aTNqsG69rMkmdp1EibppuJB5OacOPK3K3iC4TwuXpvdMDUoDBmGM9jCY+Iy6U1jp1AWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQHpntASPDYuK3vEBJ9EQpMLaQx+qEgfQP3E5K7qZi/105CQH
	CZu6x3egKKB1A5opFDtijEBA+JhaPc1EotVXlX97KnWECwQBPtL9cz1F/99ktBmzAD8=
X-Gm-Gg: ASbGncvkM1O/1Nt4qq0lQj7+60xag8KQRRAVr9EMC/kch7vhPfJb8RBsGMLE7T/c1hA
	B63tmPG2viPMRUGi/7dV7Ds6JKM+Nu7wa10Ldx81CIr0pZsAktkOLc8MJ1R0ctT/b2zotevH3bz
	Cu9qPJqSclImpf3YtXDfQsvKLVU8bHGBThUHtBq+sqoe6hRfOI9HcbOC8RqKdxbkN32K+Ec/wYg
	A7ETriKsjByqFaZepd10bZXN0XBxv8mJ6FGWZHYY0IwJzRlpZGniAe8eATZDd2WdAQcGFejHtvH
	howQhBTF6/EvjtBfziaRYRmzakbUUWvbfswAoV3I4xT/NnCqZqfby78Q1sWMLfOJaQ8na+z2ZtL
	NdbDuLGUir7TndZjkZ6QBy6kkdJnP8CJ52SIUXqh3YfLmGTCrTI1o/+fPHiLwk1CWpTgvdXAz+7
	wwIRzVkgJPHP/FqDRB7csADvE2QDzwqrQcJlO3Cg==
X-Google-Smtp-Source: AGHT+IGZdl4Pl21IBBaO/ZButEpH0PzuFfSoeZYZMRoe+0+bMD1zBQVZ2wQRWGymjVo4mK9aYIWK8g==
X-Received: by 2002:a05:6102:94b:b0:5db:ca9e:b577 with SMTP id ada2fe7eead31-5dfc5b6b66fmr3231724137.35.1763383621000;
        Mon, 17 Nov 2025 04:47:01 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f49865fsm4239625e0c.22.2025.11.17.04.47.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:47:00 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5dfd4a02638so768286137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 04:47:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmSPtwcjlHju9vnBNzhujmIbONSKaEsr11f4yPUynfA12APmrxGpqKoVG6MnDXY9MTN+qS8ZaiT6xBhFOHDXOHPA==@vger.kernel.org
X-Received: by 2002:a05:6102:d8c:b0:5df:bb10:631e with SMTP id
 ada2fe7eead31-5dfc5b95fbemr3612940137.41.1763383620375; Mon, 17 Nov 2025
 04:47:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105070526.264445-1-claudiu.beznea.uj@bp.renesas.com>
 <20251105070526.264445-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUwVeLtyQ9X-Lz16W=KtbfjiPqsgWfuDc72B3u6OCtqgg@mail.gmail.com> <6369d978-a067-42b3-8384-c5d8814a1506@tuxon.dev>
In-Reply-To: <6369d978-a067-42b3-8384-c5d8814a1506@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Nov 2025 13:46:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-OtX-3m+vqzoVHz6XBONrT2g_HRCMvWOu_1EHGpGRww@mail.gmail.com>
X-Gm-Features: AWmQ_bl4Y6s95cgkfQqSPuVmWy8KeOf0TP3rp4asZVU7KPEQ2DYbVaAN76WF58w
Message-ID: <CAMuHMdX-OtX-3m+vqzoVHz6XBONrT2g_HRCMvWOu_1EHGpGRww@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: renesas: rz-sysc: Populate readable_reg/writeable_reg
 in regmap config
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, john.madieu.xa@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 14 Nov 2025 at 12:46, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 11/13/25 21:15, Geert Uytterhoeven wrote:
> > On Wed, 5 Nov 2025 at 08:05, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> Not all system controller registers are accessible from Linux. Accessing
> >> such registers generates synchronous external abort. Populate the
> >> readable_reg and writeable_reg members of the regmap config to inform the
> >> regmap core which registers can be accessed. The list will need to be
> >> updated whenever new system controller functionality is exported through
> >> regmap.
> >>
> >> Fixes: 2da2740fb9c8 ("soc: renesas: rz-sysc: Add syscon/regmap support")
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >> ---
> >>
> >> Changes in v2:
> >> - added all SYSC registers IP specific, except the SPI
> >>   registers on RZ/V2H and RZ/V2N as these are accessible only from EL3
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v6.19.
> >
> >> --- a/drivers/soc/renesas/r9a08g045-sysc.c
> >> +++ b/drivers/soc/renesas/r9a08g045-sysc.c
> >
> >> @@ -18,7 +37,57 @@ static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initc
> >>         .specific_id_mask = GENMASK(27, 0),
> >>  };
> >>
> >> +static bool rzg3s_regmap_readable_reg(struct device *dev, unsigned int reg)
> >> +{
> >> +       switch (reg) {
> >> +       case SYS_XSPI_MAP_STAADD_CS0:
> >> +       case SYS_XSPI_MAP_ENDADD_CS0:
> >> +       case SYS_XSPI_MAP_STAADD_CS1:
> >> +       case SYS_XSPI_MAP_ENDADD_CS1:
> >> +       case SYS_GETH0_CFG:
> >> +       case SYS_GETH1_CFG:
> >> +       case SYS_PCIE_CFG:
> >> +       case SYS_PCIE_MON:
> >> +       case SYS_PCIE_ERR_MON:
> >> +       case SYS_PCIE_PHY:
> >> +       case SYS_I2C0_CFG:
> >> +       case SYS_I2C1_CFG:
> >> +       case SYS_I2C2_CFG:
> >> +       case SYS_I2C3_CFG:
> >> +       case SYS_I3C_CFG:
> >> +       case SYS_USB_PWRRDY:
> >> +       case SYS_PCIE_RST_RSM_B:
> >> +               return true;
> >> +       default:
> >> +               return false;
> >> +       }
> >> +}
> >> +
> >> +static bool rzg3s_regmap_writeable_reg(struct device *dev, unsigned int reg)
> >> +{
> >> +       switch (reg) {
> >> +       case SYS_XSPI_MAP_STAADD_CS0:
> >> +       case SYS_XSPI_MAP_ENDADD_CS0:
> >> +       case SYS_XSPI_MAP_STAADD_CS1:
> >> +       case SYS_XSPI_MAP_ENDADD_CS1:
> >> +       case SYS_PCIE_CFG:
> >> +       case SYS_PCIE_PHY:
> >> +       case SYS_I2C0_CFG:
> >> +       case SYS_I2C1_CFG:
> >> +       case SYS_I2C2_CFG:
> >> +       case SYS_I2C3_CFG:
> >> +       case SYS_I3C_CFG:
> >> +       case SYS_USB_PWRRDY:
> >> +       case SYS_PCIE_RST_RSM_B:
> >> +               return true;
> >> +       default:
> >> +               return false;
> >> +       }
> >> +}
> >
> > As all the writeable regs are a subset of the readable regs, do you
> > think it would be worthwhile to write e.g.
> >
> >     static bool rzg3s_regmap_readable_reg(struct device *dev, unsigned int reg)
> >     {
> >             if (rzg3s_regmap_writeable_reg(dev, reg))
> >                     return true;
> >
> >             switch (reg) {
> >             case SYS_GETH0_CFG:
> >             case SYS_GETH1_CFG:
> >             case SYS_PCIE_MON:
> >             case SYS_PCIE_ERR_MON:
> >                     return true;
> >             default:
> >                     return false;
> >             }
> >     }
>
> Looks ok to me as well. I chose to have it like this as most of the
> readable/writeable function that I remember to have seen in the past were
> in the format I've presented in this patch.
>
> I noticed you already sent the PR. Would you prefer to return with a follow
> up patch and adjust it as you suggested?

Up to you, I haven't looked at the impact on code size yet.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

