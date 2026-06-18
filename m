Return-Path: <linux-renesas-soc+bounces-34191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4PKRJTPIM2raGAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 12:28:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF35469F4ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 12:28:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JrO5TUnt;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4156B30861E2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 10:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162D13ECBDA;
	Thu, 18 Jun 2026 10:25:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7013E9C21
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 10:25:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778314; cv=pass; b=W27UZ/i+SkaeIPb9G2tkp2zY7JGYkcrs4RfFMRddEu01EijcjH5a1DN5CQpc4fh5hyy7WGKjB/Xu1kbD3yOUg7C//kX9IAyfvYl9lw3IDEcep9yj87eo60Q0bJMZeEaxIW+RnfKVNa4Vb0lbqBSzXaSZ28nuFkypuIgosdtZbzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778314; c=relaxed/simple;
	bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IInya9yrrGMcjYv3ffseUXFVgCaVd+y2eeF39FNTWw8r6K3Hc/fKSTUTS/JYMYK5vkBwNk+MyUeKBU+28EgKC6a/Pz6tDQM2ZOo23LJmk6+9nUvFSfJPOgfHVkZ7GBmf/HT0PlyPv2Qob920UxQyVDkW9hVwP6mhvep44E3vRxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrO5TUnt; arc=pass smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490c1915793so5717525e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 03:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781778306; cv=none;
        d=google.com; s=arc-20240605;
        b=Jv/NpADPqgXwZ0NgroBEVSCJu6hwcx6IJs8VX9YwczXX/nUCskEQt0kD4aLcakKSDB
         kH1gO0JtmgcDqJWlBAPeMLCim9Kg0VDLl7j3RFkWxpf5noPkSR52dmqTfCnTxoiWbFtj
         7IgQQl96I8d2dz0AUMqvYBHRhHAKKFhEuuhv7TG2VW2vqHxFywzuXhnL/PVpJwI7JKyX
         304l1K+yHORdW+Pgc2GQ/UnL8afs/VelsAtzbCun5iC/fn4NNJquRjOX+xJdvMNYfzls
         J3BRnm7rbb5RHT1qBxrSrOV3TbGf/coZoGVVR7Iifj8UPlWae1R4ZkJ7xjrDGuIJk3px
         df6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
        fh=P3LIa1Eq8afvLbWGTasf4xz3mgC3dbiZon21+nKtXfY=;
        b=ilqG2V8AJJmGxqguwZjThiYP9Nz2E92MNuNZjWxKIPnhch9Zd9C9I77BqPqCPzN0bX
         8W+2hvKABWKLvDthUpVgmvHSbJPATbZUO4UlboLKsHjbXrwHxihxIXU1cUy1ub+OsWao
         5NMp7RzY8pu1/Lmbeu32kv8d3xYOnkfgOPL+rDZqt5hhAJX7A/n7w09X6xgVimnJU8gP
         OFk2z0GjiX1nSWK+jLTQvPyDd7BxzR4FyzcmBL3um4569lm2zzIOAZhAnLtHjyz6iq3/
         t3DzcR0RCbxpx5kfOQSTrh6yYx/ao9NSQcEqGQN62CHbHQSI8vvSs8JVGao0zP3811Fr
         ob2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781778306; x=1782383106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
        b=JrO5TUntxG44+akEv+ys39/1vOLyjc/hJRYPeYu35hkT/Q1x4ewokDZyrQ7WFYFYHX
         pvR++tOqATJM8FKDZTRB5JXXbIcQxprX4ZSJ4SPoaS7uCuL1Ludh6MkIgWXsQdn3cx1s
         17wkY3V+pjqTK42of1TriBl81hMF3gwiA926SekONyVeuiwbW0X+zjeElG3ikVYbDsL9
         t3JY6CE6FOxGama3M0Af7E8Xfg7AjU+JxVP6QfCSV6+4u6AJUerHGLIRHt3VC/Vl9QmI
         yt57Jd8oiPK4ztigwFE+/ZXLCfISesdPS8tKaeT7g98kG1HNrqN67MvkBT1cqO8I5+rL
         UWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781778306; x=1782383106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qlvDSZEkUaxQbRERSQ1J1/mogsG43R0u3lE8oe1oEOI=;
        b=WhBIaTGdKRqjRLyDYuGhnUjArz6NfYBoo/8FZyb5XywXth6j8Pd1cd5SSWIahJsOd/
         OtoMRfTpiUDfAiNx65aM7Df/F2ukR70ZWQnFIacL5stWxHSpXfnOSsKQl8oMoQf9uZBu
         ntd0pBvbKzWJoHoznGPFCSNFxcddJJBWbfXe7Sd1LOHO4eGm+dxxxC5tLlPKlxBe2Irn
         YTzgGLxCnthqzl/tOKy3jruB7skGkAisU3otsqI461R4JDRBVbExnWRlG388njpQ9TXZ
         dU8Xh4EEGZoAwRU1GGWvRFUkbIpLwysdclLMnJf6VXvjgbVGbfwyDmGJlBXQ1ZgxQHvh
         Zotw==
