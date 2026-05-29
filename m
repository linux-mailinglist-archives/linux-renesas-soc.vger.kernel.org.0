Return-Path: <linux-renesas-soc+bounces-33322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIukAqRLGWrzuQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 10:17:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF815FF121
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 10:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C45223028B0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 08:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7480B2E738D;
	Fri, 29 May 2026 08:13:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3513A8723
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 08:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042438; cv=none; b=qi9qOTsvzyJ1Fh1BeNue1VXF7Nq8+2poEcfjemDTkAZSj5o2c5VQDehZsZqMeVdaV11qWx/r2gyGmiq/GkMgztZrU8XB2K6lGbSrbqfXgosZlwdzuHAtL6YJpbFv6v2ctZGZO7GqxXDijdbRjcPjUlQcdmARiQAJSz5/TiA0gE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042438; c=relaxed/simple;
	bh=ksVv1Z3kxdSomKXTAzAruPJr22j42V9L+ZrAtYZ/f6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxc1ie0dm3Th7XEK1Y0S7R2uiA5pMQobZTiTI2beauioQitH75nKZ291hCU0NS/jPjNusnnGo4YbS0azHuYlkKGFVEhdLvz3tsCed+CU4CuhXLt1ZocAI6QknfAe13y5gVxmxCAqYQqka41qsphbqLTT+au88AI3P35vxF069qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-575eaa32c7cso4655818e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 01:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780042436; x=1780647236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4O1rGAxVnzbuU02bFkeBc3pYMVxSZfJuH3Ds5fZ03M=;
        b=bpdnrlPxFVy02dd5U0Kvlciq+Or4//DwDy9Q+Rn5/8NZz7VA0jgFfNXVvaezRyqhCI
         sOj+C+S2X7h4tQRooq0XB6b4brPlYQeZ6MF+z6wEOXGMj1zcemVlyl9xbaewwycQr5V9
         K2wFJVsxnPNMeKGWdG3V/YQ8gFEAVNetf6J0XYfSoxT+qqxNMZrd7ECBHoOyCtmeFhMh
         tp0c25t0O1fwPwytta564qgoxO71EM4Cv5/NT3U3nsmiGTxAvrBgJk/CppwBAtegcjTW
         yenBQHptmkMquMVEvErWwkoOLlxC7JirSk3VHK2efzUCu+OAVn1efGQNx1q6fLMq+by1
         gGlQ==
X-Gm-Message-State: AOJu0YxsiijmZMDAZM+cUG+f1UKoRY/SXLlesGQT35QS1em6fDgFRbWs
	qRrsPqpA0Tkxx8a95s2Xg9eR0HfJy2ieS1HHXMtk0nk1dncVpYwGunBO2ucQJANE8sI=
X-Gm-Gg: Acq92OHtNjH4qRY6Vzjz5aXR4qPESI/H/2zEOOjMJtbHzHwKYWBNKyQxm9oSInkcj1p
	5280H0vuSiOQQm+0io+LYLvEKGKpY4cnMY2COljTc1CPXLJq3DmYoQLn0sB9tsYEt2OLiWGbTT9
	R1HcVCdZdhECBu+x8li3dCdvrPWQe2dhoIy85URfQXPJcw24r3nt4eAMiuDb4ZZpa27mrW83es8
	RfzlRYrXFq3qhcJjCb1CHGmjnqJbNsoMTcKGUhQtr9P6zW5lsYFhesez5gmbAUqBYPOroxM6NVp
	T0Fn9iP2QS3OWyGssVh25Q9SUQsS1zsBGAtDnbUMhhve6lIhFDsPlMNcsBM4HjvVz6T0DMWVMJ9
	fguI8Xfp0LyoKIvfba6pGXVM5FpmiULwSFQOTlxoxFwGjZ5iutCPZEAdjcwm9n/vOwaiY5jKlaM
	0FShVAyIfLxgjFYhvKSj1ilahs5K20DCKtLz/qpKzMAhFmdPThOU4i2AouCbCCgA0OK95J+h8=
X-Received: by 2002:a05:6102:4a95:b0:635:1bc8:3563 with SMTP id ada2fe7eead31-6bf472784a1mr529791137.20.1780042435812;
        Fri, 29 May 2026 01:13:55 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6bfc81a9db3sm640877137.8.2026.05.29.01.13.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:13:55 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-631333ee9e4so4331700137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 01:13:54 -0700 (PDT)
X-Received: by 2002:a05:6102:61cb:20b0:6c3:1d6c:2800 with SMTP id
 ada2fe7eead31-6c31d6c2c3emr22326137.5.1780042434281; Fri, 29 May 2026
 01:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519075620.4128-1-wsa+renesas@sang-engineering.com> <20260519075620.4128-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260519075620.4128-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 10:13:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXn2i9K64NC47VV7GRQZbPrFq5aom2wMjFNsyFzLxUC9Q@mail.gmail.com>
X-Gm-Features: AVHnY4I8_LolE-354sAuXX9KsfKM2PHDXb13x_jgzOFpxUa6Rman_8lcR8iFUUg
Message-ID: <CAMuHMdXn2i9K64NC47VV7GRQZbPrFq5aom2wMjFNsyFzLxUC9Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: renesas: mfis: add R-Car V4H/V4M support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33322-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,sang-engineering.com:email,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9FF815FF121
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 at 09:56, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The above SoCs have only 12 mailboxes and do not have an extra register
> space for mailboxes. Everything is contained in the common register set.
> In addition to adding these SoCs, the other entries get updated to
> enforce 2 register spaces and their specific number of interrupts.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

