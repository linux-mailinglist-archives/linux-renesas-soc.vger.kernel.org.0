Return-Path: <linux-renesas-soc+bounces-31009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKpXCDNT1mm8DQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 15:08:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEE43BC924
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 15:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F0473013A4E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 13:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCF63CA4B7;
	Wed,  8 Apr 2026 13:07:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1513CA493
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775653679; cv=none; b=Yb6J33N0jDrXNoCWSQboaQ+oDD+YJn6hpsXVuAuQrdJIwnBCkCDRqwaeeaGXs99o8dySbrA35x46ffOZ1lnUBdNDsC/8gl+uCgXvIeqoGobvBm7a/vY/TxlkK0XYrGWOAN3XEWpkkTGppDtNqr4WBIeOzNt5k95TvVOpNtZI7u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775653679; c=relaxed/simple;
	bh=2wNTTwVqCeqr8hkgFLfv2QURTJXll89k2pFbxpcF1uI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SaG2sgqPCzhk//UA/5J6JogGBX0T9j+jOGhB+54Cu21ymWQIuo+1QW4Vgnd5HsW35lPj1W/R9E1xTjkEdHnQnO+PNoHRyL7U8I/q6KFtUS99qlc+L9Ma496IHNca6n243+fD6s3gdL2nzRCboi4ImQBE/dzoW71v2RvhKsImRs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56d9f191ae6so4140639e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 06:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653677; x=1776258477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RI+J43qd4H5Anap3izX+byQPpLoUkJOQTO1aaryrRrI=;
        b=h++PuaZsnEBMI+g7qy0uTxUPcY2LNi1LXAeYSRLGd130KjKP4jyWtLb282N1OaZAPc
         HJXZyLFPfdblKRrgjqwcFJyjx9kT2dSVkboc335HNUuYyX9ADdf9zl6Vtx6X+i8h7SxB
         B8ml178gAwF3gWnAUU38Z6oP4PWMqFtq1OQUgj97DyimxSnxYl5f3vu6MLkjtgTz0C7x
         iLZwlKLHKU6QR50ERdx+LiZeB960W/5iHozejdYhgli8C2JF3t6E8YEaKxfvy0rMC3Bg
         EWLwOUzbPd9q1VNkoJrFTgwx10KwhMFxGVkTCfcW61rl51ic534/Kyo4fSF42NrOI+c/
         QTZg==
X-Forwarded-Encrypted: i=1; AJvYcCW6Pw2IL+h5V8iNLeA7jJ1O3JIvdlG3+47GTTgIPUjpaHiA9Rwm0x6nKKPN4uJ1HZPSf1adYTJuwlPcbpFvQey/HA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygv+WYVSKo8eqh5lntxzq4bJaVfJZtspjEUDWEX+mnxfLcTr/w
	cXCEro9LOOeYsikw2TidN3q71Zc9x9satoN7Gc0lz//MQmzOthlz5i25VboByWFE
X-Gm-Gg: AeBDievP9wgyBp9gJecsBR3s/IMH1NWV9qXoG1PUh8o41OKN/EjUGCSnMpLSdo4DxWI
	E+QYK8BZlhlQdH2KJf8lrmSZrKngozESAbYXghlSutH1a4rQGbrnTGCXX91ZoEC2ifmaLpKo84Q
	93OSp/8kSixlEaYRwsD0d5gxV2zrcQpm1AfiLZtwgUe0Kk+QWDvmzximo0XAQabNCU0Jn95is4V
	MRJUoxjomkIPa3rKzheledrCctWqpbmlXLT4VCxM3HI4ROuQh7ri90icZBLfFHhkliUkMcuTFVH
	g+uG3RqK78pr5IBjQ3iWmvlL7vizUNMG1OzaBYiAFBwuIbcXURHcjro2O5/HgXeWLFImpw14mGX
	avbr4yy7f/hl4bkEVkmkn+DslzA5EncrEOCHHDMg0/bZLpaF70Zj6hDb40mLqnZAcAi2s0l8Tfx
	YVIPg5msC4giXgZKD6cza0Xi/U+XmOrrDGk1GU3kGQ1B4W0pqAshAFSlC3NhyUQ8Ln
X-Received: by 2002:a05:6122:e469:b0:56b:5952:9157 with SMTP id 71dfb90a1353d-56daba42c24mr9597305e0c.15.1775653677222;
        Wed, 08 Apr 2026 06:07:57 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fba6af44sm16551345241.8.2026.04.08.06.07.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:07:56 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56d93355337so4414984e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 06:07:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxyhbqXxwDeOgEbin8gjnGfW8O3dLwhmai+3oyECTXv6qLSc//jOF2jYynFgI8uiPzgfq9Tj/KhxtI0koGyF38sg==@vger.kernel.org
X-Received: by 2002:a05:6122:871c:b0:56d:b4d1:3c1e with SMTP id
 71dfb90a1353d-56db4d17398mr4930024e0c.10.1775653676268; Wed, 08 Apr 2026
 06:07:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 15:07:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHhd150mpUT5-VPcHW0W5Hs-rFC-Bjrc7Z8Szco9P_Xw@mail.gmail.com>
X-Gm-Features: AQROBzCAgzGrVmv98H9pXphPv--qNykKs0tFH6sDE4aSVcbSsBjA9H5-Jim4uG4
Message-ID: <CAMuHMdXHhd150mpUT5-VPcHW0W5Hs-rFC-Bjrc7Z8Szco9P_Xw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Add missing #mux-state-cells to
 usb2phy-reset nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, peda@axentia.se, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,axentia.se,pengutronix.de,vger.kernel.org,bp.renesas.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31009-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.241.139.240:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.119];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email,0.241.179.0:email]
X-Rspamd-Queue-Id: 7AEE43BC924
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tommaso,

On Tue, 7 Apr 2026 at 17:35, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The renesas,rzv2h-usb2phy-reset binding schema defines #mux-state-cells as a
> required property. Add it to the USB2 PHY reset nodes in the RZ/V2H and RZ/V2N
> device trees to fix dtbs_check warnings.
>
> "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
>
> Kind Regards,
> Tommaso
>
> Tommaso Merciai (2):
>   arm64: dts: renesas: r9a09g057: Add #mux-state-cells to
>     usb2{0,1}phyrst
>   arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst

Does this series supersedes "[PATCH v5 16/22] arm64: dts: renesas:
r9a09g056: Add USB2.0 VBUS_SEL mux-controller support"[1] and "[PATCH
v5 17/22] arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal
regulator node"[2]?

Thanks!

[1] https://lore.kernel.org/c63d0a62d439a78e9ccc0b4176b84bbc32629a8e.1764241212.git.tommaso.merciai.xr@bp.renesas.com
[2] https://lore.kernel.org/f33b5566511a946e4e909854213e75c12d89a441.1764241212.git.tommaso.merciai.xr@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

