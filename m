Return-Path: <linux-renesas-soc+bounces-32928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIKVMrgiEGqsUAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 11:32:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F985B13E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 11:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 97E2130158A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 09:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7C43C2B9B;
	Fri, 22 May 2026 09:31:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CCD3C1F31
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 09:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442282; cv=none; b=OCYMmcCvZB+VEbyK+H0Ml9QqjNA/DveC7+nx0RpTn8oukikrZiRVbSCJalJUjtGeWNWcaqbWSkgD8CgNjTgLKDxHQSR4ukyKae8hUfGftPkda8iaVmtJqU5vH6GZeTvTeUAjOmxE/Xwd+vs5PFDktCD68ZRlxYs65icCpvUqer4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442282; c=relaxed/simple;
	bh=tQoNXs0YXAnp39amJZcKaF37pK97KoMuwAUSiGpU0uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAKbvu047j6C6hvshtNpyUund/atzYxSc/041TADIIWnTCh++X4Xer6HVv28wjQAHCQ22jXg78TboISMZF9DOWqtPAqdbb6BcM+4cLVpjspZ9qMLbdXuJKJB5i7R7gRWBj9/YtHyzi73XBSacL3zITOzF1Bpo22ib4QJUT7kn34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-95cd8b71105so4210017241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 02:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442280; x=1780047080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXh/a66hlYfRbxZfuNeGCMhzqvUCQcFK2ffTSRMpwj0=;
        b=drhnkiZjyclaXMKCPHvxEqfFMQBu+KFd08UxBIAxfgr8rp44MtSG+Gm5Ji32dIdL8P
         SkSVGP0s4++C387zhDa7ZMF1L9z67TTelWUDG3Ajh64XP1c8QAXkpML3V0qoabvkDi7d
         1FJvF1O0naA3Z7AU9i6WhtNooMSApSlP0U7H216xkY3H8qzaEhllnD1bEJZ2LjepKHZ4
         LFpzzqzQYJ4C0UXJWYmnzcKhDagcGyclfeSHk04AdUM9MIQ0T8VR7JqcV2R6ov7ajhZq
         p1ew12U+cII4mGRxdvWBt+kFaV2Fs09ttBrqhgi2ARWfF+ztOpDv1jZYj2IViwkfCwG4
         gOVg==
X-Forwarded-Encrypted: i=1; AFNElJ8KGyQr3ELLbWgCTdV3BJ3UDyxXuXKlGJxdh4eCQnA1Xx6uA5FQpO74tVALG9e5BNeY3p4wN6aHc+8+ntwrni7Tfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaDZORueSj9T5+qFC19b8B+x45Dmor1c5VXxiqoJ6XNntyQYrN
	g/3B0m/JtUbCWmm5aD9sOtjk8uqqBkj1xmGKUFxq98SPT98CPUWmP1YManIA/6Dj
X-Gm-Gg: Acq92OFb4tmOAbC5SWxedhR0P8u7rJlAV20Uhip4r/W8n8Pt2aYCAxEVtnmqkOZR0F2
	JsNlvR5zlJKJBvTu+JLvwYxzTeMhUUUwzNrV8aME2ZYEt6VQK4jg8hmCDJB0iqE4c9AXPCXzKjF
	xtW+WRaf3nUbbwLa7fbAGe9KdJTw6UqIL8S8Spq4I6e5DJdUK3GnJwjIWLlasppGkNv1TxnbSSt
	gdOohfmC6JJMvSx3pG5IjFk3LEnjdcmHFx81h0M3BJX5aqjDcGdK88MqfgGGZ+XCj5Vc+NvOiz5
	sx2TgJbt+KE8PfPesUpyOq82koFXovj4qgMKPNsOjKkt4Tr+3meJndU5eM1cdQmOssfSd+40ai7
	wcSCzrSPhcbUEUd0h8FchhlgFkDAENZhr25AnGI62BBguB31poY+bxmo7XB90rUAsf2/0KARNex
	GYUBVp1Fk5e62z+SDISi2YeI0+GyI0fxuimO+YvIa2s0VqRlpEk/AlQhXpmh2i
X-Received: by 2002:a05:6102:4a84:b0:606:49d:1861 with SMTP id ada2fe7eead31-67c817f6b08mr1065780137.27.1779442279901;
        Fri, 22 May 2026 02:31:19 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff5f1140asm683051137.12.2026.05.22.02.31.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:31:19 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6313c800372so5436987137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 02:31:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8x3beeboXTFyam1LUKbJGM7gaeuUAbpwLKl3vKhbHf6LD9JCv3MUdN+2weiEcsShbANqB8jf+GgemVbU/5/yxWxA==@vger.kernel.org
X-Received: by 2002:a05:6102:508b:b0:607:95f4:53b5 with SMTP id
 ada2fe7eead31-67c6f741653mr1209894137.4.1779442278012; Fri, 22 May 2026
 02:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520092516.69819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260520092516.69819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 11:31:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6m1+Ay5i-5Fty+W3knznVYK+SP_-G649joyR-JaoC=g@mail.gmail.com>
X-Gm-Features: AVHnY4JCREYmX_pQ2UBjLSuHgDHou004xVproUkaCAOyhIUIUfjhoGTRoG5CGVI
Message-ID: <CAMuHMdX6m1+Ay5i-5Fty+W3knznVYK+SP_-G649joyR-JaoC=g@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a08g045: Drop unused DEF_G3S_MUX macro
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32928-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.549];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,glider.be:email,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 68F985B13E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026 at 11:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Drop the unused DEF_G3S_MUX helper macro from the r9a08g045 CPG
> driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

