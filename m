Return-Path: <linux-renesas-soc+bounces-33326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLpEMp5UGWqYvAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 10:55:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 685C35FF969
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 10:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9306A3080B79
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 08:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC853AD531;
	Fri, 29 May 2026 08:51:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4C834F474
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 08:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044690; cv=none; b=RhG+g457cM0vuCCjWeP0uwrHShZu5RhHFi0AAgr08oGU/wHF7GA/wLzJRQ2XR2Urx7vA3jE94FvznZ2H32cK/wz/yXPaH5Zbgv8kcYpP11T2U9nanouFGcmMOVa0gGDvHNuwEUFZYxkNP0QNilukVrJkB3WfcbSsowDZofT2L7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044690; c=relaxed/simple;
	bh=bdkabu71rrDKTa7LCUjVlosFsfIEDCU0sEtD7EQ1qII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fF8w8/9y3ghTIfsnR2r5H5wzUu1D4JCzz/EuEZ3b67oVnmP+OhyhRlC/zuC3ghidoE81ZnGucvvPku/o1s3CnZNp8EwLS5TBB5zoNqofRZYB59HNiqqb7jO/LL03bF/jeJO3aKj8Tg8ZKq+3ySyJSrGWr8nFXslZ8x1JnOMRhPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-57533363201so4605862e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 01:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780044688; x=1780649488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkwvcdoTXy80UmD5wUVPELnXBlXTid1VaGcK25N+5mA=;
        b=rTEbz+3U8L6wM6KyYyBZ87P4KU4kciIFuaIF8iHQx7fa8pgtttBNZkzonHdh0pfxR5
         DtOLoI5AtMkqYHorhB6aW7VrLvlpZQbEi9jJM7lLd3oWLYWziFgRC2CQ8aJyg/xOf77b
         E4Vq+FIgDxvApXMqpXorsMoN4sJkW1ALlL4bHjBxwgbigLI/r3qUb8Q41RcMc5iaGmW5
         JVTfVotVMQy6ivPCEhz6Ywh8ANiY1snYdVfsjRUpteSE5MaIGItud5pGmTSvMks/SaPV
         /Std1qd/DCgJFVfngwj1pArRBVoaQKdMXGtde3WPXMIjjImStisqftMNIyuipKTBoXzO
         mWug==
X-Forwarded-Encrypted: i=1; AFNElJ8XDkGfA3Y/EMIpxAQjsmNbKPlFsQQLfme+OjfevdhggEjtL2OB7sIzFxhq142rT7DEdRWqeGLbixYVPZimYIBw+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5idy5MrUMKww3NqUsRDUMQjtyBq+/++vE2Uj+N89Zdy/PV6Ef
	hBmT72ILK7foz2FEvBfnZq4sQ3CjC2tx3vgRZx8Ly4bzvYpMdAqSo/m097t70Hz6w2Q=
X-Gm-Gg: Acq92OF3k6bxMCjpXdqZT414Cwn6Iql5/rHEZrJAZD+IkatSoenK2H4iP7xq9cLYRZC
	K5rAQChVdL5YKsD4w+TMozSVloZ9Qi0+7HSRG7PUBrrZglqa8d64W6I4xdLn74jqwS2ciJ8WJN9
	NknYZXlv/2DiN3Wl27/czeLHfE7US2ebSQlZ9PhzaLBCCerEQUh4PmSsNDXN6xlNUKvzR+t1NVe
	GYf1nV3ywa2dgn7H0zAPdcqVgEdrIDyWPu2o7Llv6V0P64VZGnJOZ3ycpi4lsnTqixpCVyU6hbM
	WlZV9lprvk1nM/pinavKpEens5h5qhDtR7ND+oWahSp4+fjp/EC1uu23eHk8qDI4C4uE80fnQKb
	ZlCbPpJB4vETvoLYwvVoMbjm6oSxA/nRlP3Mi7v1lYsLrNItQB9o+FctkMzUfmPIlrPBCVq+dOt
	fdFt/TXGdRHSjdz+mahg8RQN8p9QH0K+yP5xwm+f+Xd4LX4Gv2p2GhPCTJsOejfZ55g4wnTV0=
X-Received: by 2002:a05:6122:8d0:b0:56c:db8b:504e with SMTP id 71dfb90a1353d-599f4796e77mr599048e0c.13.1780044688126;
        Fri, 29 May 2026 01:51:28 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963aba241ecsm493091241.2.2026.05.29.01.51.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:51:27 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-63130466364so5081510137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 01:51:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9RreEQbF9z7p5UlvN7NPbcixYJ/p08xwnlY8xyeunhLmu94RFnMlGtAUcHxpbiKGXb92nTSS9NvHviJqdJcJuHXw==@vger.kernel.org
X-Received: by 2002:a05:6102:3ed1:b0:64e:32c3:1371 with SMTP id
 ada2fe7eead31-6bf3719eddcmr673394137.2.1780044686545; Fri, 29 May 2026
 01:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 10:51:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvUsUUkOj43oOWGs_MLvOZnEW=2YyKpP-VwHxe7ZaTgg@mail.gmail.com>
X-Gm-Features: AVHnY4KcCj63IhphrvFGQN6syC1_7Ix7eM6G3oNuhl6QDo_VJC9lcWJclcF3QAs
Message-ID: <CAMuHMdUvUsUUkOj43oOWGs_MLvOZnEW=2YyKpP-VwHxe7ZaTgg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Describe all reserved memory
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33326-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,3.156.174.192:email,glider.be:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux-m68k.org:email,2.98.90.0:email]
X-Rspamd-Queue-Id: 685C35FF969
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

s/r8a78000/ironhide/ in the one-line summary

On Sun, 17 May 2026 at 18:32, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Fully describe all available DRAM in the DT, and describe regions which
> are not accessible because they are used by firmware in reserved-memory
> node.
>
> Replace first memory bank memory@60600000 with memory@40000000 and a
> 518 MiB long reserved-memory no-map subnode. This memory region is used
> by other cores in the system.
>
> Reserve 32 kiB of memory at 0x8c100000 for parameters shared by IPL,
> SCP, TFA BL31 and TEE.
>
> Reserve 512 kiB of memory at 0x8c200000 for TFA BL31. The upcoming
> upstream TFA 2.15 BL31 uses memory from 0x8c200000..0x8c242fff, the
> round up to 512 kiB is slight future proofing.
>
> Reserve 32 MiB of memory at 0x8c400000 for OPTEE-OS, which is the
> entire OPTEE-OS TZ protected DRAM area.
>
> Neither the TFA BL31 nor OPTEE-OS do modify the DT passed to Linux in
> any way with any new reserved-memory {} node to reserve memory areas
> used by the TFA BL31 or OPTEE-OS to prevent the next stage from using
> those areas, which lets Linux use all of the available DRAM as it is
> described in the DT that was passed in by U-Boot, including the areas
> that are newly utilized by TFA BL31 or OPTEE-OS.

Thanks for your patch!

> In case of high DRAM utilization, unless the memory used by TFA BL31
> or OPTEE-OS is properly reserved, Linux may use and corrupt the memory
> used by TFA BL31 or OPTEE-OS, which would lead to the system becoming
> unresponsive.

Oh well...

> Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

