Return-Path: <linux-renesas-soc+bounces-31642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePI5C8Z162kQNAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 15:53:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD3E45FCF5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 15:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0883A3009B16
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 13:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5D140DFB9;
	Fri, 24 Apr 2026 13:47:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750613537DF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038479; cv=none; b=PLcHpNB8I0ssFIh07NtPupr6RAf2hSHmDl831BfaxRk54sgy11WwvHs2UfOpQIlogpd2+rwFKeWe+Zh3iwMy/FdnkMcXGiHm8OH5CP51mLMQP/XN341EFgPL/c/K4tI8CV7gAhytd293umKroIYxPr2U7j44fSjd5lVXWb51LQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038479; c=relaxed/simple;
	bh=09Sh707RFRsbA4Cpc6VOVQ7w630BPN+H1W5SBQ8X4i4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Au66PhF/cg5fM4qccfCajBgkRPSnv5P98LO/nvep2dWqivW3foGKgozEFgV/mHIY55maAKPX+LiwEQPB7TtiKfug+QOG0PTcWHU32MefsGcF8Gil8IGdPLmXbsfwO/+9qY8KOMgcF88lwlMayWl0snSkA0An61jOCFLT3U9iWDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-670f6ae9c7dso10747061a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 06:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038477; x=1777643277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxbBEAEmkzXg8sufmQelLSZfpgBcx3HXgkzS292cULs=;
        b=AweXTmQD5kH3tZ3+/iWQ5zn89NZhz3snHB0XNTjVVQBa8JXyhfNmXpQrMfz6WOxi2z
         IvwsgRmhqeE8gexDM/luArePdax3edUlAAEdLq5msb76duo5+TSsa9GeVC8vnNjQo2tp
         N7Sl2caDaCd0TlMTXT3RM5CCxELp8GrH95aB0ntEUCVP2wZF33plZtvBv0xwyj3iIqID
         QFasVMAkgevm9DAB29yw0XqAHwfHE5wK7eQr410Xf1xBCXFKn4orfySMT7FYPmSDn1tD
         TxRA9OXEfIoCzMoXqg+1DktJLbFPiRMnrQpADLGi91zmhVyjua7IGdCZei3yqqNZH0Dd
         pW5A==
X-Forwarded-Encrypted: i=1; AFNElJ+d6pIA+rMEWN9KBzFtmR3990FWwJXd/dtCjQQ2NyXAdCiYiLeq8TRQaY/IJY2/brhjL3qFsJGgLv6HJh1Ef6DoJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeIkm5RsTyv4EPicrvUY9PQrlMDOD6TBKzHu8koUhYgZp5VGwt
	3ZJ3TfonzCno5n1A/LNrPum9iux4Be/dI1E1JvusJwAHvlJFjKFAn9mJYAGrDJdG8go=
X-Gm-Gg: AeBDieste61UIFZ+0EEmlAfpypt99JUBOJNBpbsA9vF96F8qgLeQw5KCRGC7cbcIgrn
	9zEmULw5PEuHRdAP3AEzlIzE0s5sOiMrHUVs8cvBgG/HlfCQip7ikHJblYqnJ2OH+5+YUWvCJNH
	vrK+PFTLDBP+Tna+KwuMA1wjTCppTHwvOVuRGPtq9/+pWCBqFaTK3KEFijvn4spgsu8d4W4vjxp
	+aWJEs8VlN6fWN4l86Qamur9YWk90GkHkhZw3cZZcXhBWlywT+R3tufnBCL1cGQM7PnAklvr6Yh
	NuY5d0gEz/eAaxLXUJr2ewZf5R7vgvKjsBcqScKY7lOYe06zhyEw8Hlm/mmgL6qT2ZFq4dI1PJK
	l5ButlxUAZXdCJREy/66GarP7jmflRd6S1crzcLdSEFN+VsjYPNd8tjMBGlJRCjmUXhxkbPSVhp
	V4SKSfMCu5WYZsioMuH6F9YRQuKMseMJ/Oc+wV50eeF5APLgktv/uRt2XmQui9YP+PQ62dtFY=
X-Received: by 2002:a17:906:eec6:b0:ba3:1150:94b1 with SMTP id a640c23a62f3a-ba41a24ffdcmr1651028266b.29.1777038476698;
        Fri, 24 Apr 2026 06:47:56 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e1bsm774060566b.3.2026.04.24.06.47.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:47:55 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c603ec2dfso1041925866b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 06:47:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ93lho2Ym/gpmIO5sc/MXkiC3rY6YwkLl3XtqEeY1/ig4kOHrINNSVyn56ydU+E77ynuiG5MnifMAIorBqlcFHj+Q==@vger.kernel.org
X-Received: by 2002:a17:906:f593:b0:ba5:234:13cb with SMTP id
 a640c23a62f3a-ba502347802mr1522477166b.4.1777038475099; Fri, 24 Apr 2026
 06:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org> <20260422233744.149872-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:47:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtAcB1SoYz4jZo4s7shMi3+=Ovt2pw6YgRedvSiDT=3A@mail.gmail.com>
X-Gm-Features: AQROBzCeSX9qxN5yqtzC3-PAZZnXar2rEL_AsOuEwJq4ANARfzjj6L8MVrx53_Q
Message-ID: <CAMuHMdXtAcB1SoYz4jZo4s7shMi3+=Ovt2pw6YgRedvSiDT=3A@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] ARM: dts: renesas: r8a7740: Describe coresight on
 R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 9CD3E45FCF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31642-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,glider.be:email,mailbox.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Thu, 23 Apr 2026 at 01:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe coresight topology on R-Mobile A1. Extend the current PTM node
> with connection funnel, TPIU, ETB and replicator. The coresight on this
> hardware is clocked from the ZT/ZTR trace clock.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

