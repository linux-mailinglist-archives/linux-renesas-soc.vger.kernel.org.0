Return-Path: <linux-renesas-soc+bounces-33441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PHzcA+YtH2rAiQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:24:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADF2631618
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:24:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mbaPpLC5;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28732301410F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 19:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF183A7D82;
	Tue,  2 Jun 2026 19:17:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3843A48F6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 19:17:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780427839; cv=pass; b=Tfi8i9JWm9JqM/t2d25gdCDEaCWmpFSLq+90yfutiEOvmFxqHfGvuE967vEBF/dge+FM+hmqmM8ml8NgJoPh1n/BImTs4Ug1HHB20BdRUjG4shVHdUPeKbNY6554AO7NioVMdCS42oAGDrTQW4fASzEQor2eLjgFchu3a+T9oXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780427839; c=relaxed/simple;
	bh=mSsK1OjXsjkFlenkPIt8hS5iFOCe8M7xFGjamW5t7xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxOMWp/g6YnRIm+5wxMHDO7usrf8Kf5APih1q67rYvqvFUlO4SvgO+UWpwdylXIM1ewcwcIGRf2EnxpZAB/cOQ6pmEJITntGhxDWuBbOcL8KSq9BSXbb8jIwQW1yP+vkPU7+3AWUr8LE5yUgSNQGTxDXRzvEQV/ZQ5Uwbbm/zNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbaPpLC5; arc=pass smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45efb698ef2so1887772f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 12:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780427837; cv=none;
        d=google.com; s=arc-20240605;
        b=gPCFHXuc72b87keaXjb5DFlj82frSDFLtINyxe0HAxHm3YZ/30euzEnuAlR7gVIh4g
         xDdaW1Pizk7MClNdMAHqdoVZeptwmtMXerh+zX2i3WdTdDb9sXKtEJbIRJ0YVaaWwO1B
         4oiJl9s8JySn9Rw578riEg24PFL9UC2nRtYvVUoZS1oJe3wPPzF26fOLVAcg8qet+O15
         LhmtGBVPUy2Ix+LvyQO/TIqBvIBqUcNd5kRhJmnmdJmqitLrBIo8zZVOKedQ0a/A+BTv
         5Nef8/tSIWSLgM3zZeOonC2XEamdc3AYZQOD9EyxqMuNFRiSXYlj0iHV28GSEv3pLBNM
         kbAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pql2O34i0Txx0WbzJHzF9j1Y7wGG0LWO3D8LOQNywio=;
        fh=OH41SU2eqOy0A8HfFGva5ZPYaApRNNIwZ6KikcdF2U4=;
        b=VWr7fUTYYg0lKxe+T5EhcHUM034n8JH0FUzaa4jOgZUJFfZd7QW4bks5gErns4HWZ6
         /SNQJQTxkp64k8/rr0FS1SZNwU7gstMgAfQuGQoG0xjZXiJDkHARYtzemjTAi+3K1pks
         nGAooSn4+RomjW4OR6cTjl02elNS+2hfKvYWMTIMP+JL7rKVarhdKIqI8XGpL+7x59MR
         3W4wEg1qgIl1geqM0hiuLbgKNCEidzJOPtoAvr4613lzMNRYWye3KS45t8HGAeBbvsTB
         60zScweIXQCUtFQoHXsAK67Bkdy7EP8xkFLpIEYiwLS1taCWBSEfnFG/WVQujTVJDcit
         MM4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780427837; x=1781032637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pql2O34i0Txx0WbzJHzF9j1Y7wGG0LWO3D8LOQNywio=;
        b=mbaPpLC5N/XjPM5qMRUoKJ2aBIuj/qRSOO2bZ1J0eu9awz8nOYP0Oh44NddXzgzPOm
         sF7MjXfbrJxHh5zU39v7uVMzZYZm1wKAJ9ffqqXE/wQwB6QHnbmrTpiex9oTtxy2HTbN
         jaflA7dmNjoQb6qC8glImLF99UT1e5Il1NyRWDsOrLRJjSA6Dr6B3t5+M6/STvlFP9FM
         A4Ke3mfkVv8IK80uufu4vnxIy2NkU3rrPNJmvJJP7dgkQCiIz2egPAg+qjMB9oDKUDc7
         VBwF8E3I39Oqyvr4YYumbWi2diJ9lN7kPifUEh8dgwAUMioPz/Jq/cLURatbnDVx4kdp
         NrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780427837; x=1781032637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pql2O34i0Txx0WbzJHzF9j1Y7wGG0LWO3D8LOQNywio=;
        b=hiWya5g2SzDNkO7cM+YpGMBfYl4/NOvNz/Hal3/yQ6I/b1gPiDA7qb4AeUI2o+fo4I
         PaDhvhn4dL9d/E/YfiPXYgULhS4FXma5lyXzC0ECWJxKGrX6qKEgomIdJKqkqw3A/f/x
         t7E818YuDocm/NilrgiXad7emRgWPFLV2YgE1/UQIsA6yL1MgNWbxESI/WDxoPW9H/jc
         rkmIOXD4ICkSEwqrQzQ8aSxG/94jQdPcU07Qd+7cs9ImxfBsw0ntO/YWi3MKCrRmwSl1
         xZt7oCNk7oi5hoO/XI/eLOravbdTkhWiwMA7GWHfSUEy8xP0CwiIYLSrnDkr27EQw2YT
         86pg==
