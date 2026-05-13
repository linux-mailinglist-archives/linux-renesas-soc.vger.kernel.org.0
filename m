Return-Path: <linux-renesas-soc+bounces-32570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PoCHzp9BGpCKwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 15:31:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AED5341BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 15:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55E2F31F4EDC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 13:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024862248B4;
	Wed, 13 May 2026 13:15:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89613221275
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678125; cv=none; b=PDs0Z7o4/0HhvaluncEdL3GHm+VHfEEzpW652Z26O+RZgIC+/rQ0VIaDbzoJK/FvXa+PonF9B5nPDeaz1cc7VocE3rCLfZFcvZ1/taBnIkqy+CglacXI2vnz9e8AWGkJ8j4v38MWEIgTItcnI+wmbxGTy4y6hhoz6rKnPrvHHuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678125; c=relaxed/simple;
	bh=oV7lWg4lz210rteMJfOa33sA9nixlf2kec/RbjFlF7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lrURB8pvouA49/1U9lzkUDaFfAqaXj45yRz/TPXbbQpp3FqHMj1Bbpm3CJxJU3I15Se8CmMRXEXJkzvb5PyJTXfHw0weich8lqoLiK3We4kKkbQuh1svYKalc6cG9tms/GeBzCK2c1ej5qxkSva15jcSMywhbKnxAC4aJ7Lh/2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6312b8f8e47so1999039137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 06:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778678122; x=1779282922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8cNW33wiaXVwXT9Hgyi/JcE/ejaGgsPgY1Fa4o6ZiI=;
        b=ntXu6emad5w/ADMhaLEtfzqLSYQQcOmxDFSbd1I3mku4EH8Y4PTfJEZCTjvwzRpGRW
         MJUnv+VwhYZ/Z4ne4q5kQgbPOeMPWckhgW33x9UEwBdv9UCK+OBNzz3OigCaiOW26AAy
         dcZlAagVRQMJxtL6LldmnwGMF7zdN0b5f0rSSjYv27ekLVZ22LpXbGvkL5ycfbzDvfA0
         hCgcfo6P6nlsbPf1/8mt6oldFzlH+jOsKn9Dq7w73tq7XFQg1GRAW1E+egiNSLn4si4u
         0uNjkLwYTQvzAnEP7Dymy237haVUlVf61hP/lxlqszAqVNy0VTIU9aA0uB4Z8JJswrWw
         n7Cg==
X-Forwarded-Encrypted: i=1; AFNElJ9LUg4DczfjXRGvG5L2xWDmG+LM5FOpcTkM1N+eVj0w5t68K08hd+I36RbV864yWd/e0Q9+ox7v4kQi6Hsyju4HRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0eFqqZfd0N8P94V+9F7mhQLznLu+JTC7449kybTrDkPbs1SW3
	VUMboB7QRo0zVxPeaYOoxeae+3ZtDQjCxXZ5xSNh6cOSM5N2PpmICDoEBCxirRKr
X-Gm-Gg: Acq92OGbEyJbs7cdmiPjVJSH/z6KNlK93F7QhVEEixambEur/igu3CjqJlT1UiOedlD
	CfJ35vWXdR6pHbadHe8VZPgH6usqx92mCUVP5Sa1Fyh+vs2QhldAHrS42ZPyLt0u66p/u1+f8qe
	XE8kTx/jsl9aD9LCybp16OU6alZBpgvLUPdINeai/C7CHH+RfZX6Vrcnkv1yazWf5EREAiRLy5O
	YKKsUoNCArYZHLEg8rQzC8kynk8MBPvQ4L4Nh2fGZ9ZozbjHzPeJAGpIkqvGnX2Y0Kfk4QQX79B
	3RAYYmrwfv0Cgy5B7fwCTpjeGwAWNN4vdWrlfJk3PY2SgaFmxlbUwz0JN1CADigAf5cJNXa5rBk
	ajqxsTduGmeTZyHVOL2WkpdMbu2iIfvyB87Ku46GXtR1JDcIlEHaj0RcexGa5kiXaKu2Kt1vxld
	qp7e0lCkfQGA5DoSFVlWZ5d/L/onyyg1lJgWSwixvvvN8BeetA753UCKDVQqvPo0x6
X-Received: by 2002:a05:6102:6049:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-63774235b40mr1137891137.25.1778678122189;
        Wed, 13 May 2026 06:15:22 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63140216a98sm10064463137.8.2026.05.13.06.15.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:15:21 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a857578a8so2308579e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 06:15:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+/ccyykBZHIqUnsTZE+Rkr+VFjDdlvB6CU5e9Syi+mqxzd1OTYYcqlucrV0XUHWo101I69/QYThH/EA5sKivjdwg==@vger.kernel.org
X-Received: by 2002:a05:6122:d25:b0:56c:ce0b:fecd with SMTP id
 71dfb90a1353d-575e70a7075mr1239716e0c.12.1778678120886; Wed, 13 May 2026
 06:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:15:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
X-Gm-Features: AVHnY4JTrqWXHc77xf-iSrs-bkBREqw0nQKCK-qidhrABbBSLqD0EGxY-SoFw7w
Message-ID: <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r8a73a4: Implement ZT/ZTR trace clock
 on R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 35AED5341BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32570-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,mailbox.org:email]
X-Rspamd-Action: no action

Hi Marek,

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Implement ZT trace bus and ZTR trace clock on the R-Mobile APE6.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

/sys/kernel/debug/clk/clk_summary looks a bit off to me:

    zt                         0       0        0        208000000
    ztr                        0       0        0        277333334

> --- a/drivers/clk/renesas/clk-r8a73a4.c
> +++ b/drivers/clk/renesas/clk-r8a73a4.c
> @@ -43,6 +43,8 @@ static struct div4_clk div4_clks[] = {
>         { "m1", CPG_FRQCRA,  4 },
>         { "m2", CPG_FRQCRA,  0 },
>         { "zx", CPG_FRQCRB, 12 },
> +       { "ztr", CPG_FRQCRB, 16 },

20?

> +       { "zt", CPG_FRQCRB, 12 },

16? (12 is zx, cfr. above).

I.e. the same shifts as on R-Mobile A1.

>         { "zs", CPG_FRQCRB,  8 },
>         { "hp", CPG_FRQCRB,  4 },
>         { NULL, 0, 0 },

After fixing the shifts, I get:

    zt                         0       0        0        277333334
    ztr                        0       0        0        277333334

which looks much better. If you agree, I can fix this while applying.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

