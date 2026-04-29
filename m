Return-Path: <linux-renesas-soc+bounces-31740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGWGFCKu8WmwjgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 09:07:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D666349034F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 09:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C16E93040C7D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 07:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998883A1A58;
	Wed, 29 Apr 2026 07:00:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6328F3A0E93
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446044; cv=none; b=SdDNMm5F9ANrWI1RERJFL7r4ZrtxvDQmxxVA1Oyct+PhCXGk613p+QmY00Vf/S0qoPxdghYA6n2siLbQAR32UPTzK8l8EIO4mGnYSkeAxbPaYmLkao4BbthAB9AGlAK0hQzFjXnyhWcQ8R8wtTWMsQcHhQNx0JAO32QGlaS0XS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446044; c=relaxed/simple;
	bh=fwUCd2OO9r+K7cZl7yfax8OQL7g2mPXYtDj8o9TBPYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tL/7EzKc5fztN+ykwS2ogiyRiJ+yrju4iH7YJqNAjFOM2K5Sg1apUDw+SoZkFx8EahEsFlwOJfv3SiA9QJcZRgQJDzi478BxqSkcXqNddQSF0o4hiqh2X65be4UBAabeE92FYNmv5F/FtmCzAfQRUm1wjpLtQzKJIAXc1hVGGMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9567aa1a047so3596855241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 00:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446041; x=1778050841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxfHvn5RDAY/xqK2xFryyMAtewdPervAdenhp8f5XRg=;
        b=OkhMA6kZu9Ekedc5bpDMa2ql5LO+xOJwqvu2UMODM2zsWPpqjJIyCxdaUqFlGTX5Zc
         O9KDm52gFI9FbKUpTYFuA1x30gtRjC43EzfXQRNqhMPBdwt59z8B63RBjb4KgKG3u3wS
         YhYS4N8FjFV8WSA/6QCkrZ2dAUafi4YIu2tmHkv3HPW0flQKHH6OmP/4WEKIK+J9lt80
         rEvp6nD+I+lnbDL8Ev5dIvlzQr+CKE1Q2SztsPhXcpKOp46s2Qzia+jYqF5IFiyB0bMO
         edUiYOXiFIICwX/pZdU2kKK5ypEOqkPUGdQl2/0WLQcr1AwTmlRE4BTZwmMju1J+dOv6
         fr9w==
X-Gm-Message-State: AOJu0YzQe6rTEPp0Wz5ZFI4LgqeFCITEHjqNM1lVfGNsGrb+xhCgRAWo
	qcvGpnVf2gh+QC6t4AApISPHm/jqDbJnZBUwxeP1gpGeZ4JoeBJq8muOYueA8QEeSX0=
X-Gm-Gg: AeBDiesgbPf0/PujP3xrrCdcPVyPTjEJAa4wx4jprO7eIa94/lZMZpE+59l09g4rmV4
	GyescF4qNgwPmmxgOh4gIKWz0+hg6K467m9gCmEF0WhaXFiHtLF+ZyHHyhqaampev3udzsT4r8E
	e06HiyvqZ6+QrPENy0OUoPwWJfGDZ11oncnGJRBEhiFz/xDK06mAVXunrva5kc4E9D4tEXWWy71
	CPR0pJhfBizh6ayrOi8zENds+NkH4qQSycYCQp/A8qMAehU7me/XtzR8yPo0f2yJXokHM8ZvuLf
	XwoRSNy1FloFuXezab2OZ3Fe1Zb525yej2CzC4ehFnTXD0/0eh3oZ/vMIpve7sfQeK+E2ug9NuP
	DWigC89nF6UNoAFEAAfFsy0NspDV2BnG3pVg1qAm5/JyxjgH3AjvhvTAr/N2uoMu7RVvfvariF3
	t1ia5g3DfFLjXBmgdOdhpfkyE1wzLFWrgw1DtPd1DR4Fjm8ZkGRwhY9ROneqJcSrQpNLqlX6Ums
	Fk=
X-Received: by 2002:a67:e108:0:b0:609:2677:80f8 with SMTP id ada2fe7eead31-628057b6a39mr2782329137.0.1777446041292;
        Wed, 29 Apr 2026 00:00:41 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb7831df4sm560701241.12.2026.04.29.00.00.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 00:00:40 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56f8b51db2cso3780458e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 00:00:40 -0700 (PDT)
X-Received: by 2002:a05:6122:21ab:b0:56f:61d8:86d7 with SMTP id
 71dfb90a1353d-573a55d0781mr3033698e0c.7.1777446040132; Wed, 29 Apr 2026
 00:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402112709.13002-1-wsa+renesas@sang-engineering.com> <20260402112709.13002-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260402112709.13002-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 09:00:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWj6wutXOkfcnnzPZ4D97fhOW+o1ainQDNiST9y_pBbPw@mail.gmail.com>
X-Gm-Features: AVHnY4LVVMFZMc-zJ6qM9FvMwoB3GcpitrWZbQQMaLuKtqtGKMymMdA0uRBA4X4
Message-ID: <CAMuHMdWj6wutXOkfcnnzPZ4D97fhOW+o1ainQDNiST9y_pBbPw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: renesas: Document MFIS IP core
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: D666349034F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,mailbox.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-31740-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	NEURAL_SPAM(0.00)[0.075];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,sang-engineering.com:email,linux-m68k.org:email]

On Thu, 2 Apr 2026 at 13:27, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Document the Renesas Multifunctional Interface (MFIS) as found on the
> Renesas R-Car X5H (r8a78000) SoC. MFIS includes features like Mailbox/HW
> Spinlock/Product Register/Error Injection/Error Detection and the likes.
> Family-compatible values are not introduced here because MFIS is usually
> very different per SoC.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since v3:
>
> * dropped superfluous constraints (Thanks, Geert!)
> * added tags from Krzysztof and Geert (Thanks!)

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

