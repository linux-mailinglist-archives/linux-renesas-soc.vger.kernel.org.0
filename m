Return-Path: <linux-renesas-soc+bounces-30215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGVBBoC3w2litgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:22:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 023D8322D63
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F9C33041670
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEA03B2FD5;
	Wed, 25 Mar 2026 10:17:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03EF3A1A4C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433823; cv=none; b=CDZ/rCPDP3J2jN2+imvjiqMlcHb2V9VFAoGBnwliIbaRLEGsNgT545PoQtXTjgkXrNA+JkEZoPGEgbPvJtHIYP68l8sc4fjG6qn6XGU+OFjroRCtgJx/fyXmXpnR1QIkb0GPRSv6unqSetInKS3e57Wa2AUXDl9wVZiR+dWs40E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433823; c=relaxed/simple;
	bh=62igCHF5603h2cDAAalhEN5a09CaNNC/4Ln4C74bl7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukQqhMPylbmLr+X/R8wwARTjYV4cjDoMbC7TH9IAj0m9wyGpkAeTTVAhdCUiaKGGgqoZ+SizxLAnJ3KvdPhZTSjbPnZpWg8gErdQpwr0NJh2EsUCDuOvFwI2mrjG3nRX9Y7DMjDnUWjCFMQ5Y9H8R3j9RHu93EIoXxWpg6e9sII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5675d609621so4805998e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 03:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433821; x=1775038621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTLtnGl1M6udnRP5yuu+s9KqbRSTNVgcMGsOu4/hFHA=;
        b=QXt8W4BugdjgUJCPsKw/HrH3ObD1myIw51aHLSdg8zPf3KwyUZBNV9AinlALwXoLB7
         ICo6Mi9v5RYd2VSPBRravDqOp4de3CHI6/9nHolr6MckOh9f4XWNl2o8ipvk66Zrf4TJ
         fRqekC0YjFrNUusyXtuUaw/9rB5Lb7MJwgBtdurdGhYiMPGmaPHqe6r8fssgJv82fX74
         jPiS9kmI2JRMThRdF3J+lrDCMrNunWPowzK6JNG9Z5t33jMJnC5yOLZtE2Qc7Bc4Xo/k
         ZdZNDZvVlATawtp/Ulh70gRvjzH97ByWiaXDxI01zRAsEtU8MUaZzvhPsfYY+CIz7zVO
         f2xQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3twxiX6tvdaSVqBemstOM/VzYjPYJmTXDMXfeTX9EYjEqwyRIqNB0LQI7GnvG+a5lfx7Kkdj4SCBP1t2+K59tyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCR3l8qcQScC7kdkgYk4IQQVGTaLTb7P/Sa9Nrw9TWF7eqbHrn
	Aapq92tKPwBcWD8Ty9xGb1mrYxjj7cG2A3mND+9ZUmWhFHFpKCRqJTQxx9/J/LJyza0=
X-Gm-Gg: ATEYQzxN9nyytWHH34NmYzP+AbmDr6hS3jwmslDyVbUbvllb5S84U7H+zzI//dZiMbo
	qDNjMSz4ClhqtO2mCR5/yFRhGUkYCTmg1Fwc/flYDeSIlrd2oyogmK++0VrPAbQsgfx/KQ6Tx4U
	bjt3NQ/ADx0qz0TWXS+ZEsqfdusKaBCFgyPvOYZuOva36BPk3Jy+4qQJR9D8kia5H//c1DF6weV
	l1JXk0mkzhPN2p68efSjOJijpRugVEFR/mLovGT3aLZqg4pUHkvtksjholM/sli9wJxNSZLdDeN
	mgu+9EUTHtMd4uwmQrNCgVJppz8a1ljyQu/UcFnJE8C6qA8oGGG4UQ5K35UFwOoJizgoqR2gTPV
	nCIEkYNnK3/HnSOEHb7TghMubxQtNjSCVSb7muQT+XreuDZ0haVUdHzRHYYC9YvMyp4Cmvkebl2
	5UWt9p3SqEuXJH8+BkVhBeUUl/0MFnt9fDzAZBncJRqagY0SDcrB56tyieDqDr
X-Received: by 2002:a05:6122:8491:b0:56c:e871:31a8 with SMTP id 71dfb90a1353d-56d21f9cb8cmr931946e0c.7.1774433820719;
        Wed, 25 Mar 2026 03:17:00 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddc7f750sm20373888e0c.11.2026.03.25.03.17.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:17:00 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94de88e52e5so3763035241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 03:17:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgkvjUL+SFYhBGNFl12Ws8YA0r5DEy3V6rw1ZY33DV5wzyWnY+D9GPnkMFizJwMM+fZEWqvwgjgV2ccSto+rbAqg==@vger.kernel.org
X-Received: by 2002:a67:e705:0:b0:5ff:b684:f7c5 with SMTP id
 ada2fe7eead31-60378fe5973mr1555537137.8.1774433820077; Wed, 25 Mar 2026
 03:17:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com> <20260324225239.19136-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260324225239.19136-3-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 11:16:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVEtjDMfzo=ZQig3+3eYa=vxkAx8cHwxdmC7L3kTdS+vQ@mail.gmail.com>
X-Gm-Features: AQROBzDiB3ZNSpBoCH-0zzZh64dFUliOdmHE4q1JciSR7WAkrsj16jKQbjIuw6U
Message-ID: <CAMuHMdVEtjDMfzo=ZQig3+3eYa=vxkAx8cHwxdmC7L3kTdS+vQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Remove entries for WDT{0,2,3}
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-30215-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 023D8322D63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 23:53, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The Renesas RZ/V2N SoC (a.k.a. r9a09g056) comes with 4 watchdogs.
>
> As it turns out, it only makes sense for Linux to have access to
> WDT1.
>
> Remove the clock and reset entries for WDT{0,2,3} to prevent
> interfering with the CM33 core.
>
> This change is harmless as only WDT1 is currently used in Linux,
> there are no users for the WDT{0,2,3} IPs.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

