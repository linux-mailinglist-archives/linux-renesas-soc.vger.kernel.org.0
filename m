Return-Path: <linux-renesas-soc+bounces-28135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCwsJZQ+i2mfRwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 15:20:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD2D11BCFA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 15:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2EA6300E63F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 14:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA51B329E75;
	Tue, 10 Feb 2026 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bh+T3j3i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D241B394F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Feb 2026 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770733201; cv=none; b=kF+w5EfCu6C9OX2A98+B8dd0o+BaZrPAkVt3l8pSaMi0+M3HqoqTq6VFxA+2dSeMxktYuaFfOpQJ+/QXKZxCNLC75nfW4yoaA7WrmvLV1HRVdlCCYYB2vkjuVr5EYsbg8Xpl5erKg9EdEqqxWFLOcmmrOwJBHof7eA9aqe2rtX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770733201; c=relaxed/simple;
	bh=Odw3h2xXVkrcgCjrEBxTd6gG5L40NhU7zxaajIxkAsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqyw87x5yJjLlNar6x1SN3fGrxQSKZZEOdHFzshDmPRmukKarR+ZfTvcZNTgQiesGCTW3B5r7FGuwzX/aCvBbuFbOb9mamiO4Lj4nFYZuUpsffbBiySQaOw3Kabf5mNw1EpA/LPgAS76YWA1eAvWXShG+Ahj4WwQB4b7M0SroVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bh+T3j3i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD0DC16AAE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Feb 2026 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770733201;
	bh=Odw3h2xXVkrcgCjrEBxTd6gG5L40NhU7zxaajIxkAsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Bh+T3j3iTWYfAVEB+OpSnFuBl7FTl9X1t7PcutsI3Q/B/GDgJjifvoWAJ2+gzXief
	 vJM69hMd4FvOnqcEd/FihbVtkdycwE4EHu48Jdhmje8UVA9ZZR4ed2dKs/zBt0Aad3
	 EUfyt0KYattmvr31qg31g04Nw+Dj2/tuYCsYtUsyoV3hOTjOglRokyfrNdFqIIEArr
	 STv26k3KsuZ9uE2e2ike9TJflX4NT3S2CcOLWAvjMKrkuicUIFFfAS+n65KdL4I/aw
	 PDcczD7NL3yo8+pSQ+ChJ37Emt7J+jZMysH34NuQzCmXoIxhUVlIWBndFw4hhh9SKC
	 UhN0jo0iwG0sw==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64ae1729637so2257772d50.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Feb 2026 06:20:01 -0800 (PST)
X-Gm-Message-State: AOJu0YxB1nYVVlOvdZjRv0WXUNgGVLCmEyZU3ZD1rmCJvRadNhJqsTRO
	FRLpSJJ9/XPQVQVrnx74uofbOBfWAIMC7IKDn8++TdR044DnoTo5BMaQP2OzqEdLkPKz0tW/LGo
	vdZip9zCemqDqqgHKxTtIliZxdO5/eXw=
X-Received: by 2002:a05:690e:150b:b0:649:3e3d:327 with SMTP id
 956f58d0204a3-649f1eb3d66mr13590998d50.40.1770733200730; Tue, 10 Feb 2026
 06:20:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Feb 2026 15:19:49 +0100
X-Gmail-Original-Message-ID: <CAD++jLntW0QZ+Nt45Z-G2wbmqrL5jtnuy2B5_rRE6eS2w-1Nqg@mail.gmail.com>
X-Gm-Features: AZwV_QjNXHFtXvNMF9TF_TvJtup1g1L8Eh_OBP9sLN0HF7Jz7nHdNO-AVIyYB00
Message-ID: <CAD++jLntW0QZ+Nt45Z-G2wbmqrL5jtnuy2B5_rRE6eS2w-1Nqg@mail.gmail.com>
Subject: Re: [PATCH 0/2] hwspinlock: remove platform_data from subsystem
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-28135-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0CD2D11BCFA
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 12:01=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

[Page Mathieu who I think wrote this driver]

> As stated in patch 1, the U8500 driver is clearly unused for more than a
> decade. Removing it allows us to remove generic platform_data support.
> Both removals make the upcoming refactoring (headers and lock
> allocation) in the hwspinlock subsystem easier.

Fair enough, these hwsemaphores were only used when communicating
with two DSPs that we never managed to support upstream.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

