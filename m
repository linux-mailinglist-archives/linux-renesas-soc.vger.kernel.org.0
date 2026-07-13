Return-Path: <linux-renesas-soc+bounces-35096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k9ZQHdy0VGo9pwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 11:50:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBF47497A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 11:50:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JhaQSBeb;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADB67302AE3C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 09:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B4937A82A;
	Mon, 13 Jul 2026 09:46:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E9A377559
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 09:46:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936000; cv=none; b=TkOZKV3gVLtQ4NCgPtEnIS2Lp6buHknnAHV51Oh4WPXNMad3VWB0MFLOlJ/pLcFM+LBbKTLA05o6aqEQ+xVyT/WpOM1e7Zqez0DNXM5gYP5vWUa0Ip8Qe+DE7pWaoHjcqYHl/27cpz3WKADtZ6J2RapOf39/qs77WK73JLiHDUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936000; c=relaxed/simple;
	bh=S1Jswu4gF0raqkyqNHhNG97xtcffgBXN4C7u+pxab5w=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bb9d2VvBCa43zbWLrO+2x9Kp5eCRQpFB28CTMpPozD4ySkubKbYU2n941lsoYVUop7PzjjCAY9ytZtVlXka9YLGt7X/JIdvPsS+qUl4bKWIbMBbpWBNAD909aP5gDrvC4YCLL2yYk2JJTkRpnsIhnjfaouhiRTvgusTgmro2iXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhaQSBeb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD211F00A3D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 09:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783935998;
	bh=S1Jswu4gF0raqkyqNHhNG97xtcffgBXN4C7u+pxab5w=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JhaQSBebJHsv88m59on73a78tG5oq7wc+mnZOZz5DbBtAJyhEsF4DmYkbBD199iJp
	 EjX1S9Q6LEIkwO34VXtSO4s14YKJGCToUoQebcDlVkYcU0CGCjtuNJeEXLlFRdTeVJ
	 eUQgAmd0YjDyJVkbz7Etthpep3cPo+cnadVRUfqfZ8kQRafS2M8uKMt7FNqQTy2u34
	 JxTaFxXLPuy3ogX6ctrE7j12bcfHNpV5HkCm+Sdk4IwdxRfsKtQ9WgDF6ifd4U1MX+
	 qk5V2a+oi2NNe8FbKZJZQmeDJmULhLVFjXIJ5Z+QXGB+aqLwX5t7nQ2illmfWrrOe8
	 lZCAoW0ZcVdig==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39b3931e259so27337901fa.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 02:46:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YzUkCHrhQ8lVBQ8IxzouYbTkfhTLD3JEgs7PFaa6QDWxpA4EJnQ
	ei5RDZkB0U9okRNlqXZkgRo9madriEv1gRuofTQ2siDtVNFfs+9ve+0MMX7SSf86EhQdGZOx470
	aBpEufHwCXP7jTFR1tO/HP6zM2xhgciN7Qtfkf6ATkA==
X-Received: by 2002:a05:651c:19ac:b0:39c:f58e:5c8a with SMTP id
 38308e7fff4ca-39cf58e6a1bmr15845141fa.21.1783935996856; Mon, 13 Jul 2026
 02:46:36 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 02:46:35 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 02:46:35 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMuHMdV415V23a9E2QM77iQdGePOoZYNk=+v0Hms6uxugKBu5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712093148.21446-2-wsa+renesas@sang-engineering.com> <CAMuHMdV415V23a9E2QM77iQdGePOoZYNk=+v0Hms6uxugKBu5g@mail.gmail.com>
Date: Mon, 13 Jul 2026 02:46:35 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mce7WXrme_z_ZoUCHqYUAdP+Ee6rHB8TmRdeZ18kBH1Tw@mail.gmail.com>
X-Gm-Features: AVVi8Cc0kqodj6tQl0eUIgkxrp0sz9RxCfHf8zbwTLuRtnTtrzGWp2JAJGQrxYo
Message-ID: <CAMRc=Mce7WXrme_z_ZoUCHqYUAdP+Ee6rHB8TmRdeZ18kBH1Tw@mail.gmail.com>
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: add a comment explaining the
 buffer init
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Abdun Nihaal <nihaal@cse.iitm.ac.in>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35096-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sang-engineering.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:linux-renesas-soc@vger.kernel.org,m:nihaal@cse.iitm.ac.in,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFBF47497A1

On Mon, 13 Jul 2026 11:20:02 +0200, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> Hi Wolfram,
>
> Thanks for your patch!
>
> On Sun, 12 Jul 2026 at 11:32, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>> To avoid more false positive reports of "leaking memory" when
>> fops_buf_size_set() returns an error.
>
> But who is freeing priv->blob.data when fops_buf_size_set() succeeds?
>

In case I was too eager picking it up, let me drop it from my tree before I
pushed it out and wait for Wolfram's response.

Bart

