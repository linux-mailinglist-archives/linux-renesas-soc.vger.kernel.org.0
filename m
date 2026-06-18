Return-Path: <linux-renesas-soc+bounces-34195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 767UJeTNM2owGgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 12:52:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB81569F82A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 12:52:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=J3wENa60;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A973F303D4F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 10:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE60D3EEAF8;
	Thu, 18 Jun 2026 10:49:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247C53EF642
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 10:49:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779783; cv=pass; b=ChtFjloxtIG9n89qO01H1dyduNIIAQ1oZUq2XxLpabAHF9V1sqGQPw1HJIXjM5OdYwzudXMv4VODEM+qhI5LdU6/A/E2rxYdounfmCKPkhQKiA37AAe6LedFvO+QLs/x0W6eTIKzg9HfUOz/3mTtPZY4zAqhjgAo7VNInLNPWRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779783; c=relaxed/simple;
	bh=i0LPAIbHaQDaHzL0HbBEibfN6MdLfmwe/8X8xZtq9KA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPiU4RzDwFL66VckLkgUpeiZQww8oJDcaXNPfdltJbW+2OYaoERNoVAIIXQgbE9o2uE0h8rmgRZqoROarG8Rlgxw11LNvpeY2r3wb6LF5zpABQYQ4GtolJuvZn15LaRgbIVAJHC2naDAANtd86YLhr39cb4CSleYYXrjGfpuE/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3wENa60; arc=pass smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so14660995e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 03:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781779779; cv=none;
        d=google.com; s=arc-20240605;
        b=ZHw35bWYY1Hk0SxDr4G3gjiASZEkD0lUaFZcZBJWDRdH/MzaSQutqW972TL3uyOEDz
         Aro4ZoQE8pI5BURlXTwlw6q4xOmNB5YhU0AB9fj0Q/hGiFBokaJzhLybLs4U/viyIBOw
         EhanY9NCq31bCaLtTZKblxtDiUgbOQEw2mjK0C+LFb269pupC6YVZNZ/ryblz7eumpHo
         svmFyjrlUZkObs8ospm4vnimucnWmmfGghZOUUN2ahirhMadvKpot4+yUPvN/bAVMwVI
         Xv1Gc/CDOpdLjXfu7oRIuoIdjQytSHdR5b1VaF8YkID7JlEcC47PQTOX08jPyfkXTu12
         75nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i0LPAIbHaQDaHzL0HbBEibfN6MdLfmwe/8X8xZtq9KA=;
        fh=HEQPNx1haOZUCiwt2At7Q8pNC9JY6R7R6IvUmorjdQc=;
        b=U0SrRI30ZdT4BHwt6tAnOboBk1uUuJhvm5yFLIzwyWASQY1yuchC2h0f/r54qby/KO
         Wr6mTRIQYehJgclpt8xHDVFlry6FotFig0VFqxpfbfW17CiCfrz7jvYbD72GXuxV3Kih
         GCoftBphHnIbThEJNjv53edxqbFj0Sfuk463tWLmxNkr3OrQT2cda7dxatLt7gtRt/JU
         k7c/PxpBnE4fbS0fWBC4HrZ2bJnhtqGY9Kik8NE4OF3tRxNcqwDNdZTqqpGNL4WDOmGw
         mlWaPIKvp0/ONA68RxYquk/Bvi8Lmp5I4D5bopHyE4xZTyKnJP/XiCPpsjyYRnGC3BDJ
         2EtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779779; x=1782384579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0LPAIbHaQDaHzL0HbBEibfN6MdLfmwe/8X8xZtq9KA=;
        b=J3wENa60BJlFNPgu5MC4i8o7aET2JQXdZf0KIVpQfaukhLBv64LQ95aqYHz16NumqO
         wVs72vDzV/+tbrkOSActWfKatfDdNa4FCH/TmNHeNpc6vOq5l60i5LtJv9I5jvrXmIBZ
         CrYtRsnxP3qMJoXyJ6uqQXK1rLArAZyVb+bTPeAJ5NVsU7Tl0e0KFtBs6r57HCrkd7Ct
         pZRbdnf5RLUgZoIrPizosgZCpMNGXKNGTvCp4n/DmzGYxtQKZls/yBBbOF6FlWJ+/5WQ
         TBb+b780RtxjB+3x80FDQMrZBbu5U9IiBo99s+kCzVcqjaz/lYrKXfakjTsRX7SbKi8B
         yZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779779; x=1782384579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i0LPAIbHaQDaHzL0HbBEibfN6MdLfmwe/8X8xZtq9KA=;
        b=SJfdfJLLVD47E4rW045hoY+VIeKKQZCcrUAns5XBI5VMIc49xPLGKw78ahuukOLiOe
         LPeW6Jg8Vt9ZkmN6n/xreIgqqyPR7BOwWQ5bjHhB6iuCOYcbANaJYuihfuBo2ifYja46
         qgnq2Qq0Ec2ueCDSK3SKcPwN9utZa6wgubaeWN9Q9z0ktL1U58nAvzTDq2ODd1W/daBK
         5dNsOqiRauEkKpijDh4Hr3lmsoX31JxRodgRSCkg7rbCYnr8H1Hno6N1oCHeCNOOWkaf
         GZWBdVwbIuc7fqIIOH5dv04yeWBiXKfXiprtzbu7CoeJ0NbgvnfpzygszGiD1sVjKlu1
         giBA==
