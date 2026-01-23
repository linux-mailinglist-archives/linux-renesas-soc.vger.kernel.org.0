Return-Path: <linux-renesas-soc+bounces-27357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOxDLJyHc2krxAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:37:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2743F7727D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18F24301CC6A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7C92C08C0;
	Fri, 23 Jan 2026 14:37:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AAB201113
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 14:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769179034; cv=none; b=hIZ+ZbLs0eS7+qP+HIbLe0UBx7euxMxVGEZjHw9G4qusEEfOl7XqYZfaw2iXkjyfQhtY3QTBPxkRC29N65HnDxXuOsZn3gIYDNdVOwSJeFqbUhq1nvTZ/5wHXlh/suNELamjm5cOm1k080m7o1xCa5MsEGqxD72xibSawNzXiHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769179034; c=relaxed/simple;
	bh=nCsWChx6yxZSKjZAa2GMQpNOMLhhdbKSzY6rM8oSSlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O13li4NBz+HCVOhkmd0UjuiHa7EraNYS8X1sedRxSu+gr2c+PA8fgyPzrrxCWljnLKm+DvFwSexkWZVHKvJLII4ZSccrlimEjjumbOd1wNuwNr1nMP2nXn28feU08KPdJkuz7HqPAgT07WSvNTjPd7H9ejVaMCQFIRGiqka7hFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-947fef8ebf4so2326663241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 06:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769179032; x=1769783832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeOBI8yfyx4Jru6wCPGb60ftZsgppeSY8TcHOVeV6Js=;
        b=WJ96GF9X0Q4dhhWoigIGVI8XRRtQ8jYNTrXm+ypn1609nDnLR3F5tTTokUfpY4YiKy
         aCXq+PaVaTcUQmHzhf8gj/3faFl9+9A3jL+d+wbdbwiNke8ioO8SqXpItAvHFxirT71q
         p6LCWaQcUnXAuQhZEzLQ0MUA7Dd9Co0DZjmw25+Ul5jMPChLd2k9QC0QDgdw8cXeMnlu
         cATyP/wf8dJO5ZrPyiZb1QZ2SP6on3ohlQRIvd2lWgqzeh0vec2iCo0+u3uOyBKYYEA8
         lgwGuRs7XXVWub4Y0TNPqEKcJmXQXWQ4A7h0HW/sU99LHz30mwX8ZJK5A9BWcgS5HWfl
         PQmg==
X-Forwarded-Encrypted: i=1; AJvYcCXC+F8dF/jN/3jbSHsUbBmuQI7Ky38bFTbnFW00BEHy1fUqx0UTrZGQW3j01v1GhUR0L3R8ZzeMV3uqo2muvz5XTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Clp3ijJWIhopTJDSiZEgbBIDap9mA/UoFquozMpJJltcaZFc
	lXLewu5UbwSIiHXledZ36wi9NZ+qZSMGbUmfBCrqDsJutFA/yZkI1NqtGm0K/6bc
X-Gm-Gg: AZuq6aLq1T5i++ghL2tu7Ss67wDlZN6aNAoXbH1M7jLfrr6R4i3tFYK1MFSyP8CJ9BQ
	IofE5efXm7+yfrYyHdHSWklH+anY6s0eDOewd6g1DthOAQaiKDDOHjrMacJDv2ZOcTvBoT8VS+3
	ACjehRaZUWqXtIf3OxxpQ8KJT++Z+S1f7XgX/5n7VDJWEYm4W94q3ubaZ4t9SiwJD+0ctO3sNsH
	N+Mbb1t49vvYuxb12uY77EJV7GtghaPPNvcLk9yu4hYI7/BDgnZqwOtrLfqsaAukWWMNiHL4b0N
	Eh2SnOCEDvIgziiRO6Yy5pjDAFHI9LFvoBdHt8Cq+Tn8ElpaSpzsFPOllCmRUpPyHix0xa8ttMn
	MDIF2+MgB4GJS1zSneOSqTzprRXx0xqtVdnVu3Zxq+HJ43Lltw2N3XlgLCaYe/cU/NdgQ+UBbWt
	IDp+AV8wPZVWY+r7p39zQGiY/+k9rf6N3S4Ea8a0tfWwQ/MszKpzjBGluEK0Q=
X-Received: by 2002:a67:fc11:0:b0:5f5:3739:100d with SMTP id ada2fe7eead31-5f53739122fmr1183048137.0.1769179032112;
        Fri, 23 Jan 2026 06:37:12 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9482e30148fsm533052241.6.2026.01.23.06.37.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 06:37:08 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5f524301a76so2056543137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 06:37:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVF3u39mtoyt7GXX7bydiwi7a2GiffUPzgWvCegMUSb6zPbu6H3XFY9DFXf8XP94kdd4QDio7b7cACCvEHJfhrGOQ==@vger.kernel.org
X-Received: by 2002:a05:6102:f13:b0:5f5:259b:66e1 with SMTP id
 ada2fe7eead31-5f532daa612mr2326635137.3.1769179027220; Fri, 23 Jan 2026
 06:37:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com> <20260123140031.94752-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260123140031.94752-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 15:36:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWyFMWth7x0+ZVysLeZkxNNFPQibdSJMVfqymtAE=PwbQ@mail.gmail.com>
X-Gm-Features: AZwV_QipW_DLhbWh9heQ9wnTY0UPaLJrYO-wTDJgNVv9-6b_lsLVLgBLRKHfS18
Message-ID: <CAMuHMdWyFMWth7x0+ZVysLeZkxNNFPQibdSJMVfqymtAE=PwbQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] clk: renesas: r9a09g047: Add PCIe clocks and reset
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
	TAGGED_FROM(0.00)[bounces-27357-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2743F7727D
X-Rspamd-Action: no action

Hi John,

On Fri, 23 Jan 2026 at 15:01, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add necessary clocks and reset entries for the PCIe controller
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
> v2:
>  - Fixed clock names
>  - Used assert-variant for reset

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -438,6 +438,10 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, 10,
>                                                 BUS_MSTOP(2, BIT(15))),
> +       DEF_MOD_INIT_OFF("pcie_0_aclk",         CLK_PLLDTY_ACPU_DIV2, 12, 4, 6, 4,

Please preserve sort order (by _onindex, _onbit);

> +                                               BUS_MSTOP(1, BIT(15))),
> +       DEF_MOD_INIT_OFF("pcie_0_clk_pmu",      CLK_PLLDTY_ACPU_DIV2, 12, 5, 6, 5,
> +                                               BUS_MSTOP(1, BIT(15))),
>  };
>
>  static const struct rzv2h_reset r9a09g047_resets[] __initconst = {

The rest LGTM, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

