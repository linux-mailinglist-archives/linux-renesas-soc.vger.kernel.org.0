Return-Path: <linux-renesas-soc+bounces-29915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAeDN64XvGlEsQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 16:35:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F762CDC97
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 16:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D74B830087F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 15:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF133E5ECA;
	Thu, 19 Mar 2026 15:35:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1843DCDAE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934508; cv=none; b=ryf+yDvaNnRILnJCngQFP4nbcGdnCPnPwbMEr1mgmGYNIGmQ5gVap3SxB8y3YGP/3LlUVF8tlu0UwphtK8CqC/MLh4/11MV7cxXalRnaB6lnR0tH7B4jnmvREV6pvn57x3mrnP45sNMYZ7Kncv0epj1/BvrF4i7zPC0f57u4Gn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934508; c=relaxed/simple;
	bh=eylfJ4M1fnU1Ael0qpcvdqzFDOjb2umsOCkO5NW/HWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exbMVjRTz1M/erQN+yX2OVRu4UOX/g79CrRv5OZq7nYogpnLQvyoO8wl5Ag/QoUiFYGMJ+Dl3Qk1zWTOOpBgvSJ86KrLHPyTRB1T04cRVNOE677g3vFFJBr+5/urC6/neh6YY21KIcPGZkYsrqVjuxwZzFgo+AqgvaFsE6B2S6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso260552e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 08:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773934506; x=1774539306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sna4D+aikgWBC0KTBMb+CkCNEcX0vzdhAjvZ6i6CqOw=;
        b=q3COMLnUou0J0ulVwFufxKe2xEG/vuF7g3JMUmiYQZRLlXdt1yeWyYvni2ZeCvd6rv
         OwRFwZcaq7m+JiArYZk9EzUmFRdhMbcRqukgFFzVh6U4eqr9T02WGJKXKi79VgUG7uWB
         c2bSwz/+1odjhO/wXuAekhSJ45UQpGQB07m7YySA6W+lgpr/VXw5gKiQ/rTtnLEWCrhH
         ZVL2BAl3d3QPD0CK7O7h+T+szsXcHeFKtgRt+O2dij4XGElTXf8ozxG69Aa9cjBS6AWx
         82SAkVTN43rtXvUr8+9DZM/SibW8n4INNVtz7HznqFj2gwwqGvOUc3Qy1ZZqBpsRuVhR
         sjRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzU0SA4XTr6OFe/ulPGmEYwmXvP9fhq5viJiy62qSLKVMhXJuOq8RsAUUEbiti3UMc0UqV8zk4v4yiKnlYw5yBUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEh/1SRM2qId0sesV4jQkj6KTOCZvIvIza8dyGYJdp8LWSt7UF
	idFAHVwZ1Wulw9b4gQnde+sbDCu/FIaCdpAfTthHmV+H6nPPH1Avrp4jOxM4y0+b
X-Gm-Gg: ATEYQzyKJ/cGRsUahsjgqW35OY66ACKhiSpr7khqLitBYTHZFiotzcM0YxqHRoldwaa
	m9tSOJTALr6Irp/c3fqc13bc6KurSOBLS7VI2waHQ+KkKf2Y2MqilsuBIn4/zrOVEj7OqSxMYO4
	9mATQVPG5bDC/tNm+BKFeOF7dvrV14dXHx43GuYgVIPU3oKbYg3CWLhkTcTYiFsKZSPOvpgjz8D
	G159Uweu0VHxU59qzlJpbvyViCkBgwVeSFIaqabQZ8kOtIdZyLlZ9+uXBKbB5C48Qy5FHaBleAx
	kJsL5n6+ZwJNPsfcwtqRDjaSetDPHkg62OfUrt7PmypCk/GlQ9KsJfySzpGbZilgTmn1sOxmJGW
	s33wUFX10JEbEGkPYGoYKWnd3uAtA05MyAF8wSSY3VMWzmZVRv4VRO1Az1uo0Aj/L2RxNt5CHb5
	6PXom5cR9nZGiI2bW+IT4gTkBK7kjoNh8TkeIOUP2pIIie1GY3Dtt0QAOzeopv2TJAfcKod+o=
X-Received: by 2002:a05:6102:548f:b0:5fe:f4b9:fe2a with SMTP id ada2fe7eead31-6027d13c97amr3428369137.16.1773934506434;
        Thu, 19 Mar 2026 08:35:06 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9510328ff0csm2986497241.5.2026.03.19.08.35.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 08:35:06 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ffc6a96602so181480137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 08:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzw4HftveOYPeOtEWaCvuXen3OKC4GKIWzfaRBZQm0F+rbWpudA/f+eL1uYHOj/GJIUILHXgPhixJEhYlG2/VulQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3f11:b0:5ff:a16b:93f8 with SMTP id
 ada2fe7eead31-6027d0a9552mr3310306137.6.1773934505746; Thu, 19 Mar 2026
 08:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319125143.230377-1-biju.das.jz@bp.renesas.com> <20260319125143.230377-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260319125143.230377-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Mar 2026 16:34:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXGpMrWY1tbajxVmTns1-cBOujpRZkXJLn9L4aCB029ww@mail.gmail.com>
X-Gm-Features: AaiRm50fZzyHCZW5h8M-E1YgMkKFxFNFCA-0vlbyly6nYVtV03im4Mdg7Zg4Ptw
Message-ID: <CAMuHMdXGpMrWY1tbajxVmTns1-cBOujpRZkXJLn9L4aCB029ww@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] clk: renesas: rzg2l-cpg: Re-enable critical
 module clocks during resume
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-29915-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	NEURAL_SPAM(0.00)[0.136];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 83F762CDC97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Thu, 19 Mar 2026 at 13:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> After a suspend/resume cycle, critical module clocks (CLK_IS_CRITICAL) may
> be left disabled as there is no owning driver to restore them, unlike
> regular clocks. Add rzg2l_mod_enable_crit_clock_init_mstop() which walks
> all module clocks on resume, re-enables any critical clock found disabled,
> and then restores its MSTOP state via the existing helper. This replaces
> the direct call to rzg2l_mod_clock_init_mstop() in rzg2l_cpg_resume(),
> preserving the correct clock-before-MSTOP restore ordering.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5->v6:
>  * Updated commit description
>  * Dropped the list implementation.
>  * Replaced  rzg2l_mod_clock_init_mstop->rzg2l_mod_enable_crit_clock_init_mstop()
>    for enabling critical clks and restoring mstop state during resume.

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1600,6 +1600,23 @@ static void rzg2l_mod_clock_init_mstop_helper(struct rzg2l_cpg_priv *priv,
>         }
>  }
>
> +static void rzg2l_mod_enable_crit_clock_init_mstop(struct rzg2l_cpg_priv *priv)
> +{
> +       struct mod_clock *clk;
> +       struct clk_hw *hw;
> +
> +       for_each_mod_clock(clk, hw, priv) {
> +               if (!clk->mstop)
> +                       continue;

RZ/V2M has critical clocks, but no mstop, so I think this check should
be moved below the call to rzg2l_mod_clock_endisable()...

> +
> +               if ((clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL) &&
> +                   (!rzg2l_mod_clock_is_enabled(&clk->hw)))
> +                       rzg2l_mod_clock_endisable(&clk->hw, true);
> +

... i.e.

    if (clk->mstop)

> +               rzg2l_mod_clock_init_mstop_helper(priv, clk);
> +       }
> +}
> +
>  static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
>  {
>         struct mod_clock *clk;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

