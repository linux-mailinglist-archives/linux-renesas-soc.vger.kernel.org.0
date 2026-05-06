Return-Path: <linux-renesas-soc+bounces-32144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHWrFKVg+2kuaQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:39:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E43814DD68F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10D2B3008259
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 15:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF913481AA3;
	Wed,  6 May 2026 15:38:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE38C481FDA
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081931; cv=none; b=oqfreAnB3W4urul+8d+IcOIhwobQpV3DIOQyc2PelsescPlCnaH0QK3g6qbl4UAmLsaceZLPuMLZvD2iMJbQaPdZo1GcY7kqwdYXnfCFIH1Aq/vKd++vyXfRfIY1vrx20Xu+cOwOopGZx89G9/rtRZwv+X5dO/vc9Rd1dashzvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081931; c=relaxed/simple;
	bh=qt46z/pT8ao0DLm63LJMC6q48E1ATkP2yfWfyJjvgvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gV/zFGNruNpAUmMj4ulfQ/+X0Fs8/jUs3lG2u8T1l9S5HdMuMN5R5XghfhgXa3fAe1aSP+KZBThi+jk7fz4STJe9uATJr0G0yPwyQNS6RBJAc2O5PdBabIYMsEyaXTF75sFkShPzm4zBHhNwOjPGumvwBkOt42D7rgGbZ/qoylQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-57524e53749so1133836e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081928; x=1778686728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+CjY/Fb28bFWjqLwLQHlyMRoP8RUF4B+j87OjTAnr0=;
        b=rYHgfnSKrltAEYmqEgOpRMmhcrD9gL3MGBfYpl6AzgtnURv0BQv9i/aGp5DCVL1Hhs
         lqVHKQKdVqj2OzrRRzs5zh2/yxhBiQxlxAAXZ+Gb5751Nu6onJItdMhpJ/vo2r0aCAPh
         6PD7nLIAYg0sz+yExdZ/r7rhfBRk2oPIPe6uJ+9w2vBOWM7drrRtOBO8bminCuPE0d4A
         YrBH41fS9Bw76Hgx9Yy2vyrBPbR/1oYQ3LK/cFmVuXP2Z7pWlWnBIQO2GOtf49SwUjJX
         ouw6NANl4yyY81FnJiNAbPu4xVj5EFbRxmP8ifiTvaK4fjE3gw3KhdaxuK7jLtxwWTMM
         7QEw==
X-Forwarded-Encrypted: i=1; AFNElJ+eoUMtYzLOMOBm8FLB06YBBYgke2SzC1K3heKCt0zSgHdmJpV1Q8XczkTrMb0SCl5qgbue4DKXYT2hPjNs8Jr6Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNZDbhTC9i0pGgNtBk7eyEWKAlA1B5EI/0ovOREu2tUY+4N4Y3
	H5g/uk2YJhoHNrZ7tAc9/iGrc+eJ79DrssAnyImukdJqoe8mU0vy+iV9ZSgBB0yn5sQ=
X-Gm-Gg: AeBDieuOFwEPqUWsJZO2EpPkSqiAt2ocXynDj+NYD27bWkt9n1mRST340RPgRCqNe/s
	m5wq3gwVlZ9PN3zUA9gRmlepSCS62HQxRMbaSHMy+eRq/PLFC7swEv1Au6ncFDflfPJ2gVCy61A
	M+aAoBuZui/sQoExRp47GKRXz0ewa/QHpoxnElHKViMBbqbkIk2LnJrVSs7ifDpOkqqGTnC9we8
	o+5Zr4lkUfJw9zHRKb+ToBBbjDdmtWeA0jUNJ2BgCFEbdkX3QMRNSK0mO5H1RKIirZLKVqQY2Z5
	OXCkcwOxToUWjWm6zmQi7vkSmoJ6aWy/l7do4TMuVHr+kvVT98mrvQVhDIE9U8/gwsoZ4qJEHTF
	9egk9yTXMPkYdCKxsyU7KliR1Ld8G0FUWX73sSpd609EV7ZsEAnJsG/wKwrv44bl6Wz1vh8tWb3
	zUIWLgiGCk7p1zP8BAUHiKFw1tMGYNqeObzVO6Q1CcplYbUbQKEoAbrG1KPkroB6caYvSeQjo=
X-Received: by 2002:a05:6122:4d04:b0:56f:63db:2072 with SMTP id 71dfb90a1353d-5755968a9acmr2007656e0c.10.1778081928135;
        Wed, 06 May 2026 08:38:48 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575585f72c1sm2073014e0c.12.2026.05.06.08.38.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:38:47 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-62dff2771abso1496380137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:38:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+kmlVXHp9FaN+A9+bH1TtfuoiybWCM7ZQRF43ULCvwpCmf7h1bwoBsxJIzBmtAQsVN9TaUSD2/ejUerI0VYPUO1A==@vger.kernel.org
X-Received: by 2002:a05:6102:2914:b0:611:d979:a38 with SMTP id
 ada2fe7eead31-630f8e6ad2fmr1911752137.6.1778081927703; Wed, 06 May 2026
 08:38:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com> <20260430093422.74812-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430093422.74812-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 17:38:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiYg-F83Wq3mHsY+SRvfvFf863PL+ntWECS3Hg97fP=w@mail.gmail.com>
X-Gm-Features: AVHnY4LkzS1oN-DrJ8JobrorWEPCRYsarVoNHuBu0KNSKv_fpIubNCM1zDCjywg
Message-ID: <CAMuHMdUiYg-F83Wq3mHsY+SRvfvFf863PL+ntWECS3Hg97fP=w@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] pinctrl: renesas: rzg2l: Make QSPI register
 handling conditional
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E43814DD68F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32144-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Thu, 30 Apr 2026 at 11:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The QSPI register at offset 0x3008 is not present on all SoCs supported by
> the RZ/G2L pinctrl driver. Unconditionally reading and writing this
> register during suspend/resume on hardware that lacks it can cause
> undefined behaviour.
>
> Add a qspi field to rzg2l_register_offsets to allow per-SoC declaration of
> the QSPI register offset, and guard the suspend/resume accesses with a
> check on that field. Populate the offset only for the RZ/{G2L,G2LC,G2UL,
> Five} hardware configuration, which is where the register is known to
> exist.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

