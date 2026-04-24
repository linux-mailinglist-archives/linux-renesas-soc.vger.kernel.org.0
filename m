Return-Path: <linux-renesas-soc+bounces-31639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP2IL8xz62kLNAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 15:44:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF6945F87A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 15:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFEF83004426
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 13:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FC73D6CC7;
	Fri, 24 Apr 2026 13:44:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3364D3563D4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038277; cv=none; b=Pvc+V0wc7fE+TqzWQrPAJDDBPLNx/UY1TLqcdWwmJCbkE2l0HUO0b9hpES7UJu3bDdNe7WD6PX6LtEuHYJu4dDsiz2L5VdEa1/rMLu3WuTyiNd4yo03t4Pi/PQ3LBbypxUhdZfhmT3AEef+gIcn65L/lhyArvh8QwvdY0ArfDrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038277; c=relaxed/simple;
	bh=1EsaHT8Lnwn6OB/XIdccrHAPqaw20A7gRtQ2nTSrx3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EkGrnBaaaQQUACeIQGB0cx1Rlv38yijQh7IjprVERj27AKfs6HCtxdLLxybpjV7Ehr2GIyJrYEO+iZ44g4YuAquMYlJdSa3DyGKrqdUuxxQTd82t/Vks5FdqAXSt+w83di4JDAdSsD57J267NE/mpfImSL+VVnR+YmcKIthQmSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-ba6838e76f2so756490266b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 06:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038274; x=1777643074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVITAiWvrW92i7MAbP6rXRmEbOpDAiwmF+Jd0SOVBOs=;
        b=SLB7x0eqNfowW3qqrzQUtJf9ZP9GWYi9gL2mNsksN8oI0dyIf+GaLR054vivsKoB4N
         YM9i4ZgRmKfpeS/KdrpRiEACfTnkIAsnr68sMehabQ6VwxiOI1B8I+TqKysIcNIyH6MW
         8geFprXdb+5Z3chaKia89/PzMWnwblFaLjhVOGNQXu1QuPbPLekK8OCu9R6MsPOa8mQN
         SBCo1wfpgY03kqT/9LgGFKFoC+GnRDpOVk+INerd2h5JFmOcHS/PkRgfcwWMTXvMcaGa
         /5GzZnOEoiSH9aV8gFdUgkJUGLcdE99PJfqGC6vOeLOU6glM0XddLYjAbDyRz0LNtr0N
         OHuw==
X-Forwarded-Encrypted: i=1; AFNElJ8bB24n7+TcXVJyQf0UuEsYsQ9Vxg7dIn8qtWIMHai0xdfGrcZ02Uy+VefV+6FrXmuRbReduE5e9KRO5eMFgRL29Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTOl2u6OQtf0DRY+gfQiC4UDS0LcZim+CqM6DFEcOukb950t3s
	5JZ0aejBTy4txv5k2VJL9U3fJlQEIc7njLwG9Rd+wbc1xw+zA2qEBKN9b5470Ep7nYhbbw==
X-Gm-Gg: AeBDiesbLiXZr1LzfjEDVOTTK+N92Sr3AFwcFtWWsngX9eplwPpIhsmQaxL3Ig55zhF
	NTKGKgWoO9jIKoBlVdTIjfPyZY31rF9+qHnKuGSDIarIEIsdMyoweGP556KXBqyaYRbYOuMLFj2
	A4pcmvXCFCYznz4uB4ZSapny3HaqpLh1cosTDGevXT/6w8q4TGcgb4d8JUV4lGDVsIPdzxycJIK
	r6e7gD2wDsDYaeZhnI8z/0xNWhUUfRKYWeqXIH8FkgqMrXx/zVepERk1AqG+qA6+fOQL3Ub9w9f
	dlcAUd9GT3htFmW2vE4Z7XQSqyYMNfTUQFqJtMQO7jMN/TUEa28B1wQF4AtuSmdRCReiExGixFo
	xfZgmydtuiTnXpjKIU83cFEeLub52/vJOXpHowCS3CxODzcITjrBitsCzgt5p7MPVpXdYZIp3VV
	M49czVbyNTssaiioV0kGu9tzr0dCocF0/8ilzj1yhE80TiiaBX+Dz6f4G+bd4PUYhVgedMHH4=
X-Received: by 2002:a17:907:d093:b0:ba3:cacd:b9f6 with SMTP id a640c23a62f3a-ba41907844cmr2025698166b.7.1777038274401;
        Fri, 24 Apr 2026 06:44:34 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bae2sm783364666b.36.2026.04.24.06.44.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:44:34 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ba6838e76f2so756489266b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 06:44:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9BJIRV3mf0mQ50+gf1D96p+LbNBhoKfc3TrfGuxBE/JWOS0sNPvI+Nbm3wTQhX+8N5E1pnG1/LBNwTeZtVnXSgxg==@vger.kernel.org
X-Received: by 2002:a17:907:9308:b0:ba7:34cb:388b with SMTP id
 a640c23a62f3a-ba734cb3cd2mr1213880966b.42.1777038273933; Fri, 24 Apr 2026
 06:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org> <20260422233744.149872-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:44:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoiAagA16Cg08vTzOzC2Lx_PAZd0K7rggEsxBgZ0NMdw@mail.gmail.com>
X-Gm-Features: AQROBzBA7dqZ2ppfvOSrUp0QRX1PbdziYnEq3L5TnWuwS1i-ktuGiob_NjXbKkQ
Message-ID: <CAMuHMdUoiAagA16Cg08vTzOzC2Lx_PAZd0K7rggEsxBgZ0NMdw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: renesas,cpg-clocks: Document
 ZT/ZTR trace clock on R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: BAF6945F87A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,oss.qualcomm.com,kernel.org,glider.be,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31639-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,linux-m68k.org:email,mailbox.org:email]

On Thu, 23 Apr 2026 at 01:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document ZT trace bus and ZTR trace clock on the R-Mobile A1.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated. While this does change the ABI, it does so
> by extending the existing clock-output-names, therefore if an
> old software is used with new DT, the coresight tracing parts
> will likely fail to probe, otherwise if new software is used
> with an old DT, there is no impact.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue for v7.2 in a branch shared by clock and DTS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

