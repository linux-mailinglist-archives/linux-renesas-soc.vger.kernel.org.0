Return-Path: <linux-renesas-soc+bounces-32569-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCzqKzt8BGpoKgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32569-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 15:27:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 502465340BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 15:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF8C6310FD20
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 13:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E30825A33F;
	Wed, 13 May 2026 13:13:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6672836A0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 13:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677997; cv=none; b=BzCXrGvDZBHHm/dC+OGpRH9J1XYGl1Q65DlsnUPK/SU7im7TAEJ7bONEiPCbDSKxVv2S3HG08uX9ms0nV+FCTfru/A0R3CVg4Q4786VA6NuhtX1xuDgOVRc+WyNMeO+MnoAPZalpzJOvpf8AoD6ndKed4iPtbBqW2rXW2jATjkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677997; c=relaxed/simple;
	bh=ptGVfY8dowl21jHV2wAijSOBwL93DMJ7Wdq/sitHQUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTXOhIjdYDlT5ou9FZnrkPuvlkMeqDX0h8HzMCjwuMv3HbzLH2+pSIeFJCoLzSIaoBjFr739L/j2djhKeBBsyKMAYqQDC68fEIEK3/D8USIXqom3hxG8rr8wLp574sI+eTeeYRjZfYVEVossJ67RIs2vogujCkuWBH6FGXAuNkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56f72d27e7eso6391834e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 06:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677995; x=1779282795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dw4EVFD8umbNXj6ZLEY6BaqpT1xcbjLyZmag6+hF/7o=;
        b=hpkExKFuqz2TZZoTSaDNLDrLY3w129DP7FKFH+TA6cX2Vy6HT2hITEHPXC+iIc+J/g
         yMriCiYXjWD+U1kfyGjwrfGuyifbyFt3mvENvJWOmwjqv9GEGvdfKU717u4TASpuJe9h
         rSLzSDoRt9rlRsSsvv7h/LNMdwpMIaA+OgsD8IZZAT6tmlalaVs9b1BVhsJPiCFoEhm0
         pVWe3DeZUVdDCYKbq1yx4fAAV4ly7k4XDV1tTkB5OcJOsV9BC5bTzpvAvCXJ29XZElhV
         mSuqt42QM8nPrngxdHp11WNDXgM7LI2cCVbvL1PQcbDXAQDGhKaPG5W+e5RFALxD05AJ
         GiPg==
X-Forwarded-Encrypted: i=1; AFNElJ/eZ3BRn1wrrcOppPobPZEDd21k0hENa12tN2TvloeBFuX7ZcQ+rnGnmfVjxKE9ztHih34k1sUHFzZ6XqnAPoQYOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCeko8vM6N0ZlO3y8Y3NKvvC0lzvk8YpF+k6DQQZQL4b6F4Pu+
	kHsIH8Bma3U5Ijuw0fbeSmQqv+numC1qlTt+bXTSQa9VZK6KtO4abCC6cyJ9T4Br
X-Gm-Gg: Acq92OGwgOP0wndgu/nY9nG9QfJCwdxXcujwxxyrcFaDxKbtOQxPDBwVjkLdUtnXFOx
	ZJemtz69Tdt9IEIU5ZrzvlWfvyLPz2l6zylmyyEcwg1T/JmwZjgnYIbMCvanZ8oIqWieXJImTwm
	GaCKL6MADI9yseQlmDDqwDwiLXXUZMeN8XDYW21P2maL+gBlycVb6Q5orgWfJoJ66J9oEnsj9sw
	Ek47tiEwwcO1Y+IUjlAnetU5k6ccsHZPzrKGeM4SVWifhFRbN2B545S+Po5dM9BE0mcS18ir/fh
	GpUtBlnwC6ZCc/cQ+/hU9WCUiiI8Fd8wUCVSAbz6X/xifWys11GG8QfuIWQaLnbzSmMnzLCcb9M
	26r8S/heujJF0nIZpkkdS04yxpTrtMs1FqpoEK9mfJK+raSjQwRyao1l0n72aPtuf5xRVGI1c5Y
	JBaZFcW+T8JgF30S4N64ohDiGmYboKjb9hJsHO1SuAxe4Q1NtEZscwuemXJRCZ
X-Received: by 2002:a05:6122:a019:b0:56b:942f:b870 with SMTP id 71dfb90a1353d-575cf8c42f6mr2725700e0c.0.1778677994736;
        Wed, 13 May 2026 06:13:14 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575869c4cfdsm11026296e0c.3.2026.05.13.06.13.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:13:14 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-631ca15d35aso3068891137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 06:13:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/H14S2VstVFjFpMOJc9CWvjfF4Srs61jTNCHu5hqryGWbPB2brGRyXnaUboiC0SiYFVHgoMlN0Y2braXbTrthsDw==@vger.kernel.org
X-Received: by 2002:a05:6102:148d:b0:611:959c:86b with SMTP id
 ada2fe7eead31-635d1ea150cmr3550416137.16.1778677994300; Wed, 13 May 2026
 06:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:13:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmwyFSP3TsVjh97=wDmGLYNfX=Nr=97NnDP5H=Czdwnw@mail.gmail.com>
X-Gm-Features: AVHnY4IveyelRqFQvstMxxryiMS78Fp-yg20GxMmqsqgU9kR07zLUMeO9C8m-YI
Message-ID: <CAMuHMdXmwyFSP3TsVjh97=wDmGLYNfX=Nr=97NnDP5H=Czdwnw@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: renesas: r8a73a4: Describe coresight on
 R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 502465340BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32569-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,mailbox.org:email,linux-m68k.org:email,glider.be:email]
X-Rspamd-Action: no action

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe coresight topology on R-Mobile APE6. Extend the current PTM node
> with connection funnel, TPIU, ETB and replicator. The coresight on this
> hardware is clocked from the ZT/ZTR trace clock.
>
> Note that only core 0 part of the topology is described, because the
> other cores are still not present in the DT.
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

