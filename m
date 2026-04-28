Return-Path: <linux-renesas-soc+bounces-31705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TgjEF5m58GmFXwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 15:43:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC85486245
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 15:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B5E3302719F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 13:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713F7481673;
	Tue, 28 Apr 2026 13:20:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101FB478E3D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382408; cv=none; b=Gu2gmpKKJo6luI9kZ7eSZ94u8VxplZLO2+Tu4PTr5WZVKU3RtsmWXwxh+SH/7DFlLSFF6Z7ZfUULJZPbWQhxNHwMb4fB2DfGsLflAcbgoLgoNVDM2cRNF/0svHmfS1OHyNF1LRQD3P+6YaOLMqsMEUNR4uQZSHEVTb71dAG/BxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382408; c=relaxed/simple;
	bh=FPAb7eFztQAdAiJh/8k58TDgQsL4LvZ8AVOE+11y1Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJca2YwzC9YEiM2oVbdNIdi/J6HCuuEAw4x+rOzCBueF0fkWs/D4HeUC6TnQR2laAyx2d0QdY6iGnzYISTwxNaxmgLfx/s8d8dNH+NjI857edjpmETJwE+E8eMoRpisOuLFC2Vrc5POqYasb1B6jRYKB7qpjrp9AmrXeFbh1v4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso12795593a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 06:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382405; x=1777987205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKTOlmD1/yBlktMHm6WBqCZN7HgZX4UxFY9kLSyUAjY=;
        b=Drey/sFMMkBbv2CTPEeKVnRovEZg11Z93ZF75+7DfgxwJkqMzVQqv0Jw/XbOZoe7sA
         7k6C2+J6iWbNkDhLfQw1XLo7DwqvaUbnI21C0lMFiLCX8DTbotR7uQOf5EOKGPNfEX1i
         PTKKjA4GiTITfAoBIw3j1SmSVrdis6sHPn5oZoqX1UAT0BP5E3gdSShfzQouCXWns/af
         iBnj5OZces7II1LVIaiROnIPy44NEVWL7BbCzWc+1mzus/bFvyzHI2XvYjwpvqzsKKQi
         NAxV9DLmL2S2P+u9Pz2fwWstQa7wQ77HGzqiV+bRTnSkIIvO+xULzwvVz6gba0373S2d
         UCxw==
X-Forwarded-Encrypted: i=1; AFNElJ+qiJ40Rg6ccJDPF4RNK53WujGzDuE2wjhN2YsjkcxXwBGr98yP+zwzvqW/6iotiJL7pmqwS2Yc1POhHbSZKqL/zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyevTbHGNzDsX4xyPHtGYKjt3RGrSdUPCDXZJM2g89wXocox+QK
	dFIieeUSLhJtpXCDQoW+RgA6oy6H9wBnBKWy1Gd6+nWC/Ks3Oy/SWTMwGYBUwBjw7gg=
X-Gm-Gg: AeBDiesq1lcvjunpz2/C+2Pb8yLKGyGOBZooXcDektI5h/oLig89IfeFHl47jGcOGvJ
	rUijyeVg2OwUBtNzty54uotCdN+B20iUG/roX7IPhNZyeA+YkSaDuzbocGPv5Tvi4sZ9R4+Yr2P
	ktie1gmrhbXHCp+AZkNng6ymzxcgDltzq9QYuhbq/MJ3xuJP4qkoJYhI/zpLkxKBHZORYN+WEZL
	R7sq/0SW8HXg57LaXBUrygs7v4EXms2xJLIXn/mf2VWt64/0XwYCu8xDuumKPz7SZ7dRZPjuqbl
	NVgIlpknZmIHDGq8DFs+GZA43x6PnvZCybvZhb1f7pgBM0dcFkgBLmljgtei/iboAnk/li1WrVo
	gAIGXZSge3XYLPA5LGqd3wG1mR3R93E/ERvmYhsahKkT8g9nsYn2ZlqLv5UvuRm7bpfKsxs6+my
	8RlQuT4S6i4m9r2KDrNETIdwKchuCs5qgU8V9ZuHEovR3b2/GRYv2kCtoCkDgzahrvPH2ZDwY=
X-Received: by 2002:a05:6402:a0dc:b0:676:989f:ec4b with SMTP id 4fb4d7f45d1cf-679bb04c0cfmr1243478a12.5.1777382405224;
        Tue, 28 Apr 2026 06:20:05 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b67638ccsm829477a12.0.2026.04.28.06.20.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:20:02 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so12302144a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 06:20:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Ss0gdDXefctFGGgz4nFX0HjLiPbcTwVex2t5T+uxtAjbEKU/2M1twv5vAGnfED+eF28x20SGURRkwO+iSr+A90Q==@vger.kernel.org
X-Received: by 2002:a05:6402:46d5:b0:679:3604:7152 with SMTP id
 4fb4d7f45d1cf-679bb0614bcmr1319707a12.11.1777382401908; Tue, 28 Apr 2026
 06:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 15:19:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXQNfg9fh9BEr+KYkVjFg7T9hTXEUk6ki7xxZEzDYKBQ@mail.gmail.com>
X-Gm-Features: AVHnY4JZdWFymL3Kj462clduhRgIeDNaRCdbfE_Fk-jr51VVXMeTXi-HgJjqU08
Message-ID: <CAMuHMdUXQNfg9fh9BEr+KYkVjFg7T9hTXEUk6ki7xxZEzDYKBQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: EBC85486245
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31705-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hi Biju,

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for configuring the ETH_MODE register on the RZ/G3L SoC to
> enable output-enable control for specific pins. On this SoC, certain
> pins such as P{B,E}1_ISO need to support switching between input and
> output modes depending on the PHY interface mode (e.g., RMII vs RGMII).
> This functionality maps to the 'output-enable' property in the device
> tree and requires explicit control via the ETH_MODE register.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1198,6 +1198,23 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
>         return 0;
>  }
>
> +static int rzg3l_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
> +{
> +       u64 *pin_data = pctrl->desc.pins[_pin].drv_data;
> +       u8 port, pin;
> +
> +       if (*pin_data & RZG2L_SINGLE_PIN)
> +               return -EINVAL;
> +
> +       pin = RZG2L_PIN_ID_TO_PIN(_pin);
> +       if (pin != pctrl->data->hwcfg->oen_max_pin)
> +               return -EINVAL;
> +
> +       port = RZG2L_PIN_ID_TO_PORT(_pin);
> +
> +       return (port == pctrl->data->hwcfg->oen_max_port) ? 1 : 0;

IMHO these oen_max_* comparisons are very obscure. For the casual
reader, it is far from obvious there are only two valid combinations.

Why not use the same logic as on RZ/G2L?

        /*
         * We can determine which Ethernet interface we're dealing with from
         * the caps.
         */
        if (caps & PIN_CFG_IO_VMC_ETH0)
                return 0;
        if (caps & PIN_CFG_IO_VMC_ETH1)
                return 1;

        return -EINVAL;

I think you can even reuse rzg2l_pin_to_oen_bit()?

> +}
> +
>  static int rzg3s_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
>  {
>         u64 *pin_data = pctrl->desc.pins[_pin].drv_data;

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