X-Forwarded-Encrypted: i=1; AFNElJ9QHlp4+CF1xaWVT7U2kikHijPVTX3e+1vKacY6S4S1mEXtyZVemcs10kDnG/67+5gLSldsM+E1rNxCqqWKpTlwyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJeCgJG2zgQozxqZLFZItzyUE+r/60z+lFVLyFZkHZnu3imC4W
	J6nO28M3aq910x0UHbHYVXhAiI9wuUk3/U9rOL2i5+UjnIVPF9lmaSYckocPO6YA/sr13apHEc+
	bfEd6im3Igo+JIRRw+S2zfka0z6upcUM=
X-Gm-Gg: AfdE7cm1UMi1ADgSJc0BM2LG10nxtzJQZRnkL3YQdDDuJL8sz7E60MaSMTvP+hQ9mzn
	vl/He1lE2LRHYcVa51Q91Xv9NrK4I9hzIJFYR17z0vvLT1hALOfnJQ7LAkHzGSLU1iAjwQKjEtk
	8rocwfsYSbssR2CwZAbvxBZ0PGSbukwfyCv1c0lFjrVUfPk085ThI6Ys+JhX/+N1rTIwEsIuSIj
	XHmxkMcnm0FVawthNw7AKBQ/t1K+mK1vFBYrcWFk6DMKCpnDGe+eprpZta62guZGUnbBHotb5/+
	PXUHYiGyxQvplYkKA4USraHEC8bN3V6ub5gqgP5NQX1jX0/lpcRTg+DowvTcvxs/9w63dUIhimv
	clVYzOtxVlyJb6l4=
X-Received: by 2002:a05:600c:5644:b0:490:adb6:7957 with SMTP id
 5b1f17b1804b1-49234141d98mr81843365e9.33.1781778306310; Thu, 18 Jun 2026
 03:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajJwqDt2jUfhSD1x@shikoro>
In-Reply-To: <ajJwqDt2jUfhSD1x@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 11:24:39 +0100
X-Gm-Features: AVVi8CeKp76ZYhBRPcDvdhbfVkObzMomSw3gP3ldqFUf5h9HH7P4rMMrIdx25Ww
Message-ID: <CA+V-a8uo9sr3m9F_MQYbHVD5wa3LT3n6MWrVpiNiPDumnVHMYQ@mail.gmail.com>
Subject: Re: [PATCH 05/12] rtc: rzn1: Add system suspend/resume support and
 wakeup capability
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34191-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sang-engineering.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF35469F4ED

Hi Wolfram,

On Wed, Jun 17, 2026 at 11:02=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Add system-wide power management support along with wakeup capability t=
o
> > the rtc-rzn1 driver.
>
> Do you have an actual use case for the wakeup functionality? If it is so
> limited, then we should maybe not support the weak abilities until
> someone has a real use case? For which then, a proper solution has been
> developed and tested?
>
For running s2idle cases with rtcwake > 60sec this feature would be
helpful. What do you think?

Cheers,
Prabhakar

