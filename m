Return-Path: <linux-renesas-soc+bounces-32767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMiPKp4RC2pN/gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 15:18:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE9456D7B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 15:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC5ED30B3A70
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 13:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CA9481223;
	Mon, 18 May 2026 13:10:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E361480969
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 13:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109817; cv=none; b=F9WyZTFybWQiGMxXw0a3uXzu5Rq2S076FTQpcR6L0X2F2BN5fWvIgUWBuTY/wWCbi/IIudnGfCwtQo3hXKf5xSTpCijMBta5LOmz81NkaSRq9vahbJsYMQFRIclU0k+aSqrNx9jbla82EyV3x2YlVOro/73rg/+0YU6Qln1iyc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109817; c=relaxed/simple;
	bh=G7+udxGdMzW311PV93iVyWCQ/w9rFtkOUgJWnF/y29o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkYBByMy343Of7IIzI6B8Ja2qygSvgyHiL2f5vs7H2jJaAUVLvTMtVlxfhf9gfssVjwz99lwnz+3UTJ9loR1zAqSAQGF8vjXUaJA5408X/VmNKbUdJkQAkAxo0seZS21Whv2FEE2RfeJGPx3sUYJYjyGScddQrwsaHGXo2v0MNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-95cd9a5f24cso424022241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 06:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109815; x=1779714615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHrpzbVHUORDOZVtpFM2vQlzLjhthGfdMakUGRCP+CQ=;
        b=DuHH+LLRjz55UlDqRPMHtWHiQEM5qGz5evx69uQ+SdiUOF7Yvpxxwagu5ZsLuL/EZF
         qNuOLM1eEYGW1JEG+WKeAwfiSvrIWJknUgDhSYhgRF4ipxQcKQUhFiUj4qxdSCjK5JBU
         BHaGoyxRKqiJAf6BawnSixbYnPlp410LEQvhBwr4ZNIiIN9eg97MhsZ1NtmAMqBWQHTM
         Oy3Rago4Hn9W7FQ3oBaYVFGN7HmWK6feSIsanZTArXSLnWxAdh+sXIstwBMMtLEJV6wM
         2tijmaGVKOBnJrjpnfU206h+XVmaDSVCOlyMU7NhEdBfSb3SgJov/gi5AycLjCnakkYb
         5MDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vKjaLO35Vn+TfHdkoTLjT9xTqlQBmx9eOrF2uw2C/lyAsWTyC8ee5qkFwcWxxHge4CxDjLa7bb56sVFCpJitEmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFLEHEKc3GzCRcvBS+uGMqHW8mFEqvYt1c2prfnkMT2cV4VcoL
	4y/thdbsMJU6bkiXPSCz0nSrAKy3vBOkTtFu7WglyO3llWcrOnOOaqCMIFN3rKLD
X-Gm-Gg: Acq92OEAJzYWKhSMfeRDd++P8IFv3nUDZ4xABRWQ+uZO2zP4JSEf7ezCyMLhy8ZOK38
	KRIAL2hpoPfvDIePy4XMB+CoTwxqlT4rRe6cO4wU520L2/6dSzUlZGWRSI66SepGG3TJ7wWAvg0
	Fy7hpYFVe2160CyPQOjkKPTGvUJMvz6nIu4mQ132Gda6TzL8Fpx/HgdPFj8N+j40yacw+RfSlwc
	oVxOO1DivuCAhSBsny86tCxPW6dGE/5iZhiUjRFodQUDX37Q7D81SCsQ8G5u6IU3moGssu2nmHS
	7pboRH0F9cpSpFjeIs3bf8I44KtkTPHENppeotckRi7YXFShuXcqPe2dStxSwaBcrocCOSNznRc
	ltcePIsHkwYPx9RwqRVzi1cYepRdenqo10sgoXNbe6fz087Ks3JQl1aABQUitkYp02g+xeJO82v
	F+AfE8NGD6AhNNkPmOXG6FvRjwfse7SG2z3MmWgeCJJIBGjW5cJNeTL8mZ6aD7X+J9
X-Received: by 2002:a05:6122:3c4d:b0:575:a6f4:46b4 with SMTP id 71dfb90a1353d-5760c0b790bmr6985797e0c.9.1779109814687;
        Mon, 18 May 2026 06:10:14 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc29cda8bsm5143169241.0.2026.05.18.06.10.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:10:13 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-575602688deso701129e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 06:10:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9cGjywjbq/Pyvg5fEz4y6QJb00eenbJCY5OmZUrdek+ZHDT3qm53Yqxxp0RV/xC5zQkIXyBkwDCJw0gNnyuJgpdA==@vger.kernel.org
X-Received: by 2002:a05:6123:2e2:b0:570:f670:587d with SMTP id
 71dfb90a1353d-5760c1db187mr6653637e0c.12.1779109813267; Mon, 18 May 2026
 06:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514212024.1624517-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260514212024.1624517-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260514212024.1624517-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 15:10:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGiJ_SQag2ZdYsz-rgiUp1X7OuA=9BwzdCp2MvKt4NGQ@mail.gmail.com>
X-Gm-Features: AVHnY4L_CmKmFv6NTtb7Ex2zBx473PgByWg0FHBUS3H5Q5GXZk_wFPvmtDeeWDM
Message-ID: <CAMuHMdWGiJ_SQag2ZdYsz-rgiUp1X7OuA=9BwzdCp2MvKt4NGQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] mmc: renesas_sdhi: Add SDHI quirk for RZ/G2E
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4AE9456D7B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32767-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Action: no action

Hi Prabhakar,

On Thu, 14 May 2026 at 23:20, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/G2E (R8A774C0) is identical to R-Car E3 (R8A77990), so apply
> the same sdhi_quirks_r8a77965 quirk across all revisions, as is already
> done for R-Car E3.
>
> Fixes: ca804a5615a7 ("mmc: renesas_sdhi_internal_dmac: Whitelist r8a774c0")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -225,6 +225,7 @@ static const struct renesas_sdhi_quirks sdhi_quirks_rzg2l = {
>  static const struct soc_device_attribute sdhi_quirks_match[]  = {

This array is meant for quirks, i.e. to address issues on specific
SoC variants that cannot just be identified by the compatible value.

>         { .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
>         { .soc_id = "r8a774b1", .data = &sdhi_quirks_r8a77965 },
> +       { .soc_id = "r8a774c0", .data = &sdhi_quirks_r8a77990 },

Hence I think the RZ/G2E entry should be added to
renesas_sdhi_internal_dmac_of_match[] instead, referring to
of_r8a77990_compatible.

>         { .soc_id = "r8a774e1", .data = &sdhi_quirks_bad_taps2367 },
>         { .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
>         { .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_4tap_nohs400_one_rx },

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

