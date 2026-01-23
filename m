Return-Path: <linux-renesas-soc+bounces-27358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFBNIeiIc2krxAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:42:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C4E77341
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D05C3027DBF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E10325715;
	Fri, 23 Jan 2026 14:42:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4FE31D36D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769179342; cv=none; b=a145T402/fAxtaarmSPIBM8Kl2ewD/JZBsVF1zYSm+JEoxW9yP4W+8TpCYzZiLIIwKs1hGaLVA3M84cmTJseVLpsRNT/m8+JFS6FiJisacDRQUg5L9xlikz50lrfParTXbpvW4JiX+cOOI8yRG45eoJEvj/vGkeCNzbEXAslZW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769179342; c=relaxed/simple;
	bh=Wnzral5cDoYZxbt4300gIY+fWD5kwAwcN6sy8j1a/Yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCZ7t8II5cIsAFBEz1UxMhOy+BnDvdbT6qnLWPMv77T1Tl+BgwzCKkd3MlRZSRdU6T3SbK8yX2ZqxR+ylAzFWYaqIjywj8De1INsifxhhsjEMeEsWHZDXXIp4Nv8NbqYrlhPwEbvfCzWFk3KY1CdClIS3g8T4FbYInLzntLPbvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-560227999d2so808768e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 06:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769179340; x=1769784140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrLyFLOgIReHJ7nKkJOEOCPW8EUbvL8/pGt99hnxu78=;
        b=Vsxv1SPcsU2YiQXyhiFG1VBGQ1amhr5z/4eQW966sn4NuVMdK8Jn8afkvvVGwl04mP
         m++zRgNwwAPa4bC/sowz5NNQK1twnnmo4hjYl0YBEp36wrH3DfeiEAQ4ET/SvfFfnpVR
         3vqyl3KJ3HF4qm18yNdwMeUQ3czQdBarm8zVx75T1j/Il5yvLDDWDmzI3zF2Un5QYJCk
         B4mGSkjbJLjFOa8o0BMHFFCEgwD6zqpdMY+Qrg0fr/Fb83ip0f/inFJqyeXl/lX/AXtq
         Kvz5eQAkR04hHdbWpCB0D+OXGsLDDXM3BosDUIVucOTekIhTU6lyMZ+NA8HgyTRggp0c
         xTwA==
X-Forwarded-Encrypted: i=1; AJvYcCUx6xkgejQNm0NVGqr/dvTBlVTaTM98MNV7AA59ZQ0HuUZvhJ6x9myWsaapEKwfFV+L52a6YU+3mJXjoJFFaIZE7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjYCDbG21sW0xHyyUqZkOwO/v6IGjl3M5YvHprB6l9S4Ipg7pv
	SUpwCkC6R2HOqlvAPo2yp2kowBocZz5l4vKSUiYZFpq7g8WlrR1zg6ViUS6iWeF8gMA=
X-Gm-Gg: AZuq6aKs+KjB75JlYbt1RUdkExVDk4lDM2AwqtpncFWPDaBTVemdbSCpk7YO8TLVIG1
	5odovdybqJqzQ5cD4Nl6lew4FXzIeeWwLyOOAjr+R4faDk5Y30BKpV18IDDfFoiLMvGU5OaowyV
	c4c6dl0kA8sTBvfIvj9RCQ1Wo4/RRxP/EuyS8XFNLrl270cdEJRl/lZui8n9gSXkxb/xge1W9uf
	Nm55PAC5ARfGiepgKj0vgck0B49f1YsXPNhuJo63pv+al6LY3iHNQ+oGdWJ86P9k1ILIxZKoywA
	osfvGh9dtM4YGyD1AcVT4AOYA1bDpPK5L3GbfzA7WFbLvNjvL9ScOuG9DZKKCzaifFwGFa056oD
	f5A0CIE9XcUeYsqV1uabjy8Kz0bT1sYjQpfEJXKr08NlouexC5s6UOZkkemFhMKmDHWRU3/hj9v
	NetKPHKWf11as9+pV5j8QjVYYAPGji4LKwyaCTfZkNI5JzFoRLnnfW+cOrux8=