X-Forwarded-Encrypted: i=1; AFNElJ/Xx2TJ/CesO9Nal37U25MPbvyzcxqB3UJcILM7mayyzXh8womnNM6+b+xhwSADPv24Sc3cAQ2X4ezWFSZ2qbq1VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnVNe+rONzjITPZMrU3gUqlPSU7LTCJZvQgVy+dCnrpiyiitKQ
	K/5HeW+5nMSiflPypgAnHIFuH0d5Mx8DQD8lxwCLR2UL2SEJW2nCE3D7lQBNkfN2ziJsDFN1xxS
	lFbQEkamtyRWgj2kIFVk6gKi2mQXpU4I=
X-Gm-Gg: Acq92OF+jWSc4KuBjMuhVgJc5fcLZBcu+4H2PI4qWAqPKLs51VhAbkpCdJp5kCOUjmj
	RT2B412zGMccmbaWoTxwlk92DOt22hrEr8mkjRFbi4I+8nUgfSlq0s0heIeMevdzSsGZu5pBm7n
	7ulYaAWtTYVtDi7+GLTusjqcDpqVtKlZ8t5Y65auVnXDo1b0NAUyQHPgMCRH7wkeeCU3pcaEnpA
	I1pKvVnJJw/bwD7dCiWzwmOaC9SI59RdcqV1t4fRrO5sNj0ursay9jSA4fR5o5xtgocPKwH814J
	HrFb0KVUirvvyj5XbZYkLvtfr6gxD2neACRRwpJugbOO3kuW6uYAwT/PVK733ItIEfe1gqipBe0
	WvHrzleh8m5iODH2KMICFeU9oGmilpuajFpo=
X-Received: by 2002:a05:6000:cc9:b0:45e:da9b:97d6 with SMTP id
 ffacd0b85a97d-4601f6412c2mr703236f8f.27.1780427836776; Tue, 02 Jun 2026
 12:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260506164914.3987293-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <7f6fe294-582d-4668-aa77-ad9ab47cce2e@tuxon.dev>
In-Reply-To: <7f6fe294-582d-4668-aa77-ad9ab47cce2e@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Jun 2026 20:16:50 +0100
X-Gm-Features: AVHnY4LjxLZyfS_o0rliq9dZXkh2VKw4i42Fz-8_my21m69fFg09PCpHY9lT9Do
Message-ID: <CA+V-a8vjM4wY-braP9tORROxuWqDg06Mhpdowj1A07sedh0oeA@mail.gmail.com>
Subject: Re: [PATCH 1/5] rtc: renesas-rtca3: Fix PIE clear polling condition
 in alarm setup error path
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33441-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@tuxon.dev,m:alexandre.belloni@bootlin.com,m:claudiu.beznea.uj@bp.renesas.com,m:geert+renesas@glider.be,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5ADF2631618

Hi Claudiu,

Thank you for the review.

On Tue, Jun 2, 2026 at 9:31=E2=80=AFAM Claudiu Beznea <claudiu.beznea@tuxon=
.dev> wrote:
>
> Hi, Prabhakar,
>
> On 5/6/26 19:49, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > In rtca3_set_alarm(), the setup_failed path attempts to disable the
> > Periodic Interrupt Enable (PIE) bit and wait until it is cleared.
> > However, the polling condition passed to readb_poll_timeout_atomic()
> > uses an incorrect expression:
> >
> >      !(tmp & ~RTCA3_RCR1_PIE)
> >
> > As ~RTCA3_RCR1_PIE evaluates to a mask of all bits except PIE, the
> > condition effectively waits for all non-PIE bits to become zero, which
> > is unrelated to the intended operation and is unlikely to ever be true.
> > This causes the poll to time out unnecessarily.
> >
> > Fix the condition to check for the PIE bit itself being cleared:
> >
> >      !(tmp & RTCA3_RCR1_PIE)
> >
> > This correctly waits until PIE is deasserted after being cleared.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
>
> I think it also deserves a Fixes tag?
>
Ok, I will add (and also CC to stable).

Cheers,
Prabhakar

