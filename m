Return-Path: <linux-renesas-soc+bounces-33188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKKqJlGZFmq1ngcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 09:12:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D715E044D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 09:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72AAB301B939
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 07:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8043B995F;
	Wed, 27 May 2026 07:09:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA66A3B5E15
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 07:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779865756; cv=none; b=GfC9vYssAQt6vszgb8HpOP+WBBaCSOHtl6QBZR4tG29Aw8uU9dzLUNrZQ5PGTBLohhlhSK020hI8MSy4AZYmtJ/xCrnb8t3UmPToRtlpHzAGljbScCniKhTC5CZmp1yUtphUHzRA+TTQ6o0lXK/BbjhAK9Z6mrPBrPtuEDlH1yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779865756; c=relaxed/simple;
	bh=ngrbmOnXC5lBjdRyD4GqxUFWufQt4vLkSjmsYEIayIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0NaANkwt2fyTe4HDVmzg7+8WzV2++VwTAhl5SkkJ4OddTWnp9UqTZNQYQIKTX+cnVJNNPD+OX4+7CRL7Xd+4wRbwIq0PwT4CqeDcdZpTyJI/M5/GoXwRc3EuvLqKo8hf6SFYFmPhhxKuqyJScf1G0wo8VUIhESOkBRcPbjhkgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-631311d876cso8258020137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 00:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779865754; x=1780470554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOmm8R3Cq+WYMZhLsp0nlZk+GIal/aJfbZcGuqrg9gM=;
        b=UIE0YrdLRYgXc1AZSxxoC1B2iNGq4pjo43OvVLNFhPfDJJIlh0O6zLFaJkRQ3wlJYF
         l9gDpKmkrTvO+uvmW69vHIW5SMuTBxucp48qRG2Sydtz9m3pFSVfXySvBfvJOEcSH/lV
         ey4KWhcTcCEttWhaQ4BBtTQBLi7bgyZ6C9AEHFPLIx7CaF0TI9oaHJgS7b/QM7a1rYXL
         a47iXoTDJLxWYnTPsLBmPYRaf4Qsk8OCEj2m03i5TwACmPdqo/1M0J8vquWgbdnloD6Z
         MenzLrHZyryma6Br93y9w37wljNil5ByC8Ruzm3zshiCwjeMpamXZQFyTv2g4zgdcjpg
         ygFg==
X-Forwarded-Encrypted: i=1; AFNElJ8GEjAcah+ZEIHoOVLsiPF9zv30DTORzriMtGKw4wXTnYHEIIyzyIgUkutI+OMbIRMo043XG4JrHdUOqhJro2Ryag==@vger.kernel.org
X-Gm-Message-State: AOJu0YywKd2oW/ObFA564exTmnTt4HbhhXn7EzukW6MKLIWc4xLg+ULD
	nTU2pzgNFM2QaPI+fZ4itXAy00ht5hoXUOy2bng5gCw1t6J+G/ZH/QpoIXDCcmeNrrk=
X-Gm-Gg: Acq92OEPpfVp6hXqqoXxPSnaZnV/6GW5d6qS+OXFRSxVU22PepAnF5/fv0X20dfcIQD
	cTK7yLj8KuT+rwSWivplbNJSNdAZ8RrJ79BGv+vxroU54qEpMuYhfNmsQLWOPVY4KUvl+uRWuAy
	N2t5olOyEN2aXXc2MJDKwwK150tOj8RFL7yRrD1FgcHdQR8LFAe4bLTHZkYFAugxGSChL+1vAlo
	jAv03DFrgyfnEXN/unqHZr6n5IY20Z1pfsnMRIHObT1B3cuiqxUU3S97BiKwvHgTeGKiklkvEyE
	ZYAyCHvFPqXe6DYY/vwqo9UfnJ9KI/uvTsboGUa3OhfqwcDXqvmq0oHr/HIjopeHFJqvdALC/zp
	3lirnNs5y+FHaPOHHGYpZLeNrxuNO5g4Ch0buygmrESHnSPFAuXrKJ/Lz8U1OKSZ7iXEMDXQlru
	0gNg12nl+fmI69wJCpgZQsFL+MiDYdqHegEljE5hEf9uWbnAGrWuJmva8JuAuKggw5kZqAJ20=
X-Received: by 2002:a05:6102:dc6:b0:631:4cda:3ebb with SMTP id ada2fe7eead31-67c89302d6emr11016727137.24.1779865753682;
        Wed, 27 May 2026 00:09:13 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff3e499bbsm16008333137.7.2026.05.27.00.09.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 00:09:13 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6314c3818baso8897855137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 00:09:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ91swfnHr7BYB27JdTNmzGu8ivnyXHWBXW8Daln/hA4lPXpBy/+GwkY3e5p1QKsSXEOw9wLll0uzfY/JoSMEhj10Q==@vger.kernel.org
X-Received: by 2002:a05:6102:8009:b0:632:137d:3ab with SMTP id
 ada2fe7eead31-67c8e2c996emr10450851137.31.1779865752913; Wed, 27 May 2026
 00:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513225037.49803-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260513225037.49803-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 09:09:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWy4HDUDCT=UeKLJt5S6gYW4Mgtkx13zpyQgSych7ByZg@mail.gmail.com>
X-Gm-Features: AVHnY4I0JbQSZqWOxsG_K3k-o_DCUSP-T9m5VNAB8LF4AI_MR_0R3ag34vx9oc8
Message-ID: <CAMuHMdWy4HDUDCT=UeKLJt5S6gYW4Mgtkx13zpyQgSych7ByZg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Add PSCI node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,renesas.com,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33188-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.941];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:email,mailbox.org:email,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 10D715E044D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 14 May 2026 at 00:50, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe SMC based PSCI access in SoC DT. The system can interact
> with TFA BL31 PSCI provider running on the Cortex-A cores via SMC
> calls.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

