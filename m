Return-Path: <linux-renesas-soc+bounces-34168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X9/lE5aZMmps2gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:56:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E135A699E51
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:56:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8C8D301AA5A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A553F9F56;
	Wed, 17 Jun 2026 12:56:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C583FB067
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 12:56:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700993; cv=none; b=XYHTb0Lypy+FFAy9SnLS3jgkLTHHRYK2359+2a7MQxYObC0BU+OVXVuNF6Dcu76NRbScPrOY++hUClVr3pyhvMvpCNyPO5Ck4b1nnc+bXIJrtenAeTnK4u4nCiPA2+xg0ZlkcU6oqf8SmbfgqSPz7dJHfCzIVCDpxJLgHrLznHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700993; c=relaxed/simple;
	bh=PL5/8llaxXKp1ZYIbyg6dYocdzD5Zpdtpj1ZDkD1n3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/YbAeISP0gMyFitN78Hnu1sxN2I5RKfdNoE/YUltMDSvgUg6DRxJyVMwWEN5qs+njScYa5H8WBDWmUFnWKV2EFQUGI0HD3kLWD1pPipdjl10yEV1KS4S5hcyisqR7k6V4Jo+L4WYe7jj0JFNiVpLOXnDZmNdyKD+gMFyJs+bK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-59e8ededf4dso3639051e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 05:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700990; x=1782305790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yHUoF18qh7x/sHtaF9wChZK+CqOBTzk9s/hEXD/IK8=;
        b=dY5r25QwxFcrGytdeiDS0R4prTB4YMhfdiR6KugGN5e4tvXLDu0yvPnIrL1WlbcF7F
         xycfsaAIsrsFTlGPsccRb8gbjcdixc7POrY6GKTcQddXDGC3MbBZg0QOslpHJ2tDQgLb
         sOZ79UiEhKkETXU5XWF7M9Kq63FAkNKY28EWasC5Rj0hkgNK3fYYL5tXKQNE+37XWS8q
         kEVRQy+ra2nnw1l2kAKtRbhqjbEuxhr6+9gPchmdY68pEzyx8OHXZ0vOj33m8oQnbOXf
         yS5kg2qy6qPYWlRyTgckI4+H7HSGW0gx2Rnm0+Syy4l6WCbj3tw+B8tFT86wk9GiBnoI
         7YyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8x0xrPo0eWdrzNIizi2afM7R1DFz7qkDYDkqrdNIU4yr7yzz/ug0e8RBzAmsLZHbbZv3qOK/07NTZ0KH3F7vWY6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjqdsDMcpkeUfBx780+PLX3KW5pbjMCu53NJE3s5B3WDUNMb/2
	ZoU6Ea7ghwzpOWQyBBq/BZFEz73FKShV3Kz++Y3FGX5YFvfjerETmp1/vixoOsqX
X-Gm-Gg: AfdE7clCy32uJvNYlZqFEH+wCtEhzSEsTomRJETPv6tACnIaxOq5r+nWsnWnyNFYxlx
	iL6P7w/bd0JpAPdqOGsQ1kxh+Fx70+EIyrKKY5URVeeLBVzOlToit065tkSDynSDHqKdhCf5SRS
	8xs0tiBN26x1tPU69OQzIKueG6rlkJmuMpVW+7Iwm2DDfrhsnbxX31OXxfxAAlkBnkdWERnpr11
	+ZbtyjZXDNBWPDlxVP3ExxKFBJ0ZgFRQdJNl0JWkSW9pjv3Gv/1rkyY6ug1Res1spBaXn//C8pD
	yYRDvk8fUjq+elERtaFK7MQlvBNd1Bxz6b6kNwAwTmb4dpDydviLy4Vy1Sh5GVQ/D0aLRytgEOQ
	FnI0emj/y8QVdiDPqkY/gmHacdEizEWJPWugdKLywEbqHY1uD+XY2vc3td+RdhEy7pCQdntdOut
	wRYV/5aa+zALA4Pd+eq7yCGXsdDQkyX2bPzfLUrCMKXxBJFbz0IA==
X-Received: by 2002:a05:6122:62f1:b0:5a1:fbbd:6c07 with SMTP id 71dfb90a1353d-5bbc0d2b4d6mr1262263e0c.14.1781700990409;
        Wed, 17 Jun 2026 05:56:30 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb8ffdee27sm8275742e0c.5.2026.06.17.05.56.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:56:30 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-966d4748ad5so794114241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 05:56:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Mrst8oKSE+f7IWiSdertmtQSaBtxquNMmlBMqIV/7lQnoembE58UQofjz5f0jKqkZeazau049mz+jlcpswZ7MFg==@vger.kernel.org
X-Received: by 2002:a05:6102:290b:b0:631:2a82:111f with SMTP id
 ada2fe7eead31-7246c9990f8mr1845428137.17.1781700989579; Wed, 17 Jun 2026
 05:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604151855.307772-1-biju.das.jz@bp.renesas.com> <20260604151855.307772-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260604151855.307772-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 14:56:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW07FsPEJA3+3cvmruO0OvOU9+CnTDK5_xCL1z_P6y59Q@mail.gmail.com>
X-Gm-Features: AVVi8CeeeCpMRB5a4gVFOmJfA8zq-2oigbmQ1zerFZYaRtkwkPoVdp4z3phpJVg
Message-ID: <CAMuHMdW07FsPEJA3+3cvmruO0OvOU9+CnTDK5_xCL1z_P6y59Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r9a08g046: Add clock and reset entries
 for GE3D
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34168-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E135A699E51

On Thu, 4 Jun 2026 at 17:25, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for GE3D.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

