Return-Path: <linux-renesas-soc+bounces-32765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOLZG8IQC2pN/gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 15:14:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE25756D6AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 15:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4133309DBA2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 13:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADA6480DE8;
	Mon, 18 May 2026 13:08:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3C3480DD6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109680; cv=none; b=OTDfjJtfqDxIJNaCipddtZsN4ehUjQuXtLxEKtvOFB+XtNkFu7z4+Olxs2mNFXrgcWQQxKNYjishgKrx6+UsrvcnE3P5Es0GRtNtIpFzozop6yQBfmx8FKPS0ZxHQpJ7fJqi5LvObiZVYeRj3pnC+wZY4XRwOrPx261H1zXxF78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109680; c=relaxed/simple;
	bh=bLoHqx7iz89YsOH9/yJgX2I07MLCqfljXasqV1HWAJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JqKwMVavZ81e1psOZmkbKlUX9YEAYRjuc6Cny+OOx7vUPDuBIGIjTcfSr416FgngdCM1penq3iftXrqbR+7dmemy8+k3Z/+Uy7pOhVGIJe+11Ty07SL+/+Sy5jDZT1z7YCyYbreNOebaEItSJDF+jjg4Z9AnLKIsrSPbJVQzeK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-63133de7abcso610143137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 06:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109678; x=1779714478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8A4vYkByGT4hltTC530nDELFOVxe5LtgHJp6bYwWpg=;
        b=B5lPGm20HWdBA52flyjhvJNGHgKVoUAhMM5OU78yKfVhaXaAIi0yfznGTh71gJ43Bi
         GPhyyfC0G0MP8+q4/Ki8xJZom+gl920GpeR5jsX+9fv6U6DNqP0ZWzIZ+mTLW00Ka5x9
         VBeCUIhkRDlAbBv2kWUkX94WQ3y9Q9olCXmWMYzEipZFKuM7rsQOesdttVTit5f8Gil6
         O+7zvxHuJXhUlaDGYKWm3dY+OTYJc+yhi3PDFCD17u6HVTmwxzCiep4yxmVimpHhRwPS
         im6wTftWKk6bnPzJZLxhY9RRH9ELwoSRVvd0qdGjbgdQ3PmU+1uguUmK/0+VQM1kvc7T
         qVzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+We5FWcUVpxIttPSL5GHg2bi59KBjYsG3uPTOGwaVugFBgtZ10p7+E40btJooIm5nlDdUMaOaQ+Al+HSrW7g5Tpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBgYC6expWC3D2uf6fRxUf2IPn00najBlTr8/DtQ4q6KVnqP6H
	N6OaS0k4A2iLAO0YiwK/ma82JpaArWX8VyRpVBVB4oIqONByWTkEpdHUhLUuoppk
X-Gm-Gg: Acq92OHdFWcy7vzI5hMiB3hjniEBM2uAz6ohtdEeS9yFP8I3Kje5YKicVuObXtgPfIP
	u6sA0FNeUCa5le/Axm59uU3oHSiBJ9DRKVe5LUWjTumh4AJ2wdaJf6rZvfJqo6Dbd1ZHwOpDn9F
	X8UZfJhrJ492/ru1lPbadKoVJtaNTue3D3ia7NAROxVmj8tpxZkLytSEMW9Fp3u9i6AFAdsla83
	rrSQBB/HPXfmnElcCS0smS14Jvyx8ZGZYdhFhYA2QIFz8k7ZTcD/sU6oBOPMq7DHNVEWfg40hX0
	Ke8Bu24sWlDqHPEyjGGe0X4u8/4rL5/GNa5x9zTPE7TICzEpySdqVWrdS1hmhHqoCIMZZiub5Kt
	GrdB8YmK7Pg9fKbhXpUxDgupTsQ5ZPQkZrrHuHP4rKPfUeoCIdjKKZsxdh188FaaftO0qPYtBS+
	lx2NsCx1HZ4cDTLC1vf6a/J3TKDQHab4j4sejYuGLEty/eNGA6Ik2m1dzahZot3KTC
X-Received: by 2002:a05:6102:1610:b0:631:3377:dbc7 with SMTP id ada2fe7eead31-63a3f38e2c2mr6397913137.20.1779109677918;
        Mon, 18 May 2026 06:07:57 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63ccf18cfc4sm4574586137.2.2026.05.18.06.07.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:07:57 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5751770a178so608170e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 06:07:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ81L8u9RKDbPN64js7Cjkyzf7gcs3kL7i9HJ3CRpBnve/wV83Pf40aNYPtxts9QzkpwFkOyZZMgBFjDl9ILf6DxNg==@vger.kernel.org
X-Received: by 2002:a05:6122:da3:b0:56d:9e98:4676 with SMTP id
 71dfb90a1353d-5760c09d17bmr7729115e0c.13.1779109676420; Mon, 18 May 2026
 06:07:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514212024.1624517-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260514212024.1624517-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260514212024.1624517-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 15:07:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDAJjWGRLQb6jfvzUPAWymmTC3yE89UPyiydykHN4u6w@mail.gmail.com>
X-Gm-Features: AVHnY4IiZkti6BwVvlbvdUVkcYDNCX04P78NcYM0PkLVTLe5ljlG3OOT8x4qAls
Message-ID: <CAMuHMdXDAJjWGRLQb6jfvzUPAWymmTC3yE89UPyiydykHN4u6w@mail.gmail.com>
Subject: Re: [PATCH 1/3] mmc: renesas_sdhi: Apply bad taps quirk to RZ/G2H
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: CE25756D6AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32765-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Prabhakar,

On Thu, 14 May 2026 at 23:20, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Apply the sdhi_quirks_bad_taps2367 quirk to the RZ/G2H (R8A774E1)
> SoC.
>
> RZ/G2H is identical to the R-Car H3-N (R8A77951), which already uses
> this quirk to avoid unreliable tuning tap positions. Use the same
> quirk entry for RZ/G2H to ensure consistent SDHI tuning behaviour.
>
> Fixes: 31941342888d ("arm64: dts: renesas: r8a774e1: Add SDHI nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -224,6 +224,7 @@ static const struct renesas_sdhi_quirks sdhi_quirks_rzg2l = {
>   */
>  static const struct soc_device_attribute sdhi_quirks_match[]  = {

This array is meant for quirks, i.e. to address issues on specific
SoC variants that cannot just be identified by the compatible value.

>         { .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
> +       { .soc_id = "r8a774e1", .data = &sdhi_quirks_bad_taps2367 },

Hence I think this should be RZ/G2H should be added to
renesas_sdhi_internal_dmac_of_match[] instead, referring to
of_r8a7795_compatible.

>         { .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
>         { .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_4tap_nohs400_one_rx },
>         { .soc_id = "r8a7796", .revision = "ES1.[12]", .data = &sdhi_quirks_4tap_nohs400 },

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

