Return-Path: <linux-renesas-soc+bounces-30255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GfpB/P0w2lZvAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:45:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 43577327017
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD57130BA888
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672023E1222;
	Wed, 25 Mar 2026 14:29:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044ED3CFF77
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 14:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448980; cv=none; b=oiqUgypW1g63e1S+ywWMmooIaAKgj0Nu+RNwkC8AOzgaKzFakGk7Q/Ve2nbY6sCSSB85WUQMkhnbaVbJsiClEA1W9FC+T7kdv1rZUwEE17cKhoJ9KtcZ2pIjUJ9hRCqru765icP4eWEX/kk9iV/mSUtnoD9NQGuuxWOzZuxHcBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448980; c=relaxed/simple;
	bh=pC3PtyrMmcEpGp+hfMhfoNh9MzNjqP+1TIbBKnXeEMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SE9fx0s34pZzb9UxCoFydISk/XSM7A/M/uMUELcSUWQ7A06kl8tB/QoIXfCHKcGtTTH1INQQN6AdXqRojSC3zjXA91Ly/eglDX+yIj2xbkW0KlNrea5c9+ZHVVZKZdYObsHaDvu/JW0F70f4akSw8sl2LCdHuL1nAQ6gxWkrcEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5675d609621so4993567e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 07:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448978; x=1775053778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7isK/Dbl65EI3Rm86FPt2M8EyGlg1PW9pqCn5jlwq8k=;
        b=cwPqsdtfH+YTqV+RDhEaE5DyHsOd59PgaDH2ZX1XKDfTimzy1xBI2Q1/peDJoIYS05
         gQEpMtAKk2clHGMx2Wpq337CKIDKuc2bOKoB40E8NRNJP+ib+fGVcoDC15FdAY/pUIAe
         DaM8QTM763rrm0qoXivHSqjfuzjCKQL0MAx3+l8V3i8NUeJeCvRV30U/K6urlt1O4fRT
         c/S/nK4WVDIpwIIGBVNm0N5xOhohVXUwglI7GgHaSTQ3U3X1xnEYNTV9pKFXa42DwGTH
         kpXDbZGtJXYMZyS64qRd0kfET/nsibbNOInQWL2wYKYikMNKGrhbhiJeWZdIr8E8Vxw0
         U4aw==
X-Forwarded-Encrypted: i=1; AJvYcCVN2pT+2KdciMdqVicXek6uHOJEwDV9WMlePgrBd7wChzIeeB0gSPsCaBfEEKUI/1x07yqXdIcCHWo1XtW689sz+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz/42HcLYBtc299o80dY6r4oVjZ2PV6SCni6d9CYnWWEud3wP6
	hwwz12knwmoJvq0WgKdS3c759QYkRbA1I8/GBYPcmylFmgu9UMTbfcumNprDIsDBxs0=
X-Gm-Gg: ATEYQzyDY21z14lR0aeRfNWcEohMdcV6Q3LIS8sMwMnafkEko0ia5QbY5lJHrhyipjS
	3AbQUD3MM4uigjsrqWAfnOhQKmkR9/K0wfcpBOrFDqRwmnyM+zBcIATkdwq2vVArY8Byo80ug0T
	UQeQHqKP+GQ1XLSoQjn5UW8LiTE/Ek7wFQvMYS3VZqxoI1laf3XumB8j7ABn8SpAjimX6OBvrhE
	HiLPh1SuuQJntQQPrKfNVn2j9hULc5qGeU4WXRr3lcpGdFjFHMzNcz95ab2U4Ea0pqXPAFZhVP3
	cghANIbUJZTDjnoCnIUbXoM6ghdqC0hUREnSYM2+ovTVIlD5Cv+6U0LMGJ78apK5/6TzkZmuPv1
	pZaIouICYqTp2wrAW+/oRm4MGEULTIjUc8J07I+WJBdI7Oq68l07AeV91gEuTLURIrbqXF7HtH7
	TydtB6ABtljr3qxivIutqNJWdjlZliTiMTiIpSVMnVGA28s3qt6ZE6XSLSuKGO
X-Received: by 2002:a05:6122:4f9a:b0:56b:8ba0:fd6a with SMTP id 71dfb90a1353d-56d21d07a9dmr2121510e0c.0.1774448978012;
        Wed, 25 Mar 2026 07:29:38 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddcf1554sm20900274e0c.17.2026.03.25.07.29.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:29:36 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6028bb29cc9so3858543137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 07:29:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZgHloRXSi4/OJgQK2t0pClcXFLNtPfsAjRBNgsV1jF+yA8oDNc3vfVPnFUYBoTwAkx08FKe3Ka099ULxyGYsOoA==@vger.kernel.org
X-Received: by 2002:a05:6102:4bc5:b0:602:7627:6c4f with SMTP id
 ada2fe7eead31-60387238034mr1950349137.17.1774448976166; Wed, 25 Mar 2026
 07:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org> <20260313164008.40933-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 15:29:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdViXzq0H0UwZori2gh2Tcd6o4ssoGkXmJfFFwiL5AwHwg@mail.gmail.com>
X-Gm-Features: AQROBzAzZX42-SVVM7_zKELfgnu5iQhGBNJzdGqfYMua7CEfqTRedVMpWqUArVY
Message-ID: <CAMuHMdViXzq0H0UwZori2gh2Tcd6o4ssoGkXmJfFFwiL5AwHwg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: Fix KSZ9131 PHY bogus
 txdv-skew-psec property
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,bp.renesas.com,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30255-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mail.gmail.com:mid,mailbox.org:email,linux-m68k.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 43577327017
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9131 schema does not document "txdv-skew-psec" property, neither
> does the kernel driver support this property. It does however document
> and support "txen-skew-psec" property. Fix what is likely a copy-paste
> error from the matching "rxdv-skew-psec" property, use "txen-skew-psec"
> property instead of "txdv-skew-psec" property.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

