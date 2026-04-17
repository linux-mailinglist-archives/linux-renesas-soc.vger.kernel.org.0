Return-Path: <linux-renesas-soc+bounces-31360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHB7Jk9H4mlh4AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 16:44:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9C141C326
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 16:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 420FF300C6E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 14:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BDD3B9D89;
	Fri, 17 Apr 2026 14:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyiof/KM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7EC1ADC7E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 14:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776437066; cv=pass; b=b+ifUTJ18KsBecb5Kpb1INM1kt4IWmzOCpKYgvNyCuuwGnhM+Y/XNYknQlMzAMA45O3ZTdjKS50DZ5m946LlsKOxdaZVUosqnF1anEGr7n0qjTaz6WY+ycX+QmiZEhZeG2LQUSk6lspX0+8qxClAe8KKeHGZ/5d3ur0tAJcXkmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776437066; c=relaxed/simple;
	bh=RvZjgleGuZmwgvhgJ8Vxd86Xkc62XC508140/KU6t+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8NxnrG5pz/CrHsQgNGHDY0+ZikBspArooKl6gjn0SvWSCe4OZyeevty+iHdocOK7wLxW9HVVTGSBY6BR9fIepIeqNugcWl6Wv+r3pWZ6RU8w5pThff3qQnP81ezF5tNB+Vi+YyRqPUn9jm0jouxjDjkZMtgWBaFpMUfeYZ1X5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyiof/KM; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c795a47186bso353203a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 07:44:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776437064; cv=none;
        d=google.com; s=arc-20240605;
        b=YgkhgW64PL1ESh+km2BK3/cvZKZ4inGWsUrl9e42DqaqpeEL91aXPN2sBaSwZgfK2w
         pKi1+nZ3dJDlouc8+z2IPDIUX2nPJ8xzRL0Lq+O0TL5Q2Iu90gJcDKii58wozC9Z4RYU
         R3/dMfTeF9N1xDXIaUK1Fr5NRO6NucoCQ+zLUVYzWQIFGRMbK/+jJnnA1eDBnhuHE+tl
         bPYw2s18/4sFCc9CL6ML/CKmbtbBONbmTOPEzw1fNlpvfrSP0mKHVO1XYezo69cxljwL
         KyDcfS6bjBMv0qkf6Kuz9eKZ0WuJZRy16ywj25/7w9Y9C0lqC3NsT5/uL+lcF8OtuToZ
         H6ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RvZjgleGuZmwgvhgJ8Vxd86Xkc62XC508140/KU6t+c=;
        fh=bZxM5YRQK7cnVvHGKqTjZxJ4xa5ZBm+EUCFYwP/agLs=;
        b=Hk6FmWnRYxGN3ywb1RGph8BLp8AjgyiUYrkYtsGNCcEOasgILmD7nBp/feOuN0I0O4
         Ic+E8tEzzJjeJb8TYKSF68C66WuJx9LN4frwEIWHCevWSgXWvmE5VZFZgTum9YFsiPHJ
         qobstYcbPX5x2J9TKCvyqSF5MSwJJQFV+/f9VdaIMeygKprZ0/DZbWtANQQme2To9Xyf
         K0N4lEqIst8W1fpE55zjtevg9iXPPpveLc/Cl4WWmpTHAMDfXaMK6ejvoYKIFR7bxWVQ
         78ggvKHrdWpXUHDMYao9myLDWOfFLGli0pCtj9oxRKYiDdgNpuVd+rZEz0ZcuZABPI8F
         mSjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776437064; x=1777041864; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RvZjgleGuZmwgvhgJ8Vxd86Xkc62XC508140/KU6t+c=;
        b=gyiof/KMfniQ+vBTz4M+I+0symhU8LwM3NyiRxFYpTOz3jWQjiibj8RNFT/fIjVJRO
         dxLERqkg0xfqe06ESeiA16riFfZhoD553zUfNTdhsR7S51NE8FyDMlstdMLZQSsWo2kY
         XVfDRkCFLKfPLHiqUQiYFS6vDmnujQky8/vKBp0Ht49KAfediXRWRDHcdcYPfPh932xo
         2knFi3L2jWxPpK2N2V4V3UOxejzlcC3J0y+zmFtxCaKYQGtibndllI0MzT58Scs3dDEr
         Mzr/do4PGuSLZj7G4CrCnBc9xmR3iHQA3JL/QKikp5DOBobQTpbF1KAVbeTkt+7ad1oO
         yHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776437064; x=1777041864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvZjgleGuZmwgvhgJ8Vxd86Xkc62XC508140/KU6t+c=;
        b=pxqi36ppWfxJcGmzGfk2fPHwkf+UQ67C+8eCcSuOROBc6tdY5zsDEAHHdyCUDOFrxp
         l/zWQlTcYgpxlVKu4cESooKVQoQzZO9xtdG8awJGjDuWljMhQZj/C6xzIEOnAMrrE0ey
         pCenonQVn1/YaXPpX6bSqfpK112NfexyUdhTDsOBVe6Am58rXqXci+eyVNgGmlxUzbfY
         rAjhbr4k85aDGsrhRMgdh2We/lt9ofXuXI50GzEc6bdjPbqDiKpu/hmhQeaDS/2KW2qA
         W/SFPuc8u1cSnbXnPovdAx4wxL2+/nqRkeQcVGOfnsZCZfestdOHwyprAwhpudL6fiXG
         XvWg==
