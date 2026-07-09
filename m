Return-Path: <linux-renesas-soc+bounces-34943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mvcjLAB7T2pfhwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 12:42:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E26EF72FC39
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 12:42:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A27D3095036
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 10:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35E4405C2D;
	Thu,  9 Jul 2026 10:29:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D5B3FBB5B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 10:29:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592964; cv=none; b=eP4dlo2FhmRucizDUKnSzJhVUZO8tjV1UgMN4tikjBCdT4N1uQ0TqgGAYSErj8WoWhl+hGieBv5oT9ahAVyFi31zSY1GbyHAQqRMlvRASSKRR1nx7KtXez7L3jdA40NXRVmXMzQtkRd75wB3On58pUWMnkbAkcCXOOHn4KLNE/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592964; c=relaxed/simple;
	bh=SGuHeYTcGstwO5n9DDhvCGTcKVnams+042+BkbBAGTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FGkTVweWxdy84Zi8WB87iQdY++8dDYH8TG881zIZyiVPfAUSpKA7pyb66cBffHgLeyNCFle0WIiJT0fjGKoAcX67LbQQfDDZNsx2EkdwUxkVri3QA7Y95xVIKtaZnMQUgeXjKOOztYkTLEYApm4LfMSbq18yyXGc1Y3uqQRuRmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bdb162ee53so1192031e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 03:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592962; x=1784197762;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZamOEqvf20g5QpO72EPkaDRuNkZPExK+6Unu2WZF2DI=;
        b=jZ5fd9uv6AJxZAD7Md//TsAhvmoXxm06blJfNyLwiV8JCdvxOmSjztqeqdJC3m1zqm
         TaBaRXzI0bAcFtWlIhRTawR0JJEI+uXT3s1Ip19h3YUFfHyV+M5UFmzsKpg9pChBv8je
         cQRweEIkvjb3+SdxBmRLBvA0SctgpMt+/yPNUBe8EzqfETGkXbrsRylGtPJfsgDl39YO
         0Sl/EuWBwBMBxUaNDagCavTlXZswg0u9F0YvmOQNBrX2+o480dGDlCd9t0T2dbMe9it8
         BurYAb7OvpV4u9pfrajGiSsU5dTEqzyBtH03v7Bch9/o/N3kBrOOOYIIpOecOvqwWfgk
         MKMg==
X-Forwarded-Encrypted: i=1; AHgh+Rovlzg4rG2+jrKxw7eXVcYl2eHKBmzw16M3zon1BVeek+jIRorLa/nNXFpqQHMj6OWNWhel07GR0o+2AYVzabTkxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw56sqKTOZN+wbcMz+U4CoEDyemU2MMP03T8XSzrnw7FuRUFgLa
	ueXum+qNx3xnU44XwHOB+ZHppCoiJRPwYCWrIDrgOMwqyiAxDKBjXp2JcawtPi3e2nc=
X-Gm-Gg: AfdE7cmu00aQ4mCBi+5byXU6vCEoI8/9YQu3eR/5x/RdpdudJv+ARWoS7k3xA3XbefY
	nWe0qaWSkD7X0X9pUensdu27T78bk1GRWjFY4xgpme48GSmaQygXQq0pS6DLgNzIbAlfPNEBzeW
	ZS/o/o4tb77ikIyZC8oyMwcjuZQhD7rwCfndQOaOB1LknmJPJsUEaNV/cob6aUxNRhx/sRTig+u
	8sfosjGiqqHm4uRz+2Gv3dM6gs2Ve36ge8L45vFmALalWj8du9xUm8d/usI+uDo6Hih06nW1BaI
	jvrXA1quYuxuma7XN4l6KiZd4Df/lhM36M2KR6Gt1Jmffrj6mwkI/BEtpx+YFJMGTMQK8P/Orl6
	4j33c7ugKnR+HHg+ztFaXx6sYrEV2hfOexi6rUVwYzM2fry5wHmn18iIR8t/SpjhuIJdIrtbKDi
	JjvKGpH73MU1TB1fUv5TCfBTWtDxctfF2mcX6QEX+l+Laf7eorNVkE+g==
X-Received: by 2002:a05:6122:4b12:b0:5bd:ecad:8f9c with SMTP id 71dfb90a1353d-5bf75d5b57dmr3856360e0c.6.1783592962297;
        Thu, 09 Jul 2026 03:29:22 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f5e1191sm3257725e0c.4.2026.07.09.03.29.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:29:21 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bf959b820cso158654e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 03:29:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrTw7p9bE6b0KxK2U4MXiik3s8AG/daO40AGGI+HmtyA5Ld4MN5BFtWou4VuhmubD3N1wz7+4/atkJERxrsMlpj8A==@vger.kernel.org
X-Received: by 2002:a05:6122:16a2:b0:5bd:9d27:1ded with SMTP id
 71dfb90a1353d-5bf75d09a7dmr3522535e0c.3.1783592960849; Thu, 09 Jul 2026
 03:29:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
 <a069d50d-030d-4189-ae9d-37f989829da4@mailbox.org>
In-Reply-To: <a069d50d-030d-4189-ae9d-37f989829da4@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 12:29:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCXVYtN+jykp3Uz4tBHpWwW488=NguxSpWkYkO63BB3w@mail.gmail.com>
X-Gm-Features: AUfX_mxryCBg0UJms9GxmXbM4sVe50wH12jLcYc8l3gBc8Xa9jNslCUWm3ZIyfc
Message-ID: <CAMuHMdWCXVYtN+jykp3Uz4tBHpWwW488=NguxSpWkYkO63BB3w@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34943-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E26EF72FC39

Hi Marek,

On Wed, 8 Jul 2026 at 23:55, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -358,6 +358,7 @@ config ARCH_R8A78000
> >       default y if ARCH_RENESAS
> >       default ARCH_RENESAS
>
> I know this ^ is not related to this patch, but is the "default y" and
> "default ARCH_RENESAS" above valid ? I can find exactly one such use of
> Kconfig in the tree.

Thanks, both are valid, but sort of duplicates.
I will send a patch to drop the latter, and restore consistency.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

