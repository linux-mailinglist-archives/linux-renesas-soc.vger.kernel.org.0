Return-Path: <linux-renesas-soc+bounces-31261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHmXF1Yd3mk1ngkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 12:56:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6013F8FF5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 12:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D46D3005AEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 10:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F94383C92;
	Tue, 14 Apr 2026 10:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+bHQ/XX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4593D6698
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776164049; cv=pass; b=d3XIt+CriYtQ5SKf5P7z8EgLgMA+jvD8yPJQwqex+yZYQ0KaHUSKj5LO1zwuQNUYN4BCZIgv32e+gIHjq4HqyBkLSzTWaVK/7Cg6kPubItvwGmpL0aRml8zv97pge1Bq/pBjnJshXD8QrF97ITXWDO1Jc+js+0IYcaNwvTCf02k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776164049; c=relaxed/simple;
	bh=IJ6eZNFa4BvzEyhZzc3NkU6Mj7y0nTg/7TgB/BQzNgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mskbjtye4pXjSNVealTMksrw96hWQplyVY5VTGM4RLLcqq8YCayyx6aIoPUV0eVtAEyfKxzEBww5bBS1vxTq37jozuVTvQ6o/hyYev9SKrIx8gx0fXoxLVHjhiP5pLHH9HGmoPkcwm884MHLvTMvRvH/mFJ2JQBtkIajCw1KZaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+bHQ/XX; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c76b9efc299so2141182a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 03:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776164046; cv=none;
        d=google.com; s=arc-20240605;
        b=aGpV9ocVOPJHeNfzs3PB7IOlUzL9kQrnPr/HE7h5aVb5G07CDqDgu3VXyZBZcGhuWO
         rdP2gyaCMy+O6UxThknVuWaqB4XhjAzri13/y5UUdO8aPpzDhqJytez6QZ/AsxlssBiA
         baaMAZjj/8WoLWITjmd3vAp3teFG/M8FcC1cKTMkRQY0ZE4HXE9wj1wvpuTy/NDDHPMY
         k4SyIqXp28Ww7U6ilerj/MXQCT5CLJJ61LihQrWy62Q8t2dXTGsISzbenYea7Qehms0/
         IB74dSHJ3M1rbtjN7J3UGz4USV2yDIAxDCVjD1XU2E6oeIMjXAps0l1oCtCIvwfzNey1
         cZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IJ6eZNFa4BvzEyhZzc3NkU6Mj7y0nTg/7TgB/BQzNgs=;
        fh=rmusH+yb/0Js4RzlQ/9oAcpS/Rgg+POnYg7+3wJv7pc=;
        b=Pa3A2OkhWf580uzcD1ov90j/+zqnE6Oush1Y/tNjXe6vrlHCJnefsRg8oF7BwUioH6
         3SKlx0zz8auqWUbV43Z9VaST2DFjr5+Oabg2BHp/WhrPjFEDb1foXZhWDzcp8RcNSQIT
         7L4ObkkXint+WzjNz3tj3/LBkDejggi0Ldos1RsbPyKrKrYMdsm/UOmMvqckEWzyGwnj
         FScynA1bame9RFMWJ/Wv4bAu1vOCbNfK2ER6ToaX0y2wmSug9I99Z3kWpOkW3RdtpinZ
         Qa8ziMVHAd54Ki1C2fEPafRKiOcVBgoLzmV5dis+lLkNcfuTnvL8HlCu0WubXninRsUJ
         +0vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776164046; x=1776768846; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ6eZNFa4BvzEyhZzc3NkU6Mj7y0nTg/7TgB/BQzNgs=;
        b=O+bHQ/XXtMGwOQKs7GXvIf1SYUw0hn5HcY0huKkwdIYFQr+5ASKkIzPgfvjvu/SPBm
         wlrKWa7vT2KMB6lrdVmz1jXhGzaMdGt80RelWBHBV27o+OnkDaK4gtNpEY6P/mUzD3Yi
         FQhIQzuJf48ekau/E2Xt65k1WyPv/xlJNadUaPjFhGotWXGMR/7LipkbY33NXiqjF/Eg
         AqxCpCr+5GjZVaTbIZlNtBaDgQSvKnz4BnsRIwokRoomXvjWZZqUtyfJ7hNX/UwYSK2A
         PUl9tqmNgchVRx71zA4nfsGJy3nmyUCsdYffgFWeCxU5eH286nPrCl15Eb80i7HiaRvK
         1DNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776164046; x=1776768846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJ6eZNFa4BvzEyhZzc3NkU6Mj7y0nTg/7TgB/BQzNgs=;
        b=XwUxOSg2ctAcTv8hdaJK9QNx0CfsbS2nixHLvdFi0ENROHm2s0cn3vfdQ+M2/PXKUx
         U4mqo3RfFeGOslWo4gak0ismDlmW09gk7hTdurpFXr/+5rU40QxPo86C+UyI4w8vUUPL
         pwEU9qSx2AVJFRSWhkb6V3w0TVf6nJzkIoNlSAO1INiL2kF+aOgIz+vGhPZOj6kx27wV
         Eatu8+iQmee4p9BKeYcZwZ44chh3xFTsUeEmOnsFDjXT8p/ADFd+7xM72+4Atz85lzjE
         pg3GaMJm4te1XPfhDsSIlfytjqc300p+jM/36YEzoU14NmdXX26rRRhrKKR8RXfv6l8c
         OERA==
