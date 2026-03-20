Return-Path: <linux-renesas-soc+bounces-30023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKV7LUVNvWlr8gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 14:36:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 251B52DB0CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 14:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2E4C306B0AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 13:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0005279DC8;
	Fri, 20 Mar 2026 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kv9wfpWp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F9428D8D1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013752; cv=none; b=lE3iFqPBwGTvF27jh/xp9upWlpP1t1HdcrYcmGdXRE1MYd6w+VhXmLwdp0vCZscyKXjtJ9MIAr282V63+FJ4C6K6TtYqngvu2BEYjw4C6ISSOLBGbFFVP2BjUTfKG0jm3qp44WhbCRZVvqaEqc6OXeBiOeecAhbChXIjq/Vf7Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013752; c=relaxed/simple;
	bh=x+Q+mpwKpWdfkCJjdjeyoSi32p/Cj9EkuzDU7dEgYwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sf7LJJdKmFtZ4MdY7EvLqvPCkY0zkX+Ea03KvSTz/eZPt/LARVtOvD4hGqGiiqIIksleBMuGkpsWx2J4mgCuGIIK2+x7LxW1hr6WgYKE1bKeNtnaLb9vj9GmShJrWIBxzsX+HNawAAfgMLjoy+VsoIJrsJgkrrZ4kAwcIT6ZB4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kv9wfpWp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F9DC4AF09
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774013751;
	bh=x+Q+mpwKpWdfkCJjdjeyoSi32p/Cj9EkuzDU7dEgYwY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kv9wfpWphRuHPSu8UiKQ7LF9JUNZ/yg9w+WDHavCnTO/Vpnzva5ZY9bFUS7m9nCHq
	 3Uvs0eg7Y8GIh1/8w7vy7/Tmdb/DDI96VL4FNSz7p82lMD3IeP/dqXFQQ7O1MBEHT5
	 PUIPw5e/lsP/hXlT8GtV8RGmP30PPW08etwdWNY4/bkcO5Ik1k5Y2v7Fu4F99mFcSY
	 kLYdYHzUNJqNg1FPJKCkEmbs8ICPhlQzd9dj9Vbw3YqmXEH9OjdbogJ4nuydZVCUAP
	 EtKT7uPWQKv1btnY82ThTR34KJ7BoZTqNRRRckMVVSI7iTFnz8PwLD26D/v/MK/T95
	 uB1etS3MJ+B/A==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79a5fb98316so18608867b3.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 06:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAzvKjWeyRg5KgmqHYFybnbs3PGuQI2MAPy+a/5/VNSWP/F+zYZlERlMS96nV7FSBrZjPZLr4Thdr4GojcJrrs5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp8NR7Zq8lllf3VENM8Z85a7cU8cTLbFMdoxTVk4crmp4GiEei
	IewDWFc11xs1eY+MCu8FO+poA9FP0xnD2iI6DY2zxJf6I8xO7BRUCbNR9PDwD/JMIH4L0aRiGqk
	IPhPSz/+sZuSCek6/9TwAYQgeqal6Gzo=
X-Received: by 2002:a05:690c:6d81:b0:794:6fa2:a037 with SMTP id
 00721157ae682-79a90a92a96mr28577437b3.8.1774013751143; Fri, 20 Mar 2026
 06:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:35:40 +0100
X-Gmail-Original-Message-ID: <CAD++jL=5HyZ-Z18iJPzrQY70dYq==z-nofx+O=wfTxYrfynZWQ@mail.gmail.com>
X-Gm-Features: AaiRm51wCIQ4YFUApl9fDukQ-YQ0efzADwWtEvQ8dtpStZjJJL077i4VFyJ5keU
Message-ID: <CAD++jL=5HyZ-Z18iJPzrQY70dYq==z-nofx+O=wfTxYrfynZWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: rzt2h: Add pin configuration support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-30023-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 251B52DB0CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 3:15=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add pin configuration support for the Renesas RZ/T2H SoC. The RZ/T2H SoC
> allows configuring several electrical characteristics through the DRCTLm
> (I/O Buffer Function Switching) registers. These registers control bias
> configuration, Schmitt trigger input, output slew rate, and drive
> strength.
>
> Implement pinconf_ops to allow reading and updating these properties
> through the generic pin configuration framework. The implementation
> supports bias-disable, bias-pull-up, bias-pull-down,
> input-schmitt-enable, slew-rate, and drive-strength-microamp.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

