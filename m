Return-Path: <linux-renesas-soc+bounces-33638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6nerCE9OI2qKogEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 06 Jun 2026 00:31:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 790C764BA65
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 06 Jun 2026 00:31:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="ggF/rBcU";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B089300EF83
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 22:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161AD3C4B90;
	Fri,  5 Jun 2026 22:29:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D169222FF22
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 22:29:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698589; cv=pass; b=iGePIOevEqJ8Li6UT2HjBZ8YUn/52eqqicSt5GHifoHFE3sX+y5cHXsC0D8jPcue8y0r90UwGFkWzJSJEZZLu7tK686Su4AjByO6Gl/Tz9YHNok2fNMqCIvNWsomivnOmJGKOuneHwjIKCnRRUM7DqZN4FGbk9eEPUn8XF9K+MI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698589; c=relaxed/simple;
	bh=+hJ82CmdEVkqjDDHhsyrW4LNqGqxDk6mnNaahYCx5HY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G6wPFnijRypgyZvlkp8n3NO/klkgK7rYXOk+PpGAqTiyTUooE7dNinFqi3+GFk1k8GnmSNJSJtDy8ig9834cxKVTRcb5sPBftLwoKSIybMXxUdEep2KOmyk2WFY9ckvPXqSXo3drk8nhjG71O/7vRsx86Vix7BM4/ggAbkHrjQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggF/rBcU; arc=pass smtp.client-ip=209.85.215.178
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c859878eb48so1055699a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 15:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780698587; cv=none;
        d=google.com; s=arc-20240605;
        b=GNpyrbbrGxrV4yAVD7DKKGMKeFbkevri/G9qK45eQtO7KSaWNhzrO9R3WCj3zUGspP
         lD3ftGG+5HguMCOx74vVfoDfactMDHGE4ua6fSANHRrwAAxCfbYqR8g+7gL85JRLM2WK
         zWO8vmqkfQgc4CakpjtClLyy40RmP/qsFM8tAKoN8BTT4iNub7+cFX9p91V33r9v2sYj
         ZxXGYcChlkIajV6o0Xbc5gWlax3ThKq6jR5anQO2i8hN0Gi0ZA9J343TULr9GUI7pXtK
         JNvFvIGoXRWn/jGz1tqk5xghCdntVL6N51tao7gLbLnLZXQXvqHYRteZjgPujq3ca4MN
         WYUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hV9ULzaG79qCwwmOnfVk6C9FBfxcQdzVGSaD3MY9TpE=;
        fh=OOgNhSHCZ+k0C8v0gqMtKbmpqhnDQzoB5cRdNY31h0Q=;
        b=XThOpJY5yqBVC/GQB3p1Yjlv7wN/lzQICiS0YSopLh+DugYPR7i6BOJ5SIOfVMpAfv
         VKkljXi/YFhqomn4jAzkcrRnQRLQPbQR7vZQxFiXmfoV8cQOtP3V7WOvTeMKkHZGnutI
         K1sOAQNs9f+HF4wkTF/yLybM5s0hARu8mVf3VkkpRX1wZACz3SnOiJrmILoZkpqUG2lA
         c2HyBuEFbi/enFsvZomCJUG1c1jxfBNSpAN+a3ig5kqYyzJUQenwqHujvNEoowrYT8Mz
         B414+Wzp54D6/zMz/DnL/ENbJaFPoJDcDI2ISLg/HagRA7q2K0thvNu8xFTih8Cb7pFb
         kKmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780698587; x=1781303387; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hV9ULzaG79qCwwmOnfVk6C9FBfxcQdzVGSaD3MY9TpE=;
        b=ggF/rBcUcl99HOvxNPzHwpMMrmOUW699YoLTrMY5uPui/IAYAqH+nnbU1mM62ACL82
         P67nb0j5d6rftNk+bltUOFbn/PtxzbbcFdYEmrZlD1fhDrrpNcX+6dYrtWxBF4KpsG1e
         1oKWWmwAZAih1TjrMXThWb+n2r4ql2xyAiOg8qPAtOFA4e/4kxN33jzQRbrmp6snd9tm
         U1vRsLHNvittaVgbXYYLkf6ICXVMay/FKmtGF3jn+uw44a8wVwi7x+MBKKFEsKGztiqg
         ENLIOsoFUH5p6LLIuQrmPconDbR8NPz90r4WnWpE3X3vOjwW6NEn1tiKPJ7CRtJAT3JG
         MxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698587; x=1781303387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hV9ULzaG79qCwwmOnfVk6C9FBfxcQdzVGSaD3MY9TpE=;
        b=GQ0vtsU3J+wY7WUd7ZkBgwl1kzobezSty04ni7fees9BqmwSzLgqYFodjZf/COr5sh
         foX0O/E61xSWfE9RJaIie9Jr//n3TnuIWNU3iUPPFSM8v7lv+anrkl0Nrsx1h74mmtRW
         bs74gNir+OjJ2n0uZnqCbEw/DMMk/c8/76vWzScWpnXwVJ1ufHeWaEkW3o8mGJgrL+r9
         hEKv0M6LEoc3636qde/LKm4DgoHjWx9kCivAqhKWRegK7mjqoB5v+0/8Wm9EJMcg7EWS
         FiZ2/TjXly/4XuOAYsvjWxr9IkEHy9B5J2u/eu3KVVhM+3j2elKSZvtoSp1nb8qEIKea
         JBiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DKHlgAFx9XGbmT/KX360FKVUBJRk/dKexQ5M+m5F2lHZnlN0TqAR4oiJx6tICcEmrFFs4787dAUiTZJkkgPOrZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT/845XPZhEpjqIkzcMf2zreQWMAPPBJKWLmvURZg351Sr3Han
	CrzxfdTOuGzgDpCRGXXpYX5UgktpdzUHDnp7pSs4m+NXiab3vx1X20yX6qJDvShaAel0gGLu1G5
	f/ZeTpmQYOBIW4wF7EKIhka98e7RZX1k=
