Return-Path: <linux-renesas-soc+bounces-34124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hUe7EStwMmrszwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:00:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EE969831D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:00:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1B023248EBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 09:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CE33CE4AC;
	Wed, 17 Jun 2026 09:50:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6673BFE25
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 09:50:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689820; cv=none; b=oN0E3TrKENE37z/fLJSk8kCqNtd4aXFtd/sx1wDQe/nBeGpEHYZZYzHspXGL33jpcgh7kETTlNzFF9ESnT82YUVEjFK3SG2FQfvsaAucRpDckiYPKlvksH6CyWjHLdIYCBYr95vcNXPWPthuXYFnmkQ8PQ/naFGvtvoO9t4RdHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689820; c=relaxed/simple;
	bh=yosGDZRUqJOAqWGj+YSUg44nrce0K/K5QUaTYJIYSEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ED/zy26uwSqxoDU4BWQRJVbPYOVuHMl+DwrtAcFXAAcBOS3gSRE8/1vGO1RV0IS/TvjSp/vVIjWnghbs2d2CiGp/RnEQsPouRqgAc0l6qUo+X1Zapj4Bw2JG4N5XTTkchu5mAyfwE6QWESyt//NJP3ykv5b+PokiLRsQg4aN+dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-963b04fd87aso2250424241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 02:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689818; x=1782294618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=be9sl4KL53VG3jbIWtM67exzlHhIMuOa3JPJ5DmV4OE=;
        b=Ahz2WUF3Oyp4sZ8IAa8vZ+zp41RW3IwBWFqNYAAgf+c1Nrxh5dLC4QibVNsKzYhVrE
         IbNX0ysTuoVCEHA6ee692wFxKGoPlnwDMCj9Wl8QT9cGhcm1MOOvg1BggO9yAxiziSH9
         DIAxLcn+Be1DgE4b6F9KYCALJak6VYCqWefbRIFIF88MWLeif/zF6Vq8PmYU+mvW+D4j
         bfh0YJ/y4veXYtejn3SP2noKy4uf22dI+Ymj4D5BqvtoOL8TONaiajolCWkY7VmTK/25
         QYDhnQ8vAs9JD7MFprltreD5S2ZG56H87Y2xS+hEyFLf2wzh/zBMvLsK9wVXqjlIE2nJ
         hKdw==
X-Forwarded-Encrypted: i=1; AFNElJ8E7J/yYftUIMnKq5wpky3jUw6heoAqg4Aj4c8orkSMR45PFf0pVbXaKg/CCHalVgjk/dlFDDt8PnrT+7OHQEziKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrkzcKq0+e5N0DdGcD/uGEE6W3BpMKkDK192ueYXmNgv2wr7Hc
	9Lz9lUbZh6NBWCwjGOLJnfT0PSOD5PmMYO1W1/ixbhbm74E5dYxNE9QYGxTsi9PU
X-Gm-Gg: Acq92OFPJCiXJNTzXrsHxrAeYWGbIkPd2eUeEwODN+3kegxmkE5TENnjfStbZcRvyWa
	gtG0mP9Xt/4U2srBPCj2SXzHLA72CJJrGGBCKwcPx7y7pAeC0gEhh+Xy5VP8MB+VFNHeVW8Wvdv
	RM0bVkW8Eg/vcBM4V4Cjl3r0/Gaaj/i1/k6dJJAVbWR34AB0RDPL7qPW4eHuO8y+xT7YcXXIs+i
	XroC8nrBDHifU++YUwW9zhWl28eQWCtYwkefkyFilXi6s6ReHGzx+YcrYWbAt/WMvdYKffrKU6F
	9BNACXYjRDGOiUsIuqyvo+c3rQjM1l45/YDXPQ9q0YwGDNRdw5O2ePQUkJl2MlkyJ5z5dV4m925
	94PaXfH2Hl9DwY58QhnUm3wzDlddn0WLpqKx6Zg49/Ix4QaTVhYEFj6calziIf50Gk2hkP76Sz/
	k5xhyAvrc8cX/qND1dazBS5JVMlYVV2tvXqD0UjtCcEfnu25Q2Zg==
X-Received: by 2002:a05:6102:4bcd:b0:722:a46b:2f2c with SMTP id ada2fe7eead31-7246c9abeaemr1464702137.15.1781689818410;
        Wed, 17 Jun 2026 02:50:18 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966a03a31c7sm7141135241.4.2026.06.17.02.50.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:50:17 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-963b04fd87aso2250414241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 02:50:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9w//Ghid98uEVB1l0efwNu2CqTl+TkM/as+rTz5/BND2AOzN9xhXEZ/6fFJsc2ntdmO/nSgxm2jg+yUNsVUMhPOA==@vger.kernel.org
X-Received: by 2002:a05:6102:80a3:b0:6cf:37fe:2cb with SMTP id
 ada2fe7eead31-7246d750087mr1351245137.27.1781689816544; Wed, 17 Jun 2026
 02:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615104845.4122868-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615104845.4122868-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 11:50:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2GXxHD6-cqj+8dbjjdSRmhB+DmEU3fU6evvMzQ1icXg@mail.gmail.com>
X-Gm-Features: AVVi8CcJp3e9kR75NVaDatbeWYVbp9xfJzSab3kpmDUcfOpvbSLyDp0yecrMJ4k
Message-ID: <CAMuHMdX2GXxHD6-cqj+8dbjjdSRmhB+DmEU3fU6evvMzQ1icXg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] clk: renesas: cpg-mssr: Implement dedicated MSTP
 delay logic for RZ/T2H LCDC and RTC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34124-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:email,vger.kernel.org:from_smtp,renesas.com:email,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92EE969831D

On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce a dedicated clock delay mechanism, cpg_rzt2h_mstp_delay(), to
> satisfy the module-stop (MSTP) state release requirements specified in
> the RZ/T2H hardware manual.
>
> Per the hardware manual, while a standard 10 us delay (satisfying 7 dummy
> reads) is sufficient for most IP blocks, the LCDC requires 100 dummy reads
> (142 us) and the RTC requires 300 dummy reads (428 us) to stabilize after
> being released from a module-stop state.
>
> Implement a conditional bitmask filter helper that switches wait
> intervals based on the packaged module clock index. In
> cpg_mstp_clock_endisable(), the clock index and individual target bits are
> known, allowing an exact match. In the resume path cpg_mssr_resume_noirq(),
> where individual bits are not tracked, pass a fallback register index base
> (`reg * 32`) with bit verification masked out to match on the peripheral's
> register group block instead.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

