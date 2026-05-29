Return-Path: <linux-renesas-soc+bounces-33324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EKaFKdQGWrzuQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 10:39:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EB75FF51A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 10:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 55D88304EC27
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 08:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97C63B47F9;
	Fri, 29 May 2026 08:35:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5550E3B27ED
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 08:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780043701; cv=none; b=iow0mjpoTBdsFLOyNsRgMWBWnlCRNQqBIDsu2VS+DhlmCJFYTbIADRNt81IGOHU4khh0T54YOdC/5+SzIg0kypygvV2MGa1K1uzyNdJYy7N5yLQYDKIdE3tvxe7u8Le66QxRUg6LTD5MnzpHmPm9AK0/ZZLDussqpsdOzL1AEuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780043701; c=relaxed/simple;
	bh=ek3qk4m+/2gBxopYsug1++/DvNEbzXlTNyoVd3g+TaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a69W3NKfp8vWtwXkiZYzxsxcWYWUJ0///fVy8sc3fsdjgWEk6vn9SilYmxwS4keIEYB+Rf6+RXp76mZ3CWKp0W2tI8LfcAtQqYQ4lOhdXxGtFDIIypWBIc3scIMXB2mGr7wWcRAgb/ReLzsdtNnhlW2XJq8QN/8DELK7+SLZXVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6324ee4040cso5070035137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 01:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780043699; x=1780648499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Q6zzuN3Y1XcfvM192VXxH5bPBxYyz0/XT0mI+jj97c=;
        b=U0SQ4vrQloUyGrJIR3NMbhQfT54IhT1F3YSGzmsSjprMz7TQZm2PkkkCrWTGmVazjK
         SgqdXoW+A+05rPrHqPlZzpw1nHxECEZ7JbEslBgcWwvLE+smH54TOF2gwRBxVsMzCHVT
         roBc6kIQxZazZbHcfDnLTEMpm3NC+B36b7cgoQbM5RVHGNwsVT/ppEDu1vbJz4+RIkFv
         cJpfJcGRGGmr+5UWgvXCFCGmJ8wos18DcsL0h7m8tJizOdaUa6xoY2/Q+5yNaXh5BSSx
         ovmgY13vP+wcrlT515M77ajPXPMYBeZYWeaenvpkOFtf/PHWMS62Cdm9ZuU6f3lPwx6s
         pPyg==
X-Forwarded-Encrypted: i=1; AFNElJ+5uCTwAL3tUTJz28+O6Pygj+rXTsx21vQ2hN+DAevHIJSggYUapljHrfAvvAH9JkQepujIsLMuZ+s00CXIfFsoKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMGioBaOFbQ4s6f/mJUS6Pp+cvLU4TEun0yGVQiCaSM7XrfOTU
	SPcOHieNIa3/gBr7vIxFh9GEsi4MIBkbiFaQEu5qE3IFvFYkSaugx7961af9XJ/eS1k=
X-Gm-Gg: Acq92OHfUCLRfctE22O28mNBTRFw5hMIWzA5afIPCh9aMzcaD8h6i8TeKfi4+AI82YJ
	QBMMwDOizfBh2EAGwR2yaNL1zIZCRXSGHLvhJSE/w8ui75YagZ0rTIVeHgFjCzXRCc4GS4sIIuM
	BCVug5gENgObo+VkXXgYSFBqxA5wi2DA/bx5Pl+fM2okHWYnPnH/IcTTzeP1+rm+rrPOLULqpfe
	qjJNCNC0bvkqRgJmp/DY0M4CTsWcRlAOsIF+KwJs+B4FhV7Tue2S5xY4S8b2USq4/zLHzclIJiQ
	Xm5QScB6RpgAmGJg6foSGwbbqyzIZpqAg4fct4gUGTIQ8oVImDaMa7kig01T8qnYX4/xdf2fvZO
	N/bUC6MH+2eAM2kqYNWUqkRjqYFoF6vP6av3JLZWmWv0h1uYJIwws5hVQ2Yy9ohTwiNp5uCj2ws
	pSR0+FNs8LznLnzFZQJcqBLCVzdoHYwIit9Ug8VNpuBdm1qg8dP9CWtMVsXuI4QiWiryQR0uY=
X-Received: by 2002:a05:6102:688f:b0:660:d26b:506e with SMTP id ada2fe7eead31-6bf26483364mr653535137.1.1780043698969;
        Fri, 29 May 2026 01:34:58 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d9b2f2c4sm732285e0c.13.2026.05.29.01.34.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:34:58 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-63133de7abcso4412083137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 01:34:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/1BicsY72u/4aZPul9x0o9Fxs++Mai/nPVUvWuOg65dsuC1lN/HuOSCmWa5+cB/XyDHeXcNFFIh3hTFU04l7MbFg==@vger.kernel.org
X-Received: by 2002:a05:6102:3a0e:b0:632:29a5:2b28 with SMTP id
 ada2fe7eead31-6bf26482f08mr633139137.6.1780043698317; Fri, 29 May 2026
 01:34:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520132315.944117-1-claudiu.beznea@kernel.org>
In-Reply-To: <20260520132315.944117-1-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 10:34:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLmoOrx9+TngcOK7_M=oKgJRcxmPKGDetRe++hX2vDPw@mail.gmail.com>
X-Gm-Features: AVHnY4LJbRYzzzwKxtB5OZZtYlbRSFCPZZqg47A89j0pRjOAgDTOMrGCgSK8kjA
Message-ID: <CAMuHMdXLmoOrx9+TngcOK7_M=oKgJRcxmPKGDetRe++hX2vDPw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g044: Add DMA properties for
 serial nodes
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	claudiu.beznea@tuxon.dev, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,tuxon.dev,bp.renesas.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33324-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,glider.be:email,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 49EB75FF51A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026 at 15:23, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add DMA properties for the serial nodes on RZ/G2L SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

