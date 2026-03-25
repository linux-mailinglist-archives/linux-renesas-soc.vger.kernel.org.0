Return-Path: <linux-renesas-soc+bounces-30258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CCCILwLxGk+vgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:22:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1661D328E2B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32579305C4BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B626E3E6395;
	Wed, 25 Mar 2026 15:59:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FD93CAE66
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454385; cv=none; b=dhwldwtTPib7JHxas9vftfHqpi4wkd+4+Sq77ibAPmGz11JEWlbO1UjKe6pMTJFDKk3J81wyPG/16fgjxeLqLGn+tvPF9BpDaHdljJ9OT8lK6sFW1690sxQWvP2kGxbpZgdkDOQdOfz/4vi+9j0HU/M+sRs/k6nQfvEahFlzBLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454385; c=relaxed/simple;
	bh=4RYRYnx/N+uB3nG/PmCpdDFzhigjOZcdXVf1qTaHjTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sq2fHMw7t2QZx25Hc7tiK3sZzLGEdFmI0xkdTzdVGNqp3Zt2j0J7Xp0bQYI12s7UzveWMtyIJ2yn7ObBbgvZ12dKVnjlzofb6srzWdTDiaRQyKr9Hia4I65bB6s0tUtBe1OA2f53+xFjL7oZdKXC+TjPBcyeaq2AEqL765xjFdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56ba039eecbso40710e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 08:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454383; x=1775059183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTYn6c2oWhs1HU9mLDTjqKGDTTeJkf0Hf24+Mstq7Ik=;
        b=hwLKuvb7Lt+ixCkTHjNni0OAAYqJJrOLhn5txlJcktEJxtleT+TJFj3fP76ocTyW44
         5JdhNKlQbS4FuO2vHNpimVwoEBaeIeepJWX2qb73s61PxhuC++XMM3AGDdN5WGfESv7q
         o0bReSIMLhp2ZsXgNWxYYmv46KRAWLgvQYF1r5mcUF9x/n0k6RRAz5db7cawGqnMFj97
         wIHjSC0RKCvP6zFwlGXxAhZ/zKawBhvptkV/GodPU474VAHjYYwAfkeyo9rGeCPU0g8R
         IraB85IUNaFIbn7DOGCmTWTNaNg/387WHlIVmLHEHWKmqWtZp+oxgMS3Lx1XwMZF0/Xr
         eTfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy3MePVDx55S3kZ1grG2kAlyMyGjUSEADAgi1f8zYhCC5WVfOqdB9ViOOGRu+3s7+6ZFPtLX5IxvBoJbWj+WMr5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ9CfUKGDuvANJem7z1tGLe+/ug7ghQOT9B9EImFCAQNOPFmc0
	MyMiCuH+RMh8peg7+zDPTF9nkqmhdhTCwrTxGzhWcKfo8uju8BkdNluHPzltQdy0aF0=
X-Gm-Gg: ATEYQzzhabMz16+oINWQG7zldbIpzxs7vju9TCruer0rARC8y4F6OyDsPXCS/bLo6tL
	FnUbDGND+S929bCl0FNotHEushVbVKuNyFt/w4qHYC9qtJJ1u44D8tTteeSOn9aknJCBOUJckex
	I85wHT6u1xHi9h5WGsFrvWU0n59aTfdEW/KotNAcXgCwoT2pMAl5UyQocdl4X8iNm6YAB1VzSah
	bF5mJjPTGpS0cxU4ZbzXiUnobB2KDS1YnKL34zTrxJF5fMcDJ8G6ntiWdyxEFRAj/7b4hjMOzUo
	sNTX+ulTtTH6n//GTp7Yh3SNkjdhRdGxtzRB8gTUxrOQL1X4Z+ibmYXu1ToANfwClk83EUusyHG
	t/W38LU9UTonphsvLmt4og7i3FsmG6W+EUAh7yBNJUd+oBOm4Tt5f/V7UqZ/OMQr6SOTK3loTS9
	SXKBprSFYGBemNA9Z1EJpU/jdrAj2Pc63QH5HXWVO8ZyLAp0X5B5Jv6RHn3qQw
X-Received: by 2002:a05:6102:8091:b0:604:d2c4:98e5 with SMTP id ada2fe7eead31-604d2c4a190mr366612137.21.1774454383287;
        Wed, 25 Mar 2026 08:59:43 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50c928asm82223137.5.2026.03.25.08.59.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:59:42 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ffe1c73287so2042554137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 08:59:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSDfMiJSag5JK0jAbTLUfwvZ1gNJIoFql3/zfHdbaNLA7ps9Gd5JfcQS2fq6uh1DDwkUU6eCN3VlpMlvpKyq35fA==@vger.kernel.org
X-Received: by 2002:a05:6102:83cb:b0:5ff:be25:8936 with SMTP id
 ada2fe7eead31-6037901966dmr1857866137.5.1774454381452; Wed, 25 Mar 2026
 08:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318085119.44717-1-john.madieu.xa@bp.renesas.com> <20260318085119.44717-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260318085119.44717-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 16:59:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXwtniV=_gywHfDCBQ_+660aV4+K2SXbfM3c9guNrbng@mail.gmail.com>
X-Gm-Features: AQROBzASFVBtfoGlkigJX5s9euj0nyf-Dtn2deDVkxMdGhdHzx7S7UnqewbVbV0
Message-ID: <CAMuHMdXXwtniV=_gywHfDCBQ_+660aV4+K2SXbfM3c9guNrbng@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] arm64: dts: renesas: r9a09g047: Add PCIe node
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30258-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,glider.be:email]
X-Rspamd-Queue-Id: 1661D328E2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 18 Mar 2026 at 09:51, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> The RZ/G3E SoC family features an x2 PCIe IP. Add the PCIe node.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

