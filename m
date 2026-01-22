Return-Path: <linux-renesas-soc+bounces-27277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEy6JLojcmnhdgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 14:18:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1EA672CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 14:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1A0FB906A3A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 12:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471AC32936C;
	Thu, 22 Jan 2026 12:32:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27223164C8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085162; cv=none; b=p/Z+xkIpIrCsdT6GGduo/e9ilJSL+BV1jtcfmauzOIDe2eAgoXsdRUgpp8KeFpgD7V43rbhmw5pNYWhjclN7ulI+yx+bceBmReIPRXG0trwsXTsDNk9zh0f/IhqYjF9U4v0/1sLr+fFWggks5yR+EJc5xM1LeINQaaCTVv0HGSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085162; c=relaxed/simple;
	bh=BZu/5Fim3WbSmBgZucW+Oc0ZzQIc/F/G6KlUlmjvOc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cp9PNC9hK14/EZkh7OidpOEat4wVAg8ebmaUIvuLY2niSdfCA1UDErkbGlMkXP6kj+BoD19S4jVZ9azBjrwqeT8HdBPaDXbr26+jZXNl5UwuKx0HOEkNm6viSvv2+yRWv3kMVtHfNWlTveHqr58vMkt6DhZisrKRM1RJ1qn6fpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-81f5381d168so941859b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 04:32:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769085159; x=1769689959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NshjYFUffTPn7Y/VWXqwFCdDoXaersEomkK4SDzB2hg=;
        b=UVOweVev6gl3HU7MSh2yWKXHxNNOX3umt5/CiN4R0XxSnYf6+8ZYpnBbHCZ898uBlJ
         fqpI3N8jLb+7Rh0FQ2cnpqPpQZ/ajfB//uU4a9q/UPBmhOuXGsz9C9hSWHpWQ+6xjX09
         oOrsEE+PzH/iv2iYMIqE1nAjuRl7anXKM8YNAqnw+4kT+0hFEM4tqrhKo5F3QtdrJ4fJ
         WR7446B5SFebewNVa4Y+eBflGsrdy3wqbQPxKC+c45yWdRqAJ6y4OzGekcpCkM2aXddD
         Y1RJcoxBMEQEiNtozl++YgK0+sWvQLi6pkKqFxRiQKQsL8QHokFVSn3gjOFBftjfP5Ke
         DhDA==
X-Forwarded-Encrypted: i=1; AJvYcCWS2xrLi+IKfcMGwPz5oRExQ5KKYfBcSszViUj4VYh9KLayPjAN3VgCb3IOqzb5hyzJ4yNR1GUapfZtHNv4BKI5TA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygUhJzrll860dTSqvzYmfmcybySZ81md8MpVzEI2WBiz0aFv7X
	EjuBr5lUeEej/2NpLHPW4f98suGQZTzpVRQ4kgEGGIKcPcskY1V+V9f9XEHW8Wce
X-Gm-Gg: AZuq6aJCrtgpNSc7AW7rIF+xaVphoujuUQl58lPoHoXQmhqUbQb/LrtJf4gc3q279G0
	FlgXpFr1kvDQ6BwWb1ih5lSMOsgJ290ZUj0EfHd9pAzLH4GJFwB75V9jNsYuQ/QOMchuFY+uQRV
	X2FbujKzGQolVuP5tcnORadCZX+/VvwgdINKZuVm5o1X9XVn1JneNrnkv5a310Qly/69Obf2gQC
	t+9BUdgZaC/n6cbNCVYwl6G7BlJGijZ0VjdOVI6VabMsc/INL1Fio2OryRKsqadz75X44xKnls+
	oMisV36GEPuEwi/G0oULwSrDOlC7wN2k7qbtZBcW6ojxq2+C6fkmmRc6w4dQo+gPqg+bs7XTF+P
	eoYhc7mLxPCD7JULLutpFt31ZNCBIuZw+tpCWVJapZyMbMOoVyUJdifiReJXituxgBZDSBU9PPE
	XidXQZcHxUeJjWLOqDj4OpPg8gsnPLYypwbdkw+rJLVRzyx8mt6MLQ
X-Received: by 2002:a05:6102:41a0:b0:5f5:3abd:9301 with SMTP id ada2fe7eead31-5f53abdb352mr317847137.35.1769078727079;
        Thu, 22 Jan 2026 02:45:27 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6d3ca93sm5529337137.11.2026.01.22.02.45.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 02:45:26 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5636784884eso243091e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 02:45:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVpmNVPikCsaP0vFw46f2N+kshzkAvLUlz2wEl5YHTFRtKuvopJc8I5NlGvf6CJDiczhhhwugzQzj6pghCm9TtDzQ==@vger.kernel.org
X-Received: by 2002:a05:6102:304f:b0:5f5:3719:19d8 with SMTP id
 ada2fe7eead31-5f537191b24mr421545137.31.1769078726495; Thu, 22 Jan 2026
 02:45:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1768559762.git.geert+renesas@glider.be> <cover.1768559767.git.geert+renesas@glider.be>
 <20260122-fragrant-auburn-oxpecker-33aa7b@quoll>
In-Reply-To: <20260122-fragrant-auburn-oxpecker-33aa7b@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Jan 2026 11:45:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHJY1774N5m_S99u6ETJdyuj7GdrXv75DRoDty9j8tcg@mail.gmail.com>
X-Gm-Features: AZwV_Qh9OPSpjre26zYtA49UvfUvRCXHMaoKfRQXbtFLez-kbSzjI0P07of02JY
Message-ID: <CAMuHMdWHJY1774N5m_S99u6ETJdyuj7GdrXv75DRoDty9j8tcg@mail.gmail.com>
Subject: Re: [GIT PULL 2/3] Renesas DT binding updates for v6.20
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.24 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27277-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,lists.infradead.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: EC1EA672CB
X-Rspamd-Action: no action

Hi Krzysztof,

On Thu, 22 Jan 2026 at 11:02, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Jan 16, 2026 at 11:50:17AM +0100, Geert Uytterhoeven wrote:
> > The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> >
> >   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.20-tag1
> >
> > for you to fetch changes up to f3b795d298a280687ed70211d51043ed5fc7a96a:
> >
> >   dt-bindings: soc: renesas: Document RZ/N1 GPIO Interrupt Multiplexer (2026-01-15 11:56:09 +0100)
> >
> > ----------------------------------------------------------------
> > Renesas DT binding updates for v6.20
> >
> >   - Document the RZ/N1 GPIO Interrupt Multiplexer.
>
> This belongs to the driver patch (see submitting patches in DT) and is
> not supposed to be separate pull. If you wanted to share with your DTS
> branch then maybe just pull it as dependency, but the problem is that
> Arnd just merged all driver pulls and this one was skipped.

Right, in this particular case including it with my drivers PR would
have been more appropriate. Sorry for missing that.

> I'll leave this one to Arnd to decide where to pull this.

As soc no longer has a dt-bindings branch, he usually pulls my
dt-bindings PR just before my dts PR (which he also hasn't pulled yet)
into the soc dt branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

