Return-Path: <linux-renesas-soc+bounces-30918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGJ3Fy721GkjywcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 14:18:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E47753AE369
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 14:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1337B300610C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 12:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69DA248F64;
	Tue,  7 Apr 2026 12:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rICtNVZH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87466397E9F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 12:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564330; cv=pass; b=AjcBEolYktk4YSbOFGg7viE/sBQG7KV8jyuNX7SNDGQJvQH5dS5F0HD9Ss8yeo9Ok0enEPkmiSWBsPoTS47SGJn/GImhKNV4exAvEFJAm131N4eYewPBNIEsSBS13DlnM4Dvisldgj1LsycuyPJZQSjrfKH/yV1NjM7pm1uHMhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564330; c=relaxed/simple;
	bh=QiXTocBbUPCne/DLRORZwb1CjVYu9NENBmKQCLcJLiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzFAv8mGi2HWA4zPV4XIZlgaFMl9BvLeMMcm7ZPUol1d8m3EFnsHcH7VoDJM11rSgTRelQ3BoY+6uIdoQAOjkOBWRtlaeAdU5hcexEirFp40UVmTHZ5h/zoEAqxXkBFuQvFbBW8V6aNXmIX1wUb8fqGhRjDHbcf22AR2yC1eFsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rICtNVZH; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35c124d2613so2860780a91.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 05:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775564329; cv=none;
        d=google.com; s=arc-20240605;
        b=eWYFhuiAP5vwA/32Mc+i/83//CTVvKmtyplHIaubjRPpVTy8dX02UUlzaXyS9xcrPy
         p2kFHt64aXthWbtRQeiZ9ggZMZ9uwnRwSVxECsYrGuyJngm6CdieGNCYaeYE3PmiAyei
         OkDaDD0MnYIeDHdnaQPE2a43IGy1PHMwyP/3vrkfhgCeqgM0SJstlYmApm5dOZnwbS8h
         9OksV5q6kVtzhvUIDWNsBBw9LfQh4jnorRG43MHc4JMkxmz6pFNaqxRn0OIsadDRRUQn
         oIgN5Zqxq4kZ4I7hAQCfeBBkLPGX5MfK5lVWgWSdVh2K+J4bFKmPtsY52rbLTSpuWzfK
         /WuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QiXTocBbUPCne/DLRORZwb1CjVYu9NENBmKQCLcJLiU=;
        fh=3TXpXUNGPT+9bh8yWWJ0FktFUtEqi75wusUhAbinAP8=;
        b=k4ihGmfOshcXN83joZ7JFM7uwV6KG8X39naYy0kVbr5Q3VR4mn8J7g7wRDbydsyNgF
         jLFzj7+ACkHUO9+QA3BAAXcO4clnNpRT0FehxWNKY0JhbJks96oBP3gVkvgLoTi7hpJr
         7+z9C7lABaxI1v6XUvKHAQJ1z47KxYsQp4hIVDmuYza8x4qMUCXIFAgEyHUf2lxLs+V3
         aTVo4qiHjORN+K6C06PVifBFlND9E5KzWrEznd/u9ghvC9ReeUpwGryX8Jv97g12Q2H+
         ooBVJlDielgYS6c/K+c46XFELjHnxVqlaEf5oYjDLH2lH14uUhSwwbT064AM9CkojjUf
         /J3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775564329; x=1776169129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiXTocBbUPCne/DLRORZwb1CjVYu9NENBmKQCLcJLiU=;
        b=rICtNVZHlvuEUQMSQ3hmhy+UE1jTn05fdRuyIpvZRQohV5ylwLp46uksjIIeQfnVDQ
         E7VpxBFr3aDPGpD76EtlwyOzeWPxFzUQPHWARZA2l5RAjxGwZ5ZzWU940X0vVMPxkQxU
         skyV2xLZWXuGYTP2EZK89gdbtR6p5D5OPPptb3iMmGGoTNtERM6jCGMyNd+89NuQ5arC
         uY2GedKblbTJgqfxW/eL/pt8c4ZoayDrbZ4f1oHxiE6CuV16kQu7V747bcP5gdnFDuUS
         FsgTMTk5E/DXBR0DzorvE/ajiNUGMAAXu8d/hij0g253zyuNcpRpfDslyRvpYdnxyNYu
         6eqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775564329; x=1776169129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QiXTocBbUPCne/DLRORZwb1CjVYu9NENBmKQCLcJLiU=;
        b=fQ3gbIvxWcWfwORHXgTHcK6dyiGp5iEV68RrIxMSuuJq80dm8TzFmoPZ97EFY9LnI1
         tN/FOZ60r2l5iu5qeF14wtP5sMxuihXtEr4Tb82iEiPBtqLZK3gn5c4NMNSIMEJ0mPkj
         UPEzEtpdjMb2o8a2VUkYPvO055ksPniNiOG4dZYAdHIydYZxY2gsrcVMBbPrDAZ9hEsT
         nvKebBcKaInw6kQw48ZUluEYeIl6iLPbnJzhX6PVwdgPD7vMNwYxpsT2+12HI0FPToGv
         ySYG54KGO2zgPP5Dz3bNt/S/zePRG86yVB0rRTUYruDKadkAsOk4HI26hyiBgfZ7pj/U
         ePiw==
