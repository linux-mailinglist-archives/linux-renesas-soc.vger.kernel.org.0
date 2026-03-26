Return-Path: <linux-renesas-soc+bounces-30346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHlaKKk8xWn/8AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:03:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E1133678E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BC6030967C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 13:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9812FFDEA;
	Thu, 26 Mar 2026 13:50:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F75E1A01C6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533038; cv=none; b=e6/dW445k9gUkrhO7UmXePWLMIZHTH2K6SiqtlYRNAWazK87/Bk1XrEUVWstDLpeTPM3Uq8q5fK5qqz3yXtTDCs7R+9RlXeYx/JVPeaV3OOzFCwReY0D/74deENB8Zc0W25a0+oWfmvXp8E+J41EpP55F3r/vgzdU2wHaFwGNhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533038; c=relaxed/simple;
	bh=zfR0KFSHLPzL2E+STUVtGkTaWWo0Rd9uMDmN3nMDB/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mYDm5IlDuCEiKb9Cpaf6i6YzWKoBtaopKCSQNfovPqk4MKvJwB9Da5HgMU8NpW142h6J+OhDyGKbMKAHtJBvIwPlwJ5h3IhZB6f7LkMmPCnQoJR9TycevpccdpIlEVIuotsUPjOzgL7reg+t07HzTVa9U3UB6BLlm48TsbO2qHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b97a9f4b4dcso118436966b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533036; x=1775137836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZpiSciNjye0KqicJtIKQlGVq5eF91hzz2vGtpczo+k=;
        b=H2PHfZa7IumdH3re8HXRCEcUiJiIqDh5e2X+Vc3YZsVrKsLHOTPdKLsIleQ/Lv+M9B
         UduqcCUgdGuD358yrxkaYN9lE9ziUQ3ToVXzqp4cm6HG+ssd9fhb6GBFrp7uyHBkwFBK
         jrJOc/VD3m4TPD1Jfg+0Ce32f8H725WbcTdH/WoEh7Ck21LrTZRLWZFqGylHGtM94m2j
         R9SwlwAG5h+IZdbYZ+5pjJ6rNZk6MJc34VAMyH67ForUbKQBKcUziamDUHROlCH/sm96
         b7iwZuTgS+/D4+jbQxu+g7z2nLqxNjYe2aiLZ5WXVtItmIXBBB5lHCdSrNUEL9R6lgjN
         dbyw==
X-Forwarded-Encrypted: i=1; AJvYcCV7TQl8M8jsJqqWnhbhZCGoSWvzQRyjgbR90m8gAbRUVjiUz6hPnV513syD/ckxHINTu4hRQrwS+dDKIOe22RS1XA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv+mkQHHhSqgsKzKmvekFgVOeFcdMvdb+9tBlLOjZluFr9whMC
	uxnM/IooZe8xKIIOC0zd5ABthn5bEXewadck/Vsdaesft1LERPvPHCgSHTU2M1ur6TM=
X-Gm-Gg: ATEYQzx0Rz4qRivUacUuUJeNEFi+zwGX0A/7l1vS/K3NUvxV3UvkyIuLdIwBltySffv
	MCFDuyMO8b1ZndRsRWHNEBylAI3gLq6zAw6OVNcRWNy1rxFzPZ4/Rf4jFUibuwGHV2SNEEseSi+
	M/DzY8xJwwaz/9xIz0q9SS8alrVfbkKtvk6fGOE9iIN/PYtXe7BQsxnPLv+fGXNtyT0w06O9kz3
	5F8VzWjlUhLCEOmmcJEDNdlrfQ9l58a8tu9seyTTzlP+ePgevqcnbLc6D/eFlAcdOf7HaJHrM2R
	CT+HTgK3/V5oELU1t/bC5oo74HxBNolbJyzOdWa+VNDmgQZJosL9EzdwCGA0TSHsz5uN9cD9hWZ
	qAGwHK/Z3LK8U/ZmVoE3CvEo1y8CFS0vVZJcRunXLAjzOZohStWMwKgqJeMB1cKckOMFpIN0g5w
	6Gw73YsGTdZ0ayt3iFWR/+/zy1eh04efgtOo18SK4NjQEQHF4OmtyaVUgRpHCX
X-Received: by 2002:a17:906:2887:b0:b94:a1d4:ceff with SMTP id a640c23a62f3a-b9a54237a71mr369857866b.35.1774533035345;
        Thu, 26 Mar 2026 06:50:35 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20218741sm119253266b.1.2026.03.26.06.50.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:50:33 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-668d70fabc4so1888240a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:50:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVp8WDbqvP/F1chiA94aRqeK3AFwqE59ma1f60+Emc1mLWpeHdOBCPIpTG+5rtYoM1+ZwZGva24yKuy0LNzc7cmwg==@vger.kernel.org
X-Received: by 2002:a17:906:da02:b0:b98:2462:959d with SMTP id
 a640c23a62f3a-b9a54238a19mr468792266b.31.1774533033140; Thu, 26 Mar 2026
 06:50:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:50:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbdNPMxPzf1hHT5vO9CVCPsL=UMtbvEXF9gtQ869ve4Q@mail.gmail.com>
X-Gm-Features: AQROBzDNJoDmUl7Y_VlwUV8V3o47tmUPgQk5SBKE-wsihNwjTg-QGGD52bK1kjo
Message-ID: <CAMuHMdXbdNPMxPzf1hHT5vO9CVCPsL=UMtbvEXF9gtQ869ve4Q@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: clock: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30346-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,bp.renesas.com,vger.kernel.org,microchip.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email,microchip.com:email,glider.be:email]
X-Rspamd-Queue-Id: A7E1133678E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document the device tree bindings for the Renesas RZ/G3L SoC Clock Pulse
> Generator (CPG). RZ/G3L CPG is similar to RZ/G2L CPG but has 5 clocks
> compared to 1 clock on other SoCs.
>
> Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clocks, as
> listed in section 4.4.4.1 ("Block Diagram of the Clock System"), module
> clock outputs, as listed in section 4.4.2 ("Clock List r1.00") and add
> Reset definitions referring to registers CPG_RST_* in Section 4.4.3
> ("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7->v8:
>  * Fixed the R9A08G046_ADC1_ADCLK macro value 138->139.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by DTS and driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

