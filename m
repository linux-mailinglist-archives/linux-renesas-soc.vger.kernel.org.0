Return-Path: <linux-renesas-soc+bounces-29786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJZaD0q6umk4bQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:44:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4F42BD6E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70AB23116FDA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79C83D9042;
	Wed, 18 Mar 2026 14:35:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3BF26AF4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 14:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844540; cv=none; b=GkI+Ts4FqmYpu50IE7nMvDfxPf20thOxS1/CTDZ8lXT0qpuhsCXlmZr4rfPtsPP8htlNbJV4eb684wdYZl0fIcqUYi10RoRkHvwxTKE6xrY0mEXousXC+MdYeIgdfIQbF5mr/UAU1VY1tFeVKgYrlQmwa3cG89hfL29nxlLpcDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844540; c=relaxed/simple;
	bh=oguUgHwyjHxRKaSmaLBscl2CTie+JbETASTbeTu1iFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pldHibvy2nMynCuOs7ajf+4xHsUuNN89kBZCDoVHy/aJC+P8GbAwYaESWlv23dGo/+aGSGTvGsYB8R7nwRdUZdLgD/exoU96u2sJVoBf886G+dwaupwdVWJ+x+4BqSuKr9yadOqcxJRab0lILAmefeCaOQiFpmNt6NN1i+qW1k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56afbcd8adbso3124230e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 07:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844538; x=1774449338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1em1q7s6aFVpI39hYWLY9rgxMn5ODmIsTxQ+BBYDwI=;
        b=ZyXAwlgW+DUqR3ASLNHh7updRFfmctPtfFkEm0wACpG223kuRsVEDDJ+d/Y3ZxVYrV
         QEHfI5Tn9oqigNBvdgCkfnTGU9yn9x8JHMw6HAGDxaLux1k9/3/3pNX84wW/DdOwdOta
         jFPx2I0jqgfIZIfDZZIKB44Qown+sV0BbHiod2Zv4ZgJe7YmGm18oI+SbUWvo2dTzW4Q
         K7M7wZL4UnRpaAGXvbfdowFiDaC7LAcKlCZ2P4yXf3RlYTy/og9b2YzoBXBZcJjh5jcB
         MJY6rcggswiMdN2A9lN+TcFuDArx9gmjZqusrUS56QRsl0QciCKlgpehNjl4R5Pwf6UP
         PNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnUo0Pm7GGHPO8g3aAtUzC6Xq6BVXwvt+90tbqe6r44/v/Z5OL2sntzsODN4MFALsAE4mYyh2/IG8xLoOQhiJmOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxEtaaDSaEiQiyr7PSq6e4NWImnvvTuBaJFVmD3l8Idc7Zyfo5
	euNFYmCR5DREJuuJ5VgiyohczmMfPqs1ZKsqls12bP85xZcH1gDr2cq2gZddEbhqEZM=
X-Gm-Gg: ATEYQzw+ITK9nLl6VSHrptEBnvKZ3ZTI2PVzjQBWGw66P0Qb5/Iqiezs0vpStBcpoMD
	8gr1jmKsQMuWT7CAkv0sMRIydtj47av4HJZBTpHIQXH8cfuAOUgy2ENL6G4LmKqwFUf6M4KBVc5
	YdS3pl7GcySbgzKkViE6xJlb9gsP8TdRtVgxA4l+P+r00nilu0n+Z6aFpNfN1pl7AnoaHhlFVp0
	IIkWtNPcXdlVW2S9LO5Atcz/GbpSd1i+BCGhiaqBFfH43H/3bZOm8AT+RrzGy8RXAkZPTdaMBti
	F2xUWgGspotCFtMIbrpd4GX+AhTPH1XoE9dkMoJBxUTACj63cPq+N0dXnsfrydlc2e6/dnmn4+E
	KLZcZ/sIukXfAUm7lnkpC9Dq4ixKAbbaX81Uj22j/pGFBfgkoLaz0sM0dFxS/M0Lxka8BzpdM4r
	HlUNxefxiJeKbUCSCn9XklBNBVDoazRAHoFMbFN3Jc8J9PosE7FnWhR+AvP+m0OCSH
X-Received: by 2002:a05:6102:2aca:b0:5ff:f446:c010 with SMTP id ada2fe7eead31-6027d0a94b0mr1601322137.7.1773844538416;
        Wed, 18 Mar 2026 07:35:38 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951032d062esm1365606241.7.2026.03.18.07.35.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:35:37 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56cc6fe8815so266589e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 07:35:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVo5pvMjfGTcxMbHUZdCb5qdyCf5eGrVQbz+7zSNWQ1BRnLh2yWw7yAif9kBGgOOfaHgBVYm9HIPqdjIfn7y8UBIw==@vger.kernel.org
X-Received: by 2002:a05:6102:32c1:b0:5ff:c831:b97f with SMTP id
 ada2fe7eead31-6027d0a94c6mr1479588137.1.1773844537627; Wed, 18 Mar 2026
 07:35:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260312111521.115392-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260312111521.115392-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 15:35:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxhiWXLapcHAUL6nA=-+6YLme8v8CruMESng3ZO4f2OQ@mail.gmail.com>
X-Gm-Features: AaiRm52MgP6LI1mgHHWHF3R-1Rw2VakqXMBCl1TWbozu2vUbn0Op_voGtlrMZic
Message-ID: <CAMuHMdVxhiWXLapcHAUL6nA=-+6YLme8v8CruMESng3ZO4f2OQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g057: Add PCIe clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29786-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.097];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: AB4F42BD6E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Thu, 12 Mar 2026 at 12:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clocks and reset entries for the PCIe controller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> @@ -508,6 +508,10 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(8, BIT(6))),
>         DEF_MOD("gbeth_1_aclk_i",               CLK_PLLDTY_DIV8, 12, 3, 6, 3,
>                                                 BUS_MSTOP(8, BIT(6))),
> +       DEF_MOD("pcie_0_aclk",                  CLK_PLLDTY_ACPU_DIV2, 12, 4, 6, 4,
> +                                               BUS_MSTOP(1, BIT(13) | BIT(15))),
> +       DEF_MOD("pcie_0_clk_pmu",               CLK_PLLDTY_ACPU_DIV2, 12, 5, 6, 5,
> +                                               BUS_MSTOP(1, BIT(13) | BIT(15))),

So the PCIE0 and PCIE1 modules are always stopped/started together, oh well...

>         DEF_MOD("cru_0_aclk",                   CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
>                                                 BUS_MSTOP(9, BIT(4))),
>         DEF_MOD_NO_PM("cru_0_vclk",             CLK_PLLVDO_CRU0, 13, 3, 6, 19,

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

