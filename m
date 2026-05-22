Return-Path: <linux-renesas-soc+bounces-33015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DrwHfVpEGraXAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 16:36:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0E15B63DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 16:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39404307BA3E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809014014BB;
	Fri, 22 May 2026 13:43:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770033D45EA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457408; cv=none; b=lX7yG4bYQSQEC/grypUNhJ6EEsHcBjlOi7UFzw0b/MyYLydwjGfZlXcRmzxXwZsnRXW2s2zhDUCTvELCKDeRTp9Ag793QwTeMzzvr3H2FPNr98MLEa/P3o7TXtMBO77CU8GoqFnoTb6HwzL4YI+a4z/0FNBpT5NkLDkIupp6K0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457408; c=relaxed/simple;
	bh=HEs2rq79YCoAiEGVJOXZDcuuCnNnzEJW3mYI9DGQ2fM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7uMIRWKgHRIxEh6GMBnH/8D+jbGKNb+lxxDBeiskhAGSjJ2DirYfCAKiiWSLMO8sMli1yWECXKE3F/jx4hZ3UWrvsbij47QiYULjFdombrUHHsLWGzgxFAtvj7V6RL2Tc5NkpAhz2Bly+meZRbn3M8yY7tjVetKH5zMe605nC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5752b27958fso2577886e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457403; x=1780062203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWzbSNX3RGbee5XiT1xV4dZKM9nwjUk9YQDs6iPG2rk=;
        b=WGw94anOm/NRdE2FvYbkc38kWQYSmIwWJaWQMHz0HJOL7mS4gEtXn6dGAw6HyxizCN
         z3r2VR7vn4BPu05SOShrpsZ5KUsoE2MfrAMzXwv6va0QVJNczvei70n697qPfkjOppGI
         3vJbFfzTTL33zaHsA+Mi9ncFyYXB58QiJPJh93J68Kh7Cjq9+gp//kAamk03bsdCJemH
         WfFU6b/DDQsIOpPsN0VPC8pQRP2JZWoOzHNe3xOLLuaH3QGuzJDJ2NG02q8U/ugUUPvn
         tPKBlz7jnFn6FFGHStTmMHmNk6rKpBGMr/NeilZxGJw8H2ZBY1WGtnldmP+4+8kaX5oh
         cGjw==
X-Forwarded-Encrypted: i=1; AFNElJ/G/OwyU6F5+i+qRkTSCeoJjbUSv9sJDVkjARcgL0+BO2G2POSTo6n7LxccH3aYgAxKDZlUjzfK+2gN1B7DKieAcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynhZUeIIJV0Srunfdzzs0rE7T/scZH1HgXKL76BdrScZA/Ej5d
	uJqBbcMHfye/1iP/iZhuzjm2OL8CraxUaGvDTUTyeLfIE4m6sAHlPZMwdSDwQH3c36o=
X-Gm-Gg: Acq92OG7dJrDcBp7MN1mmATwY71Vee764jJ6C0ULrRYiZVD1/4OMw1cMJHoWs5YwUqh
	z9RBLpoXywyYSaRTIG053Gafq8Xp8r4qsiY3WYOkAumBJzGlElV3ejvE/7qCw+aTR0HckFxBuLV
	8/LBZbl0U5bRowqeTp2g0eBjko3qWimB43acUtEFGWFlA8k8vf3d1ergrNLQQD0hcqbcVjhw27a
	Ilh9EVgykiVqezd5obCxZs95DQJ8mJKPBJhqGyimMjGtz2I1OhU5/5dALHlkmzSMptEQORVduTb
	t47cGxArHlvU8yo9rCps9/1tDYk32kUAwByplnuEQuYnJjNFZrMaii+OEdEsOEVE92Gb0/Lyurs
	c/PFPkebZOQxpdzbdb0Xt/1iE4ZJ/7XvDYJn9JwgNY2//Nm096NNpSbMjp933gYiyeH0wXm1ZH3
	nWx+mKEtwGS1s3U7Vcwq6jaRXat7o5avLIxurhUA8r/ZEhl8mYHqgZzWSRTOHNCRq4wgeZDeYtA
	F0=
X-Received: by 2002:a05:6122:65a1:b0:56f:61d8:86d7 with SMTP id 71dfb90a1353d-586607b73aemr1883947e0c.7.1779457403290;
        Fri, 22 May 2026 06:43:23 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173baf56bsm1555120241.13.2026.05.22.06.43.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:43:22 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5752b27958fso2577874e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:43:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8YJk9vks/UA5x/ZTYxuGFvtsfrP8rgU5AMPr9ok6NYKbyzwxaxmgZALjwMN0yCFUGOrJuSdZ7sflxIz9CL4KL9TA==@vger.kernel.org
X-Received: by 2002:a05:6122:ca1:b0:575:3b34:28b6 with SMTP id
 71dfb90a1353d-586624cee61mr1849670e0c.11.1779457402270; Fri, 22 May 2026
 06:43:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260410163530.383818-9-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260410163530.383818-9-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:43:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEbmX0QqVQE7YhnCO325=2djd5S=ynr8DZnspKKK7WoQ@mail.gmail.com>
X-Gm-Features: AVHnY4KCEtGxHGei_0qihwJrEjH83nV_Z2btTPs2i2CQslPWM7eGYi7MBkb4Nkc
Message-ID: <CAMuHMdVEbmX0QqVQE7YhnCO325=2djd5S=ynr8DZnspKKK7WoQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] arm64: dts: renesas: r9a07g0{43,44,54}: remove
 TCIU8 interrupt from MTU3
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,gmail.com,baylibre.com,pengutronix.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33015-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.936];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7F0E15B63DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 10 Apr 2026 at 18:37, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The TCIU8 interrupt used to be documented in earlier revisions of the
> user manuals, but has since been removed. The corresponding entry is now
> marked as reserved in the interrupt mapping tables of all supported
> SoCs.
>
>  * Page 486, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2UL
>    Rev.1.40 User Manual
>  * Page 363, Table 8.2 Interrupt Mapping (6/13) in the Renesas RZ/Five
>    Rev.1.30 User Manual
>  * Page 528, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2L
>    and RZ/G2LC Rev.1.50 User Manual
>  * Page 540, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/V2L
>    Rev.1.50 User Manual
>
> Remove the TCIU8 interrupt. This does not cause any breakage as the
> driver does not make use of the interrupts.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V2:
>  * reword to mention that TCIU8 used to exist

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

