Return-Path: <linux-renesas-soc+bounces-33023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FkGFsN4EGoZXgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 17:39:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AA85B7055
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 17:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0D4B305DEC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B993D41C2EA;
	Fri, 22 May 2026 15:34:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED02378D87
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 15:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779464096; cv=none; b=EaDWfqh4DpClxjdMHpmswZqQYVP+1Fy2mPrN6zArC6SQJ5W5T9MVgzr6bHa6uMW9c0o0KU4YrkwwHuawPYCmf4/M8jMhfvDXid/4JkRAft7LGL9lUaMVLQk3HFXtEtGv2Q7CYuKVAENI/AYCUSde5S7PpHHYnsr6Pv62qGRV2Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779464096; c=relaxed/simple;
	bh=RcKm+MJQR01WbzgcsBzYoy8Uo599kOW4Z1qyK0a9O74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESgsnwkHeDhoAfcZEmYDhrgHIXANwnziIaJKGWlZSZFadogjKJggRlkHi/XAAQBvDDQa0LItmwDuxYXDFeotHNvOzF9l/dR6s1JfxCnOoZYS90kgapXYUxKLq4ZLPujVq1763qs7GSMbAzuJ/yrkRFPQSoehHe4riw29lC+pq2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-57602a2d80aso2393422e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 08:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779464094; x=1780068894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FixydBMStjIkh+xhknFyVmJmnf/BoQ9WGZ0+yOe1GDc=;
        b=Pud7BMmMm6+grFKpsG6t54ZhASy06nIOMyDa74Ztpx+x6Cn0VNgM/MlY+lAi03xvSU
         vb+kIzA9mgth2meXXo8YUenYNoCx97MIRzRvCpMKvuDClZqd9yXdY/AS5Mkqen11AmDM
         tFiJYXbe6zrbYVvKCQ5aG4hfIj9SwzBNcmsaQLmGHt40wRcUmTIXcadMboKBPAprX27F
         P+o2bkq8GeNPoWMeAZg4E4tv65uE9jcbBLrsbRzGSrNGmbBILyukSm9fS251pvJaWoEp
         XEv0yRMAHsDlVj6iB/wNHjL6abf4Fnwq4XcsItJxUBqT+77RyF4qvEI+ePcuHTOPg9gh
         lgIw==
X-Forwarded-Encrypted: i=1; AFNElJ9Yqjv5XaVy2+rEN1dRTzixQh/tS3bZj265ld9l3uzQ6BfH5zRznav7nk41P1EmrQmnSeKbH6kbsUxr/TqfDkX1/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4VAB7q1MrBrpw21kNql0DN718XUtoUEU8vILYfsg3Qc+eUGew
	LtkCkGAdpoRC+1fx20ST0xAnFfkm1JrQlGpADdH/+n6q9hM/B0kaT/ysMMQHk4tEHIA=
X-Gm-Gg: Acq92OEn50ZHr7lH+jrO3xoiTmaaFImAn2JX3utznGkeviD/4tBdaQjGvRbX38WO89x
	pMpsis1NnAGDT4NHDZkf3bZ9W35PBaMnDBSa2kvIki4QYjYYum38dHEPNt6L3f97U1GDZ9YN7ET
	0c630IAkwHcr6CUDT2iyixtmw9iFz/dnMxUh/Ny2b2GYQJkyqcw4LWXtSfY58cRO6IO3t+xsjKo
	vrPYkETBliWVVTw6bn+mQCgn9EXAAE88aigw338NimP0g/M+GKjl+A9D8oeMNh3vhZ2aznSPrvP
	6Kng3mqph/AL9WcXm4Pn9TmTbM5BkUkbZCyLBkx/FYhRlNjurWwPq1cqibJtAhwBuTZ0Fh17Rnw
	ER+kLURWdtXl5Wro0kDBpyudHvSy0Kkn3jXCMpvH6Sfmp3FZzMoqAMOd9o1HhFuDRbbkqxhRraT
	lRkiA/fNB7Pqc/PYmMgt5cZQwx1Ufgzb4ZGFF7TKOHUKld3XuAnSOavQzCQaB+OVxd3uJMTOc2S
	yc=
X-Received: by 2002:a05:6122:a5d1:10b0:586:f3ee:2150 with SMTP id 71dfb90a1353d-586f3ee2352mr1145796e0c.13.1779464093657;
        Fri, 22 May 2026 08:34:53 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173baf56bsm1943356241.13.2026.05.22.08.34.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:34:52 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a857578a8so2979621e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 08:34:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/K8z3/XAoezAR0k+MiD1gLyh8QGJVfiesOPXRJsw1Oc2SQh/3eG8sObrEygSzxX3MUUNFzaSdtaZ0ynd4OiR5MAA==@vger.kernel.org
X-Received: by 2002:a05:6122:4d0d:b0:575:3b9e:db3e with SMTP id
 71dfb90a1353d-5865d70cb8amr2549460e0c.1.1779464091785; Fri, 22 May 2026
 08:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:34:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGsdn-8R7BeOfXOtrhHNW=FKW+rdG8cH1r=+GDnAE+Qw@mail.gmail.com>
X-Gm-Features: AVHnY4Jf1Pww2GHfOAXrLj07kMcY44kD7u6kHAIZKMSWedE81wNkTdVC9LQ0_SE
Message-ID: <CAMuHMdWGsdn-8R7BeOfXOtrhHNW=FKW+rdG8cH1r=+GDnAE+Qw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car
 R8A779MD M3Le DTs
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,bp.renesas.com,redhat.com,kernel.org,renesas.com,gmail.com,baylibre.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33023-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.950];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,mailbox.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E9AA85B7055
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Renesas R-Car M3Le (R8A779MD) SoC, a variant of the
> R-Car M3-N (R8A77965) SoC. The Renesas M3Le SoC is a register-compatible
> variant of the R8A77965 (M3-N) with reduced set of peripherals.
>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Drop DU until it can be tested
>     - Reinstate sdhi3, switch SDHI to dedicated M3Le compatible strings
>     - Add no-mmc DT property to SDHI3/MMC1, because MMC1 is not supported
>     - Disable ohci1, ehci1, usb2_phy1

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