X-Gm-Gg: Acq92OFi8+03FbLjOhSJNu+Vhmqq3XSpJ7KabhvfsNb+78OCaEuiHLP9F1lqd3rZ5bC
	VxYDoM68/hsT+sz+9H/RGLn8dvhIxkfapd/1Fv9G9jlta7FZVUsj2iVVr30sdLItXJ7hcM0vn5i
	XitdgWUOGIIiCqOaojJTFP2AbQh35yTIKhjYzLIrK2895ec2fq4ekapKwYFjA8FAJ4u/0dNgoWT
	bucX7Vbxc1bL0MmKju7rWJd2XsHI38945G9ZPC7TcYHgi7MKzYzUkMPoza/kZWuN1Q4gF8nwqvS
	/sFXf5RRrNz6QfNgdTAkWX0aPHQpo6OTAFU6yqafnc6/Oa4dC87tgLcqk75cZgeo8mOqlZJG+0z
	12vkqqA==
X-Received: by 2002:a05:6a00:3d47:b0:842:6fec:1296 with SMTP id
 d2e1a72fcca58-842b0e2f70emr5369705b3a.4.1780698587138; Fri, 05 Jun 2026
 15:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
 <20260605121955.105661-11-phucduc.bui@gmail.com> <68a03a72-07f3-4738-bad4-6b92bafec318@sirena.org.uk>
In-Reply-To: <68a03a72-07f3-4738-bad4-6b92bafec318@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 6 Jun 2026 05:29:35 +0700
X-Gm-Features: AVHnY4IxKGU0FIWOFBZ5YgXOV7kRSiKXHpEfhImiSr4YmJecxoXq6aFVUBTuuBg
Message-ID: <CAABR9nHGNVWuOLyuqvjrsYYJBXOFs8W0ZN5PUs3AX4+rM2RmMw@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33638-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[renesas.com,glider.be,gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 790C764BA65

Hi Mark, Morimoto-san,

>
> The indentation here seems wrong.  We're also using spu_count to
> separately guard the clk_prepare() in fsi_clk_prepare() which seems
> problematic, I'm having to think too hard about how this might be
> robust.

Thank you for your reviews.
I think we can just drop spu_count and let the clk core handle it,
since the core already refcounts via enable_count/prepare_count.

What do you think, Morimoto-san?

Best regards,
Phuc

