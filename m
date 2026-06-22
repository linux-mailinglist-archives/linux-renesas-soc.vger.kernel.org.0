Return-Path: <linux-renesas-soc+bounces-34312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /u/0Ld9FOWrYpgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 16:25:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBD46B04BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 16:25:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10FD63020644
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 14:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A2C3B14D0;
	Mon, 22 Jun 2026 14:23:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2572E7F20
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 14:23:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138209; cv=none; b=Me6mkTvKZH4t7bH2zr+vxk/mHzA+ErYjLMNd9JTEpywVw3Lh7abE63RsFcCvLb5pa8BTrjwqYiGyLJouR140EbFkZ4yhctE6khJYWLLsJIKNiYcHqQ/KQJVNJHhwXLCjpDZC92rtpZzT9pc0QoEc+YVv0qxUYL0A1qmfELczaxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138209; c=relaxed/simple;
	bh=F5GDFMTmKzRznIyQUX/zD80spn6OJc/D0Xk1TLD53Mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmCTgjWUJuKZhmKMyYoEQjcr2IpRYtrgHdi+WFus84MXdJGpbmGeXZBS8pa+jbBzmymB8si4G8loobiaHffZBt4koh1S0kB0oz6/yOuLAdpIyzoXFBqT9skBMPKQZWHMH8fk4b5nzG2SUypz7Z6ljySei6vqliVzqmkkBAm7p/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9670c11410cso1283031241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 07:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782138207; x=1782743007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjO0vpP3bcciv6+r1jFH4CXawVtxzP6zfYl8Vthe3iY=;
        b=gzn0hRtgs5ivBb/ZQ41u2MnriV4e4LNQlieWUZ9yffgBXxfNq5munoukrYX6SM9/9c
         ZJhZ2agDzTiYEn9hij7HjU3w2V2iN4+SpZPYqYjUnph4LpHrsvQzhDJSyv9M3Cfw1SNo
         a++m6wknDFKTJx6kg3hq518LEJFNiamRaoIdLylFPAR5ByPdQJpSVXhC9wA6XeKc1Ig4
         biEdzR1WMVlgyEKI4RNEu8SwdPXQzAzOx1N8nou0NF4LTRJUOSk1e2X7iPAy7Y6+ZreF
         DdIGspEOOB2F7bh2D4zrOVMY7JYoGCH2VGpioLmHNfJj2XStPRTcroGoUDSvaTeFBZOH
         qA+A==
X-Forwarded-Encrypted: i=1; AFNElJ84H70Awj4eiDQQbPSgSS0F8OtzNhGzOK71BuW/S+6OCg+Q/0A3ZwpiyclesJHgEYTuzhZ8/XzDU4ehx1bJo3hcBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQWBMv8hkeiKzkQpKXr5u8JJUsn3TT5QzcmuvRLl2vL+MGsso+
	2ieChsf+zlVX7aSWSsLuZN4NBxZ6G15E5YDTtViqTZrlup8yf/fcSyINNYRgKhYDCvM=
X-Gm-Gg: AfdE7ckC9NvGS8IzFbwk7gJcOHf2BixNW1r5HuwW5EBnfcT2QnySK4EZalG5hL94NYf
	gr9CdV8hojgR+1S1Kos/S1Xhiis/KaCNYvHmzC5LVVW7yXi0+Qn9b5x/w5AcQGF47wkv96UwG5T
	rTR3fzbHYWTTtg/8yKmo69HeI8ERlU1+avXT5h5B2XupNwfVxdG5a/9OqFcXL/WZ6i8fmyqwkvN
	Fd7J+jDx1Z6497OCNLv5lPJOAyYK6W3MThju+Tgzt7PG3TMepoH89c2D79eL1BW/uhkHLm4ENab
	NVMTzwYEFLcXQn5BWQbX82oOPUSidRhl7c7dOdWjaz8mm9aKbTYlV0yM+Np66lu+s7xBRELIsmg
	VVVvCKqk0yrfOdp9B0vpIrv7s1QZNWQaA/YzP4SEqAGWJNm4y7vqdQYSGFATwzjaMN/ukRDzGsG
	5cT0dvx3UAnLSNsfn5kOxHXAAw4ni8xgNCe6fTt6wVYLQKlXHMvQ==
X-Received: by 2002:a05:6102:ccb:b0:650:94b2:b209 with SMTP id ada2fe7eead31-72a1d20fd0fmr9256927137.4.1782138207096;
        Mon, 22 Jun 2026 07:23:27 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba22997ccsm6102370137.3.2026.06.22.07.23.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 07:23:26 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-966e7380109so2580124241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 07:23:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+qhXlm/b3Nol3pzrWIkUb1R3qE6l1D+aWp0fz9SWKfhoRVgdHUXcEM8bH13+sBfKqK2y9AsvhtCXmKyLn8McZ6OA==@vger.kernel.org
X-Received: by 2002:a05:6102:cd0:b0:631:7781:fe91 with SMTP id
 ada2fe7eead31-72a1d82fb9amr9896596137.9.1782138205971; Mon, 22 Jun 2026
 07:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429115054.158160-1-herve.codina@bootlin.com> <20260429115054.158160-4-herve.codina@bootlin.com>
In-Reply-To: <20260429115054.158160-4-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 16:23:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXzLB6tjgLFoxHgROUNZzyJxTc7n+w5mwuOofFjJmjgqA@mail.gmail.com>
X-Gm-Features: AVVi8CeRRavvQLT356DCXy2-7RBj9jzC5WtAT-mLur0kf5Z40ESkA2m96DB7MyM
Message-ID: <CAMuHMdXzLB6tjgLFoxHgROUNZzyJxTc7n+w5mwuOofFjJmjgqA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: r9a06g032: Add support for timers
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,kernel.org,gmail.com,vger.kernel.org,se.com,bootlin.com];
	TAGGED_FROM(0.00)[bounces-34312-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:herve.codina@bootlin.com,m:wsa+renesas@sang-engineering.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:pascal.eberhard@se.com,m:miquel.raynal@bootlin.com,m:thomas.petazzoni@bootlin.com,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DBD46B04BB

On Wed, 29 Apr 2026 at 13:51, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> In the Renesas RZ/N1 SoCs family, two timers block are available.
>
> Each block contains 8 timers composed of 6 16-bits timers and 2 32-bits
> timers.
>
> Each timer has its own interrupt line.
>
> Describe those timers blocks.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3, pending acceptance of the
DT bindings.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

