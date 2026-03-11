Return-Path: <linux-renesas-soc+bounces-29196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BoTIKhnsWnsugIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 14:01:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD6B2640B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 14:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 43CEA30093BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 13:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E282528507E;
	Wed, 11 Mar 2026 13:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GMxI4o1m";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="R71LJmsv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D51828641E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234081; cv=pass; b=KsMFh5enxMW5djgzNQEgA0g2iCv6espu3dUBrgocxhOM7semG0ol2GPROI/+29CcwrBnN7agBUfufC3FiJeyW1+Tkp7xKEE6GiUM3cpKwm94N1Uwb5r1eB2D/erYf/VlEBco0+6S420RtNX51T2kKfQfOh7DB4v9hQUslg4H7no=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234081; c=relaxed/simple;
	bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TH0QTVWAqJWGB8Vws0Kro+78HQvYOsxbr6Ft6XzOqoQ6kk0PWaUiEmJfFtELY0cMzVcZcNIxI1cc74WJ8PD0lKmOD/LhI/ccfO2tDDJZkY53B/GEPKcgvjQTv1+hmuhVKf9Jm5mdAptWdFkFFF6d5ysdLEu5HGn3oR4nY9FQyig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GMxI4o1m; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=R71LJmsv; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773234079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
	b=GMxI4o1mTPVjL8rL7A0AvuUvzfp52UF7d0UQXhzR0cCRAEWbGG30vSfxD9z3wQMJIMCux4
	rhmFHCbHXHMBJZxajh9zouJReEie4vcHrq9Jyq94KQvP0fAfVJGC8WLk8U/FkWLdB/Rk0h
	/tIzmgdpBb0KiDMrbRZRz6P+ETHOFLk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-DTMc4GNXMVacKC98GG_3ag-1; Wed, 11 Mar 2026 09:01:17 -0400
X-MC-Unique: DTMc4GNXMVacKC98GG_3ag-1
X-Mimecast-MFC-AGG-ID: DTMc4GNXMVacKC98GG_3ag_1773234076
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b8f5bce308dso1235488766b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 06:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773234076; cv=none;
        d=google.com; s=arc-20240605;
        b=eZ8pZn04eQWpirYAuW7RZondpJQCOeEkTo+SpTxQyAh1kK+haE7JzWU4+J9XUBf7Bf
         ivtWIFlIqdB6myBYzohXU6JTbqW6EUShtPaMI/cSaRGjlcSfOqP+juSA9yAyqmY7ok3J
         e0A1BG7jaFZ+btkJNJNpwtVcevg8hgxUnnYcFncW60b5oj5lknRrkmj3cPXb7qRvawjX
         YdzeXfi0RPhAoh8jwfupqql0o9+fSmTGjcLdUBA44jY3qVAEK7QGwFzO/79A8H+me4Rw
         05XcSiKwS1OtZ6raeyE/thaBNXtMiX9N2lMNHeWB4j49gtAXDdeEWVgjechQ8mVl+y9W
         pnBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
        fh=BkXM76D0eO5Ep3iM8D3TZUHjutTD/PI1WQ5LwAPZ4nU=;
        b=SGL+uL2/Ph9Y2wiUHJyGSrwSWKpaIhilgtrmVFzkKVY8TRcXxXX5x5UyiCc5y8vWbR
         ZeIZ/rECpZ2nebohLFjbQ09tvgqKFJ8jQSxlJ91NEVdLvz3mDty0iMNt2dCnKWZ7gD0t
         oexEgnsBhpnyA5VH0KhDbmvSSfgIZ3t/cizcvz7TBTYTyzfbL8CWPr9rpyLs884qNZUq
         Mw1IGOh45uttoLWsvz7TDHAg9KpyUeFLx1SconeKPqBgEi+EKZu2jOVIpTouqXG9BVET
         4Zwn3X/8oVZ/+8cW/UHvAd8tK0/US9m5BTg4PfDpQFf01L5UeKweMsKIziBkgIxNiL2V
         16Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773234076; x=1773838876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
        b=R71LJmsvDoGTZvb0JwLD4qFTsSwb4UVVFK3SuL7qvti11COXCeLaEOIzry8wYazr/y
         ikp00ZMOp1JHxB2Izfa/4nCOd35Q97UNuboTaNqFDr2lUNY6FlEgAyq+4g5lN13pHwJg
         7H7icD/Im1a+6ZPvyBXegMmCiz6vW6V8voJObK7xoHxzxBJxy/lt5ujguyC6yX3NBjZW
         nn0A9GEjlb8X4C5pbsPVVLwQxD5Daf6EmqljjqgsHM7lZd+BJ0rnIkQxmwllJNHtWsmC
         T6ALdhnd0ONm3ywBDnf2onV6Oj6K48tgm8GyRAL2S8ulnHLHBDnAIHhJmHVhOqtVwXKu
         6Zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234076; x=1773838876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
        b=m01bDF2PpwQRaE01SWf8c4FA9A7kuph3VhijkZx19jgsuIHnXIE55xzGYC077xio3S
         yAxJQlcyWNqW4nl2nBcu+bDi+po0XmxwvkQLstIUVS7BcJkbV5bxcvu1QTFdQq8SBcmy
         +aFjzXOmljLTeONtmtTQypj1/o4avriiMSgNXox2VhEPAb+2i3epqL0FqP9n33TTioro
         ntvmdhJk/YSjH4yeZI+LIc+AefFoUrVxtqBox9JG6WIPXzOsmy9anDuwPvFepBiR/39p
         S4d+LjSaW3pOFpzaF10GD89t96vGv2AfTSRwzS2Cw82fQRa2G86EIMfAlvT6ED71PAmM
         xszQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpifPz6OSufl6eQQwUrLrwriksUsEgW7oGX03e+mCGW0s9KDOZbZkBmcVoDO9qiHavv+xWeDDXkGMJObeGbrMm3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLQUBFkIAqPJgb6aaXkSmSMpmEVz61Q67vYLfQJ1AQwt/cVTYv
	N+JbIoaA5dIzfVzkSccQzsWoyK3n3O95n9tqf5+YajAAVd1+1b7Ma87RFzbJIiQ4BTkimUNGPMe
	8hdLMtFQ/p3KCqeRXyXaYBJ4Zt3kV6YdpsIQB5ax79L91Q45U2m7x/tpTgd0SYyOgkUvAWurVwG
	8inDeX+bVwE+fILSiCAopzkjt4yXPV0CmZFT5J5jOHJZ8gF3k=
