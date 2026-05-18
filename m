Return-Path: <linux-renesas-soc+bounces-32753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BvoFEhfZCmoA8wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 11:17:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C87AD569823
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 11:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53A53305B47A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 09:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80C73E51D6;
	Mon, 18 May 2026 09:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zk4d42Ub"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49A03E3C40
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 09:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095439; cv=none; b=hMxIOLZqvoEt7JaVPgNQ2rq7vNg0/4C0E60urGEOCEWL1wJZnLqFhR6L+gjBY2gH41R55bnrMK3iwN4I7aPKf9tHXdYIJgWpQT76ItKGM5y5K6E7uGSnEQkZ5bK4t43j0XuEMvEtx+Jrt7kBYJEtgICeuPNJEMce/QWV4XEe5Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095439; c=relaxed/simple;
	bh=hajp0DZRTet1z1y/6sWDp4t2WMSMUpWwUf/1hDpcsXM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvAnXnpO2BMPAtmTHFkOce9eq74EXMAl8ITFpIb24GjJm/PrNdrEAmo2Wk5Umj3aWBJCdnqU2eQ0oeedmxR2+FyfHV/VCyrpuF1Qce8IOF3SKUhcligpNnDcv6SMlD0AqCtMkHB3pgo5isYNfI0sLGRw1yejtpEiyzdjjHlyMzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zk4d42Ub; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDCEC2BCF6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 09:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779095439;
	bh=hajp0DZRTet1z1y/6sWDp4t2WMSMUpWwUf/1hDpcsXM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Zk4d42UbtBSYWUU4astGHOUEq1lbCJIgmNW01NGXYZjPs7KTESX2hXiJigcCci1d8
	 k1F+jihIgShnVgmjLAjMcgwZUYgRqQz5g0m0l7lcdWGqG7A+xxaV9rd426wNh0Fn2g
	 8YyTTNkdtABrvba085Bwk1wGOyHKWdquBU6AMDSZi12uoDD7RxFC1/VkRzhEELbw7C
	 /j9JMgkWw7dqldX+du9KVwfpneG2aZg2brA6HOgWHF34bAzBUui+38YDeCPLhQJwGs
	 xp4rzDCKo4EPfvN5FnoThZgKOjgFV6esIhKHvQPhDwjE+BzZqTWfSeLXOT0UJEy0lj
	 nRQvxfyTQaphQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a88de2b52eso2663664e87.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 02:10:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ERk+BNJYqCJ3sfNeldkqF2MccBQomKTCa3rmiT5bKACJPX7Ak0N+CGDVldMx25/Jx9YGSUZOQc2DDzdi+fZ4wyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLs9dFR1q3InCF1EC5H8q3dPONz68FR1n24GGjgY1y4ktiFava
	NCTx3DcE2d3XH3oAFJ0yAdMl4u8nRSj/BIXLCJAedE7/xTAES2vIVO8JTSBBNvUXvSH2gnG4/sr
	Ri/ifQ90+pydQUN7nougkvG0LU7xy58Z5AWIbNlNdyA==
X-Received: by 2002:a05:6512:2301:b0:5a8:6d58:b29 with SMTP id
 2adb3069b0e04-5aa0e73c0a3mr4149381e87.22.1779095438247; Mon, 18 May 2026
 02:10:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 02:10:37 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 02:10:37 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260515124008.2947838-2-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515124008.2947838-1-claudiu.beznea@kernel.org> <20260515124008.2947838-2-claudiu.beznea@kernel.org>
Date: Mon, 18 May 2026 02:10:37 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me+PuOwObQ_zPKjLbpj6zs2rFjgCehD52A3W9WacVKCjQ@mail.gmail.com>
X-Gm-Features: AVHnY4Jqy1SOJcsrwATZK4tdEyvP8FVXL8hm-7A7J_54rMD6AnGZw7ds634wgiU
Message-ID: <CAMRc=Me+PuOwObQ_zPKjLbpj6zs2rFjgCehD52A3W9WacVKCjQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: renesas: rzg2l: Use -ENOTSUPP instead of -EOPNOTSUPP
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org, 
	geert+renesas@glider.be, linusw@kernel.org, brgl@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C87AD569823
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32753-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, 15 May 2026 14:40:07 +0200, Claudiu Beznea
<claudiu.beznea@kernel.org> said:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The pinctrl and GPIO core code make exceptions for the -ENOTSUPP error
> code. One such example is gpio_set_config_with_argument_optional(), which
> returns success when gpio_set_config_with_argument() returns -ENOTSUPP, but
> reports failure for all other error codes.
>
> Returning -EOPNOTSUPP from the pinctrl driver on the unsupported pinctrl
> operation may lead to boot failures when pinctrl drivers implements
> struct gpio_chip::set_config, the system uses GPIO hogs, and the
> struct gpio_chip::set_config implementation returns -EOPNOTSUPP for the
> unsupported operations.
>
> Return -ENOTSUPP for the unsupported pinctrl operation.
>
> Fixes: 560c633d378a ("pinctrl: renesas: rzg2l: Drop oen_read and oen_write callbacks")
> Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controller driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

