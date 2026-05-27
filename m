Return-Path: <linux-renesas-soc+bounces-33205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M4eFwLPFmowsgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 13:01:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F125E30DF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 13:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E588B300B463
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 10:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E6F3F410A;
	Wed, 27 May 2026 10:59:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3E03F39F6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779879561; cv=none; b=Z6bP+uQQt/8/6SPnVCpEeJZQV+zEt6sJlqlplh/NDpGhJADoKPbnqC9Z4P9UnsMxsoAdKtJivRa9Wwf2IeKWwzLHHeTAeXZ1apMlXeQ9mWNDdFF7LmnDJco9DAp24lic86zFRuieVVTh4mghaPi3jAwAu/9qaL+VX27dialnU0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779879561; c=relaxed/simple;
	bh=jLHyjOxl5RN+EeAG2bOgVdUtQ1t6XARnJM9A9fgyjQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lEU+yA7Lv5+Y92VUuTCjOalOxHLb5gRtg4zINcoglxn5s3PHGHrwc7E8jmLUVsJV6Yu65OCVYPMxDxoVhn3LXNcCrj8v6WYhz7EiJGlc9CX4BhiuCWGODg0pHPFK/AvsxncXiVa3e+OJdlQxrvD6HRdFfvfb7yHvtvfNSiziyCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-57516bb40b9so8014972e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 03:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779879557; x=1780484357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGrazzxeRDGIU/r1E+qrR5xkaxHzvbTfJG1/y7af1Ec=;
        b=oVVqMKl0/zV+6bUMFfjOOlfwlzc7ojklbv1mH99cyP9dtMUsEmir8FdiW0gkwa/1T6
         FNJaMRCpN+9U417RV9iZ/eMELL7HBktIt6P0XjDbX0YxvP4ND+guw1HUMQ+cwc7eWkG+
         EKgCD1Btjj+fkOBDuXvJT1iBfrgK5G6HYlsFRZTfovt4kNTR+fPLcvVLBuPUtJE+P7mQ
         JqPsr/QVsfCbgtSfqpUgDAZbWB+2dOnK3VkcPcAPgINCS83WRqMeumsanCXhAsWukXGz
         012aGj0IsiDl1PFIuImUS5Oc97RkS6xw569Y9d0PlM8pUdjhQRIv+DM6qGTm7GAlMGAG
         ahqg==
X-Forwarded-Encrypted: i=1; AFNElJ9kt2kNRRKfVaxskT3aw5IigWoc8NQJo0B5ergCa1ND/jvBsyzBkHUqskE4zldDnJGjRIi3iRak5LrkYNmERpFgCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjmlzwII+a3UDJbjhsiGpKrcbNGkQVSu/5PvQVz01KKzv2ntK3
	WE7juctSH3FGnahqh8lFSenD69jv/N96hKgu9An6um/zfjE6E0otoX43ztWs28HhTZ8=
X-Gm-Gg: Acq92OHxAUOITpCCTpjGnYMKycNy8pWKgVrzZKcoBHS+fxs5qZ8LS09h+KLgaoB2+Kq
	/6EZQLg8CMjrxXGALmMDAI2/WakFWgOboeKSRt86qb7on0ZJfHTda1DdAq1B6LKHHT6KM4FKrfY
	jar2yYeSNGt0Y8oHTyJ7nogNFJOB6Vvg9TaHZApAzFsK13fQtzHIDC67kk0gVWPez8vbhpDGrXB
	SCWCL0nvAW0RRg6K/AI4VD4KKWWAB15OIlz/eboVYyR2bx7zjtqmdHSgHtf4mTieio4unnZhhbi
	r0WfzV8vwsVW4vdumngvno1go6X0ptEM0xTG/eR0zzOSQT9MtsupuGLKLdtiCpHm8vN7+eT1H2O
	WKd4nDTWd71xEW+wxdVkGtl+00l8E/qAbSZKKgje5uPTmtOHIGxHKKIW3ZvuNY+6u9eoRrtMZtS
	+vcUN71k1HFctjNEid713CnO88IZZ4MINLMMQ+uihZuIeVx6rruwgpfPlT5rYmNXfjj+iNb09Aa
	Io=
X-Received: by 2002:a05:6122:3b0e:b0:588:2fc:f169 with SMTP id 71dfb90a1353d-58802fcfb55mr9339287e0c.13.1779879557437;
        Wed, 27 May 2026 03:59:17 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f25d708bsm20856041e0c.1.2026.05.27.03.59.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 03:59:17 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5873983d19eso4857471e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 03:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ88CGDSJhS3LJyY+6CCBfBj3IytkS/UaCgc5niwDNmAgkWcCgssg2cbdbOky1I/tZm/lx5KbIJGQzRkXaccNzGwXw==@vger.kernel.org
X-Received: by 2002:a05:6102:3f4b:b0:631:9366:da8c with SMTP id
 ada2fe7eead31-67c898c33e4mr12526499137.14.1779879556821; Wed, 27 May 2026
 03:59:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524082657.19335-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260524082657.19335-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 12:59:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQCaiMV2Oqc05OB7EQg++0gj-cbGYjjdy8vM0uvO4qnQ@mail.gmail.com>
X-Gm-Features: AVHnY4LwFhicj5_5tir-adZ8YWCLaBs_fNGP50ccLA8lGaFPhJJtQHDMx2r0DRw
Message-ID: <CAMuHMdWQCaiMV2Oqc05OB7EQg++0gj-cbGYjjdy8vM0uvO4qnQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a08g045-cpg: Drop unused pm_domain header file
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33205-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.596];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: C4F125E30DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 24 May 2026 at 10:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The linux/pm_domain.h header is not used in this file. Remove it to keep
> the includes clean.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

