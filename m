Return-Path: <linux-renesas-soc+bounces-34974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o/3pOQrET2o8oAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 17:53:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18723733255
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 17:53:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9222305870E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 15:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA93411671;
	Thu,  9 Jul 2026 15:45:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED82B421F17
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 15:45:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783611950; cv=none; b=tApdEuuhUlMo5sCpMRT/7q1RxdeDuwQzbL5JjcJDSya/gjESGcu4y/Kyo4EoIC9j1wg5Thcie85YrVcwSqQqtNWzXWEi9TWd0MC27wR7gjbMN5/MkcXTxttdjToP0oyjOGKOC5Spyep6LkWCez7/EA+JG2O/tAQqOdiz7K+7hwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783611950; c=relaxed/simple;
	bh=FK7tiZEI0WffDbTlu07kAZuJRwj0uLdhH15mcZOjFjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRPDfsGss8PKIC59Pmzbt/uOttNzv8cykVn5G4bAsF6GMT0BB5v0HvNROOTIjFPezh5cc4vWUlLYUSa+99xxhMTd3ZAa2PKiqa1C9OoLhfn0e24g/WOkbTUUP/YUNDO4rDdyTr9ah8OZqgpxoF4/0/gbNiHyQ0SCZzruAnjeyWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-969524c1aefso521604241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 08:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783611948; x=1784216748;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iqrcHFDoPWS2t5kW57shcQV+qLcmaCnZOWUcXcNxWfY=;
        b=sSrqRkPVNytpcE2K5fNlHIBxne/Je9jaNgVlmWSZ9X6SWxAaP+S28BEmvkUFa5cJ/I
         q7z/wcRQYTmU6k3gUA/BTdrk1cdeAvUkiyhaEQqfmURC1os+rAZbeZeafq2/zWSREG14
         NyP4D3qWFgZkl9QwGFnIgloPuZypoUCaojL3YvzZvUWi5weUoJE42lxsBSGFKatqaSDf
         v76w76cQf+oPAcMweoNQbOq2V+bBYb2yVm7wj90I98jDtx8veJFEnRYZz+RnwJrxbmXP
         LqRjDWNb9jyDuSMNq+V/eaNm4uoBXOdBJMBkPmCuAj0wGz3OymGFAW6XT8rKLAlVJ2RP
         ylwg==
X-Forwarded-Encrypted: i=1; AHgh+RrUUXUNbqeTYGG1Z4DmosT37bLDkXnm1mSgqbigqy3wdO+B5FqU+jV6qdBaa5V9FqVw+MEcSePlRMkSrgpAlngPEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUwntzgfzysxtwav2EZ7sI4MPDTdlmn2oIOgG+MUYVv09yssGA
	DNYLfmoPZqSfbMbQKEkxyiS/JIL4Zw4DlBzPLnPg9wBSlZoKFSyGecipGC6Ls1M6u4k=
X-Gm-Gg: AfdE7cnMsMZUKzC5VhMQtinfjNCRAcqRG4oBqVB3eYJ+nzujSrcjcVetCg8u4vVOYyI
	ChnvYQwnMX2pG+IO9nRS2xi+ROB0i8tJvqPhtEd2mO2Jjw6xojrT3ozyeYtUvQOQSrQB3LkpWnT
	V0aghgX38pPyPpyXHEQfyULdWv52JxQH5wofnReg1r5BrrWe9ux2B3Mc04KRMme1QB+RRJyu+Jg
	qnngBFPMvrJ3j5rP7v9lILEUBg17tGfC/F7rxen4r2GjzeMnfWhfekpZcD/w5eQSFMsW++xFlDH
	8F5Z7bt7p6l2leF4J2aWcuu8vg3d+AYZwWsP8k+tAY1S1GIw0VsaOhxbS2AsShgtsau88mBJYuw
	+Uwu4z9Pf9xb705dBtSKjiGlTYO30MpHUSswhJIIrhP7ljoejN5LfCAvMh9gD5B3hyRGXKsjiyC
	Zy+DCcwbuuwp83Ko5eSEOqY1tibkiLa4+mVuptm/1ETfIlyT/gYg==
X-Received: by 2002:a05:6102:370a:b0:650:94b2:3839 with SMTP id ada2fe7eead31-744dff2c879mr4889201137.7.1783611947801;
        Thu, 09 Jul 2026 08:45:47 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed6545095sm3356384241.11.2026.07.09.08.45.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:45:47 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-96944741eaeso671327241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 08:45:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqMwWEdoMPy1LnBcbnhYzZipndvLFV9AMBq+c/FEbZlqKnRWBvzSJy16N04fGKLjHRJ6d+Ts892YZwaPNppslHGYA==@vger.kernel.org
X-Received: by 2002:a05:6102:f8b:b0:6c2:e290:cc69 with SMTP id
 ada2fe7eead31-744e01021e1mr4657081137.23.1783611946911; Thu, 09 Jul 2026
 08:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707102418.1646159-1-claudiu.beznea+renesas@tuxon.dev> <20260707102418.1646159-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260707102418.1646159-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 17:45:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEQVN7VqsmQ6EKWxazrFyQdY4edaHyt8pPFEaJfGgbpQ@mail.gmail.com>
X-Gm-Features: AUfX_mz8Do1OkGKS8SDkGEbLBy8tojYuESbee1M6XmgysSPwrDRBiIuowYvmngs
Message-ID: <CAMuHMdUEQVN7VqsmQ6EKWxazrFyQdY4edaHyt8pPFEaJfGgbpQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] clk: r9a08g045-cpg: Add clocks and resets for CAN-FD
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, tu.nguyen.xg@renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34974-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea+renesas@tuxon.dev,m:mkl@pengutronix.de,m:mailhol@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:biju.das.jz@bp.renesas.com,m:tu.nguyen.xg@renesas.com,m:fabrizio.castro.jz@renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-can@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,gmail.com,baylibre.com,redhat.com,bp.renesas.com,renesas.com,tuxon.dev,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18723733255

On Tue, 7 Jul 2026 at 12:24, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Renesas RZ/G3S SoC has a CAN-FD IP. Add clocks and resets for it.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

