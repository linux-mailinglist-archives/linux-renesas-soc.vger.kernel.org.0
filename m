Return-Path: <linux-renesas-soc+bounces-32082-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJG3LSnl+Wn2EwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32082-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:40:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D9C4CDB6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 181C83017279
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFB83B2FCD;
	Tue,  5 May 2026 12:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grhURwyr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F842B724
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984762; cv=none; b=c1u5zZ9AzK6smc4npew2jIeTN2IN12jbMBBEWvhQ79FjizPTXBHO4SceZKO/PRimCrdcdARid5ADilhRoOK+oUi5dR47qkjsvSAfVHqoqFRlIgqvVgQ7SJPEfFIcXIh3VcUQUhNHBSEebZThodHHMX3tYOfkmgrnVZoJgSzJLU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984762; c=relaxed/simple;
	bh=w99Js4h1XyQQBHV67ZX4rgvBqBQbq9lx0gZf7yXOqDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBoWwiaJZKjbFvPu4mtGWFU6ovVjdYKhAYr5LfvuMmUereekrtugCfUn1hNeAYnLBrtQOfe3VqQx/vA4h5+zlpFOKyi7fsD9QemjVMVcHTQ3zzN13IjR7SEuE916l1xhdsuTu5D+vp8xCercCVhckygoEYNaNvccZlLvuaUUx6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grhURwyr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A9FC2BCB4
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777984762;
	bh=w99Js4h1XyQQBHV67ZX4rgvBqBQbq9lx0gZf7yXOqDU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=grhURwyrdebtefa/yfuJnvGKn3wTuKvqc7yxFAzkZHwZQ8jaNFUgi1Z/caHWlC5yg
	 e2gCDq/zSUwTW8uIOCv0bEd+ZJA4c1EVCAAHmWiKpvu1BVlOZ02x6Ha0KMaW12EUnS
	 1HBZBJGAgXi5p9/193PQinTI8OGTYmridNoLLfP408RFWKb0R5mIJjf32DnTNFG7po
	 MkXpMxtaL24pXFxtdTqyViklW9KBQmvurE7FNG9Qg1Ib7VPpeR1Mj9B8mUxwooN/TS
	 uB3AsriTHEVNmPGdOGBB6Sx2wRBPNA6HkO2yqH+nGFPu+TAkaFbruKOylpw5F9ycii
	 ikrUX9qLSjsIg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so4926744e87.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:39:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+KB0BUzxIbvrMDZiZYEWvp5EmUg5MCQLBR6kb87P6dTRKsIkNCGU1ZgJIEyNmY22DRL689f/D93i4qy3mogUmc9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrmMMQimw9bx9RUg5Nk5i8tbni2IdIAy0veSCCZlfwr5JU/Dwr
	JivcUq8EiMos+d/w1pfRO2oUPP44An8Q4RlOVj4TdQ7jzP2YMeuEKUa2iQjoNbroRfrw1wzbGxU
	hQ/0rbzWcmMwA/kLcmuoJs0BZ8y1vSmo=
X-Received: by 2002:a05:6512:3b14:b0:5a4:ea:724f with SMTP id
 2adb3069b0e04-5a8631c03f6mr4602967e87.30.1777984760942; Tue, 05 May 2026
 05:39:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777899466.git.geert+renesas@glider.be>
In-Reply-To: <cover.1777899466.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:39:09 +0200
X-Gmail-Original-Message-ID: <CAD++jL=i37kk0d-jQj9z_NDDN2hBwBmaQ2MptPwF0nhDXMnioA@mail.gmail.com>
X-Gm-Features: AVHnY4JbtMGrkqeTPyZZpUlVVKRpp3MeLyfRzsAKfFSt4TpFwZKbr0Ez1BZc_1o
Message-ID: <CAD++jL=i37kk0d-jQj9z_NDDN2hBwBmaQ2MptPwF0nhDXMnioA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Fixes for v7.1
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 19D9C4CDB6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-32082-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid]

On Mon, May 4, 2026 at 3:00=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-fixes-for-v7.1-tag1
>
> for you to fetch changes up to c88ab9407986836820848128ce1f90f2fa49da95:
>
>   pinctrl: renesas: rzg2l: Fix SMT register cache handling (2026-04-27 11=
:18:04 +0200)

Pulled in for fixes, thanks Geert!

Yours,
Linus Walleij

