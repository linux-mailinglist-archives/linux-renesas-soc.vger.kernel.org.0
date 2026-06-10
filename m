Return-Path: <linux-renesas-soc+bounces-33822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bMBdCslaKWpHVgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 14:38:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D07D6695C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 14:38:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C346301A262
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E67407CF6;
	Wed, 10 Jun 2026 12:36:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9B31E107
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 12:36:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781094989; cv=none; b=niJzQK3awifSiawkcUx2VJPjNcaPzA9DVnXB3U6CAP3jeEdSB6FDU2pJ9EANvIvVFDh9B3lTmuKRWiCx0pXU5XfFzLCjZimd/hXaGtnkSB1WyEgZNW384mss565G/qCpu/C+GW/I8OpxH0QOnG33/qB3Dy/TBrNjCR4zFQQmoms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781094989; c=relaxed/simple;
	bh=1jaQI/yXwfNl56dzYfed7eyhyT0Bb1rMZNDi1ewH0oE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iKtHNbxOkZNkViw6fJ6Rb2oSrnUtHKIFZu5P1HcSoz7auXFvcX1MYZpsCUtcoCaJw5KTlfp+NPAQjdH09ottviIsxHt7b8sZhkbSvXOl3OMH0pGKkbilD+T4Drl04CA2mTJs8SM1YWiGAnx2h4hTwkeZqry2/bPaOuJVpFmQw+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bebbc325000so879656166b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 05:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781094986; x=1781699786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnkRL9A9yLDp0586KseS3kXnfXEIgenVBxyMiwtAEuc=;
        b=jOzf5OmMg+26Ru/WV6i98emTimLii/pH9wQr3kh22E65fWgRWs6Vqip/SuZejuyfZ/
         uYlnBNz+524YAybt60UZ107/AviOj2TWEdzwMlsP17QO5rHnc7tbQgCv0Emmatn2s8/q
         59sJdyKzuEHmyV4DvQq2RdN/qkyACKBzyVbZGRTQkRj/L3OUxlzl64XzrRxBaEXsxiNq
         Ay9uMYDOu92B8h2ffeBIqozeYnInXacx/nixzj2NZzmFpNtztdrqGvQg6WaNxQk8MWAz
         DBP4Nv7kXzMksuEXDp1JKErIpA8ulGl4f6uIhsLZ7AEkbmJVDSnerLS1Oq6jOVMCjVPa
         QqTA==
X-Forwarded-Encrypted: i=1; AFNElJ80Wr4qYk3ICgxtWqCz8Efl3poWxm9P6bGRJa34BEjGadYVOpdrH++SwM4nZw1UWIVbPDAWQAhDa74HCvrWCRjm0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YznN7waltlT3kGpTSFVIsPhAlBuslyuXp92K0qGeXc+4LS4TARp
	YU9spj2L6Odl5bcpZPDenUE2TCqCXghFlKyrSEHj8GkKcqnHIysv/AiICvOcTRPRRHA=
X-Gm-Gg: Acq92OEfwjFKDhSBxrgAdHCocn/n6tHJySeccxZ+2Y7f99RpwW5rZ3REO+LrzczpvvE
	0RnWdUX1NyfQzt/zdGFIars1GG0scu3/7GjRkFYeSPFWjI0Jvy3R4WgVp19whCYGDjrHMVizB6S
	2AnNI0VszZElzkB6qZaMwraCruxQ8W1QA7DMrt2stQqamWnD4np/98ORNOPXG81t5Nd520CkEB0
	dq/4MrK9ALtaePriJlXvxOBHoPhhQ2CK+/eyKMDWzze5ACsR+EfSTBBjgoPDthUwQmYekrLk9vc
	UD+VBNldhJeJgFmpLt1wt/vCPTaXcLV+rMwOLPnv7TSOmBmuviS9SCGye7VPJMXNiamORvhzG1a
	nNHldLT4v0EJPHDjWHUPt/F5R4r9wtA8cqAvbmdfled4N9XrHpio8Y80QyVtus4RlaSfrwl6DZS
	SYC4V+hYZuWqu1q8ds88sF9ajXa3kT+FRFVXfbQ1gzY+DqzKDlbvZYupWK047+gmSiqDZiKBw=
X-Received: by 2002:a17:907:5012:b0:bf5:2395:8d5b with SMTP id a640c23a62f3a-bf523a56354mr607712966b.47.1781094986179;
        Wed, 10 Jun 2026 05:36:26 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517721c2sm1144424366b.3.2026.06.10.05.36.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:36:24 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6913160c9ddso9147454a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 05:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ89TtQvl3XvDIv/4Y19jKF4a6cBnLwF47yc+q/zJgijzPWfEh45yzy0PzxGyKpFOtPC92Fj8ZQrkzNBOWjwF/Q1Dg==@vger.kernel.org
X-Received: by 2002:a17:907:6e9f:b0:beb:7979:47dd with SMTP id
 a640c23a62f3a-bf3738f1f81mr1412187766b.27.1781094984425; Wed, 10 Jun 2026
 05:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-rzv2h-rspi-v2-1-40c80b4a2c90@gmail.com>
In-Reply-To: <20260610-rzv2h-rspi-v2-1-40c80b4a2c90@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Jun 2026 14:36:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyj-6zNhkZR4SRm_F-JK1QKnpPkSvzK0Z+TSE58yq3BA@mail.gmail.com>
X-Gm-Features: AVVi8CfbEH3Hc3J2sCeattAV0AJLSnQxbhugQPZSnzmY28ff2IF_tFxiTy0lV70
Message-ID: <CAMuHMdUyj-6zNhkZR4SRm_F-JK1QKnpPkSvzK0Z+TSE58yq3BA@mail.gmail.com>
Subject: Re: [PATCH v2] spi: rzv2h-rspi: Fix SPDR read access width for 16-bit RX
To: Felix Gu <ustc.gu@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33822-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:fabrizio.castro.jz@renesas.com,m:broonie@kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,msgid.link:url,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D07D6695C6

On Wed, 10 Jun 2026 at 14:08, Felix Gu <ustc.gu@gmail.com> wrote:
> The RZ/V2H hardware manual (section 7.5.2.2.1) specifies that read access
> size for the SPI Data Register (SPDR) are fixed at 32 bits. The

is fixed

> RZV2H_RSPI_RX macro for the 16-bit data path used readw(), violating
> this requirement.
>
> Switch to readl() for the 16-bit RX path to conform to the hardware
> specification.
>
> Fixes: 8b61c8919dff ("spi: Add driver for the RZ/V2H(P) RSPI IP")
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
> Changes in v2:
> - Fix comments from Geert.
> - Link to v1: https://patch.msgid.link/20260605-rzv2h-rspi-v1-1-c1d5ed562249@gmail.com

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

