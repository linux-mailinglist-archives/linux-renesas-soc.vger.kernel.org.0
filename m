Return-Path: <linux-renesas-soc+bounces-32235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBf3I66A/GkcQwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:08:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C41274E7FE1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8A9E3016250
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 12:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C99E3EC2EF;
	Thu,  7 May 2026 12:08:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08A53B9DB3
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 12:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155690; cv=none; b=Ri/F15h0hNbe7Xymywb/XTsmo4YwjCJBGlvPUIrq4IerlarHYmhThwmjDrKsLDvjHp+HOSSuZMK7CLna1ACu6/U/28eDrmrupyo4l+K+VWNDaOzsHOB/+0ArIRGaBGlP8MxpXM9To78mxyYR1ouC8zAtMF2dCrkfgODLnf21eJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155690; c=relaxed/simple;
	bh=3hmr6ERBqCfMjSM8iSf7/vzVsOSpjaXIgAdr4FMHpjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cyz394C1GSQCjyBlqAYSuaFazoJk0Ip+kUZOHPDxMNRLYWKqimh6HhnolDLp7SOkSGsDiYuZaoHWWQL41wTPoktIWPQfWysWtdyxodfIuKzpqAn1owrtnziyDD7EnySIB3q5EntTJszTnzH1/T2L0iglM75xT2g9rvOxw/EV20w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5751136c561so1470576e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778155688; x=1778760488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hModA89l364XE51tBAuBnwy/if+9avfhQto+MunlAnQ=;
        b=NuhyiXlo/7ZDaQ+qAbeBQNBv0y3CxmCZqgP96dhsvblQx1g2Yo/Yv9FbdWJuiEwL1v
         e4ZHzPF/B7nHqNROqoylGLCoBEa0x3IQursbv7apTR7+i5ankI0qqDYwAqtSNXHxIE5e
         2wiwb6YFASA+b3k4t5ASlHdokLK2G7nm6bWBp+kKRXjrweXD1Wh+H8EDVS/ATyyB9r7F
         g5q13JtFkXZW3ZKn7bfagnJMVl+tsJxO8VtbcyoQDm8ZswyTGd7tpmSdCf012oEFZp1D
         1yHRfrVwnhW4EcWLXceCN4k3b2VwbAhjcYyRFsLCKiO+KVbTDoSXppK6FWkkOs15Gvxd
         RY4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9YUkfJLh2QbZn9MINNTCcQVFxyOKGgtlVP4YeXkNu5fOHDxAROZkrzL9sHfoBk7EznxPUpZ2Ww7cT83U4fhTAK4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqHmNYL0RXnCoSfBDSaKFpTnmm7rm6U3JXSLeA+CMYV3V4NdoT
	iUPeBmrxnb9kO24m2P7MRMfsmrMG+EQQ7uB2i+Jtvvy0UB7vVeI0UBcnzYdmAve4Ucw=
X-Gm-Gg: AeBDiet7cMJ4ceXJf72ezRoRmBtqaAXjUGSnDbEPku2bM8TFwF339WDtoqMNGvjRJWM
	tS271b1EgJVjXlFYbAioI1aqJkmP+KEL5bko7n4lQ5F9CHFMGveoKGrkRFGvP0B04IRotSTSFim
	jlWkSsoM9FB9DuvJvPstHrbmtTEmwozikRpfxBC6oFH5QbFJaR1+qzDM8NBd3gPxSsNm5bPzfKs
	G7UomK7dwloUuEvS0nDk85HzwfTLIrHOX8tZaMZKhVUNtSMmij8BoHhdFU3xRot4On8vowa0vZs
	WCv0iz40ORzhedgWxtS6hgJ+70Qv0qPuSEnw94OdspzCflumCGfrUqS8Bv6KnVPe13WUIQ57SOH
	cxJ5ZNXfyX6e9ym38mwl9wXqirFMlngknnLS0M5zfT5EtnrM8mLFX68BvCTDhHs4k0uBP0xvjW0
	5v4zU26OM/6/5YaPESQYWg2iYpfM5C4XwNXSRZLwEtwz3IpSZGluciOdFX9yUJXSBUx2PFgfU=
X-Received: by 2002:a05:6122:a22:b0:575:20ca:573f with SMTP id 71dfb90a1353d-575702d4fc6mr837688e0c.8.1778155687793;
        Thu, 07 May 2026 05:08:07 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0af68c7sm10833645241.9.2026.05.07.05.08.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:08:06 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-95d226e3ed8so1395208241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:08:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/OHos8Ul7MrruQfxyjc+4eedA5ZTsSDJFLAS+nrLnEF1aNPTydlC95lsVFU75bUzzR1AwdNOZvkCM+GR0xaJ9nZA==@vger.kernel.org
X-Received: by 2002:a05:6102:2ad6:b0:608:d017:471c with SMTP id
 ada2fe7eead31-63115de6ef3mr964328137.6.1778155685959; Thu, 07 May 2026
 05:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505125921.149682-1-biju.das.jz@bp.renesas.com> <20260505125921.149682-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505125921.149682-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:07:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXY_ddFtNk9Mwg+19is1MpRCqYZ=Ks+RxQLmnfMOTg4TQ@mail.gmail.com>
X-Gm-Features: AVHnY4IYMKfhhaXF1qebj-FLr2w5h_ByXFxZrYHrC2npI6D9NhuN-Fm3Bxj5sZU
Message-ID: <CAMuHMdXY_ddFtNk9Mwg+19is1MpRCqYZ=Ks+RxQLmnfMOTg4TQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add wdt device node
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C41274E7FE1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32235-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Action: no action

On Tue, 5 May 2026 at 14:59, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3L SOC has 3 watchdog timer channels:
>  wdt channel0(wdt0) for Cortex-A55-CPU Non-Secure
>  wdt channel1(wdt1) for Cortex-A55 CPU Secure
>  wdt channel2(wdt2) for Cortex-M33 CPU
>
> Add wdt0 node to RZ/G3L ("R9A08G046") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

