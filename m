Return-Path: <linux-renesas-soc+bounces-32854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDtzJit+DWosyAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:26:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3333C58AB8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B1AE304DCA7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0253BFE2B;
	Wed, 20 May 2026 09:24:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E183C0617
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 09:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269058; cv=none; b=IJsUCrZNBnjHwxCMf2TSTXMr+SndFJHNqwjA2mNCXDRmD2qFMQjXmM206JUpOMfaetiO7LkXCZnEAE/r1KxFBMzx6oJkmQMHiLQMEYgBKuU+cuL+i1DeItfqlJN9ufzycuTgntCt6/A9FljzoV8K+wFmTLPRbMqUvcpfiAXlO8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269058; c=relaxed/simple;
	bh=t0R7qCOJA+kypC4pLNsFX7y7i6Obkil8w8Yp7ar07jU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWwr/Klwtwtl8ZHVzvYDlQokW+Lh7SBxIasvALB8TzSj9jV4lRX10PqUvK4/GVib3AIzTzH9pOc4CUGgdIZxKGzh4W9YeigZj1DOrz7jRuRdDDTuZO89sCmeG3VuczXYWA+xkpwwztg+xDrbwGU6v0XegM2g0DbuTyOM7LZSr+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-57512b86273so3405672e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 02:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269054; x=1779873854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWlK525gobXa09fkjsvfYWkLJerETe977EgEuu7dj3A=;
        b=SaPdz1ejqyAS4hIXQDiM848GecwEGI9D987UkjwCaE76mQBME8mMFsx1PEX2sCVmed
         yUkuT6f773zkvFVfinpVBGoelNrYfBx/ACtVxFYddk1jumWq3eBLsPjdVm4Mai6Yaoae
         vO9WI4SCEHePP740NWPm2DRe7IeKJjUPxUv2kpNBuIA61UxZF/kCNDLGB+m9eXeIw3pS
         fpGtAoVaFfbNFEEOBVs0+vrp2ayhxFxgYavEhm1ixIwfslLvNL0oPoJ0UfKt40AiwGPS
         EJ6Gcg2KrZS7u3xNaqZ6G8Nlx40My0ZIymSmQAYL1ssWYNEYDm8TEiUWBxD0YRBEIvMw
         JI0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ymbsY8rB0i54RrSPcG+w5Yq7IF8+oojU1qZvEofo0ChQbCF03BBl1LEK0GUfTh0Fgpzt8+eMkXhpZGJ1Uy/Q3xA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8KrLiKDojEoC0r+W2Ed/flj53zFDH1riWxdhqroyfcLvSrHME
	+nogX81gYG++5Y6vNAihDikuEqilxaMZELMeWPK86n18s/w43zmEmyijSe+5Bf8c1UY=
X-Gm-Gg: Acq92OHqHTA31z8O71aGjLvnuqzOKXoAcVoEwHBC1zDeScOBo0Y1HxGaXTd1vdczNbV
	EwZlM3sg3cw6wSAxbq9rfDQXHt/AJ6bb96ekF35AeTefC/FslnetXegV3mcdN/I3vS8nL6k5IMV
	FL7/K/VOCBm1w5bErAWAYfusQey8qL3gzWVVjQvAff4CB6bgtoLg3I8mUpJRXcCFWlFg4W1SZuP
	QD6EYP+v4PGJE8NCy1h/ZT1FQ3xC3c4uy60Vla0MG6UOzePYtnn0VihDQ8y1gAiY/48A2RyIqPc
	aJOdNrynk5PptujljENqSXhn156J/aUXaODpnjX8HuSxA5yJiNK2fBUGoM8bYanQAkO/q1/fBMU
	FFctTBcq7k/tRCKv9Uu6JFzsOmHbuRZwBy7myVcXVbzXimBgy30CFf80VrCMv++2VrPq+36vKIC
	1yaXL1S8KpbimSib7NmUjbH2/W/sk9OnxbGC5kc0mVl9az5KkUxRQFaKTt+8oy
X-Received: by 2002:a05:6122:224:b0:56b:815c:961d with SMTP id 71dfb90a1353d-5760bfebc46mr12793887e0c.5.1779269053791;
        Wed, 20 May 2026 02:24:13 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760f3031b0sm10733255e0c.0.2026.05.20.02.24.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 02:24:13 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6312d29596cso3411597137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 02:24:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ88XzDuz9SCjyv0g7V8d3RtSBGnywJCRXmEC0ry6a8SFQ9F+qzuo/UkDzvetvVOC3rlWqMTAMaig/HYli9c2l2MZg==@vger.kernel.org
X-Received: by 2002:a05:6102:3752:b0:631:81d6:e153 with SMTP id
 ada2fe7eead31-63a3fe96d2cmr13359189137.30.1779269052807; Wed, 20 May 2026
 02:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520091638.68370-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260520091638.68370-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2026 11:24:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDdS1_69+36h=HRKGvbZQ9j8_ma_sFW=ajXy=sn1M2Cw@mail.gmail.com>
X-Gm-Features: AVHnY4JncTFJPC2vXbJQCCFkFYfP6cmRpG6koumSuxYI6KHadzsWv8rM-ius6wo
Message-ID: <CAMuHMdXDdS1_69+36h=HRKGvbZQ9j8_ma_sFW=ajXy=sn1M2Cw@mail.gmail.com>
Subject: Re: [PATCH] thermal: renesas: rzg3e: Drop stale syscon documentation
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32854-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,glider.be:email,linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 3333C58AB8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026 at 11:16, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove the stale kernel-doc description line for the 'syscon' member
> from struct rzg3e_thermal_priv.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fixes: c33edd8f936ccf2e ("thermal: renesas: rzg3e: make calibration
value retrieval per-chip")

If commit bf746e2a41efd986 ("thermal: renesas: rzg3e: Remove stale
@trim_offset kernel-doc entry") would have had that Fixes-tag, perhaps
it would have been noticed that that commit removed _two_ members?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

