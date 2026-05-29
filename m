Return-Path: <linux-renesas-soc+bounces-33329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MAnLSZbGWoLvwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:23:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 094FC5FFE07
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 775F7300E17F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 09:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405353AC0FE;
	Fri, 29 May 2026 09:19:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A3032692C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046344; cv=none; b=NjB4jSd3hVUxlma0aNQmjbUh2+uApBWyVpJlC7D6QhmpkmDTHQ7ghG3LKSqJ8YXwUv46fvQVMWwaiI0gsTgph8XNEciGlsLs6Ra8qtRfN/rNNic+Xj0zs1coRxcVnque6wNp2hzZwjh+hu028Pd4g0sGTCA+5puWn085bz9gDwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046344; c=relaxed/simple;
	bh=h4zmErE+CSnSgXIlJw1Gwg48kFhxOuG8/K65OBG+DVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1xiRJ9sWXq17Oo5MxE47NIbQSt+wjElP3J8E3CptawREIaOxyeY87d742E3t5RlUdNhWXI5dI/jkdx8v7LGvpJT7Li5AN7pz5lTrQ70b/1Hajvmp+GKJlTmYnj1FPGZey5UDTKim9cRK3YXSWaBxt/z+1z4AMa3jHBPHfPuC1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5751770a178so4539584e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046342; x=1780651142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivARYXKiQKYoLDhrjcDm7S4LdFtEGi24pNmw3jsVVFE=;
        b=h2uNgFq7A/RyM2shaHzVIifek/IvjUtFQw3vCbh9gweIY/vFl7pkQ0zxp9QUtuTyUW
         M7WhK2IIupmsxvYo0ptiMaL2HwxGEzSpKNFFul4ixjhANTbw9ww2+635pOHcZBcY5B+H
         xlqFvqmbH7qb+LL2uWwCy+1cI+FBxC+Ram0WgGU19gQi79UeGOvtsMThg2PTJDdmCgbh
         04QGnPMIZ/cGs9aEmCvUqdLqogO+xqErU+aLkGW3jcgLLUlUpbzg+ykRn9gOrnrNQY8o
         9wIBYoEm/CLIllTjTglebJNynLydm1QOsXfd+3R7SffB+hOzaowsj2eJlaIIFx8C6HmD
         mUtg==
X-Forwarded-Encrypted: i=1; AFNElJ9T3FpFMO0BT3uVrHl1hmIgTifIKEj+xGpmNPu/myJxisZxkLUbaiYhSr+IHKKC5teB0gVdzPQMOS5t7HVAN8R8oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI0SA+KySfJGqB4ex15ut3cqhtDAaWh4GZs+hEoheZDsflhuAu
	aBrLzyulFnXNwgSNkj1fr+PSJ5298gIaxN7QzSXtNn40NMA/PcOSgIuJWpw/9sStvxY=
X-Gm-Gg: Acq92OFB0ghLb9Y+0jHB26JGUQCbKXug8vmiBznISplZ5Gw7D4E/RfxlkWE6pZ3yY01
	LxpKWOjWZpGuLiJm7ZjYnJzbK/j697ovhp1fq7Nb1G2w4eS+hahoYHP4sQKPw5qEFyUqayFWPJy
	NrS2+btlPaoKbRnNpma3PY4ZkiHB3w4ia3DqUps7avPsiolGq6a86Lv+oDPcxDKaRksjQZJjiG2
	JqFGkXTRTO3wv7VQYb6KhMhDCo1O3VD3MCKPWxe9lzyEX3ZGOW+XeBPOlLPySu2AOdfe7HCUAm9
	gmvcHYbwxQdbYNisp9zvDscphDOXAnMh183yFp84TudF3vfIrk4sc9qJnsQE+oI+y/PnOPnO1y0
	bf7/iMJ1RkK1nyF/JAKw7H7g6PCYbLdJMkTvAx4+CsoVMwtV0g8Ivmv+naDNQM/9p/N+muUSzpp
	aAz3rqPZeHTCjX42CQv/euauTixYCTkDbxyskJfip8IZuSaeHLfL84NjK3VB22CTz7MTQZK58=
X-Received: by 2002:a05:6122:3404:b0:56b:8023:b89e with SMTP id 71dfb90a1353d-599f5c1b7c2mr597454e0c.6.1780046342015;
        Fri, 29 May 2026 02:19:02 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d9270444sm774290e0c.10.2026.05.29.02.19.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:19:01 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6324ee4040cso5079839137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:19:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/TBeBUZ9wT6OO5FHCF5vLO14jvdlZxynWN7HNcVbcH8B6Muo+4c0NH6qm03VCZIgTpm5Z/cpTt7mWdkk6PXriRiQ==@vger.kernel.org
X-Received: by 2002:a05:6102:dc6:b0:631:b834:e05f with SMTP id
 ada2fe7eead31-6bf2a1f2866mr695136137.11.1780046340869; Fri, 29 May 2026
 02:19:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528074615.91110-1-biju.das.jz@bp.renesas.com> <20260528074615.91110-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260528074615.91110-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 11:18:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXh1Bq8a_Axxi8ciu4q5k=WpXQOsXG6SWqQxx52NANFWQ@mail.gmail.com>
X-Gm-Features: AVHnY4JTN8tpDdc2xq2LkyYReTJcWFNGCIxnxyc8UHo-zzImDplDCBbeYGr6oKU
Message-ID: <CAMuHMdXh1Bq8a_Axxi8ciu4q5k=WpXQOsXG6SWqQxx52NANFWQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: rzg3l-smarc-som: Enable versa
 clock generator
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33329-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.981];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email,linux-m68k.org:email,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 094FC5FFE07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 28 May 2026 at 09:46, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3L SMARC SoM has versa 5P35023B clock generator to generate the
> below clocks:
>   ref: Not connected
>   se1: AUDIO_MCK (11.2896 or 12.2880 MHz)
>   se2: RZ_AUDIO_CLK_B (11.2896 MHz)
>   se3: RZ_AUDIO_CLK_C (12.2880 MHz)
>   diff{1,1B}: ET{0,1}_PHY_CLK (25 MHz)
>   diff2{2,2B}: Not connected
>
> Enable versa 5P35023B clock generator on the RZ/G3L SoM DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit description with clocks arranged in clock output index
>    order.
>  * Dropped assigning clock rates of the unused outputs (ref and diff2).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

