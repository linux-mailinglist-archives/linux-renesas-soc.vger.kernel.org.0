Return-Path: <linux-renesas-soc+bounces-29515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGLQBrUruGnhZgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 17:11:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E13529D1BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 17:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BF4D3023E20
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B94324B1E;
	Mon, 16 Mar 2026 16:02:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875CA324718
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676933; cv=none; b=A1EgXeRE/ekfn8EJ4XO1K/2LpqaLdTK816+F8eTdYJL+D6j92dVd57dUoAMT4fysEWV3SIEhpzjKVymEBGbEw+gyMdpWDX3L+Nvsj1z8PPmGxUyNnjPCd8Uf2BETyiIkkUovNculhXCAVVnEtuJMtx2gRWQ3sxqNzLTsksF1kF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676933; c=relaxed/simple;
	bh=Ypla/kOENH07xh/k/3FUKlYHUPddmaGsQDJ5tt+zBdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R86fqAq4Rc9guVZ1CJ0vcYtGw6+Cfiy+06914is2yAxF+djnqDshJOeJwJMqVPTfsWZh4O7zG/wan/lumyWe3yhcMPF/msBAQoSJQl8szuKxVcN8p85KvzN5bX4efFFAGRhgu//akpoOJGkONJ30moNbRc4utI6d4nlj5n7Q8+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso3737019e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 09:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676931; x=1774281731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxIv5A/7LppNvLw/5xO3s1KDlHKvNsqys1mKlpYe60I=;
        b=EMQ17ImXmEp4J852UTSMKz1sWs2XseHCIKu9fSaEkUzhUNfBDPEnWailFVnEopfXxs
         xeRknqqeyJuavqQG8fdKBqqQyWvRjdqPJu5e6Sh2n73RSbl6vZEUu+c9XVJtlfRkAm9u
         0OHNiMTmi44GNE6xXEfuaRPm4bGuTlnnLpwJ4Zk1HJ08oTqT7pegvdUx72KIgP7FfjV2
         3oQ4TcM6K0Xt5TtM20hiyuNxQl3KJqYS2MkHi303+wjYuYu8BMV/cwjUi1BMoC1PzQHt
         ZTb9dHmWoroPbSBT6MJZBRnbGLqgiM1neKmeObHxCp6M26X/GCLQxU+b8TEB61EcqBPx
         cuQw==
X-Forwarded-Encrypted: i=1; AJvYcCX62K81OLZF7dLIm6G8RkrUnFFgeTXIJKGo2yDfl3yjOYVpQ692G+6gQTKtFw6I86+6CAZW/ukNjEqzZYG5VDm/rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfCog6057HvCWSD5F4i7ba6SQlyHnU65vRm1a14cBUnwCw1zRD
	vWY0olvDqU5IdMKTdzSxvwc4SiJvXyTgJZ+9vgTQWpkCCTT+QuNvEYiFFQuORfAD
X-Gm-Gg: ATEYQzwFGz+n26V8y6rxYCabNP/gEuWFq3AS5HU5P8c7IaNkOc39AUrupTdtdKj4lhR
	WIfRez0qD3tMzr0GamxizzdohSV3ZzdEhwwBwmhkIuNjz0DUnOIEkqIRVijttbmu7ZsnRKT134F
	x7739ok4l1DJOe8NNp93jsjxiL42QzT6XQ7ZzivoGjZ4oyrzz29UQ7yiCGjg9IED+EVpAvYu9Ti
	5JB3RWTJ2d9VLPb1u65fJBphCVPfYX9K/IwfZ9Bwss2/CHovjUAtGIUSrWitE32B334ZYv+rs1F
	rcuyFwHOC23V+IP6umF+L1a51Nf0rG68Oz2jVuU58uCTSO3m8Sv3x6tHC1E6v2ZPPup2+PNmDLI
	c0qjy7Ly38fxlVChrUIGF/ZVNEkkJKcY+GsePT4ijSstjZo906/JqmNUus6yVIi+rJyxQdbxJog
	0UIoqGTrPMJMkmgvAoKfRUlpbepZCLaWLiDzLjuw0jVXY7xsb5ywOIO+R1bEDXs0IX
X-Received: by 2002:a05:6122:82a3:b0:56b:9188:5ede with SMTP id 71dfb90a1353d-56b918861edmr929831e0c.14.1773676931338;
        Mon, 16 Mar 2026 09:02:11 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-950cb55c975sm1845580241.5.2026.03.16.09.02.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 09:02:10 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56b91ead558so405771e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 09:02:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4MfPsWDm+k+ayNC7baYX3WEiF0+38q1ZdRQPF+JQzQjUlluCZBoZip7JzkJh0D9xr7Xrr+ZwHTjlbLp9BEuAPmw==@vger.kernel.org
X-Received: by 2002:a05:6122:35c7:b0:559:6960:be0d with SMTP id
 71dfb90a1353d-56b62971a27mr4668648e0c.13.1773676929318; Mon, 16 Mar 2026
 09:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be>
 <abgn70W3kYZcZpg_@pluto>
In-Reply-To: <abgn70W3kYZcZpg_@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 17:01:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUb0=kMhCWk4tD4dJTGvSp8fShO=4xM8k6iqcYU0-wG=g@mail.gmail.com>
X-Gm-Features: AaiRm53uOIxgf_DJ9NKvMNXm8lHCsReBFW-7ybb2n7U6nhLuqhnqvVgwyg7V9po
Message-ID: <CAMuHMdUb0=kMhCWk4tD4dJTGvSp8fShO=4xM8k6iqcYU0-wG=g@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Support loop control in quirk code snippets
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.956];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-29515-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 5E13529D1BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Christian,

On Mon, 16 Mar 2026 at 16:55, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Mon, Mar 16, 2026 at 04:34:40PM +0100, Geert Uytterhoeven wrote:
> > Each SCMI firmware quirk contains a code snippet, which handles the
> > quirk, and has full access to the surrounding context.  When this
> > context is (part of) a loop body, the code snippet may want to use loop
> > control statements like "break" and "continue".  Unfortunately the
> > SCMI_QUIRK() macro implementation contains a dummy loop, taking
> > precedence over any outer loops.  Hence quirk code cannot use loop
> > control statements, but has to resort to polluting the surrounding
> > context with a label, and use goto.
>
> I was just now writing the quirk for the Renesas issue and realized
> this limitation :P
>
> Do you want me to pick this up with the quirk template for Renesas issue
> that I am writing and post all in V3, or you have already the quirk too ?

I do have a preliminary quirk, but I don't think it is ready for
merging yet.  Getting this limitation relaxed is something that can
already move forward, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

