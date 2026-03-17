Return-Path: <linux-renesas-soc+bounces-29547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJAJNPMOuWk/ngEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:21:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 726BE2A57D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94F70301510F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A9B395242;
	Tue, 17 Mar 2026 08:20:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A318B2F7AAB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 08:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773735623; cv=none; b=gH14x/BZvYSEeFiiWEv6rxHKiJF47/NNTOXhmtXBVZyRFHBNoNueZP82vg4QM2WZiUoznjhJhxFLq3UNlJcg6gDmpyM5rwseONRmDK+qiSFO1k0yW9adbkVisCYxvcUxfFKA8VbmLAAhCD7nKklX0m8n1+YoPb+URmRVoWrvnys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773735623; c=relaxed/simple;
	bh=DAXjupgOdwZoikKs5JyJB8iXIyxbkLJF1f1ATpyhV6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/Zut/NKN7F02GP9r9If5slQ17rkmiIulaupkHGm2QgUbWsc06BLJhdhgu2szG+pp1dSoC/FF8rOSdDsfzG2LU7RH7UyFtJqU31gRPsB8UV5PYVnmfU617lvPtoJDHwRvoLNK82k2bazpC7bFSDeIvvfQgknP4nQdxOrynTcf2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56b91901d26so966470e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 01:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773735621; x=1774340421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MZrBOzWKX3a3J3HCcGoedqBZCxLLoAjByNA5cYsB/Y=;
        b=mdlyRcHgjHuw92ByvPxMxx+rGhDmvcnWz3wd/kTF3ljOduunJFraduZOWxi8ztsJp+
         TjB1p2/WbSNUFWEveX7gys+MXyt8jfPcB+hgn/u0e16gg/FElpAQePNeIAAaGb53HSyj
         DWyZSodUP1wnoYvZNc+5+oJZYR1UeSqnf3Mw/ZO27CpYDdhJ0Aj7ajdaI6n10t9ZS8kd
         Wf+mw2JqQINQdRzYw/4cxRfwJTq5esq493kVjMorvYqaGiBxjt3Dsfofn+3P+bfmDcik
         TWMwErffKBYClI7AT+UoccH1Tfm2NdFN5dMdpXf8mASQIyGXq2bUSB1K5R1qh0jqgbpC
         JBPg==
X-Forwarded-Encrypted: i=1; AJvYcCWzDsoonnh6cJ5KgS38iF71WFeWWs2Q8PRVyBDvWm7kFiB0zu/tPxHMK6r0MbBvdpUiolTNyPUdVB0CYAp8fSBnZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8gv3z4FW3glKSp9c2tEJCAxdh2suoepS8CdU/7W3erRALWmi1
	pGlDr3jF1gifPsJEZOyDmoD43JJ6+hV7aryucKa0JhYkB3P/W5g1T6UzPrLsd+1n
X-Gm-Gg: ATEYQzxjaeP6tiAKPAa/bfjzmXnBMqiYqicaheBtNCy2edhCfQxsm7HuoPs5bSlGEjQ
	tVrrkrePUSGeTCcpgGyo9qDwcF0mEc7JpSh/mFX0iy4atT0a695Z43vQ1DBBXLvIsbtJBaeE2ES
	Ewi1BRkRw1ISoQFykacCo/gA+wWswE696KJJQRbNmRwURJK+uD5f16J84q4PEXmHvsa7FoB/jRQ
	bGZy3hseNsYMG9IGjjJ5/0jSjfsFixWue7XH91m5C5+oi4qByuJAUp9n1i/Mt3d9mjvguUX//Nb
	a6w/i8TJ2QzxVngmCOVeQQOC4dLAocA1JKVD0IkFUoSqkneo28vIhWrjNSRaxmJgE6AcR02Me00
	LPWgt+Nm2vSjDFiZFD7f0tKYofL8cxo+m/xF3pUeKzVpQmY9Ao9jyV3FIGfsjjSLoFNu49xRiVg
	EIuddBTrOgiTmJlbr5w+zuaGiLKepE6pntH0JHuFhNrgpVzl47doGd1zu9oVIw
X-Received: by 2002:a05:6122:468e:b0:56a:f3f9:7e38 with SMTP id 71dfb90a1353d-56b6284c401mr7303065e0c.3.1773735620531;
        Tue, 17 Mar 2026 01:20:20 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b464a4235sm9433882e0c.16.2026.03.17.01.20.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:20:20 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ffabb1dfbaso2934516137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 01:20:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3+zIv7WU2qxEl7VQJtiRQVQ1Mp0cwvy8ygxm5+mL5KPyHDQKdg6pSVg/XMlIf/e/lzeTtQqbg3FTa5crPGnsfHA==@vger.kernel.org
X-Received: by 2002:a05:6102:442b:b0:5ff:cc82:744b with SMTP id
 ada2fe7eead31-6020e4b8061mr7168193137.19.1773735619991; Tue, 17 Mar 2026
 01:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
In-Reply-To: <20260310184030.3669330-1-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 09:20:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXMdn4Uu+bLunb0g68rmV=AT523C1=sMdNFK47ZADU09g@mail.gmail.com>
X-Gm-Features: AaiRm51yyOA7w0a8XkB8aVbP3N6VXftKc6GGkOKP6ReYYiu4pm3s3wiL1ZOxXBM
Message-ID: <CAMuHMdXMdn4Uu+bLunb0g68rmV=AT523C1=sMdNFK47ZADU09g@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] SCMI Clock rates discovery rework
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	TAGGED_FROM(0.00)[bounces-29547-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.856];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,glider.be:email,arm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 726BE2A57D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Cristian,

On Tue, 10 Mar 2026 at 19:40, Cristian Marussi <cristian.marussi@arm.com> wrote:
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).
>
> This series aim at solving this in successive steps:
>
>  - simplify and reduce to the minimum possible the rates data info exposed
>    to the SCMI driver by scmi_clock_info
>  - move away from static fixed allocation of per-clock rates arrays in
>    favour of a completely dynamic runtime allocation: just allocate what
>    is needed based on the effectively discovered
>
> This is done in patches 2-6.
>
> A further bigger optimization suggested in a past series [2] by Etienne
> would be, whenever allowed by the spec, to limit upfront the number of
> queries in order to simply retrieve min and max rate, that are indeed the
> only rates needed by the CLK SCMI driver.
>
> The approach proposed in [1] was open coding and duplicating some of the
> functionalities already provided by SCMI iterators, though.
>
> Patch 7-12 implement such optimization instead by:
>
>  - reworking core SCMI iterators to support bound enumerations
>  - use such new bound iterators to perform the minimum number of queries
>    in order to only retrieve min an max rate
>
> As a final result now the rates enumeration triggered by the CLK SCMI
> driver, while still allocating for all the existent rates, miminize the
> number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.
>
> Finally, patch 13 introduces a new clock protocol operation to be able to
> trigger anytime on demand a full enumeration and obtain the full list of
> rates when needed, not only min/max: this latter method is really only used
> currently by some dowstream SCMI Test driver of mine.
>
> Based on v7.0-rc3.
> Tested on JUNO and an emulated environment.
>
> Beside addressing a few review comments, in V2:
>
>  - patch [1/13] introduces a fix for the pre-existing rounding algorithm,
>    before relocating the algorithm logic as alreday done in V1.
>  - patch [8/13] hardens clock protocol initialization by adding some
>    missing retval checks

Thank you, this removes the need for increasing SCMI_MAX_NUM_RATES on
R-Car X5H, while decreasing memory usage.

As upstream does not support SCMI on R-Car X5H yet, I am ignoring
the hardening for now (it may be fixed by a quirk), so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

