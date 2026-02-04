Return-Path: <linux-renesas-soc+bounces-27876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WH9kMncog2kxigMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 12:07:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4470CE4E9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 12:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D03893031F24
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 11:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF043E958D;
	Wed,  4 Feb 2026 11:06:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2A63E9587
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 11:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203175; cv=none; b=Fsa+Ye0JfIMCAg4jUOI1CKsd1xMJn6u4MKNkAazTty1AbrmrrKXq2CQJ9Y89dPmLYhRXwWG8nb+pw/I04FEQPcvbTx0k4kGX5rcjayUY6LHiYU8aIfckwekQXmqjcTSNQ1b5Xg1PXeb7oHwScZO+rvp0axbAe37wtrv7Z99IK/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203175; c=relaxed/simple;
	bh=5NjCdT2nrZpZ57tNCtFV9pqandhyrZegGdE4QFBLja0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XglsBujgjGMz4v7m/LhNoFYvOR+po5BPQeq8HvtKF5JrlyvhBbGV/WKlo71CE05klvMooqI7HYd1Ra0xHslLrQR2I6Lu4w95xfXN0n+msXvY/v9G7Y5YIj2xFQgqH7leSwpHsltHc90SzHY0meNbLix8avo3L65R6sSH4zOugRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f68.google.com with SMTP id ada2fe7eead31-5f535ff78abso4470421137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 03:06:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770203174; x=1770807974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzWstbsnnDl4kKhiGYvS2ziV+JALL5t+yio0ugwGnmc=;
        b=vf5x/OSMYffZvx47BLHrF3y4qkIcP3fbpN+Pn/Mg3SA6SShTOGuspg7jaoFG8JkkrF
         GthnylzdKYuI1nBqWCVL3f+2prRACsjrjADi9ZNTGxTkjgD8AEm1/M8P0e/FH2CUpYBr
         D3PCsbafPbN4m41BQA92J/yLdrwni1dAVG+q5z/mTTKS5SdAPA5w5kolll+f7/T37xMX
         lMbAHCb10W5ctn0J2ASGAShOn2gCEELalNwjWp0d0Nmh26CvM8BGap8T0lqv/ZQsSGGx
         YiOzOUOZ+97UBHj3tU7j4gfqUDrT4CABw+VzjIQJz9QqZVOkMgQm5fARo5Apxj3cb0If
         lAAw==
X-Forwarded-Encrypted: i=1; AJvYcCWH5Qc0v0/BRPPI8n08t2P6IhcIEjpLBkAbRO9/5LERbnZJhLfoynjuYQCiFp4VhVo9yBYWpuQg6ydT7U5azL7tlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwotKloC+0KF+oN8ZqAc6QskxxEQTTEhjwM90Sx9cRKeOBRm51J
	3Lvu2TGVLB69uq0dQr/otxowgu3xZlpnh8stt97g7IHaN5qqEF/mfhN6gsyaKXkFb+yY8Q==
X-Gm-Gg: AZuq6aJwvyUDLYXFfRfRmzOO7PUI4cCGl6zx/Vm2QtHL4+T82N1RaGaEHKyu79Jw1Hd
	oAuu4y+Xm0rqDsNKWNmRTPrS2n7Z0+uvVJwAVAsZMgkIX/FzccmX9N7nt+LQ5u+APAX/wYeT4r2
	i63TTDb/02zdeMAJrzM9mxG6wXL9iqU/wm5xsyfAQGWW0qkOmFwSeY0Yr5E30wEowXn+X6aEqw6
	AFIX2K3lF+pfurPt+iofqZNSQ2b4gxYfHqtMAVsgcyYD6e48QWkqNZwFDjvRJDmupsorZ+cnQJj
	FqaXXsUc06ExP0sfta7YwkPqysZOGnifB/T79XnlXUp6/Dvb8jSFWxAyXCNOFRZNFSPaYgSJyCY
	A5PBdBl+I6AiiwoYgxJ3rD/cdXxvTCXdPbmahXtYLPbpNZVffIS+4RpQOfd7Ic+k1Zizj4mkfZE
	QIG0rPZs544YmSBIJ6CjGxNZowp0r+HbnDBR/w9VpJxFyYmGl576qKY3y9aICKGvg=
X-Received: by 2002:a67:fe16:0:b0:5f9:3a22:a033 with SMTP id ada2fe7eead31-5f93a22a168mr697793137.11.1770203174363;
        Wed, 04 Feb 2026 03:06:14 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-948dfe89f5esm660629241.7.2026.02.04.03.06.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 03:06:13 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5634feea416so3629593e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 03:06:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWERMMiIjoEY9JhUb4oQMBSwYyW5SvCn56d9n/6AVvV+3V91WK7HA/VhSpOFf+dJa2uPuerkNIWGMd2NyrsGZCvYQ==@vger.kernel.org
X-Received: by 2002:a05:6122:e46b:b0:566:3954:f74e with SMTP id
 71dfb90a1353d-566e8019cb5mr725526e0c.5.1770203173020; Wed, 04 Feb 2026
 03:06:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203104541.264759-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203104541.264759-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Feb 2026 12:06:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVpgzDAChz1M=hbVZTeHVKwiprPwLbe14nLKc85hX=ZTw@mail.gmail.com>
X-Gm-Features: AZwV_Qh6HkVNb4BuqrGcVeKvsm8YThaQh31Q99liNk3PJicgrK2iH6IUSxwO7xo
Message-ID: <CAMuHMdVpgzDAChz1M=hbVZTeHVKwiprPwLbe14nLKc85hX=ZTw@mail.gmail.com>
Subject: Re: [PATCH net-next] dt-bindings: net: renesas,rzv2h-gbeth: Document
 Renesas RZ/G3L RMII{tx,rx} clocks
To: Biju <biju.das.au@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27876-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 4470CE4E9F
X-Rspamd-Action: no action

Hi Biju,

On Tue, 3 Feb 2026 at 11:45, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> As per the RZ/G3L Hardware manual, CPG_CLKON_ETH register bits{12,13} are
> to control the RMII{tx, rx} clocks. Document the rmii{tx.rx} clocks for
> RZ/G3L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Doesn't this need a Fixes-tag?

Fixes: 3ac2aa31b489eb4e ("dt-bindings: net: renesas,rzv2h-gbeth:
Document Renesas RZ/G3L SoC")

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

