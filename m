Return-Path: <linux-renesas-soc+bounces-28705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJwdIrDipmlAYgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:31:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 096BB1F047D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CB7A30AB608
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 13:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4672235F16F;
	Tue,  3 Mar 2026 13:25:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A28834C9A3
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544305; cv=none; b=H0lccjEWE/IFn9tFxZh6V98sQ1qe0d4UU5Zy5JvmaxQc6z8n7bDsmDmRJqz3G+D6MDV2NHwMr5HA6YYaa8CFOcufY9EF1pqUxz/pwYjRlU8PkMJrq/LdSRX/o7E++hmEWgyh5tpcINY3jsGbfQGk67FcSQFydpn8RzpO0y7Ky18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544305; c=relaxed/simple;
	bh=n2OmAIMl/gywcCrUj4d8zXzLma6xKUNcSmZ27Kjdqpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAnPbx656KKHc43eqyI/u+IsnyYmXO/zCYRRz8UtJn9Z+rK4qi3PKqG/jHcdRtTxZxAr8CSmg1KVvyXJbjIe1dz6enX0YtLy0fpFHUmosqBgzODyiuXoOcys5mzYRghqKANU3TIFnYdKI67o40RlJmIU1Oh+LjHAPMbg9LOO7eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-45f18e8f2f5so3760037b6e.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544303; x=1773149103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muQepyaITr1dI13pFJp+536u1zM3z0pO9iYDkPNsg4s=;
        b=qNo1KmhpX3wt9/gVi3IEaWj+St7PMJ+cC36oquLk3Rv6AQX2OuX+XCKktT2PWmjbMc
         qvLq58k42aTh23kE7haG19N2meUrKVX1GzcNj8x6UsUwZIbB8aI6jDy85O7qgjqC+gIs
         w7OpzhzcTli9RpLC5/nka+1S5FrUmvcbCA5842btO/Jg9VLvTvdMgvljvj6VnHL7k/H/
         IKl9vj9U0q40rVlZB8YToNvb6xI/J39Xno4VpQ3v9DH0TJnbpcxffnimOfBOk578f3+g
         Df4CYCRKnJFlvx4DVZI+zmQUKBWtF/Rzc2ct0WamaMfdL8J25T1BedoPvYIIhvN15QQ6
         lNtw==
X-Forwarded-Encrypted: i=1; AJvYcCVKCcC4PnoVfs1Sug2Vb1tTOQpOJzPCGzJ+cTNrAlfmfyyqnzi976ugKQlrrxnXwVh6rcM38odCZHIRUJWXe7e5gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFS9GNTUBWXlevDPf5XGwVV5weuDRe4panJOGDGbyUe0dj6NW0
	qwqbMhlJ+A/00jyszeZHx575onA85EmTTrr2uTUupPJJNaxptCuvD8HzLvNmStGm
X-Gm-Gg: ATEYQzxWajJ5m0gKiFjWruAL2YfuY/o+3AZWA5UQGyw2RcS03aswVaNDvHpnbdyz5VS
	OYyHH1tcKo5Bd4JB1soHCbsNQ0y4g9d9koEOn+0Q+4D2k+Klp/ZeMMp9Mnj4+5e/OyTid+LWB4B
	PvI2EnbToThAG6KDX9p8c14h8jUG9FusZpNwipMEAemZVN4Oml278Y1UHzNblDfnF+Qa8lfj1aI
	WFI2hezT2Y6w84gWINVgoQQWcGR9HpFMe1De98NCeYgUdjfqDF4fyDTFieB3OCE+apwtSISd5B2
	J7eyzefRkZoDDtM+djrEXN4j5eLN1c/B0t+0FlrFDGBlVx3GBWaKaYALaFka3XlK26EJSle6IUX
	4Ubi6Q9zY3pZVHGQUf15gSkAJcmz0dHPd/RXVi0mTP60b/qAVae3kScLotDh98xMY+70HMAgoBL
	W63o3lVATipae+lrBH14BStY0ZNHmYoqlXKGf41s7H9lLsVp9KSFIxDjYJTSmE
X-Received: by 2002:a05:6808:538e:b0:459:b412:ead5 with SMTP id 5614622812f47-464bed050bcmr8172456b6e.50.1772544302990;
        Tue, 03 Mar 2026 05:25:02 -0800 (PST)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d26d9absm15392382fac.16.2026.03.03.05.25.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:25:02 -0800 (PST)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-414ffb4c0a0so698274fac.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:25:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGuzWu16zrlgdjDj2vafCjptKyZkX1EKsRZn7JGUpaAgRERJdj7gKr7oq08Ypfo4+S+ORipi43aKUXHSTO3VKlYw==@vger.kernel.org
X-Received: by 2002:a05:6102:c47:b0:5f5:487c:83d2 with SMTP id
 ada2fe7eead31-5ff325d53c9mr7807558137.38.1772543823941; Tue, 03 Mar 2026
 05:17:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203124247.7320-1-fabrizio.castro.jz@renesas.com> <20260203124247.7320-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260203124247.7320-2-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:16:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXtrAwAtqNPqwq5qKHo4SKQqFoGSE7qPnFRD4rbKkPfaA@mail.gmail.com>
X-Gm-Features: AaiRm52a94My3QCqI-CCMK4Bc8JSeFzJGy0yOXJPSReec93Wzsgcz5hw25V0nt0
Message-ID: <CAMuHMdXtrAwAtqNPqwq5qKHo4SKQqFoGSE7qPnFRD4rbKkPfaA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: renesas,r9a09g057-wdt:
 Rework example
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 096BB1F047D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,baylibre.com,linux-watchdog.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28705-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.637];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,microchip.com:email,glider.be:email,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 at 13:43, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> When the bindings for the Renesas RZ/V2H(P) SoC were factored
> out IP WDT0 was selected for the example, however the HW user
> manual states that only IP WDT1 can be used by Linux.
>
> This commit is part of a series that removes WDT{0,2,3} support
> from the kernel, therefore the example from the bindings has
> lost its meaning.
>
> Update the example accordingly.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

