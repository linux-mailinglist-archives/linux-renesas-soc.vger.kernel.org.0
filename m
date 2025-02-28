Return-Path: <linux-renesas-soc+bounces-13799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD6AA49889
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 12:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB7E01888210
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 11:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E4B276D3C;
	Fri, 28 Feb 2025 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=coldcon.co.za header.i=@coldcon.co.za header.b="LxnCSnLk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from outgoing50.jnb.host-h.net (outgoing50.jnb.host-h.net [129.232.250.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B222B276D01
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Feb 2025 11:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.232.250.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740743316; cv=none; b=aeP79+IsCJQL++w5NzajNcbphbNa0DFye4JPOHb8bsqQKJkkf26kgW+HgjsBCotrMpsx8cDPPddAN3YC3hWk0Mmai2T4/eQJDQxIQ4Ikwa4HZg1awD6GsekGTjGRWQQwffdhA3VQKNAxy0hEVic7eXz17WycqQ/wed2NYf5yyuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740743316; c=relaxed/simple;
	bh=LnJAb5OtSiiPPpVmdSEicOxdfy335XXtHun9Lv2d8Bw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OZuC0pUVvew5YzdITNN70Qtu2oKBcuTxKrCoE687JrtJ4V/ZdnR0mjthZl73tqk3FtZCNtpiUzzGaYULphRQpdpMwxz9qYi+LmeS0CdduquGJwQSBrOfxKDAGv18m+YFwUwHhS3KrBW3VG+2Zf1q2Jw8YhxeHoovyAVEaXzYWvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coldcon.co.za; spf=fail smtp.mailfrom=coldcon.co.za; dkim=pass (2048-bit key) header.d=coldcon.co.za header.i=@coldcon.co.za header.b=LxnCSnLk; arc=none smtp.client-ip=129.232.250.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coldcon.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=coldcon.co.za
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=coldcon.co.za; s=xneelo; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:sender:cc:bcc:
	in-reply-to:references; bh=t+qwmUT3iOAm1DfPM+nbVN5TXLHXkSwi3Xte37fm8Y0=; b=Lx
	nCSnLku4c2fgyFbsUZbB/lUNfA33QpiyFaVwT3cChRYKK9a9bonr7SN8q0esKXeEEQGWaaZkaeK0c
	jfp17ExzyrRXMvinMpLuDsUm3A6P56h0iIG6/bqzq+KU0pmFoYgOoBJ+/xV4TSctEWVjEuoDFIcW/
	9l9VbklG37oTLZs2RZQCPCbn3g0YIV2c0DgMGufIdpX6jd5Mr9+EVFD16d0YRDnKt4fP7yzqWol3i
	d6OqVeIsP5INCy0AIKNyIUa3RhjobTSotJNcOOOhkXEXL1IgMXQSOMrQ4Dp7+UFvYQi+uRP5EvHvP
	wwStOVWgQpxB+Son4bYA3sLfUgs8F5hQ==;
Received: from dedi166.jnb2.host-h.net ([41.203.16.166])
	by antispam1-jnb1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <avaril@coldcon.co.za>)
	id 1tnyr0-007ywx-7V
	for linux-renesas-soc@vger.kernel.org; Fri, 28 Feb 2025 13:48:31 +0200
Received: from [104.192.5.240] (helo=coldcon.co.za)
	by dedi166.jnb2.host-h.net with esmtpsa (TLS1.2:ECDHE_SECP521R1__RSA_SHA512__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <avaril@coldcon.co.za>)
	id 1tnyqz-00000005vZB-13R4
	for linux-renesas-soc@vger.kernel.org;
	Fri, 28 Feb 2025 13:48:29 +0200
Reply-To: funding@investorstrustco.net
From: Iyke Nikolas <avaril@coldcon.co.za>
To: linux-renesas-soc@vger.kernel.org
Subject: Re: The Business Loan/financing.
Date: 28 Feb 2025 11:48:28 +0000
Message-ID: <20250228112431.FF589C2334A90FAA@coldcon.co.za>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: avaril@coldcon.co.za
X-Virus-Scanned: Clear
X-SpamExperts-Domain: coldcon.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@coldcon.co.za
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.88)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+CzanhUpQxxY0jGcn2Rs0cPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5x9BX7mVKxGMeKc4uo+avBbAKvEzYm74g8ZuJmRNLPV36tZ
 vDe6G+ib5hEM2vkr0IWdVUOA3Uoi89I6XCFtF9lJBMmyNbDn7R5kilAhwr3KtCfMSIIugTT4+3ce
 GAuJssckedUwwCw65nt5kyTd3g2y+gaXrHkgRC7/tI3CjXmVyoO/xDpdEgAVCaraAhMsXqwdAooo
 Bl61F2tGr4YBc2EQOjRFNyKdtS9SkiEPrAvml4DPJfUIOSRhHEJZ+BBd+VB02nkLZSrmz+olE44+
 sjwEjpq2zFoWRZL8o72CBW3vLXW/QcKr0iPdaChCh7Mz6xxpZZHt2sx3SpskijVFUJeJ7ZVcZ20v
 KiDu6LnR8m9k9VPiYRIoBtbhMWgtVmSuErxXOrVF62iVUaUQNtPivJpsKXL2aCOz/dKfKC6a5N0x
 exFQWp55y+7UUSv7gfJ7wOWlSxN+QfyjRpze3MmVolLP32zUwLFBjYrH4yoUAzbdXpzuixso6Us4
 kXRytWM05eyrEPGaUfvTQD8mTYnm5Vyb/eB36XvbBuC1U1srT4VxcBqZR3KVQgqF/fPYYAfEfsj4
 Qhrnb6bkhjWQH9zrUiS8nIqEKYBWWQAbKhnATgi/jKQpqjtXHAf2qKV0A14cs+TWFXnO5vCzfbxw
 JzJsCsf/Mzg958IFbKKlNc0N5cagQhEVniihuDwEGDcmr6e3OPSA0XfeKc2I9l078VTsJW0Jv5re
 ujkLi0kD7w7d/mJ/tvyJ0XL63tpIT3A61JGwlOLYUprz87nHk4ONuDXJEuI3ZuM7jUXIESohoO51
 xWmU8d7gf2mhhyJugAhnZGCvLFQwZ9Hna6E2h6CJ86QERC9wDViJ+fz+zM+w2AbTXwFtSaqprqV3
 tVCAxnH/R4n3uVt9q4N64aE3EybfLkyrDI3pP4F5LRArtsxyf3vYrw52JxsNbqNDT4Kf8NfG1XHw
 pAhkQqHI0C/U3fmRhZoR2Au6DQHn45ul56aUDpm44S6ORg==
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-Complaints-To: abuse@antispammaster.host-h.net

Hello,

Do you require capital financing or low interest loans to advance=20
your business projects or growth strategy? We can provide with=20
the needed investments for your business. 

Get back to me if interested?

Best regards,


Iyke Nikolas
Managing Partner
Investors Trust

