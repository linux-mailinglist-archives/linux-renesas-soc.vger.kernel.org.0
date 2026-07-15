Return-Path: <linux-renesas-soc+bounces-35245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jT+JNr5MV2p2IwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 11:02:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E40CF75C2E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 11:02:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46BAC3026E25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 09:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5ED3DEAE3;
	Wed, 15 Jul 2026 09:01:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE353DF007
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 09:01:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106092; cv=none; b=sh+G0O68Iam3+8ZbwiTXIo19Mao+ULXNLbst/ZpQYOPm2jnyLCz5BgtQ8/8cM8B37B7eTF8YcLsA8kaqF8sX/ALn8ffJzvOi7vXubCO+bKhflvcnXKCGqoDeF0Wf0h/qla/mNGvSCJHCmh0BwozbiUOYny1pjKjolXlt8wLZPR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106092; c=relaxed/simple;
	bh=4D+d1b3Trs/CMs5Bj38QykZaXyZasuM9OpqfOKndXxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPNxA0VcjKhEVnFTdyVwf//Dvmi0wMLYqcUbt4iiG6RoF275yiS0tTHxQBTOIGlvM7eZhxT3n/oOTLjxDXQ8ChxfxDYRZqUoCdggENEBTsRRk0JiCWLOfre9KJiyvy1TcOqt2mVB0Tpu5vdkGT5EgMDlqnEyIbnVksFjsZzP9CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-969524c1a63so1082232241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 02:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784106086; x=1784710886;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NaVzb/e9FWmfB5ARe3x7cY0vDrs37XFuu/XUXFp10g=;
        b=Ah3tF8VPmCK0cAjpPR01kTq8O/prSZYcn2vmeA499zBYAbNeCrBu2BXY6DfGjIV8NM
         5OyuuPCD1W9QiHXc44TwvWuH2oxh6o4BXCmFedBjKANfZGZsBLvElhTFK+emIKppX0hv
         B5KkQGboORWc/kXFuYuqJhVN+NMFKbLlHTpJu+Q67D7G09yteOXcufi0u6LUXGlq2yoh
         Cv+FLrpg6dwhMvgUU+gHVAHQ1Ea+JfPYGOrKuf7w3xEruvuxh3F2uCvXmv+h/KGqNpfP
         Grd2fsW+4KgxH1ohNvIsnM180PVH4Ycxj9l7SAL0Nqgjo+FyYbiTrTInjK+EgVm9DRZP
         n9Zw==
X-Forwarded-Encrypted: i=1; AHgh+Rptk7fabwb3Rt9WGIY71EdGWsMyC6izg3E6VCK+R+y17chA6jVvXvbJWKr3Y0U7MpaDzrjVuMwLK5fweyB3IN8Prg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHE+Me5imPyuh2nyOznDY+ySYbpc0nptgAwrziQrrF4Zea/4lE
	iuSTEwMfcC+/a/dg/uBbVBOHbl+8/W5HPZqIEuIB014oDN4huKLd496nhDCC6QBP4Vo=
X-Gm-Gg: AfdE7cnw9lkNkWuzK7K1kvxL/1NbpS/DSYiOPj/C9mBtJfHjSV2MGoy0muyG0WdfwDu
	P6txnUeECr3O2Og8ZNWfawmsieX/x0eH90lkG0jrt5y7sDKng7CA99JK9mO7pxgzHq1mWOhtXdV
	ni3UzoMYUqphAxxKW/7OsKpPApvXE6jP0Tka2dwGy4qMgT+DaRkVzBfhS5nVDE4XvkbXkw0odhy
	EErze8OFwfOyVWCav5yiGloAycWquA1xghr1J5ffMTEGs6TEZq86Uy7CzVNv6ueQO+JrXC98QQN
	WzvGM/LrMMXyGgnOxXdb0eulqT/KhQJu7T3Zb6Lf/FLatpFMy1C+XC97L7Fsrl7O1ovIUPTQoEw
	/TUE5jJqujIPxT9u9GXRS7oeV5ZU28xXV1e/zXczLQIcriVWNsW2/MKRvsI2G43jAIX9wKajRGx
	+y270Jfey0rarvSTid8WhnuAgqNbNKXyYTRsHP9c4QGP/91+z1G2VbTA==
X-Received: by 2002:a05:6122:4898:b0:5bb:c529:5f05 with SMTP id 71dfb90a1353d-5bfbf3b4b7bmr10710088e0c.14.1784106086241;
        Wed, 15 Jul 2026 02:01:26 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed3186d3esm10294014241.6.2026.07.15.02.01.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:01:24 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bf9466412fso1141851e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 02:01:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr3WVnVgOhCEINgDdkOBCCHQJZ/g4SVcHqi4C3XuYpf6N5pQrAt1GwuF6fGdaDl32CXFDF429CNLcBWm2oCcEt+Bg==@vger.kernel.org
X-Received: by 2002:a05:6122:787:b0:5a5:3eea:4513 with SMTP id
 71dfb90a1353d-5bfbf34947bmr9390069e0c.12.1784106083256; Wed, 15 Jul 2026
 02:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 11:01:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULuz6E+zHt5W9Z9ik05ALSyMz4tkV-mGRTg3Nh=Wx_Hw@mail.gmail.com>
X-Gm-Features: AUfX_mwvtCJ6mQlGxoH1JvfSPfIrIHfInpMsp-NWrZ7U05hkN4A9x-SDsqPOads
Message-ID: <CAMuHMdULuz6E+zHt5W9Z9ik05ALSyMz4tkV-mGRTg3Nh=Wx_Hw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35245-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea+renesas@tuxon.dev,m:mkl@pengutronix.de,m:mailhol@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-can@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,glider.be,gmail.com,baylibre.com,redhat.com,bp.renesas.com,renesas.com,tuxon.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email,linux-m68k.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E40CF75C2E5

Hi Claudiu,

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Hi,
>
> Series adds CAN support for the Renesas RZ/G3S SoC. Along with it a typo
> fix patch was added on the CAN driver.
>
> Thank you,
> Claudiu
>
> Changes in v3:
> - addressed sashiko review comments

FTR, this doesn't provide any real information.
Fortunately you do list the actual changes in the individual patches ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

