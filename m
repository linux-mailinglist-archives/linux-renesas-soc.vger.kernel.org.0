Return-Path: <linux-renesas-soc+bounces-34969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Aix8Juq+T2rcngIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 17:31:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B9D732ED4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 17:31:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6578A30EF89E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 15:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F46363087;
	Thu,  9 Jul 2026 15:03:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D698934E762
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 15:03:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609413; cv=none; b=JS5ZBH6rX/B9HkTtGgter8eSRdt85mhODVkWv8V4i1vuhYqPQDD2vgU3EbAIp5vxdBolwXw2DbVGHoYHIBQfPR7u0/Zpbi9LTaPqw6rgaBj6u/xwP3JPf7hM3kZD7veaiqLO1QPvqLlPXSGbw/GVODHb5dFU+kP6nY1fnwHkFEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609413; c=relaxed/simple;
	bh=Ywx5XHcvMXEATTIxBq1F6f4GLGgI9GxM1jMgq6ZA5Us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iHBSri88NAOJVHLKsAIIWM3mVSngB6m4oP0WuKsP+S1vF1mtBF+OoNc18V5J7CNwP96q+VNwc7QBK7jHexks7sY7sKqtaSmb2F6A42K2TXuuUhNrj9dl+yZiyB9OUAxWvlwsYNp04oP8SFbrSm7QAbgybqvhl1TgKVbDcMEXr7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba320so2447550a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 08:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783609410; x=1784214210;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FhJA8BeE3pPaGDlrUUvedWi+hMG2tf39b7PewxLsBUk=;
        b=aiCH/646EQdiSIZk6RoRyTinZP9DVLky52Y6GGbEGuJbMxKZwNtNAwV2ipT5xXZRuN
         5mdfdliGQ5jk0dXq5+BOOrpWFemxVXcm0AmLXddkC/F+PDETpaH37OEsOfzrfu7cdQZw
         wqM50HLFx1vn/C5Sc3U/EXin0kQUScIqbKMp8lQWm4eUi46Z2uOlWHmEHRCFmAYJfWks
         BtCbr6oIkAnEG8n36QlGICyIpKEOkMKFVS/rqxFCroDuF2xFGC+LSU9hwGyQcBoOYkyr
         pspQDmltyHJmYIQxgKsF0vaxFx4JtVcsfuQJkNIy2ds14lksbTSpAtxLo9K48gQBUtTn
         XyKA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1qcF+4vKvG0orH8ApdXsCjh7K2Txhe2XRLZMECql1k4HkNMiK9kh1omKPkA5oVLAGIcDlgrW43HfN/R5R+/1GIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ39/VwJOCsm1QN3kaB6qP3iPAprV126xu9txiW/co/TCGi2kQ
	xbuan/A6XULDmjHWe3zRzsy7G2JJWscB05R/W7khcY7ZWK0cTupACcCWwWZhsMMIKPo=
X-Gm-Gg: AfdE7ckhvZMxP6Fq/3x4OK2wzFwLAf5zMAF3ZzZvshq5/nbDxL/KsSm4giiD+TwSdWi
	OkTjc2Pki/uF0QpuMtBzqL9+tjlgaCj15viKtSZHYPpiFaie/RGCybdaS2wQsRS8sCBKxZXs6DL
	4djBN+JUVf/BQIlMgnoo6e7cp17SGDu4ICdcAMTtZb60qsDCA/rVTKUFZyDhrns+fUReSoDJNgP
	mjs6A4Ca0JtmZ9fgI11drBGm1EZFpAZY15+inHsyBkPxE0ErGTlrsKEsd1HbMoNmlsGVDXidC3K
	nolV7+uHcDTrjJkpNIH2yhfDa4+F1xz5MfRQydX9SaUojMIc5GcDdmf46bShUHxxethT39VtNhd
	E4GFKXwKwJtm9upDAyZ0XXqNH7wXIgMIuHPJdohQV/3OMBjSAH8r0sa0n5CMF1FEp156px3gwd7
	PAMO2xjjaFAWvywiYxJS23mLs1Sx1dPZzj73Rs55IiTNIAg0WEGneFgmTrUPDV
X-Received: by 2002:a05:6402:20d5:10b0:69a:8e43:ec95 with SMTP id 4fb4d7f45d1cf-69c01b92e0amr1130857a12.7.1783609409925;
        Thu, 09 Jul 2026 08:03:29 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d786e7sm10326568a12.16.2026.07.09.08.03.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:03:26 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698e5859a3cso2081674a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 08:03:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrbuj0wzfLwz6jS5rAmy/VydulI2i6WtzwtGpdIApQ8s8V7XrKIBywAybx4sLrajt4xxUsVq2+fbslJ/bJg+BpLUQ==@vger.kernel.org
X-Received: by 2002:a05:6402:a29b:10b0:69c:20b8:f1e with SMTP id
 4fb4d7f45d1cf-69c20b811camr18850a12.18.1783609404940; Thu, 09 Jul 2026
 08:03:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708172849.227915-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260708172849.227915-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260708172849.227915-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 17:03:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJ04fbFGK5vOyQF6ED9d=1bv=khtPZOZVUv25r5TKQAQ@mail.gmail.com>
X-Gm-Features: AUfX_mwiu6IJcbWIAEAJjxVY7iWOVhxZgcxDH221GNBhFtNI0GgJXWs_ZUqzb1w
Message-ID: <CAMuHMdWJ04fbFGK5vOyQF6ED9d=1bv=khtPZOZVUv25r5TKQAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Fix PCIe dma-ranges
 memory space code
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34969-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:from_mime,linux-m68k.org:email,glider.be:email,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26B9D732ED4

On Wed, 8 Jul 2026 at 19:29, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/V2N SoC supports up to 8 GiB of memory. Update the PCIe dma-ranges
> property to use the 64-bit prefetchable memory space code.
>
> Fixes: 4c443296ff17 ("arm64: dts: renesas: r9a09g056: Add PCIe node")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

