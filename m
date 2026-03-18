Return-Path: <linux-renesas-soc+bounces-29781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAT2M66yumlWawIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:11:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4912BCC84
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6691232967E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA3B3DA5CD;
	Wed, 18 Mar 2026 13:53:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88513D6CC0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 13:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773842009; cv=none; b=MFNDcyIcnolQ9+093IURNQhFeXxVLEvy+vwBqQwH4ogGxM43aMGdpE+jPut49N/fCnl52hz1mbfGYQ4UpSF+Si5SOr0Z8YSJnbMzA/r0tbVAVvXO0QjX3uuvWSTNeJTcr6fAKHyysKL+HNjjGHmyE1cA76lCFwWKw8AfhY37NdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773842009; c=relaxed/simple;
	bh=1J+ZEWWCwKCOBXUBCktxq34rBZAyz3nNsU6vGV7upsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrQ3GRWBcjNUEd+WYY9Pq1E3hPbS9iD1XGD8EObMBONLdMET9j6w14b3j05Qg90PmJ4aqunmxXViCflBlj+qRLsZiVHsvSVmpmi9zb4kSPmsEuZf/3krABI8Z2Q0mJyFtCkhhPdmNN8vImv0Ix01K38s7Tbyw/oAx4OkNrLkFXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56b6c7c8d00so3141089e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 06:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773842008; x=1774446808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtGq/NmoEQrnt3QSlNTziM/yJWABLbCKShsDsvXl5bY=;
        b=U4yrQvIiwIGlqrg5ns8Xk1jEZQJjz9JxeO3r8xX5ReLR5qZ+tGbWIn3w6bc0S76pNV
         fSKrELH0rMTOE8wEFOOer0oNLob7QTHbvNlJw7A6A76kBdWqdKCQJCeUoHBP5AY1+uPM
         /W2EnG7Q7jq6g5fOeEaSvdCAuTBwjnLAY9gChdFm9qeSA++ol7AfffVLythDGmZv5g8j
         jRQv4CkVuLl4gukeT+J17cculBwWUoBRP9/E86bT38FIqsDxvim9GKi7sVcOHlVEMAmc
         jX4pxNCYrNRR9yO7LeO5B/pyiplLU1pAVN6U82cYzqaXN401GuZFXEUnj7C1FZqjbKyF
         zPTg==
X-Forwarded-Encrypted: i=1; AJvYcCXc5j7hEyt2H5GvzxkupASAyUCeowQ1h+yq45QHQeOCO8gxg8O/V/ce0tUJU1d8gv7kAz4lWEtU+DG+2PhW5qs+1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRdcTFuLpJKnsKad+wETZm8Sj7MkVlWECz6q8XsRyqJOkYY4pC
	/7MyJFMSstDendN1kfULwcOSbz9Ypv0ZSUiB9GsY/2BOryFLB4QGblVoVjE5PU7No3E=
X-Gm-Gg: ATEYQzz+9SUXD3g7fOKCAKaaifbNmwkdcug/o9xybe6YewVHyHnQF8K/7i9U8vyyX/7
	j3ndqSeO7gNMag0Pzhf2A9U5ayaFAM+nLXbMA6chgOvWe9kfBlet5PP7SPJxH1lU6LogjRukyVx
	LY54y9CWdcC/gVuSmd8nOreW77eamsiGwtLuOCodjGZOqZ2+d0yc9j13kRKdx/Y+EzcqA97oSwp
	IOxKRR3BZTq457TX6jKKZMoFr3L8b1rY2YRJx6lmIrrGBLUhPBpvof04TUGGN5B7Ttrsxj6sYrL
	nsB+P2RbqR8DKf0/eq00qXrR1jB+Q0H8zvZ3KJVpbeH1mBV2SY1GRqreF7tvRU4GSbTM3AqRQJF
	f4xI5MXyrcx71RjP0TSI9JRkuIIjUUf8nsdzL9iYrMrRM4tfp0d5cEPhv/O5KcefWt633U+JyuJ
	zsNL1vGRF4796WyLcM/9RpShUQ3GwQGByaIapZltFYsvN0zcLS9ZD1oTRhwIeH
X-Received: by 2002:a05:6122:8889:b0:56a:fcbf:8aa4 with SMTP id 71dfb90a1353d-56ba7001730mr1290784e0c.2.1773842007575;
        Wed, 18 Mar 2026 06:53:27 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6e72ffasm1620520e0c.5.2026.03.18.06.53.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:53:27 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ffa277c115so3904891137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 06:53:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVYxzASLSno5AZ2O3324Cjr8qkUk8L7RPIvtjnXgNk9kyJ5LGnsQhLsBh5RwUeC9vkurvVJtVIy36UpnPxDHh1oA==@vger.kernel.org
X-Received: by 2002:a05:6102:54a4:b0:5fd:ea66:92cf with SMTP id
 ada2fe7eead31-6027d12f4bbmr1813772137.13.1773842006913; Wed, 18 Mar 2026
 06:53:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312160407.3387840-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260312160407.3387840-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260312160407.3387840-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 14:53:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVAS8GKPKDQ7Vrd5b3LOGpPS=ppKW=77Qx7nGPTnvwecA@mail.gmail.com>
X-Gm-Features: AaiRm504El8BNgJkH-FqgtHlRrAv-EcJsoGOe-ua0DTgkwbK3k9eDXyAB8MmeFc
Message-ID: <CAMuHMdVAS8GKPKDQ7Vrd5b3LOGpPS=ppKW=77Qx7nGPTnvwecA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add PHY
 interrupt support
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-29781-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 7E4912BCC84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 at 17:04, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add interrupt support for the GMAC1 and GMAC2 PHYs on the RZ/T2H EVK
> board. The PHYs are connected to the ICU via IRQ3 and IRQ13 lines
> respectively.
>
> Define RZT2H_IRQxx macros in the SoC DTSI to map the ICU IRQ_NS lines
> to their absolute ICU interrupt space offsets.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

