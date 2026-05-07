Return-Path: <linux-renesas-soc+bounces-32247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNAgFfSN/GmKRQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 15:04:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0D54E8DB2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 15:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECB5C30BF0F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 12:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA883F7896;
	Thu,  7 May 2026 12:57:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7AC39F188
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158636; cv=none; b=rLqkNdBqLpfo4w6imJPUst3tteLwf3YAl56hmvdLAXlUjZRPQJLvnNMA9ABnM5tUgF/aBFMzm8g5FMlTTtQK35EZmCqtnbWm0PFnqVHmoUkEElC3TxO0xYpT1BPgKXnACvhJgW3TnCoveLSNoHmcLlt5xMm4CXKDdlFprs69H+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158636; c=relaxed/simple;
	bh=9LlYWn9a1daIT7AtTifSQR5OMN7I5+6EnOhEk/VkzEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJ4Ld8xV8wKHxFS9jLeruzGjDE7JdCNySeEFjoQ83XHbM4kqRglKpHLQFAA0Oth/G3vFNJPM1l97Zf/BQPeubwYIT/EUmcdN6SCZx+nhT34m2ENBWiGRXf8SttlVTMvNe4tbRoA+C8Ssi976u/5fCvc3tf5kV4iKd3Z2FoxsWEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5751136c561so1497140e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158633; x=1778763433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufXhHtNlE4YNqXItZBW0sALbZeYV1ohvIQBPsjtJDWs=;
        b=mGyZejeRAY1tG0Aq7mA/m6P+TNubyC47PlAUFc9p0XQRAul3IR3TKJn77QST+wPFy2
         QknPVjKp/YaclTA483QGaijjGz61hXT7NRjXTgTQJ4XJTjhi7vhwh7FT0FT14HTAP4zo
         c1B3VcSJXCMilG5U/fh7fqaS047e4EbT794HR8Xi2SSAfLTEKlZ81YskM16HgrmOopGP
         LLUMUzH+0sk3e1OnDCvZRPRhX94v8gTnaFibnjg2qvH/YW0Ce1OJn6Z0iOatwDxI3Ues
         3bWVwkNp2WHQYiwQG/JWJM6inc6rgQnCQ+LtdMesnfhcLiLwWyUePkqorraA6ZGlBUm4
         +PfA==
X-Forwarded-Encrypted: i=1; AFNElJ/ptz1BIdv4j7CRrEGaKVP6s7jMiFfFy+0TiPSnVHJn7MfmK8zDnfXu8binBglv0ivoRkAwNGdMiTsujfW5qgd2jA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLJQ+3Rsp6w8I8KuesNAcK0oYDNOpDW0+P49eYf0SFjllUAV/d
	MMfuf9neHDEhwCENyMseOsmUplmDy1M5Pz3hGpglAK718R1VcgiyGeIHGePKx6ryU1k=
X-Gm-Gg: AeBDievfu606mvHVvIIfyBiui0nR8/180TNE2A9X1srahD1U9ndL+h+zx3ZLWUVXntd
	aT7CQnYvIrloj/g2xOlUkVFZNPW3bU1V3Xjknt4hga2xYyl0KqW/f3bmNtF0pcrLH0ibG+sre8x
	GY0ccGfdpmy1e4+7zOwMWYtYH6YnuMHvQ0c6PrFmfzwizENmv2b+RGx93qY7LfAkAP/ymyGCAOt
	1IqfIES0bdlqvHinq7oSy9Vaeeiyoh3UafaI2rIIs4ty4j01q0fZ86m10IF3ezakrp/z50h+VKt
	xbXPFskpBzDsopBy5pI06U1Wspsb+NUS5HNmIfyBpp+APuNKqeghl+VYQS/VFc0PEpuiniv32Ou
	z9raj5Pf5zlpCNmIsFx9GZK4GnrhYy+WqYvQJsxVeqpzHlcsav4AAi2BNYQvgBT/eES6FQKoI23
	JsJ/92zed2in8mBrPEQPcIxTTzMRkNdvTs3Q8xQ5ZG23wLf1uDGL+VY+bB7m8LvFgkFbJZHpw8/
	3Q=
X-Received: by 2002:a05:6122:6304:b0:56b:a7de:7129 with SMTP id 71dfb90a1353d-575702cc825mr704904e0c.7.1778158632733;
        Thu, 07 May 2026 05:57:12 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-57576d13773sm482885e0c.16.2026.05.07.05.57.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:57:11 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-575212eb419so609076e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:57:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9EOHpH3hJZlwMsM7jOkQAFCf5eb5m+4E9CD8XiC3x8uI8+yj+jICF2+XFz5XW8itdPU2rU2VFXNGpMH+Xxn+c4vA==@vger.kernel.org
X-Received: by 2002:a05:6122:a22:b0:575:20ca:573f with SMTP id
 71dfb90a1353d-575702d4fc6mr894465e0c.8.1778158630507; Thu, 07 May 2026
 05:57:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144523.153906-1-biju.das.jz@bp.renesas.com> <20260504144523.153906-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260504144523.153906-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:56:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7bhV9moQhJocP1haY6dTFSU2fqBmXR0P1HJLimSfvcw@mail.gmail.com>
X-Gm-Features: AVHnY4IKdN7QedDZ-7MbAan2r3jOABajb6Y5Cbcj19lgk1Utd-zT852fOF601S0
Message-ID: <CAMuHMdW7bhV9moQhJocP1haY6dTFSU2fqBmXR0P1HJLimSfvcw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: rzg2l: Simplify SAM PLL configuration macro
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: DA0D54E8DB2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-32247-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Mon, 4 May 2026 at 16:45, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace the PLL146_CONF() macro and its associated CPG_SAMPLL_CLK{1,2}(n)
> helpers with a single CPG_SAM_PLL_CONF(stby) macro that takes the PLL
> standby register offset directly.
>
> This removes the implicit coupling between PLL index n and register layout
> and eliminates the now-redundant GET_REG_SAMPLL_CLK2() macro. The RZ/V2M
> PLL4 definition is also updated to use the new macro with its explicit
> standby offset (0x100), removing the local PLL4_CONF define.
>
> No functional changes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

