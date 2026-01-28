Return-Path: <linux-renesas-soc+bounces-27564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O52MetZemm35QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 19:48:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FC3A7E13
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 19:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D45730474F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 18:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794DB2F531B;
	Wed, 28 Jan 2026 18:47:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF00266B72
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 18:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769626055; cv=none; b=E1YmX8mxjq7i0vuGUIyVuMH7AgPfaTD32HNPpP+pB4i4sbOkoirvSaJAN4uK3RO/BJrgU9zB0nF7ICDGpTFotlrC72m9/Puv8bt7okaE54EMKVv8zuE6uxTN9TA1X/5CYYJQUQ31bd8/gvhmkJI2N14BjuBghUlZ4E4V3EV4W5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769626055; c=relaxed/simple;
	bh=P8xj2BK8FjGDivD9OkfHZ4E3MGOAuE4ULGgWdPW5pgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m8dE40zloovFoI//glMz+R2FyZw48HasLhKLlNffGxj7cBDbSZtsXTGjlZkf3wh5iBZT/oQdkMhYeEa0B3RRxwyAZFETrOueFbVlVg3u0qkFMsKx8b0nsHq3xXjQK3FGneJgjJHESlGG2AatWh5KymbCAF+5aoq2Dv9yxUrctEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c6af798a83so25235885a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 10:47:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769626053; x=1770230853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8t6SLqjvsNW00Dj2Hjf4deNPVV8qylbppXyHu+3S3LI=;
        b=uPCLGHG46Yrfbdud/lzTVbPrGWmtxCDYeiyIUEag4GBqqBJJrk2IUzujTBDPxi4cbi
         ipaMftYSaDmKgYFktuayGCZ0L1UYgJFGTIhI1eLZnuKZo2Lcln3ikbOsVGuoTimvkzNb
         BPa9xFTWI4+JCebGcIBs+KMqy5QfgP8s7rO5HmZZ8akhpvUMl9eSFdlsTIEZt6RHbYEu
         D8yYbDSsZmr4sdLV0Y0bl9FM1hvCORzMcBGdCI2edNouL/E83XGbVirMIJbBPmXYgESx
         vUwKn6YAJWv5LF3ACoFRsrJMcRFDPSr2nc0sI+tjSdHRLM9y8Wv2AIwicwN7W0x3yp9g
         +pCw==
X-Forwarded-Encrypted: i=1; AJvYcCXDYmtsQlc2HHKcNDrL8Fbo9R3XMMR35Se6c7hLa5Bt/RanvYfXU/2dWFlH9YkbGKXoMzEnglfhNr9RwO5rgLVx/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4j/p338ZAAml47i422079jr379LM80Z8WWLdp/zqGnzcR7m+8
	bDVE8XyT8TKpC0cpC18/Tpe8F6VRTk1dX/v7KfKoBj3Hez1spmpbWOF1doqDibJK
X-Gm-Gg: AZuq6aKmNR/Xs9IFHwCEbdld3Ebtm7o9mYgU2jdcDcYgjCC2M2GkZiwaJ3SXasiszZP
	TCQsZOYAM4V4o78UJfGzRIHJR38njiRc4sl7gSmOwApUQrCytPikbevgAMrpd/AOtaQyr4oDP7T
	D4lnCI96KQqP4N3tfqHvczIwtrSDli0o+i3SisxNSmdtsoIPmv6v1WMhWA+mZrmju/kE1zhPCij
	9ffTQ0jfWZlPVw7X82HJoEkuVN9wx54CsJrY/jFAwjIvL7CjD++EHJDVyC0fMLZ1Ld3JwJMb0mh
	8c9M7nqRHWBjwGv3bST9g6sctYEwqEYsz9KY0ZeHPKPWRhgkiHmlwyL6NaaP2TBiuDcO6ebggr+
	89//xZ2pk9bejyH1j5F3StH7VbgtBFOF7VXkNJ1mP3xboit6MJoInGqf+4VCbIM0uAuOMtWDbw9
	mu9FrAvPfkAALes6jhG7jVPTIv00QHLSEI1lS2eHSzWHkbXdAVJg/KhRzBVzm8xkk=
X-Received: by 2002:a05:620a:414d:b0:8c6:abc5:f17d with SMTP id af79cd13be357-8c70b8f6943mr740698585a.62.1769626051469;
        Wed, 28 Jan 2026 10:47:31 -0800 (PST)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d452eesm236839085a.38.2026.01.28.10.47.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 10:47:31 -0800 (PST)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c7146b0854so21288385a.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 10:47:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKYFyjsouTXYQ34m3d2zGdxbJC4jO+IFZfOfyqYicKNRH0QAmVOpEBb2hoZWGypnk+862xWUG9jmO/rjYmBN9BOA==@vger.kernel.org
X-Received: by 2002:a05:6102:948:b0:5f1:72a7:f879 with SMTP id
 ada2fe7eead31-5f72378e7a1mr2207053137.28.1769625713444; Wed, 28 Jan 2026
 10:41:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Jan 2026 19:41:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgnVcwo3b=zQx0wVcH53dm6kBz3nQ5T0DZat4KxastuQ@mail.gmail.com>
X-Gm-Features: AZwV_QggK5aoCgxDwMwUamFclvyMAvDW7y1KAlSqyJcViMQkB2_vluWrOqhRb1Y
Message-ID: <CAMuHMdUgnVcwo3b=zQx0wVcH53dm6kBz3nQ5T0DZat4KxastuQ@mail.gmail.com>
Subject: Re: [PATCH net-next 0/8] Add support for Renesas RZ/G3L GBETH
To: Biju <biju.das.au@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27564-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,foss.st.com,bp.renesas.com,st.com,synopsys.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 33FC3A7E13
X-Rspamd-Action: no action

Hi Biju,

On Wed, 28 Jan 2026 at 13:58, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The Renesas RZ/G3L GBETH IP uses Synopsys DesignWare MAC version 5.30
> compared to other Renesas SoC such as RZ/V2H that use MAC version 5.20.
>
> The RZ/G3L GBETH requires an extra clock compared to RZ/G3E and has pps
> interrupts. Document the Renesas RZ/G3L GBETH IP in bindings and enable
> the Gigabit Ethernet Interface (GBETH0) populated on the RZ/G3L SMARC
> EVK. The eth1, pincontrol definitions and hotplug support will be added
> later.
>
> Biju Das (8):
>   dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC
>   net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC
>   clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
>   clk: renesas: rzg2l: Add support for enabling PLLs
>   clk: renesas: r8a08g046: Add support for PLL6 clk
>   clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs
>   arm64: dts: renesas: r9a08g046: Add GBETH nodes
>   arm64: dts: renesas: rzg3l-smarc-som: Enable eth0 (GBETH) interface

Thanks for your series!

Please don't include "net-next" tags in patches that are not meant
to be applied to the net-next tree.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

