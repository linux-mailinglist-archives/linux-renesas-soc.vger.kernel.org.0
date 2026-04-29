Return-Path: <linux-renesas-soc+bounces-31750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCXDIJLv8WmulgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 13:46:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 320A5493B61
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 13:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79F6F30054E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 11:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8D529BD95;
	Wed, 29 Apr 2026 11:46:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCBB35F180
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 11:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463180; cv=none; b=IKELg5DFLMWzzB6Sg8TsCXs5LbHk35DdLnibGxwjkiED95vBENpTIxePLTUhLdsSh918IPfVVYZRDrMPrvWdFXXhKj3pqKurtxJWV2pzweR9fHyKhlKRd4mWp10wpRZPv1JRyREdYqcpJPSdp6VUV6B/6DH0EVtlb3KAG5G3iB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463180; c=relaxed/simple;
	bh=XXFyujGrM3k+GZFKEyqRdilaXBG204QClf2AQk9kJz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7OaiNCKMiP15DJWPh8QgJDn1MT8Q/RMtzgivLpkgqCKJe2TVueXx3zn8YDCKo7yIkI9BVbzs2JHoxuSJoj/XtQ9n500XoHc4FwPjT7QypU8bV0wR+0jbpuD30NLz7mjoKYT+yRk3sRjCCCEAYRzGxD/Z9gc/LDJ34IibUA7bgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6221c7251e1so1885013137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 04:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777463178; x=1778067978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eQI/JeVJWqMxkzWYnwpYH2rFZzbRa7DUVbDEpXwBWE=;
        b=cod9mtqR4wWILnSmUoSGMNmHLKl0iIiZfjrL/kt1hNVHMEqqyh+ARUF68+qB63NpFa
         zUPXPCKnjYQro5osbSdjbwbTpVEX3gFMi3y2/ebOzPIsKP8HU43pMEPakjy1mZyYkQvm
         8Ad3SOVbZrxzdk9PgzZFlcniBUr0JorPCvKkDj5s7I2C1+OWqk5Z1EC6ZqmkCoTEx5Qr
         wGldDud1xASYeama9dNJ7wjEL14bKF7H8xp1HyI/Rv9J4f4JgpuXNvfuGyi1Of8tvLKo
         Oqk7lGW+hQtVjBKTcbAoTM7h4yoB8FEB6lnGLdTjW0mwZ946kca4EAG0c90+S/pXQbN1
         xL+w==
X-Forwarded-Encrypted: i=1; AFNElJ+bf2DkoSAtOkG+s/7f3ETggtqspJOS2CDh0A4dOB6uL3itFuWg5mWTIj2fo8fCHouhAbn97LMn8psw0W8qXZpVEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMvwGyedTSg9vMVxsUDOcRKVJtiS0me0xLYk6XSB7tJ6pnTjNc
	ePaUTGXUV1hTIWuQWAFsHg7uY1iM3aCQ2brjOJqMlRntKAT3NemCZrF0kthkVJTSTOc=
X-Gm-Gg: AeBDieui/LKWTcBb6Rx39/DfqM8wfpze5Mp39xDRVrGnY9cfEhH1l6Iejl5qnKDM4LP
	cSBSh1M8mikTcsVJiL3WFcjYOktwAyfHg7JtKuNSyvZ0KTcHvzHQ0EpTvn+b4KlAtQQW8ZxpUv7
	f9b+I9sQDCcQqE5hi40puM1/JXhGKXaHTigNOK19H3jU84auX8P+Ig00JZ9VdboH3BnijrU3oFS
	qlaIlPyQdGy7A2OICYZumpOuIFGEARKGxjo54J5FCs+OnyAxMyzPgbGQ7cplSVtSGiASzHStrKE
	HpXuUDppEdmBqEKt1x6/mDa2KgtlCPUPMSGda06IZv6bLJErJ7CMK70wUA4rfmA7XAj5YP4GeiG
	pZQVXWAopKORyZTL1A2gWzaJJ7FrhGIMaZPcnAkCfJmLOv+QP8QAhAf2S4707z6iDzwhIgD2JBx
	zJUVRA5OrEATx5C5j3Z8fQPSCjT7g7WwTWgo+KzsInVBsacc4sEpVJfGQprT9E87ajlluDfRlCn
	zOoMqqDOpZ6IA==
X-Received: by 2002:a05:6102:8488:10b0:605:6773:611d with SMTP id ada2fe7eead31-62808c55341mr2417400137.1.1777463177862;
        Wed, 29 Apr 2026 04:46:17 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62982736bbbsm927485137.4.2026.04.29.04.46.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:46:17 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a9076813bso5063186e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 04:46:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Br/q+XHjcnxmC6iU9izDvbfAmSWJrP2i1Py2MtuG0cekWb6WbFmSV+AiTucC02LdYMDtU9nHET0PEMW/bAvYKnw==@vger.kernel.org
X-Received: by 2002:a05:6102:8496:20b0:60c:fe65:7dbd with SMTP id
 ada2fe7eead31-62808c547e7mr2534931137.5.1777463176356; Wed, 29 Apr 2026
 04:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 13:46:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7Wv=ff34PGtauGE=pxu-gz60bYckFvC0s_7+NGF2sSQ@mail.gmail.com>
X-Gm-Features: AVHnY4LIrMWzlW7YEacrKVCpl1tXW3XTPU8aR2UA76Yz1rMTuJKkQscGTQj67Yc
Message-ID: <CAMuHMdU7Wv=ff34PGtauGE=pxu-gz60bYckFvC0s_7+NGF2sSQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 320A5493B61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31750-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.089];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mailbox.org:email,linux-m68k.org:email,glider.be:email]

On Sun, 19 Apr 2026 at 21:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add support for identifying the R-Car M3Le (R8A779MD) SoC.
>
> The Renesas R-Car R8A779MD M3Le SoC is a variant of the
> already supported R-Car M3-N SoC with reduced peripherals.
> Enable support for the M3Le SoC through already existing
> ARCH_R8A77965 configuration symbol. PRR reads 0x67c05501 .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