X-Gm-Gg: ATEYQzyDTNJCfR5V3DsphkUvUn4781Zlg+SX05e4KlwCm/3M8SMsyx9mq9VHnC1F8s7
	z95oA+bbtExoivZip+y5L3hRgoS1OuNDdxPOe/4t2BGwYhO+O3llPjczA56F3Dpg2wgafnugkFS
	WibTK2D4vUTGBVhaWqjwN+dgRdbT2FTPoza4d2dAMXaYib6oUjKtFQOOsSRKhBzSgpYG7eXb/X5
	yzE2Q==
X-Received: by 2002:a17:906:7314:b0:b93:edc0:e2e8 with SMTP id a640c23a62f3a-b972e6069a2mr143083666b.48.1773234075121;
        Wed, 11 Mar 2026 06:01:15 -0700 (PDT)
X-Received: by 2002:a17:906:7314:b0:b93:edc0:e2e8 with SMTP id
 a640c23a62f3a-b972e6069a2mr143080266b.48.1773234074508; Wed, 11 Mar 2026
 06:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com> <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
In-Reply-To: <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 11 Mar 2026 09:01:02 -0400
X-Gm-Features: AaiRm52EdqmkwN8CGi7SEvZrCO9M1f6Y7hYTKKNfjOzM3D3aXhP9MAnWBZaRjqI
Message-ID: <CABx5tqKC_KocCp+_uJ-t7AhJNa9MZOG=5Dry4UoZXzUvSryiFQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	arm-scmi@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1DD6B2640B0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29196-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,vger.kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,arm.com,lists.linux.dev,lists.infradead.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 7:51=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
> On 3/9/26 4:38 PM, Brian Masney wrote:
> > Note this series depends on 3 previously-posted patches in this git pul=
l
> > to Stephen for v7.1.
> > https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/
>
> There's no tags/clk-remove-deprecated-apis-v7.1 on
> https://github.com/masneyb/linux

It is here, unless I am missing something?

https://github.com/masneyb/linux/releases/tag/clk-remove-deprecated-apis-v7=
.1

Brian


