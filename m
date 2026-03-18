Return-Path: <linux-renesas-soc+bounces-29779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G+WFwKwumlXagIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:00:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F36DA2BC854
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 13E53306925E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE76B3DD53D;
	Wed, 18 Mar 2026 13:52:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE473DCD86
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 13:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841947; cv=none; b=VRfXU1aCDgBDY4g5jxYHpLmf49naMIlor7KBIc/9AYR+PTuYKUj1bhu/YL3Qanay2vQR8uExn6Tdm0JylDDQdafbRLds3U9wpTXpHPNs69Xf1AuATywlpU8GlIB75JtikmLB62TCNVqE4eF0fICSPT8Lwdo0cWXB8reMsoaGwlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841947; c=relaxed/simple;
	bh=VvPyw3/O/xKZX2505H+Dl8z0ionjRva9BuUKbRPtbg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mcm/RG836PPngSi28hW2PRpPDvdcEv/bRmtpvKU9SJZiaO5ado60C5KEVtVvJGMuct0GCtqbybBBzN4fMRWf/EhvovD095Sgau2HVV2aUe7hVKq9M2tPpVxmA4j8WiAUO66Q0pHC7o2oweGN8QCXwsBk8UU0NGtxn2AMYY6XkEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-950ca549ff9so2186735241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 06:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841945; x=1774446745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVjeoA1etH+hCJ5IQzsv0kISF9CTMqVLM5Ygk2CcxlI=;
        b=E/iIFmVqnqGl/LF1PjWnSa9sij31O8Xc77ZqpJkqvXR++haZQxCwrYwLLpuhamx5SN
         kcwzlRlSsFyaVBFVcC3aOCGTKvm+qNW41FeVIVxRig7vqtQ856Rl+GWjDWEZ+gphmhOz
         LwGfPsRQp7y3XlFCzifKDWhMeu1yf0nJuGEznsekhLpYRQSNX+Cn/pc3lyrAbalnkNsW
         60mOiwIVAZfgF0ufZdeTXA5ZRVHGEKUsrdOIKeXY6BF50BlpQFgOUtVOfB7Out5VraiE
         rPMePibN07Up9E2mMv/qMwcft7QUpr79jdEb2g34oyMTIjwUp+5fT+aScJO1fI0VXZyi
         3+Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVpPRXVZnBxtXqX6qdB23ChBfp1rMTJz3HwjBKi3sODGPC6EA0HlZex8gcWILYOaj3UmPfwopu/7eL9E6bVoLertg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6WKy+EaaJYFQELS8eC39sHq0C+SQU1BcQ3TFTNzLr0wAQVD4C
	xO0L0zy5G9mI2ofvWokq+mK5FOPsBiXRVOfzFb8rPOlEfkOaodhyFyrQoN5FCIKsF80=
X-Gm-Gg: ATEYQzytLmBdv6I5qTUO+LdBSXlIAtvfTpo6+qW+2PTpYUC2p4x58vy3DdSPFfVqVPx
	OdT7gmEcZmaEbwtMUMnNmKd/EDqNHgmIaTfGCFYoou9L0JFv3tDIkcCS9AfEtOaRS8cm2/bxXYS
	oWZ3t6XKz/BI0C+c4wK7gy2dAzR0Z5ih6/+ee9W6ZWH8feGOAQfvR51IsgMfGIa+etUciLwAvHe
	E+NErXgALWFazhqnEBn54mfxM6MM8KrpItTGKQQKh0dvK+IrPDpVLrccDtRc/kWJ6RF4pWddS2r
	NRYWpCh79WXRpmPqpdQLZVGXn5jrSyR3Xm5bgovSJIMvMS/dnZRZ5zdm4vmNQ9aTVOiFjPY4XCQ
	K0QNjTebS2jit+OGgXhkAr+D1zqDH3xs8htjgtOc5ZZSbvU1iUTv/ujid3Yl7a6byksOTSjPVyR
	GAYiOKWtRAU+s9c8nOWsznloIEVXP8gN9DTeh4yS10JrsW9/fxctVL+E+DQZJ/
X-Received: by 2002:a05:6102:5f96:b0:602:86a6:9877 with SMTP id ada2fe7eead31-60286a6a82cmr567589137.19.1773841945423;
        Wed, 18 Mar 2026 06:52:25 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6027eddcd57sm1394474137.7.2026.03.18.06.52.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:52:25 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5fff77ff719so3238068137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 06:52:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfiAU+c6n0MB8BcxpS4jR3X9gzxzAImDUjmL8+RB4MKpdmw2gJAvf2RRC3v2NhgnpALh8B0J8QQobMUbeqoyO+qw==@vger.kernel.org
X-Received: by 2002:a67:cb17:0:b0:602:833b:841a with SMTP id
 ada2fe7eead31-602833b98c4mr811205137.6.1773841945049; Wed, 18 Mar 2026
 06:52:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260123225957.1007089-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260123225957.1007089-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 14:52:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWE5di=vGLn+tFnvxfpPA6d5UfSz-H4EpQkmnDcLtVmLQ@mail.gmail.com>
X-Gm-Features: AaiRm51I7W7lNX8hnA02lvuJDWHSKD7th69-7NU3QCowjJj7nvrZbNkhKo3YL_w
Message-ID: <CAMuHMdWE5di=vGLn+tFnvxfpPA6d5UfSz-H4EpQkmnDcLtVmLQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Clarify
 SD0 power jumper setup
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-29779-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email]
X-Rspamd-Queue-Id: F36DA2BC854
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 24 Jan 2026 at 00:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the required JP23 jumper positions for supplying SD0 when
> selecting between the onboard eMMC and the SD card slot.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