X-Forwarded-Encrypted: i=1; AFNElJ+w8xJ+ZSSIo3QB/RDdGBEpnbNlOQxFfE3BfOXrKvRy1if4FID7zwfNEaEIyKnqnFsBAb35FJYrD+OSi3Zmx6a6TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGFxj5fN7boEDdZWe57ULvA/Cuub0fWUqzXgVxbbdn2G+3H19U
	v/c3yye94oU6OwCX5f8HdeHE7ZNhx+gsUALNi00+MPRjjz/+/nXp49pC1gG3B4Am9C8XNiOETIQ
	pHjp1RTCRI3tDYgj7ANvCKRE3LLe6YK8=
X-Gm-Gg: AeBDieuE0+XGgbx/hoEksPa9LXdOvPuvOg2aIIZijlYJwLY9Mmr7j42mP2kkWQfKwm9
	DYKVdwUj8TAR8JmWyDLGrTJGlGYlaU6nKupE3AlW7IsMzl3HuFvUXZgHQMRYs86aMb8Ar+xc2Sb
	hjTxP4BQ1ForPGWxERaw0lPJsZRD9vAW/SeH10+vaxwRouugyyfjw8UIsxIjSFMVydncmFtFde/
	ek9qY3JV1KFkcvdvViZlTyCvKotN+Ihfie75tY0bH5IT2ymwQDHmeAWA0F8DBxi113u8RJXdABK
	BwCbrNaqcTQreCjxBqQCP7n8Vy94D5JbJmsOGg==
X-Received: by 2002:a05:6a20:6a13:b0:398:a060:a97b with SMTP id
 adf61e73a8af0-39fe3c2d507mr18527614637.1.1776164046322; Tue, 14 Apr 2026
 03:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-2-phucduc.bui@gmail.com>
 <87v7dupfx6.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v7dupfx6.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 14 Apr 2026 17:53:54 +0700
X-Gm-Features: AQROBzDvbXBRQEOHytM6mfwHKRF-_puUL3-UZMWiLosO-tI7eLbkJKI2mRDU4oM
Message-ID: <CAABR9nGu6HyP7HA-0RJX7t0kbufu7pAkbUq9MV9cWUAd+uzS3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] ASoC: renesas: fsi: Add shared SPU clock support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31261-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CB6013F8FF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Thanks for the review and explanation.

> You added clk_spu in this patch, but not touched.
> When I checked whole patch-set, you initialize it at [4/6], but [2/6] is
> using it. Maybe it works, but is strange.

You are right, clk_spu is used before being initialized.
I was not careful with the patch ordering and only ensured the series
worked as a whole.
I understand now and will fix the ordering accordingly.

Best regards,
Phuc

