Return-Path: <linux-renesas-soc+bounces-29722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEDENUBeumnFUgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:11:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E148E2B798C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0A244300B28D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9847536CDE9;
	Wed, 18 Mar 2026 08:11:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675572DF152
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773821478; cv=none; b=RR92P9tNgCMQ4v5s4ZuHnkNovwzuU/F62F4ci4qid5DPZk3jmhgBqTi0D/B3EhKB/objHOvztdVdQYPK3wv8YyHzyJQZle1fA36Ov5An8CvZ7LhvC0n23MxWLt+PZUeziDTKHHkqByZXLd8DI8CN69f1e79bmN2G8XReoL3W3+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773821478; c=relaxed/simple;
	bh=KAICH7AyRNLHyx9na4VNik7GvrikW4tPpi3l7+AtXfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwoFSoYZcROtDut2YUSqHTmW1yX8fg5EREWHQdwlGuuhzq6hI3v8mp1z7ehH5XKLhaH82ioYeC1n6F1YbH15L+hhJjVivhj84ptILxDSlRKWW2kRl98qSloprE97UzppjTIlo3bP64Va+XaYhs8uN3Fui1s1BatFhOixiZGTKDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ffc6a96602so1315790137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 01:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773821476; x=1774426276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLFVo6AiXNHbx6lUNUpPWDsgWE1jK824gYrpCYtdfM0=;
        b=rMySihN0aZA4YyiaiHjAoUYcNmvyfDaupI9DmLL/6jVl0TZEGMy2y9ek/Kk7NtkhGJ
         xyX6BSKUSSdSNXdbvLTu3rlj+j8uR11s+RRoQVcPnLfwx10xKbqt8KLSR1VEy+C+/tdM
         0lt07Xx4EjCazb7zGM6dWrGDqh1K9+0vzwB9LvOxg7/EB2mQaRVISD5nyzZCCQSpA+E7
         R+rRbA9S+mTnl6CPf8Lvg4v50JikWHv26ucWtaLlV2SxWeLQLeVD8TRR5i9Ctk37zl9q
         CkLICWZ4jJaxiUADjnyn94P3K78HSOkow9iL/+splGZgVXv7yWwoelisk0cAXshlPFx5
         aVMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBYpnOYxwIEyIS+JNVGh4RD+LDdzzPyEWzHa4wSFXcR95mibq5YlGJPlM1nPsPJTC7xvx/DlFw3CXwI4rZWpH4lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxbSBxPye/Gdex15iNJuRD/MMakC9+a1rR2rM01+YebRLyqayZ
	ekOCjFvO42hIvk1ofovy4LCx0IySjmIOl0XZ2wqIcy9Sx+aEKTNkQAdt3RfmGxBjdYY=
X-Gm-Gg: ATEYQzwDn8US5vLaVIgMbjVc25NLkwT/5nBfWbZ1qoHpWl0BgS1AQzbwLmpfCkvtacI
	fpt41seSJAAaKxz2zQiWQFOxI2ue4IC4sZTWy6ErwzOoOpwffIl1UABRTapjL4S4nRvMjzdkfSq
	Ba+Z433sd+qo/xmwtIUwABkw4rkTHFWMcArLsryv1KotCPU4a+c2RBZXFVKijPBNO8QeVImkvGG
	AzRORHJ+YAlZWoMhYQAiiuERwVCXB6iwu80pan1lNgrp+JAX6OckWZv/tby3km3QOuIfjl+tS/V
	zjzIqkrClaeV3vTsBdM+Zghto7GpT6k0hnMc2lpZ7Ot7PCQ1BmjLf9ibXKgCSV0AMmlq3J7KN0L
	IftfDesC6bYDVJrDdt/iuMT/6UTmnaFSy+/W/jeT1OYk1xd96xs/IutAZLvBJSywBmwSn5X6/Sh
	GNqUL8W0B5UoOwbFdfGWo5G954l+F8+ORfsW82wWVUIxymPwrF00MuoHqqV2SsNZWg
X-Received: by 2002:a05:6102:4447:b0:602:8894:b779 with SMTP id ada2fe7eead31-6028894c33bmr196943137.14.1773821476250;
        Wed, 18 Mar 2026 01:11:16 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9510325d85csm972237241.1.2026.03.18.01.11.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 01:11:15 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56b679e72d9so1973288e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 01:11:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXeDCQaokCv9Fg2K+uKreQFkgB0Ub5dLfkiMJm8ARp9AQjdohVYmt86avyc3lfg1ZFEXFHpmxR1gAQdIFyMpi4o+g==@vger.kernel.org
X-Received: by 2002:a05:6102:945:b0:5f8:e323:580d with SMTP id
 ada2fe7eead31-6027d1284cbmr1153417137.11.1773821475435; Wed, 18 Mar 2026
 01:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317194442.468147-1-biju.das.jz@bp.renesas.com> <TY3PR01MB11346876072AAF91064B2700D8641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346876072AAF91064B2700D8641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 09:11:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUiomf+6O5eDUBAt-41D-Lhvnda7w_bbdj-EQppapjdUg@mail.gmail.com>
X-Gm-Features: AaiRm52dBzFdESjaYAuu__pn42Q-OWaaQ-EFK2jgv-IViv74in_nOyYaaSxkIRo
Message-ID: <CAMuHMdUiomf+6O5eDUBAt-41D-Lhvnda7w_bbdj-EQppapjdUg@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Add support for Renesas RZ/G3L SoC and SMARC-EVK platform
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,baylibre.com,glider.be,vger.kernel.org,bp.renesas.com];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29722-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.626];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E148E2B798C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 17 Mar 2026 at 20:59, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Please ignore this series . I missed to addresses for Patch#4. I have sent a new
> version[1] fixing it. Sorry for the noise.
>
> [1] https://lore.kernel.org/linux-renesas-soc/20260317195650.468330-1-biju.das.jz@bp.renesas.com/T/#t

You have sent two "v4" versions with different Message-IDs,
which are treated as different series by both b4 and lore.
Please bump to v5 and resend.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