X-Forwarded-Encrypted: i=1; AFNElJ86/oPnPcwSE6fDpcr2mHWeOkykZammccZsqeJhSaJ6zNhKBJJlBSno2IJzLlU2uV6tWcl6Ocb6rac7EEfaGCJ2mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2UBb3WM3wm/UgQgxn0ZKl/KpMVF33oupQ2nIBspHPrzBjw237
	y7VIeXb2Xh/A2BpG+Zxw1CB2oXEaPZtiRPmtctV+140Rrk9iF8cqn+wk8kEIbb7wke2oHng3Cke
	6Q3v9ZXGdSUnI21jBAiDLipRJFkfXDAw=
X-Gm-Gg: AeBDiesmiCfUcwky8VJcftyOzPasW+lk32kYeU0S57QYM4eLF+qJkVMW3xBaU/psnAT
	dAZWFqPaASULZK7DP2PjbvPBQy+TJCg2hE00RJSC/rhwhC9OLvEd+gHOy8sQUvF09kL2INFJunL
	u/4thXWgbjzlwhlRlqjPWmQ956GheHWE4HQtkmwhb6MaIR1+5K5W7IDQHJQ81tBw36R0FMFpMgi
	r6UNYmpBWL4rZK2EbdfA/LckBBDzeUb/c+nc+9JEfe1oFp5d66UZnwIB+9RH3iaoX52KMXIrrlA
	kdyGAyCKOPa9KJBFGuek56DTYX5GYJVpZZRjFERDXG37aMDP3v2wKQv7w3M979pusLuPkrBFqhX
	NAKL38uqbMHQYhqebcg==
X-Received: by 2002:a05:6a21:3285:b0:398:7796:7823 with SMTP id
 adf61e73a8af0-3a08c85a42fmr2848043637.6.1776437064234; Fri, 17 Apr 2026
 07:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll> <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
 <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com>
 <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com> <CAMuHMdXie1HR6XzkHXAtonh2oemNxH2UZE3uSUjW3xoOmhRjYQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXie1HR6XzkHXAtonh2oemNxH2UZE3uSUjW3xoOmhRjYQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 17 Apr 2026 21:44:11 +0700
X-Gm-Features: AQROBzAQoWeu6BUfwIVhLLCWyt7hmvErfzqvAfs0Xeg-5QUpm0Ag_AdFXLu6Y0g
Message-ID: <CAABR9nE73CcehRNpoZgT4mEL3SAzpK7s+syoBxcCMgdToEWXoQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31360-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,renesas.com,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9D9C141C326
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

> It is the main clock that needs to be enabled to make the device
> function. This is independent from the notion of it being a
> "Module Stop Clock" or not, and became sort of a convention.

> Correct. On most (all?) Renesas SoCs, devices are part of a clock
> domain, and their functional clocks are managed by Runtime PM.

> It is not strictly needed to be the first clock, and mostly a relic of the past,
> when clocks weren't accessed by name, but by index.
> Also, many devices have only a single clock, so don't need a name.

Thank you for the clarification. It was very helpful and cleared up my
confusion about the clock naming and ordering.
I really appreciate your support.

Best regards,
Phuc