X-Forwarded-Encrypted: i=1; AFNElJ/WbKojh5uDD4YbO4VniCIIt5Ffq+o4/0DcMVQIeUlQys3ywLdsmzuwXxDMmowDVRrKENE1kZqx3uc0ulI62+bLRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiVdC68Q+D2cLVgHXg0+4UKIBAqcvDwMHCsOM2h2iBFZ5oW7Xd
	uWFjc/HWI6YH4ut6NcS1tZUA0xC6fFiq9938qh4gDKixL4klxoXsZwkbkUZmBknfBILFU9K6oAy
	MGS6vAfNUuJcqLv3uhzOUPnl8fFRnvBU=
X-Gm-Gg: AfdE7ck6BNk3nJ76Da36teDbpCyO7//sPcYd/p9E5BiGlMifd6uOKkoYQfGLaDr6Zzs
	b985frmkTx44k+HRwBmiccnTGcRovK1qNNKBJZr60H+CEfcx4RRIUJB6/8JfTLgIsuQdCQqprgp
	xK/Ifvs/kM7lbnISlr7MKENnZPt49Sdrd0/NLTjRqXuNoeyVLgs0JP7uPzelfKFjv4XR3djDIV5
	gzbI4jLi1IGwumWBdsFwtOVGic3/aqaMmHrz/ReGA/yHsgfaL/4P7AU8+IgvvkHUiTLSVZIwMYk
	92LIeFoLKGj7rtw/QjXi8z5swFpjfrqZyo3n6844QaZ7yjXiG05sl4j3Nzl83v2mrdxjnS16NmC
	BR+xoGH8ArGQzHgg=
X-Received: by 2002:a7b:cc18:0:b0:490:af46:5c68 with SMTP id
 5b1f17b1804b1-49238169164mr41010675e9.7.1781779779249; Thu, 18 Jun 2026
 03:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260617165538dad7e36b@mail.local>
In-Reply-To: <20260617165538dad7e36b@mail.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 11:49:12 +0100
X-Gm-Features: AVVi8CcVzeG9DZs1UJrNQL_uvR_wiTr31L-zM3pE70n6KHb0bc6nE7Z0AGIpfyA
Message-ID: <CA+V-a8uHVR0i+3PY_qi3i0H6fMJSUFb=1cwrgw0VeztVQk-dWw@mail.gmail.com>
Subject: Re: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on
 32-bit systems
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34195-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:miquel.raynal@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp,renesas.com:email,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB81569F82A

Hi Alexandre,

On Wed, Jun 17, 2026 at 5:55=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 15/06/2026 16:48:00+0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > alarm and farest were declared as unsigned long, but
> > rtc_tm_to_time64() returns time64_t (s64). On 32-bit systems where
> > unsigned long is 32 bits, the assignment silently truncates the upper
> > 32 bits of the timestamp.
> >
> > Fix by declaring alarm and farest as time64_t and replacing
> > time_after() with a direct signed comparison, which is correct for
> > time64_t values that will never realistically overflow.
> >
>
> I'd argue that this is never going to overflow ever as unsigned long
> gets you to 2106 which is way past the usable range of the RTC so there
> is a trade off between the size you are going to take on the stack and
> the actual usefulness of the fix.
>
While it's true that unsigned long lasts until 2106 (well past this
RTC's practical lifetime), rtc_tm_to_time64() explicitly returns
time64_t. Using unsigned long causes silent truncation and types
mismatch with the API, which modern static analyzers flag. Given that
this function is not deeply nested, the 8-byte stack trade-off seems
worth it for type cleanliness and consistency. What do you think?

Cheers,
Prabhakar

