Return-Path: <linux-renesas-soc+bounces-33014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJujFj1eEGqDWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:46:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F4E5B56ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E860D3008D66
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8CC3FD139;
	Fri, 22 May 2026 13:38:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D913FE343
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457089; cv=none; b=RNTItezwBhk5ZYxGqvN3wUClKE/kWjI8J4JbYB+0dTb42lj0K6uonNXoODiBPKyo8Jx++RPV+tvPvuaJCLdCuNCLBDKbMMeYA9PH+wYBCuxOMXRmq8gETAdAWz3XvFiMQSCl91YgEU5qaJ8jkNJTDiSZh6BCXkYXbfBALAFirGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457089; c=relaxed/simple;
	bh=gP3RZMg0f5hdPp8eid35xVd97zHLBBEBxi52czKLWfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgoNvU0ASjRg744AyNYRSQ77p3Lb0bXpLUBHfgk8Y/Kmgj0Je5YTat0wnGUCWYiglvo6WGY5IAkch/X8dWYANDwALlTa9nF08vsebhg3Lq4SjebDMP/rMVmm7HtW1+K8cpLXyG4P0M8up6BQOiAbJseoMfzQrpzItSwevP8Wl7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6312a0d556cso3376508137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457087; x=1780061887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGdu3wpW+ZJZXf46bMhLaZa6JyGhCTigibu3dWPaA6w=;
        b=T0SQ7xBp4/RmPe0dUKZvy9WdGxzGFskPyvc1RPLvLdiX8IjeqTh5q3MlFUvrNwHttV
         9p/RzfBfdX2IFQUrXAZlpKuT+AUEcGR1Q4XXOc+yXXrbItKeQxYo0igbfetsGZFG0EVg
         OvWHnXITr6eeWgmHb5CS+U2e3lv6p031kKU5PvqTxgjL2rAlpNhp81MvctxIp4vKXDD7
         ahojt4o9ib51rKRn2QQCClq2KzPlYD6F9e2BgU66EHGwuhwlKSTjo/fGoiM6ENObCykT
         ZUfp03BGSBOdBfv5tbLHpuKe5u6F8SKCiJ2AXBXmhc3adzSa2N3g9J/xHw9qEh3C6/OG
         ms2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8P446eZRYSfQWnioFgwVWuchsYa4B2dlgsPTyuY03WThz/kgNmuEVrRK84y2xKrjrQyPF8bstsoUcE2YRnjQLiaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7oQ3zlrmm79vhjq8HcvNIFPT+t7j0VLxiLppum85P/U58sPic
	nIkesRVRC2TRg7gBUMuWAky8k9X2GKLV1UXmuw1OS9qfWsf//s0pVyfKapzHmavDpk4=
X-Gm-Gg: Acq92OEt8Q5FsOqlVndgWFFUsMMfR9/IdlvAiaYR42lFP0f/z2Nd8djRpPn40QQZ/yX
	v+V0L5Pp1NF8NfmYhPd4SG8GYMwU1y8+QbFtkAXOsk0c6F7mK4t+M5l8KN2fnKoJyUfg+qOn0al
	uxzArcxw3VBfAKRehHbIzE2AcO5iKubYnpAvY/4BD0Ebb0yDs1h9GLPZpUOw77LRlCXqDWSl9P8
	pxTOObxYHGCvig4oAzFPmVoXNykCu/Z6bQwoBCQvTLIobCnkoi6UYxOOlscUV56QFmmC14lTYhK
	GIhLOw7Wlpxeo+DXvsxdH/66Z6d/fTygvrQLcdebh5Hjf2+MPU+EJASpyvCBU2KVnVIYqI1hRPx
	xTP9lkJBiehFnoC2zu2/oXr76hcKWctOlFomyJiz6ZyL+RXP5ogr9pH6Iu5Brdugbk4a/51hr1D
	Cw+yI16N41H/3SUDv1aBvNUEl7u8y447G+aoGfcBeayFcqsrLf0cHEHr02DH2R
X-Received: by 2002:a05:6102:14a2:b0:602:a9f3:74d8 with SMTP id ada2fe7eead31-67c83990556mr1595120137.25.1779457087490;
        Fri, 22 May 2026 06:38:07 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173afdb54sm1574020241.8.2026.05.22.06.38.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:38:05 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-95673f7b5baso2057957241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:38:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+pwtqt5s/m0kI+LrD1Z0I6ApfE1GeDCCl369HnY/90Z+M55W+561LUYtndMMrX6GGXKBWbJfQAxkliRqbcB4ISpQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2b97:b0:611:e0c2:1604 with SMTP id
 ada2fe7eead31-67c7ffec83emr1436561137.19.1779457084863; Fri, 22 May 2026
 06:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420132211.1350656-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260420132211.1350656-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:37:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4HZcZ_uwbJ=4T8if4=ZvCt7ZeXqD-nN6gjKrcuTec-w@mail.gmail.com>
X-Gm-Features: AVHnY4JyuuJKUuuemzD_PPOU5Ss1XbJjkcK4kiycmX05BQOKw3A-M4TvFlP_g7Y
Message-ID: <CAMuHMdW4HZcZ_uwbJ=4T8if4=ZvCt7ZeXqD-nN6gjKrcuTec-w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rz-smarc-du-adv7513: Simplify DU
 port configuration
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33014-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F3F4E5B56ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 20 Apr 2026 at 15:22, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The SoC dtsi already defines the du node with its ports hierarchy,
> including the du_out_rgb endpoint node under port@0. There is no need
> to redefine the entire ports/port@0 structure in the board-level dtsi.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

