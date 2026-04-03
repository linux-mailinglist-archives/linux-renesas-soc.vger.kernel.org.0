Return-Path: <linux-renesas-soc+bounces-30831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGZ6FE2Hz2mwwwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:24:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C5E392BDB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E69EC3064F14
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 09:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7783A2F532C;
	Fri,  3 Apr 2026 09:22:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A0623182D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208125; cv=none; b=VDs7qE17salSKzq/+gsSZo0wkQ70XwchqRCHefJrkBztymhqvvVLVXy5ymseKOd8nPIibnNdldt96RsxbDb+ez91yd4B3qWq6ihHDIS6b30Ha8jUKo3chKGSSQVnzx70cla3KuHnB9li4zXFSpJoAAa9/Ywb8hSeJRm0LP9N/BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208125; c=relaxed/simple;
	bh=/qrkEi9Dzzy8A0lleCtw+nwQnl1zxJvmQgStyC+wPtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyZut6T9vX21lx3hZ3MZacq/TUpXMimvgoRcpMk3PW4pQ1wG/GbPJstxxUogN1EM++VXlUnWvKzLrD3z7kwiMPysCf2NnMt30WmmWTCQ7/KNEhj9xGkLynZWrH/snctkuwL7QsnJAYjMp5Ra3iQxfEWff21N1lDoOBAyzDLv3ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6058a955e04so1079847137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208123; x=1775812923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5B2pyHP/JliOmf6Ji1g5Y1Ga/IgQoI6orIY2xFD1nM=;
        b=tUryoJlYH7ojiDN4sIA9VMMMfnndA22rvgBvdokCwYojcDv7VVmXrf+Yf7XIyVJxoN
         FHf2XtW6id3KYF6QzXtn6ZJm/vZNt+WAYbYToZARjES89goTPK8Q0CeUscyauW9A7i5E
         2GbJFdxGtS/Qd7DLU8AwoeWbljwf68U7HHSBmZKlr8cg413fGphMRaYJc9sc1EvAKOnk
         coWfPaHUTzuaXnC8dGCRFVi4678YBFytWqFMiznT22rcnyQ3xUwj3JuOtsnsnJp3Y5KZ
         +WXCoNE5ikXn78TLdXHeiEPK35YP701dUDKnR4JFn6UYIU5cJx26Gd1JxMIpHrLUgEy4
         y7SA==
X-Forwarded-Encrypted: i=1; AJvYcCVsbdsZu8U1EwUlMBsns+V/Kxvt5ayFKf+yggHvtHVHMyUnb5gJpM/cFfkejReBTcLe9kcX+H13y6vpVpzAMxOHzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg3pmrsYAeaUBWQfonr3d3B9QpU2SG3jQ7qe+8a7u6pur7ivL4
	RbuekN8iUlAruLrdn3r91j+ho6gWTyZAomVeDPuQNWvROZJ/iaFbtxW/xLo+tvsw
X-Gm-Gg: AeBDieu+ToV/iEkajzz+nSxAKPWrAlAzPmCoW3c6uWfxV7KWKHSHg4EUpO5QeijKFzs
	QcGx+MkmKOHjVBYszkuI60EjF8XQqp2mRNRy5NduuV7Ivv3vHC3Abpifi396WnIUdGj0jfZ0+/v
	SwvbHRVnWCGnUkUoJHGvdbRP3mPc0gz1QM/mk1QTL3X2KQubsrdJcj2E/ALv+/K3cM8gGCzCufM
	xodl0cOEY+Kqzfes2xmctmx7594YiaVhgAYWI2t8PMTGy8LMCcBaGAlOYes+gEejZvmM1fg80vX
	Rx/KNTK25/HIStQnlL6tEROK7p8xyukBnTtou4X5ajQ9Vf6nwIgxZvPvOQSHIB6jDXU7PObvCCK
	agQr9wkcKQaKWLZBPFtuXFLpUUjN0UfpcH90EvIMv3u+9OhalV5qzQc3SPub0f+eS8LWcQhyJ2X
	aBehySWyzV2y3G9KcF7kR2fsydFVLgMsROkrI+kO07a7t3sMgTm7lm3GFuwq2i
X-Received: by 2002:a05:6102:94d:b0:600:3b3e:681a with SMTP id ada2fe7eead31-6058a87fc66mr1959495137.14.1775208122979;
        Fri, 03 Apr 2026 02:22:02 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fba6abbcsm5643699241.9.2026.04.03.02.22.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:22:02 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-953a5defbbdso1040639241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:22:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvJQIIINAR1r1IwGmcCY2JWIRAuB6yyv59SdJOlH6/U5cU5yOSbib3kpbl2wN7aRboO/j9Ap3TjjBqch2XcGnHwg==@vger.kernel.org
X-Received: by 2002:a67:e70d:0:b0:5ff:c40b:27eb with SMTP id
 ada2fe7eead31-6058a4b3fd6mr2323242137.3.1775208122603; Fri, 03 Apr 2026
 02:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:21:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTV71efsQ6SzdXdsnHHb93Gn6sbNNEjSzVLZ0_w==90g@mail.gmail.com>
X-Gm-Features: AQROBzBnDgdH3_Oj0-6Y6WYqcbqwAQ1EOcuaufJmPvw1l1BD18PtBKWpQ0DK2N8
Message-ID: <CAMuHMdWTV71efsQ6SzdXdsnHHb93Gn6sbNNEjSzVLZ0_w==90g@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: dts: renesas: r8a7778: Add missing unit to bus node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30831-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.831];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,mailbox.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A2C5E392BDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

On Sat, 28 Mar 2026 at 00:42, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing unit to bus node to fix the following DTC warning:
> "
> arch/arm/boot/dts/renesas/r8a7778.dtsi:43.12-48.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

> --- a/arch/arm/boot/dts/renesas/r8a7778.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7778.dtsi
> @@ -40,7 +40,7 @@ aliases {
>                 spi2 = &hspi2;
>         };
>
> -       lbsc: bus {
> +       lbsc: bus@0 {

Note for the future: if we ever add proper LBSC support (including its
own compatible value and reg property), this should be changed to the
address in the reg property.  This applies to the first four patches.

>                 compatible = "simple-bus";
>                 #address-cells = <1>;
>                 #size-cells = <1>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