X-Forwarded-Encrypted: i=1; AJvYcCUMGHpXWRP5FL0P3aACz6CrqgmIHoMC1YCYXs3PXTo4YlPhIJG/tKlwfay116vuVN4yaS/BOBYWwCpV1EmOoaw0YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLcF4DlRZcC6wGdLkkPBx6Lk5WgbKUqwdxhrEvYUewLGNmbBPS
	UTPwlbyRtsdCHNHwqhutf7o7oMOG5xXb6pzGKP8w9B9oauOHBNWNUemyo7sSFAQk5LchtU54TeO
	tcy2gzMylECaYHkIypi1cDplmkGkuqWU=
X-Gm-Gg: AeBDiesqYRTKN3Inumk174Lw9oGTWVlqH2uQ2k7LfbuUtF2N7Yt3KnB+jSWJ2JEWUKT
	dFKB4OPKvyLCtA+p3NbZdNkF7zN1miEOyb7JmPTqeV6CMGrNubEPqGDx+o3ayV6ncV8UtkqvqHO
	LPDsoF70qSAquVgLD2YbblvZSpZq0B7GSSuU0BAL5Pi/rCK3p8JTQumFDeI6XNRCyDL2F2IRCUq
	RgZQVQy54msMmdR4SDqqNGuMx0sC8V+Db/Nb4+yzVIyclZXgcf25j572pT+Y+1WNgZfYZT+iQT3
	dANZ1jglKXFBf/JIZi+X4k0e2GS/aZYfytdxQQ==
X-Received: by 2002:a17:90b:3c85:b0:35b:e553:9cc2 with SMTP id
 98e67ed59e1d1-35de6977d09mr15551822a91.26.1775564328881; Tue, 07 Apr 2026
 05:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
 <20260403112655.167593-4-phucduc.bui@gmail.com> <87v7e5t16l.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nGUyTkDmB0SgKAuM1Pp75L=m1q4bLSfhobm98TswDnt8w@mail.gmail.com> <87a4vfu0mz.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a4vfu0mz.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 7 Apr 2026 19:18:37 +0700
X-Gm-Features: AQROBzBRZftGMEKWFlfQx7m6sTV7mWUH_AhSwIbAfVFsIBCiqbQ3JqmVTbVg1mc
Message-ID: <CAABR9nH-1eBPFxtzVR6QBE1=esDN8x=hZpAkRSCO-TLmn0tRKA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30918-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E47753AE369
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Morimoto-san,

> Ah... is it because PIO transfer ?
> I have 100% forgotten, but FSI doesn't support RX DMA...

That is correct. Currently, the Armadillo board lacks DMA and HDMI support
after the transition to DTS, so FSI is limited to FSIA in PIO mode. I plan =
to
investigate those drivers further once the FSI implementation is finalized.

> Hmm... fsi_dai_trigger() seems strange.
> It seems (A) stops clock, and (B) sets register after that.
> Is this the reason why you get error ? I think (A) and (B) should be
> reversed. The balance between SNDRV_PCM_TRIGGER_START, and with
> __fsi_suspend() are also not good.
> If so, can you use hw_start/stop() ?

Thank you for the guidance. After reordering the sequence and moving the
SPU power control to fsi_hw_start/shutdown, the system hang is now resolved=
.

> Basically, concept of this driver is that power/clock is enabled/disabled
> when trigger() was called (except suspend/resume).
> While your testing may be correct from an ALSA point of view, but setting
> configuring it in multiple places will lead to confusion.

I see your point. I agree that keeping the power/clock management centraliz=
ed
in trigger() is a much cleaner approach.

By the way, I=E2=80=99d like to discuss the fsidiv clock handling.
In the legacy implementation, it was handled here:
https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/sh/clk/cpg.c.
Currently, this has not been ported to the Common Clock Framework (CCF) for
R8A7740, and it resides in a different register range from the core CPG.
For v2, would you prefer that I implement a small clock provider for
fsidiv within
the FSI driver, or should it be added under drivers/clk/renesas/?

Best regards,
Phuc

