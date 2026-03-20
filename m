Return-Path: <linux-renesas-soc+bounces-30005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODweLAgtvWmI7QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 12:18:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F7A2D9691
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 12:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A0BB317F5F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F843A1684;
	Fri, 20 Mar 2026 11:14:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B06F38E10A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 11:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005298; cv=none; b=mBJIO+1KWN1c5haoyhdLBqLvZD3b/HruqJZuC7agfMrt3TBw5gUm2tSJi0x2DXahLwFmi2kOZXIfFsA5doEcOCVfKr3ZuPsXHOlMPSTz8qrzvt2+55NGL6PgkBMTmVl/l3pFlSddMkUk1TaqdxrgqQwB2BM3HjP6X4HqGWo0tV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005298; c=relaxed/simple;
	bh=9ieM0PKneLc9XAFn1kgI0QbNwUio1Qq6fWkxlV5z1Fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icPJhCezoMV7JS+73bTq5I9BwGrJwDhjpS5iIyve6SuaOhL6vyGOgAJaUhjQ5r8uqwshQDzH40cTxKGfy/2BS5N3YwswQaucjQdc8bvERyLRhbrnqACaWO/rUyrZ/Ab3HC+fwNma8BUWdTFsQudAxzorchJuGh17TXppRGmsBTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56739adfa1aso1203453e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 04:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774005296; x=1774610096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QM2QQuood2CIqMt6ghdF4q02+bVScicBaTi5mQcy40E=;
        b=LL/GQK65SRRtte8/x6MfoaU93l/bZjL+phowBWzuob9dv3RkrHT2v7GEX2wjcHrQa4
         rJJwWxdh7ZbgK+cpf3rfrLoLkpuWqi3cPCbeOpLdLdGJKR9ZM3waLfCX8/ZhdUcc96Fi
         afGtus8qbsjVf9J7nivuHUIGNT0Px/6NOhH49/KRLoMpbwp1wyMh9fMSk50HpcD5AqPL
         BWmQ02kkXzbrLbuGhkdpB5VtOZ4HOOpetbVTdm1iODY9kRv0nCp2SIfxxBZd57jn/u/l
         OS4S5kauNf+5QQiI/mvHI9orhoXnN3ntcIsNXR3+7Xj00qHFv1tzLmWoW0tVNq4GhPHs
         TuuA==
X-Forwarded-Encrypted: i=1; AJvYcCU44Zfgzs9kuucsjuvODpfNpx26VvVIxYgR0wY+klde0GmddcH/SyprI/F+cy4PvUTzeV1yjqVPKBYU+y/ZQw6I2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbK5j8uXgsNCZvmHbG5narYartGHURPwAd8UD+StppaaQUYq6J
	hrHrMuL56UtuTkWLurOx6Y+8B4bXD//5qg6LaLwfN5V2blkjt0KeCyAWTwSS5AKJBE4=
X-Gm-Gg: ATEYQzwxN45vKIWH9JSnvRi4Hb7QnfAorzqIHxm2w5hZ0LtoCClsjFojoPVau174Dt8
	P8CdwrPCJiKHdYCsjV4LLbjf7j6fYpWOMxDoTpy3qGYrcw0Opz5uNOJ3FaA8GozO90S292jvmn5
	GglPi7JuQIOjgDi8n1ssLGmovaveLUF/xaHz/bK/a27qMYbnrJ8jbc0kovPdflkoTlbIANuveSq
	Fd20whE/Uqx4QOzn40dE5Js8LsE06GWQJrq86gnsWTmeusHF/EqQASYKQ8zHCJOZWmIA7fbNcxb
	dbI/QsYMzBW42SkPtHXhKlyWzzs/JeRDyOAiC/oA+Hm1qrjyS04vm+ozysK5tlDYurtsoC0JZtM
	eBZ5RcZCf4jBoYYDi6Pu4xJSgunDY+I9juylt9P+koZiGUjMQhhJPylg3XGi/e7Prc1rldfPglO
	40Nhpp3CZmplxJq+ZU+EaIhtu9De8Mvo168IQ0WIYXJC9B1Y9Km/I7/dhL1n76
X-Received: by 2002:a05:6102:3910:b0:5ff:bbc1:509a with SMTP id ada2fe7eead31-602aeb01718mr1544635137.14.1774005295925;
        Fri, 20 Mar 2026 04:14:55 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af853b1dsm1003164137.2.2026.03.20.04.14.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 04:14:55 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6028bb29cc9so948797137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 04:14:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXp0c9SXcslO6u1YyDhY0qSOEcRFOEzPoUUI0danKJQxcIIRyLojPu8Yk/QpdRAVf6SudreH4SCcd1J2qJbG67xmA==@vger.kernel.org
X-Received: by 2002:a05:6102:3713:b0:602:9228:34a3 with SMTP id
 ada2fe7eead31-602ae79cdfamr1587306137.0.1774005294541; Fri, 20 Mar 2026
 04:14:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com> <c8df5202caf4e36ee5beafe78ad0940643edcbb6.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <c8df5202caf4e36ee5beafe78ad0940643edcbb6.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Mar 2026 12:14:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTOPYxC7r0ztuPc72T5xeDgcfo6CUi8sRcupjiJbRLGg@mail.gmail.com>
X-Gm-Features: AaiRm506QxR9HoC6NaRd9ZijJZ6-iF5Bj8kjApAjQvVWwUbRpOpkLxT5Tya6COA
Message-ID: <CAMuHMdWTOPYxC7r0ztuPc72T5xeDgcfo6CUi8sRcupjiJbRLGg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a09g047: Add RSPI nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30005-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.483];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email,glider.be:email]
X-Rspamd-Queue-Id: 14F7A2D9691
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Feb 2026 at 17:25, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add nodes for the RSPI IPs found in the Renesas RZ/G3E SoC.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

