Return-Path: <linux-renesas-soc+bounces-30348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE8ULsc7xWn/8AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:59:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4523366D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D25C530B8E69
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 13:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CD12DB78C;
	Thu, 26 Mar 2026 13:51:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B834D239594
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 13:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533094; cv=none; b=YkMKj/JIkAeuLZ11XGjN4M/QxLRJMUCD6tYWNtQTkWsIke29JtgFO9iz3IPSbxuqRSp4662SDte++ozRMPKVbPileq0oKKC6M4T6I3FKzlwzhu9D21qHLHWouhS11jV2gqMif+1z/f9qI2PA9h4lnURN9PP8laeqqeaOScdpnlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533094; c=relaxed/simple;
	bh=c+6uzPUXChU7DJrRiFRC7ZBh3ifQTt1gYWU6T/1FsRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBp6v4hNMTXAnsxdgxos5nXLwEfXi/EAzP0tweW+JXkJSu8H9zCO1UQ48zWw3nL26tej4H9rEN0tCabnmnKJR6xhWRDPN82XDSfE7+4QdKwZJp+EEy6JLKmivrTkF6nxl5Sx+xfpB+4KEPlS9w07DHHNtXEcrS1c7xC1sgPpf+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-660a58841d4so1263766a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533091; x=1775137891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTG+PVXztusd4gXgWpBEqm2YM7xAWRFb+Dwh9rXSIBU=;
        b=bgmbJmarMlJvWcGKRrSckbxym6/0j6s9fyihvQCheZpvgMr1KZGhnL9UckIgZJj2BX
         xkIXo8L6wlj5TuUswvqS+7JbAvkaOIKgqdxE2ld/9p4aVWtJLTu7OzSbv3HxxsnAOb9J
         jwt/sSwcgJgl5sXx/XiGbsSb5BAktVVU/hapxT3b1ikfrYX8pCPF6KHXSceCrjwzxl2E
         0/zOOSOhjeYdvPrt1p0z5rv7EaL4ivIf7zyJyJbUnhcrJzXBlZ1XXieoOrJ6l4S572Xh
         IC1FPT1Z6/6eBEp6WhGYDc2RsrDRX8zs3EuJgbUqHcJ6YN4J3zWvVZ5tSsaEwBdzZrwS
         tkiA==
X-Forwarded-Encrypted: i=1; AJvYcCXIqb58APBhnQCl3ykMySbj9WgnSBbFOR+7dpvr4z3fSO/85MqBZqYV4fs2vAtM9qT3wdNILnWbRnhfwHn4hUKmGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTdlxhZeIZBs1pHB9oRpz0YnbNEXZm5VSKa4EwVM6vHGRlm3GQ
	jY/SMXQleM3UWcvDAJcC37Et+WnWShXyU0Soq2qFPa95VZvjBAUIeFlRldm82vQ5z0o=
X-Gm-Gg: ATEYQzyCSiF5GXYsb77+uX1lfY7bcL91gJ7sH3RjrxeQ39DKF6sjY+Tt69PnRHcRFRJ
	QnJjqwPc4DoiBD3JPUBkDX87A10HfqrbIk2vT+1SWIGnrMTbr+UFEt2IA4Pl2OSO0TCA7942jjB
	OKVaZnIinDg7zo9rUvETRxnZN5iMnXto0r3z3S9gFKWK0fpVryBlgEQYJ8dkKQNdpkJ7fp/Nk94
	7OfTo6Wupi6B/PHoxnREUTyapdnEyHj3oUixkmJ5Mwvccsbgr6UpQ+VgOMNR4aBwzPM+ckjhwUm
	i5831wjqfWdWUkJLon7ObyDKS6aGGS0jRrbxU6WyWLDynMlWuiiRHNZ1/CRXCA1ERe0eOBTs3a8
	kWAUeALjxlz251gieOoDsjTbfBkVkiXb7+Bt9Z4JJ7d5LcqiTSuQw1xBJmdknBfEdvrfhtZ8T6C
	RvPpFyyMw2IXflG+/A4vgyQNB+4izMKhin7TX254Chb7pEdVcjut7c95pKzZkO847h9BIYFeg=
X-Received: by 2002:a05:6402:4557:b0:663:4315:727a with SMTP id 4fb4d7f45d1cf-66a826cddd1mr3568302a12.24.1774533090945;
        Thu, 26 Mar 2026 06:51:30 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6a5f283sm1047513a12.27.2026.03.26.06.51.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:51:30 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b97ed4ad579so160451666b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:51:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0z9RkwrV5ONluRgRL6zm4KeVfq94Tq4lMrSO5XW/0OOjlvlnEPzdOtLiUnjDT28iYtLpJ2Gn/dNBkBNj38jRCFw==@vger.kernel.org
X-Received: by 2002:a17:907:9997:b0:b98:32c1:249d with SMTP id
 a640c23a62f3a-b9a3f17037fmr593171666b.5.1774533089838; Thu, 26 Mar 2026
 06:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:51:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUCD40Qd00VgKS7S4pTN1jTPMG98tLFuuKYdg++tewTw@mail.gmail.com>
X-Gm-Features: AQROBzD6orTH2sPl4Ow2ijjzpvAHLafztY8QkB4poxVkmd_p_x2ZQ7lIySQjcjI
Message-ID: <CAMuHMdXUCD40Qd00VgKS7S4pTN1jTPMG98tLFuuKYdg++tewTw@mail.gmail.com>
Subject: Re: [PATCH v8 03/11] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add
 critical reset entries
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
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
	TAGGED_FROM(0.00)[bounces-30348-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 3E4523366D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G2L SoC family requires DMA resets to be deasserted for routing
> some peripheral interrupts to the CPU. Asserting these resets after boot
> would silently break interrupt delivery with no driver to restore them.
>
> Mark the DMA resets as critical by adding them to the crit_resets table
> in the SoC-specific rzg2l_cpg_info for r9a07g043, r9a07g044, and
> r9a08g045, preventing __rzg2l_cpg_assert() from asserting them and
> ensuring they are deasserted during probe and resume.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks, will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