X-Received: by 2002:a05:6122:e46b:b0:563:73ff:19be with SMTP id 71dfb90a1353d-5663ea90696mr871094e0c.8.1769179340412;
        Fri, 23 Jan 2026 06:42:20 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fa7d527sm558004e0c.7.2026.01.23.06.42.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 06:42:19 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5f53ba9c548so655932137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 06:42:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9SYaV0EVBc7/TEn0tIJt/bFcBn0Pk/M69PcoI1xcZGj/9Odvhnnyq5M4tlrniv6yGp9/k5HFQsFqhfR8dCiFVtw==@vger.kernel.org
X-Received: by 2002:a05:6102:3ec1:b0:5df:c228:288d with SMTP id
 ada2fe7eead31-5f54badca71mr922168137.8.1769179338018; Fri, 23 Jan 2026
 06:42:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com> <20260123140031.94752-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260123140031.94752-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 15:42:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWV1zUaHTfToV-KcK+7Gtr6pG1f547-wwuFxm8rqicSeQ@mail.gmail.com>
X-Gm-Features: AZwV_QhVxxcKWK1L1APmdxo8PbYPyqK8ra6u83gDCmRGJACGU8TN-Ywh_mSZ5zc
Message-ID: <CAMuHMdWV1zUaHTfToV-KcK+7Gtr6pG1f547-wwuFxm8rqicSeQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] clk: renesas: rzv2h-cpg: Add support for
 init_{off|asserted} clocks/resets
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27358-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: E5C4E77341
X-Rspamd-Action: no action

Hi John,

On Fri, 23 Jan 2026 at 15:01, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Some peripherals may be left enabled by the bootloader but should be
> explicitly disabled by the kernel to ensure a known initial state.
> This is particularly important for PCIe which requires proper
> initialization sequencing.
>
> Add new macros DEF_MOD_INIT_OFF() and DEF_RST_INIT_ASSERTED() to declare
> module clocks that should be turned off and resets that should be
> asserted during CPG probe if found in the opposite state.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v2:
>  - Added reset-specific assert on probe
>  - Removed Rb tag from Geert due to previous point

Thanks for the update!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -1337,6 +1337,15 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
>                 spin_unlock_irqrestore(&priv->rmw_lock, flags);
>         }
>
> +       /*
> +        * Turn off clocks marked with init_off flag if they were left
> +        * enabled by the bootloader. This ensures a known initial state.
> +        */
> +       if (mod->init_off && rzv2h_mod_clock_is_enabled(&clock->hw)) {
> +               dev_dbg(dev, "Disabling clock %s (init_off)\n", mod->name);

rzv2h_mod_clock_endisable() already prints a debug message.

> +               rzv2h_mod_clock_endisable(&clock->hw, false);
> +       }
> +
>         return;
>
>  fail:
> @@ -1585,7 +1594,7 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
>         struct rzv2h_cpg_priv *priv;
>         unsigned int nclks, i;
>         struct clk **clks;
> -       int error;
> +       int error, ret;
>
>         info = of_device_get_match_data(dev);
>
> @@ -1635,6 +1644,22 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
>         for (i = 0; i < info->num_mod_clks; i++)
>                 rzv2h_cpg_register_mod_clk(&info->mod_clks[i], priv);
>
> +       /*
> +        * Assert resets marked with init_asserted flag if they were left
> +        * deasserted by the bootloader. This ensures a known initial state.
> +        */
> +       for (i = 0; i < info->num_resets; i++) {
> +               if (!info->resets[i].init_asserted)
> +                       continue;
> +
> +               /* Check if reset is currently deasserted (status == 0) */
> +               ret = rzv2h_cpg_status(&priv->rcdev, i);
> +               if (ret == 0) {
> +                       dev_dbg(dev, "Asserting reset %u (init_asserted)\n", i);

rzv2h_cpg_assert() (actually __rzv2h_cpg_assert()) already prints
a debug message.  However, it uses dev_dbg(rcdev->dev, ...), which
I believe will crash in set_dev_info() as the rcdev is not initialized
yet at this point?  I think using priv->dev instead should work.

> +                       rzv2h_cpg_assert(&priv->rcdev, i);
> +               }
> +       }
> +
>         error = of_clk_add_provider(np, rzv2h_cpg_clk_src_twocell_get, priv);
>         if (error)
>                 return error;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

