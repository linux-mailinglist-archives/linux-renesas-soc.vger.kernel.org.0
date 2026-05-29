Return-Path: <linux-renesas-soc+bounces-33328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLlMMmtaGWqtvggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:20:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8925FFD31
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CD11302167A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 09:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0B6344052;
	Fri, 29 May 2026 09:18:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08510318BB5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046283; cv=none; b=jNzt0dyjkNG8tnLoit9lRguu3PtisCTy1dcc/IxtRk+5c+i/X1cvFB8k5mTezw2ib9UGm6rOX33pxE+FQGKIGbsNqGppiKzOdMfnBhcQ/xsDgV8P6+J78Hh3qmmuJivwlvWf8pyDgXty+l8xInlDFoVvXlAuYHMyIVxTdlCaH2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046283; c=relaxed/simple;
	bh=kYtLbUZvRD5QePWdGHp0WVDYoPyTCBDBRy7vdesLO3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eCvhBio9Jsldf0jKs9+tFmeKdouZMY2h7mkCq7BOJ4JWHMvnNj2fZ4xmNHGG0sxbDlaCrDwKF4w8onnD5XJdRSpfvot3oHyxwdHZJ3YPoEqmMGVW2PfCljPHYEB81CY7GhHVWO5AAArCuLrQmpbjs2Q724X0TSvZocumPYahSNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59b256c5fd3so197e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046281; x=1780651081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwHBv15OT5TkseUB+tc7tXoD4HnKtGFO1se+kWCuJgQ=;
        b=Or0ouvRDZAH4rQcgvnYVeQCnt1VRiA9gTnNs/ar+9/nmaaZThHT3VsCxGI8OkGB5On
         zndN2HIVL9NxXzsG+TMOHHPeaWTyvw07L6J0o06jr8sJPU0T4iP4do2rZ5zPvNuy31+s
         SptsUoPbji3HlbqsjO6FCMTwwSFTdtxodeNqktP3MhuKxbtrbCTpx7Gp/W5Qs/N1SGF4
         Om5yoRSi5pO8I8LqN/XjIcV5EJVK9LiaxiQRCNlDDcweEPL2ehzJh42tHjpFef5NUf1U
         QA4bcBVVNsS+CEHwHqVEER7XrH2X3pjTxlu5L0b/QEDfA8gEZQzRtnvbR/2CI5hIOSHs
         l65A==
X-Forwarded-Encrypted: i=1; AFNElJ/+mDHcYIy1vkPLUIQopIJz09TXw67WOW39TQ2lijl5aznwDXFy+A38ZSJtA4gwi17bmu+5o1NKODPKLhb2RJFFTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCFzzFi5QKGW4uhbG5VWkhVXjyjfDHASixug/9Xi2MOiActnqP
	7aU2bN3bRD0fxwsk/WRIZE95fMH/vXMXKfgKOswz3yBdEYWQywnRe0sbUmaa2XMwlFU=
X-Gm-Gg: Acq92OEIW938k1C9S8uzpLnF5VeLAJGch/FJlU41ObceKvgrY04shGCKD7YyGDmvEFQ
	yA44eMBE7veWWe9dYe1TSbDQNNkAq/1tB3eSPh8Bxxe2VuOF75g9UezuhjGtHIFa8kcsXH9nbWy
	IMT/NULFu4pcESLm6bfICRXnf4ChGBqN6Qhgo+VibkZpBr+INsGHJIi477p/0dbtKgVIhyjzFI1
	Wti5qOo2QSRkTwjVDxCJwi8Ox6p+qy2ZKumRu35Uroij3RYHkokgmOpAtTMspNcQGld1U/9rRtJ
	OJbIXb5kWiaQn7fPkMAtP7mvW14qQ1rex8QcogoCN49cW5ITuLB1yzb7WGde15Bwa4+sbXTVQ3z
	GCyuuq1F7c4O7c3rirRLuoCciuvVku2n48+RSg+/sPXFxWd6hc2C5lVLdavDfXy39gVKLYWFoQN
	KrLyWXaVLkDYxyGmfeDLRcDc/1Cii4hHx3/qri9zMXfP+G1C/UPu5LeTQ3uXpVjlzVs2U6rZc=
X-Received: by 2002:a05:6123:101:b0:575:3c93:fac with SMTP id 71dfb90a1353d-599f01514d5mr470928e0c.3.1780046280958;
        Fri, 29 May 2026 02:18:00 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d4957f24sm799698e0c.8.2026.05.29.02.18.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:18:00 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-961556c15ceso3245300241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:18:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9WWEl+TtHmv43IC3o3P9jLVpNLDoXD4ITGf8cCVFg7dD4tjiMRkiDpaKWgVTWxNG/9SLt1vAC0hM3mrZW4Vzg/4Q==@vger.kernel.org
X-Received: by 2002:a05:6102:5ccb:b0:633:8fa:19b1 with SMTP id
 ada2fe7eead31-6bf43bb762bmr656029137.15.1780046280143; Fri, 29 May 2026
 02:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528070239.33352-1-biju.das.jz@bp.renesas.com> <20260528070239.33352-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260528070239.33352-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 11:17:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX28+OpM0T22iJgoLuXS+F2oKih8sGxx9ySuzR=RUCWmg@mail.gmail.com>
X-Gm-Features: AVHnY4JqtqHJO0ps3n_Z4z8T2KGnf7vMdJofiS6JAPVhu9xbTRTYGd5mxlydslQ
Message-ID: <CAMuHMdX28+OpM0T22iJgoLuXS+F2oKih8sGxx9ySuzR=RUCWmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a08g046l48-smarc: Add gpio keys
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33328-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.979];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,linux-m68k.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5A8925FFD31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 28 May 2026 at 09:02, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> RZ/G3L SMARC EVK  has 3 user buttons called USER_SW1, USER_SW2 and
> USER_SW3. Instantiate the gpio-keys driver for these buttons by
> removing place holders and replacing proper pins for the buttons.
>
> The USER_SW{1,2,3} configured as wakeup-source, so it can wakeup the
> system during s2idle.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated the macro value for RZ_BOOT_MODE3, so setting the switch ON
>    pulls low, selecting SDIO {CD,IOVS,PWEN} and GPIO4 active.
>  * Updated comment for SW_GPIO4 as it uses a single-pole double-throw
>    switch.
>  * Updated macro value for SW_GPIO4 such that SW_GPIO4 == 1 would mean
>    that GPIO4 is enabled.
>  * Updated keys device node with !RZ_BOOT_MODE3 || !SW_GPIO4.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

