Return-Path: <linux-renesas-soc+bounces-35032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v/hIM9PJUGqL5AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 12:30:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED2B739B77
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 12:30:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CA57306ED8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCAA18CC13;
	Fri, 10 Jul 2026 10:27:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ABF3859FD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 10:27:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679222; cv=none; b=mMkeRXohKGPvQ24toKnHSddH4s7vfML4cgb5SqoVmVMGBXUAb1DkQDonYQUdV9lzol2CMlcCMVea1FUWRvq8EmAXzNkBdepxk7xE08yk5Hvc7X/5ZNxxGS38FWIkLOw7qto4k1Nm370ngF0UCYH2iQOgeuMchwifbY4vjafqvY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679222; c=relaxed/simple;
	bh=+p5C07PlzwAnFV8W7DMxCM+4XlX762Bvt4U2R/azgio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yd0DMXJY11LPxzybavcqu23Aa/lGlTQXL+9BYmVSx0S+Ud9fFShxvTEe9S9+AnJ+sSEm3PVnkawCHoD40SDx3/iVHut3D+SoiRZJfoL5VEavmHRsicjcV7fJmOsibOWmIyLF7X+C7SsXvn4ADa9Kurn9dofP5qTEvwyzyLdSw+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so354022e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 03:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783679220; x=1784284020;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bwp9IGUDjgmX3mBabgZGirsEvY8TKRimZIn+QIFNSvc=;
        b=dGsqlfeGCAYsGWgJ34SzIvknmUSXkdHLZivzlGs4LWUy3CtODY2lHC+Dn+OEy3SP9u
         /z7X0WDwx4UdCakQ4wqwZxarPn6JNhndqOkhkFCfALi34//N2PQtPWQTs/KwioUhYDJ0
         dehA/+e0miSrL+2joAvsvDmaKosY8EZ5IaZ+yqzZikYNajmIGM1SmFJCUFeiBH4GmAZI
         odfbYpLIZTnxNrWZjdgeAoidKzjy/BChJB5Y96/gFTbS6RaR5MoNrlGPyZEj7UzRk8iA
         WZocj+B2/i39JTR6QaRDC29rXXIF/7dtq8xT08NLJEc4w2YsURYRd8kHmz+6AuGXMIfo
         s1mw==
X-Forwarded-Encrypted: i=1; AHgh+Row4kCBDbzRF1f12GcbICXpe40Qtbpi8B/z6Zoyj0WSgPNflHxtLhWcxku72xdKlE1SOlqkGWmfVUXuTpN7u6xl0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsvaByWROtwTdm2L5vzEFPF3sWM+vegLPw54aHit31UvQMJP34
	3DkJh9PVVmXeLCjhgRbuoCtDbSoOdYIdf1zxaHCGU65sMlvAIiM14TDrb/2/dWqc69s=
X-Gm-Gg: AfdE7clY4sqmFHoSXsRSMl2DgDNjumq0xDnnhm2UylYNoNrgj3aVryYCB+iU0IYpre1
	VCVbiE+qzfSEgrnZYhM12XE4gQuHVRqr01CHm6HuXHazOlPLC7B3mmZL+HOdeF0adj7OWkWLkT3
	wZm7M51sD1MrftDCl7yelJe3GQ6C1GiXH7wG3CoJWBAjPoe7kNeL3hM/ll3/W4zV67SYTXVMR7c
	kohpShreRU6fIoN2Okaso75XYGW49Cwsm6Bn8c33fcM7CKRolHiLCzCov6Z//1juRhroCunhu+s
	Yxo0ajwcQPQMNxVTZxUHNMQVZPlcj8QzLEztV2Nj+x7HGD9N1YaCELg1t6zmZYaNBTKuzCHGMbv
	OceSFgtEnEQQnrCKztgqcUraWaM4gewJwQCd16Al6gXLiuubrYOsAOHepA79NtlaxbLS2tJhvSQ
	QYkgj09rMBMAqau2Dty2SIMkSZl1wJ0D1hacIJkFLEpy5W/lCvUQ==
X-Received: by 2002:a05:6122:16a0:b0:5bb:fa79:56dd with SMTP id 71dfb90a1353d-5bfa554025cmr1588596e0c.7.1783679219880;
        Fri, 10 Jul 2026 03:26:59 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f66eb74sm4824638e0c.7.2026.07.10.03.26.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:26:59 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-736eec08c43so669981137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 03:26:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrlOlV6RxwlvlmJkKYcUyuotwfd9EMW9TuwT7hj8sLDfPMDEsesw19S0oU5CAKPQk60qoUGIJtbj1D5rEgPRGWkNg==@vger.kernel.org
X-Received: by 2002:a05:6102:8516:20b0:6cc:e6b1:7f84 with SMTP id
 ada2fe7eead31-7450caa467fmr935740137.17.1783678743107; Fri, 10 Jul 2026
 03:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709182332.876408-1-claudiu.beznea+renesas@tuxon.dev> <20260709182332.876408-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260709182332.876408-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 12:18:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGKQAuLJ-Vo7=O8E=kMCYiUZ2H=Be9T3PAkjHu+PRqhQ@mail.gmail.com>
X-Gm-Features: AUfX_mx3pB3dkKwbzFAKhxG_in4zcQzaeWH0J8kav2JP2BfBiNLW4WLUquaQ4F0
Message-ID: <CAMuHMdUGKQAuLJ-Vo7=O8E=kMCYiUZ2H=Be9T3PAkjHu+PRqhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] clk: r9a08g045-cpg: Add clocks and resets for CAN-FD
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, claudiu.beznea.uj@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35032-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea+renesas@tuxon.dev,m:mkl@pengutronix.de,m:mailhol@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:biju.das.jz@bp.renesas.com,m:claudiu.beznea.uj@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-can@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,gmail.com,baylibre.com,redhat.com,bp.renesas.com,renesas.com,tuxon.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tuxon.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3ED2B739B77

Hi Claudiu,

On Thu, 9 Jul 2026 at 20:23, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Renesas RZ/G3S SoC has a CAN-FD IP. Add clocks and resets for it.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - used R9A08G045_CLK_P4 ID for P4 clock
> - still collected the tags; Biju, Geert, please let me know if you consider
>   otherwise

Thanks, will queue this one instead of v1 in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

