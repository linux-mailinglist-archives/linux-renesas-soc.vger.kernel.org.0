Return-Path: <linux-renesas-soc+bounces-30423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJW9AipIxmmgIAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 10:04:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7C9341734
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 10:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3C39302D0A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 08:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E1D3DA5DE;
	Fri, 27 Mar 2026 08:58:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7483DA5C8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601924; cv=none; b=Z3E1rSz21zp/03HsbB/HyGpo9rz3uF8oeDSQ2JH5vTKys7Q1OUqP7twtHsAXxcsD0hY2kZ6kr2pOgJVL+wF9yaoQb7sOMKuo/bk6v3Mo8IR4NNOSVwjdWr0XTozK5wodX+zYpYm5svO8mZGGAZ7yKdwYJjDopbagh8yyeCUb4WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601924; c=relaxed/simple;
	bh=9eBJ+rLvoPYL0juBJf2hbQ+0ADpXvr1r9kf9+5acKxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R4KSc0fzTCP9746PPVPGTHTKeu69LGcueEupCe6FatMsf5K5GRqkDxa46KIx5h2WDdb7E/YZ2ptz81rXWJjVTgB/0cGCGUHLIjZwGNTuzFTKsJRNWq6MFbhLoR2VIg/fwb5bvWTGc0qIZB7vC9ufgcEUOmBuyzVpEyY/N3eKxLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56adf76631cso908747e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 01:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774601920; x=1775206720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQ6H4EuAGDMRYfK/6DhwFkTF5tOZGWN8+jPb2MdRLyQ=;
        b=j0c9AKVqtL7re2266NcWK+PaCOb9uFOVXwLpfdC3WPLPTxM+78sv2QMYggxZZ/zt76
         v5r1VVfGDFnawh6kve7p2GtZiFQ0sGPNnogb/jZ/zAewXe9zH6B23vMxKspZOP8swhih
         3hSbCE65OeCfZE1VxUDlU+AnmExoK/dXyXby6+YZYCylWa8ykeMjsgS8RXcWttyuKLFk
         uJJ4IldeKKttk2hBcaJqaW5uViLsDFKxgD84ds7qSv48/PotD9VUORDMw8YG/uIJYeHn
         UlbNC/01a3r5iFbKiBMGqL+W0ggRY4LOdoLOxFXDjJONtgXzd+QLyQ5P8jGS0iLrMias
         d1iw==
X-Forwarded-Encrypted: i=1; AJvYcCUvoDc5Ka75v08RPIhgx/FWTm/f46mcXlnGisakClVtoV/qzXaxtJo/t6fgEeEGGnu9UkNGhAjpNE9fZHh6PkqgGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3L4mshVCATcPTSxHo56PdUD/N1a6m65p/Ey+omY+dVcO/DvZE
	MITh0yNV4KRSnl/Or0HNULR4Kb5mbjIY8oBeAskZ1+Z50zNX5rEd5fMjSu80A52O5ms=
X-Gm-Gg: ATEYQzx5CVW35OSYJHIx8jwvBGZ2pca8hZ8VgfoEkT1jX3nPqFerpLyLnorzqhzYq88
	eBstPcKERmKIZbL85z/pxbCcxifGFap1Tr+I2d6a0UA3OVEpvREVqQl2kdUaqMo2EUQ0egAZt1n
	qG9u0f18OSYH9En3AvlZLVeEuwUU3ALLDLSqBNPbPCY+n2RdV97E6kpk+wAecblj/srrn9tJL6P
	RnnWAoWS+z1rJCzEkdhdCxZSw9h1dJMzJ6xjwIuZbdVjE7vcTQaUJDCKqqeFNgxwilOniaPFIDk
	kKvZDi7XSxj3xH/vEKNyBCqMdHTSZ/hkYxSOuGPyHB7hMeYcTJhWXUS+r+Q+UCsQWiJ34SDusoS
	M9BJNMMIuqZhXTKanhG+1eOSj7u9h6nG3Dl2m+2OPre7dHopBGQ+aS2B9kYDmVEUWq9yGFgH3ki
	HOt+306EFDzCcOt0+TQHbhwat0FAdgKCF+G/N8j1fmNqwytipAqNEwHgCap1fo
X-Received: by 2002:a05:6122:311b:b0:56d:3c26:20a8 with SMTP id 71dfb90a1353d-56d4a4d2c9dmr499623e0c.3.1774601920261;
        Fri, 27 Mar 2026 01:58:40 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d394fcsm7686288e0c.12.2026.03.27.01.58.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 01:58:39 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ff05af29b4so729359137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 01:58:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwolN9pL5IpGu++OWBqiLmpDAgiAWM1JtlsY2b31KECpWQ7MiLneSudne6TEKO9cyWQ0V/TN+klBwELG4R622cbg==@vger.kernel.org
X-Received: by 2002:a05:6102:3c82:b0:5fd:ee19:8b30 with SMTP id
 ada2fe7eead31-604f936fc1cmr564249137.35.1774601918808; Fri, 27 Mar 2026
 01:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVtea9q1Yoaq1sEquxEAnQ-armLRdO1cMtJnp2K2mYtOg@mail.gmail.com> <2ad69ee6-9170-46dc-a963-71f327192bad@mailbox.org>
In-Reply-To: <2ad69ee6-9170-46dc-a963-71f327192bad@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Mar 2026 09:58:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=7uzaR2Zj==STiHEfqNf02vpEOOdwJuaqpzdxh_Q5-g@mail.gmail.com>
X-Gm-Features: AQROBzCCf0IPvdkdR2ssvnnJ_xpvUSm51aZ4644j2VSJYknbtlruA69dvm0rnxo
Message-ID: <CAMuHMdW=7uzaR2Zj==STiHEfqNf02vpEOOdwJuaqpzdxh_Q5-g@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix missing cells and reg
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mailbox.org,lists.infradead.org,kernel.org,gmail.com,vger.kernel.org,ideasonboard.com,ragnatech.se];
	TAGGED_FROM(0.00)[bounces-30423-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mailbox.org:email,0.0.0.1:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.2:email]
X-Rspamd-Queue-Id: 8B7C9341734
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 at 21:40, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 3/26/26 11:07 AM, Geert Uytterhoeven wrote:
> > On Thu, 26 Mar 2026 at 05:24, Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> >> Add missing cells and reg DT property into DTOs to fix warnings like this:
> >>
> >> "
> >> arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> >> "
> >
> > All of these are dtc W=1 warnings, right?
>
> Yes, I slowly started linting and validating the various DTs we have to
> remove leftover warnings.

As this is about display and camera, I am pulling in some multimedia guys.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

