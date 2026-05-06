Return-Path: <linux-renesas-soc+bounces-32116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDaTJrMV+2lLWQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 12:19:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DF94D93C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 12:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4476A3004C5A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 10:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BAE401A02;
	Wed,  6 May 2026 10:19:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545633E92B3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 10:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778062768; cv=none; b=lcFCwspCdwqa85v6NgsS7iyeO4TsGOvPUCc8vsALjuznm5TUqBGDDapoVaf11K9Xa+c+M4cWgy3CBitgZHVdOkIy5HQlIYCGRJlZfOd3RRWGes7IiZeUno9g45zj3INItlkV6b7hmDY/Ixc4lcGLIPagHX+s4C4Cyq8ML7cQoFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778062768; c=relaxed/simple;
	bh=B2Xa6VZztFm42sxYFXowro4G1pwYLrRZg7/codjLEJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjA3BWQPH76aznKdAfgce+ymahei/AlAD0i40yAb7b+MBOifymZ62kcvC6BF8QT22UtACk6pYWV1APXEX9O08Wlcvxkt0upUe/eNcpk4odl8HtJrJDrPVeSteFpvfLZNQhPJk7gICfQ1rXM2+hraNGfdjVxwSGb8EWmbsPPFa8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5675d609621so5814778e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 03:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778062763; x=1778667563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frOZWVrduNGKMu3VYaa4JiBvzYZTtFtYjox5RDxS4rA=;
        b=fGiGoi9Zklt1vD15RmzeiWbfL1YObNbl4BXHXoOLgp8ghRlsUeX33Gc5BE2zqxsyra
         2v0CXujj/WQ9mcbS9LvPceabCgl9lqCQJ2PD+y0OS3Gt0F5gt7uYedezlRIvbaXVftu6
         28UD/MpMjB1AiFPpMBelCKXDEJItb8HBcgo+xjx2XrlRWKpJM8iGtOPS/O9JXjiFmkOo
         iUn8bPGvBnzqc4PoMWqH4EpU8+Iaq0AkH0SKIF2xAxBca4gHe7g0cm0MR6oZsbJi1pOr
         Iv/4GIYdJzInnqX/CELKDir6h6CuVgfvj6rMgSU2xGCDxmAuW1GvSXIulrRyf8YVzQ2m
         XaPQ==
X-Forwarded-Encrypted: i=1; AFNElJ80zUlpFsqv8c/pE5TDgWqIsTZSzmp+NbwFbQfB2P1T/GE+KWONGct3dTEpQRjLUAHWdO3ND4TS7t8EHbP8YM9DBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxPO0h6cjRNDzHTwq8MJ+VEAMP95HhMQiSKQe0ufBaqBODyudY
	LtapRv2gs4P+HtcGMpY7zMk0nKwwKpw6S5fGeTv2EuwY5RtBb5dqu3cMFu2h4B09
X-Gm-Gg: AeBDievyQY3ZdRqpXXdvhWmRjUB0+sqFoyT9wzLsx638FCQ7/D7WmwmMOtYuOFG1SSt
	zpU6LRTScD0YIBbR9wcFOJp6ll9qG33PZWjRQkcyIvVucLoxGxdfxMoIBYxFahhqneHG4XIo0Uq
	id7funaHpERydhHyKF/pDLTphLY1AEUhvY+25sesK5KpAqICoU4xMH5UBk0+zL00MVj7W61VHyC
	OlbvxU+3KOyOqQyuIdCFw6L4u0py7Chs5bYlJhuuWiIy3QgIC6JIxeJJXTrNu46+NS5FO2Jl/uf
	vDVOkA0kYb4vqZLwzOzpEQ4ikfz+ncDOkh63W2Epz6ZHKKXAtkC+OJK+pFKMCFU2eIYIr51Ckky
	QZ6KqQrw97IoX8SJND+hjxRpRQttkhh98AiruY5yj4Vflj3hzTFCkEQomAbfwXJ4Nx+H4ytUpYR
	Z8/UFn7j8xXrgJFFJ0YhZPf441Cfu+2rWDWUYoYleuklaMGUXJGPaM9uOj77y2dYQtZK4c/zLgb
	qYUf9j3d2KbEg==
X-Received: by 2002:a05:6102:f82:b0:607:960e:aed1 with SMTP id ada2fe7eead31-630f8e765cfmr1046111137.1.1778062763038;
        Wed, 06 May 2026 03:19:23 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce08efbcesm9066175241.4.2026.05.06.03.19.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 03:19:22 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5675d609621so5814758e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 03:19:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8J4+3gId+UlTHt6ZFRfEzq8yEovO4k9v3luFHkAC15RKoglKvDcTqREkqDt4MEoNxEJBNw5PtkbZ6fZQJGKes4fg==@vger.kernel.org
X-Received: by 2002:a05:6122:3214:b0:56b:815c:961d with SMTP id
 71dfb90a1353d-5755963f49fmr1289109e0c.5.1778062762167; Wed, 06 May 2026
 03:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 12:19:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
X-Gm-Features: AVHnY4JCwkwAqaqLSNXuaf0ETjjPOv64a8QgXMobUA_baaUFwZots-RZr9ezKew
Message-ID: <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: clock: cs2000-cp: document CS2500
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: F2DF94D93C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,microchip.com,kernel.org,redhat.com,renesas.com,gmail.com,baylibre.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32116-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,glider.be:email]

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document backward compatibility support for CS2500 chip, which
> is a drop-in replacement for CS2000 chip.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

