Return-Path: <linux-renesas-soc+bounces-33623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MV04GejRImoueAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 15:40:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A28D9648985
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 15:40:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF5223011867
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 13:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967A740E8E7;
	Fri,  5 Jun 2026 13:38:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EE42EB874
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 13:38:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666739; cv=none; b=tj23u00g2vrCsv8ZZFh6odlJj89xKfhfzX9qeK1ie6LbEeFtR9DT6fXcfsy6QadJ8altcbcjTXOQLORuQRQfjXKIkgRV6UrYl34TLJzpOCFmO9nAzZfhmTJRZbGftSK/Ntrhnpqj/UilxfHgMDi/Lc8GdgXqWC76KuiDlheCxuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666739; c=relaxed/simple;
	bh=FBNPG9V/1qWiz8sOxK8CKje3/Q9dzTuF8Px0Wy6/lMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5w/V+aig8s1T/YIx3NIq/9dhnRemvIMCnE4QK1B+QFGL+jNHf9typn2SVtb6lXP5G+dlYX86npZmU6XoL1dYTSGD1hoIHDtMTQzws/cViRQlL7XlUwFdeF16lpkLppg3rfWZ10bZZ4UlN65pqj/YvR337AGQOlMI+9QZfaOrYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-59d541955f8so623074e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 06:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780666737; x=1781271537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3BFc1Io0VDxVIM/lXxZrvbjyw3H3uz5gUx8im1vWJQ=;
        b=lldVhiH49jQfbX5iAbJvESCgNXdJoad6hEl3GW3MOqBUSJlQ+FFEtJmfzZo3+h4+Q/
         VupZ6HI53UJCSje3diuvo6C7pPzm93knxoZeu8I2im7VsU9Bs//XTWfex8E/ab/ahi1x
         JU/8gL4o13AGk+sImFACj0zt/lhC3xxXQMzR0LfmnrwE4o6VdO3D2wg3XMG2nwRjDM3v
         3ywkg0gA+YhalLXuLP51TicSo8LPOG95Y7uKXGBo4fOtiJdrKG1+5fvxlsZ20jACT/sz
         sCL3krPTkban7tOqvNp50YOxto/o2BftHjICEIb3JNGKz4cpPOL6R8QwXIRXQzFTmBNR
         6RAw==
X-Forwarded-Encrypted: i=1; AFNElJ9KwdjVW5uYmJRysOzam32Ismwd3Y181+6hDJH59R6HYyfHYmqToy8XKagqVdcv966kxyh8HdH7WdGiom0srBfv8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEMqiF9915zhDJi1/1k/8RvgLbEYuUO4L34tnBXcDfHabXLlUV
	XNCKPnUSoCqsCFALGajSOAGjRZCtkPtGsewoc+p8wst9meiOHMo70y3pOiFpsJaQ
X-Gm-Gg: Acq92OEh+DRTM88BZNMGUCMG5cFqhY0KSz8+1JhZl9l6Oejx5m2PhMfrcYYT5Is5BdM
	zL8QY2YZfoS/ANJBnczVPd4OwuiSapqb0TXJL44t1Q6suvNC4QKDem5BrXnOnZt9rsc1507Pd6d
	owrs+MLHKAwMAsbjA4PyUCAvqURE6TuG2U3zxZy1wGFfmaceSrfFR/savp1TK8H/0AUCvEEfmTg
	jmsiz2ru0M0nEwVXEXtLvS0VJeGyGwJCTM5qLdTYXIq9hlmzda6y6uOXK9CyBBy+Tw/Lgadb2xo
	PR/Rzvd/cyRdVhmqQI1G4FbHMw5cR0aFLSEOijIaI1wC0Ok4gGA9sb2guFw4N/gXA8DtS5h2Dvt
	kRI8Ol2jJHxQmrJ+WZUG1GlLyAQmtGm6QDEvakOp2ecj9sAiWZLBvrVeUkoSn12PCPxxbwi8X6E
	i7ZQKUR2+PeQV/FhDBe1SQrUoFN+AgptvMs4wuuDjZ5CjKGmzYy1RWoBRPKAPXgtWHeBGx5q0mD
	8I=
X-Received: by 2002:a05:6123:10b:b0:575:fea0:559 with SMTP id 71dfb90a1353d-5ac4e5b9dd5mr1742363e0c.4.1780666737307;
        Fri, 05 Jun 2026 06:38:57 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6dcc2ecbesm7193423e0c.13.2026.06.05.06.38.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 06:38:56 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59d541955f8so623051e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 06:38:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8FWYXm7lUL7z0+hZsPP1QU7MPApGWeRvl8HeSiR9IKLHCUn0dguT+OjJXnOSb9qSpMTM2dUgydEohMvp0/voM2Ww==@vger.kernel.org
X-Received: by 2002:a05:6122:3d45:b0:573:a779:62cf with SMTP id
 71dfb90a1353d-5ac4f952082mr1666770e0c.7.1780666736147; Fri, 05 Jun 2026
 06:38:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260511191910.1945705-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260511191910.1945705-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jun 2026 15:38:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWO=u=kEAYSqywiMkvjCcBHXVfLL7na7kwEFsuaWKMToQ@mail.gmail.com>
X-Gm-Features: AVVi8CdVv3RVEHPhsDaqredkoNGzyv__zq92-0m6DeV88WQhNmXx0Ns2Vk-vkl8
Message-ID: <CAMuHMdWO=u=kEAYSqywiMkvjCcBHXVfLL7na7kwEFsuaWKMToQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: renesas,r9a09g077/87: Add
 LCDC_CLKD clock ID
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
	TAGGED_FROM(0.00)[bounces-33623-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A28D9648985

On Mon, 11 May 2026 at 21:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
> operating clock for LCDC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

