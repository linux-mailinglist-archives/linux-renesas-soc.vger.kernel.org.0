Return-Path: <linux-renesas-soc+bounces-6952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F0691E93F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 22:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BED921C21913
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 20:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF4416F908;
	Mon,  1 Jul 2024 20:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4+M3zV8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E527D16EB71;
	Mon,  1 Jul 2024 20:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719864720; cv=none; b=n6RT0JlYA2GFdEenRtZ/fwgEz7ZQUOKGGoALIhLOng85sFrrwJa5vCio5PmYDmbmyvGWlZhYHSuHxKB29A4ay+INjOdc4oc883/y+ZwTOixKv4zA/lidG6S41bCQhc+a3TTLmkED8Is+yF123SR22G3z2mBd49GALqI+2ELK85c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719864720; c=relaxed/simple;
	bh=JOdyWIp4JdjCdIHJT0/xXlGViUBjHD/Mwa/JTAO5VzY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=s1NJRh+Mi6ThoX+RY3v1YQaYgC0qlrf1N4nPzfOJPDxWF93VOU28HnR4/TXmUj/uAdZqC2yTS6ZCmgizJLk7z4j2MtFVohQTQW6DzvaiMX2L35XJufbNXNEOaKvKrXft6gNYKoU8rr+cwHdxH0a1qBlzbB0wKqSG+mI6Jz3irWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4+M3zV8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F16C116B1;
	Mon,  1 Jul 2024 20:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719864719;
	bh=JOdyWIp4JdjCdIHJT0/xXlGViUBjHD/Mwa/JTAO5VzY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=p4+M3zV86FqA3xQMiDN8yPR2jvL+rD6zLP4EXPtRnFOoc7ze1NtVKpKA+0xFuHx7Q
	 zK2m3rFrsD7SzTFrbFGa1hc349mcECwoNDWhUOYA8/mIIa3wUeEDXVuMLzY7087Jzl
	 JP6T5GTwC5vZmU5hGwLMq9yl9W8wspUZxiEgIhpBT5WXsyl8rKBZosOUgPruE8LcF/
	 hYxj7d52OV7FZ5NsghWdknvg7JKxuUgV//tij5RDzmrYwtjI0frZKbnWvuUet9F83d
	 MF2/I7fdC2r6inulDqNetLuMHqzhwUVv0P8f74sTW13a6LctV3KdkWzRiLGyunMtTT
	 ZcQ4PejO6YpgA==
Message-ID: <625009ed3aa0d406144c01cfd53c0506.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1719579479.git.geert+renesas@glider.be>
References: <cover.1719579479.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.11 (take two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 01 Jul 2024 13:11:57 -0700
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-06-28 06:15:59)
>         Hi Mike, Stephen,
>=20
> The following changes since commit f92d44a00bd559f411b2c70b677afbc7c47230=
19:
>=20
>   clk: renesas: r8a779h0: Add VIN clocks (2024-06-11 09:36:27 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.11-tag2
>=20
> for you to fetch changes up to c7e58843d1e49a6b54d528a8ea34933cafb713f2:
>=20
>   clk: renesas: r9a08g045: Add clock, reset and power domain support for =
I2C (2024-06-27 18:17:13 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

