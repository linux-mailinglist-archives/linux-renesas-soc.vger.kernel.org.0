Return-Path: <linux-renesas-soc+bounces-27442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMlNISiPd2m9hgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:58:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 196CC8A6B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A7EE301DD94
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 15:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B934341041;
	Mon, 26 Jan 2026 15:57:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9369340D82
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 15:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443049; cv=none; b=E+o0Kj8R2YQgz3vSXnYums5sC071o6pd0dF9z3Y1/W3ESB/xb3kIRIlFz37xWmA/Gy0onotJvEQXOjWZSfuPmwl93UTxiTtiFT/5V3ixu7jLn4sVXUAPlquW1P4ec1UmOS2n+OPFukO935QZOoNAjTgwpQfxNoLDZywVVDygknw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443049; c=relaxed/simple;
	bh=bXHAel1NwLDuPGwtU7+OMOyzgPqVLj6MKMo+sEVl6lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+IGeo6C4DaX9lzZR46cP9SHSKjEnrtfR5AcrOpFXvX0z29m0cMzhEm69imLs5Fr6PN/+2KvP2DBs6vgIQm0OccWFLxtzhH083d+N/MpzXy7sBDUhqOr5FRlxtv7nG4xHb2hWjfrc936JFn79stsqeiRMJ39Wt1TSIE5IN4j2z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5665171836cso1544888e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 07:57:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769443047; x=1770047847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWlsYApapvL5A9IWANUoDMRFQZN+NsL2oKDWoPXwI+E=;
        b=eOOlTMKYHjpbelBzQO+XjtielYm+jiWPEOu9u6kPGuIsVOQqKLcDOfjjJftnFD1+sC
         0RFGYLkzz6ip10+w1FhpMJ4L2PF1dLn8PMdFZCdfJa3htjFAdysSKV44uXvui5jJIMkh
         q60zP66p27xynSo2xzrNdceX9a34VIg+VxOJhm036eDnPBkR/i+kc99A9u8pUuP3j6pn
         6A6hmc6olHtLiit/BcMTaQOTd+VNeGUDI8S4ijvIK3hhgqFVDKTJfudBcNjdpTA/XZIU
         iNH8M9qXgpq7HJ0NRwvIC3VUV+LlIuoqrfKSUuKduqfjsFMRZbNisYLBW2nKaQ2JVRib
         3i4w==
X-Forwarded-Encrypted: i=1; AJvYcCWDEEJy5MfQ4X3ECBmmZh1sTHr8e6QWSr+Ut7iJKw+ybZ1A9T4w00rfyAmvCT55hCu8KrJXtRkoG+KQXBo0EjJosg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSlc+a9fVKq0ho7v7S0T5tkhSWJuuSClGcmStx1OO3PJQUAb1O
	Ej0rFo6tG7f24+5ooPBrV6S2MwtzjtFHT4eOgolizC9AByqxJ1KgaZiMR+ejclff
X-Gm-Gg: AZuq6aIP5ug47RMXGjJinEa9j0RSMOCPgk8E19p5mCuYNIwGX0wFpgTpd4aXwUR1aDI
	y5nrPpSII8WZ7NnnIZrXuWBa7uCdH3PJ47VHBHgI6Zp+XkSS++gfXeEyOOO/ksHYL1F71ZVoVOO
	9ZQv9tNAIxG0lc1MWYP33fkDPSNYCd13/T7JEnz+ZYO51JYvjkO624rlpUiu55BDv/SXO/CwguX
	m5Ah4L3CIg1poEoCxroCt1TMkHGD3fIw5gyF0HPH0j0d59zb3mXMLCw9QNzk3vezyVRgzoxiAxc
	HncgbeF8YR5UpxFE6dtdYhrsLGPxNEgzIKTL74ruMu9kP+HLVuyWAqpHu3mvXWnHLgEel9vwALX
	r9/SFb/uuurHpJ+uLpvkdHBU0DP5GrHDNZMAIk2TQplP5PiRNVCVWViKuQhv3pEmmCLVffJDP9e
	1tQSt15qfBP8sg5Wcwqk4aPh6IFSHz9ut3HZ4FfCmVVrv+mSOB
X-Received: by 2002:a05:6122:3b16:b0:563:7390:b17d with SMTP id 71dfb90a1353d-5665c6dec30mr1202178e0c.0.1769443046740;
        Mon, 26 Jan 2026 07:57:26 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fb7f18asm1806169e0c.19.2026.01.26.07.57.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:57:26 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-93f5761e09aso3238094241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 07:57:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVvgJRIrOrjGwGoAQXVcXqQe2cd1SJBIrGWffKEa/oLXbhVCdIsnkyULpwDKHAcTJ+KyUUXoR6KFYPXSPSvdYqsUg==@vger.kernel.org
X-Received: by 2002:a05:6102:2920:b0:5f5:2ab7:cefc with SMTP id
 ada2fe7eead31-5f576514c47mr1614515137.41.1769443045773; Mon, 26 Jan 2026
 07:57:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com> <20260125192706.27099-6-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260125192706.27099-6-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 16:57:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgn_hViAO13HE_AY7KG-guAwSMTMOdHwzzK+K=kUstkQ@mail.gmail.com>
X-Gm-Features: AZwV_QgRCwoHhziZOmAhSnKes9efiAhzVMELZ9SF4N6lYcHkaUa7uPK8VSG_D2s
Message-ID: <CAMuHMdVgn_hViAO13HE_AY7KG-guAwSMTMOdHwzzK+K=kUstkQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable RTC
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,bootlin.com,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27442-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:email,glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 196CC8A6B4
X-Rspamd-Action: no action

On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> Enable RTC.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

