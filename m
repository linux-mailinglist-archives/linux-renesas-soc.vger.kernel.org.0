Return-Path: <linux-renesas-soc+bounces-29121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOSAAJzmr2nkdAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 10:38:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7834E2489CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 10:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61687305DD0A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 09:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C9B43DA3C;
	Tue, 10 Mar 2026 09:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KE80/p/K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E1843DA31
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135193; cv=none; b=QpQvzOUzTgGGreFt5AbB7Yl1fMVa/iTV304fZl2VO0akZf0NWgfDdkM/zSLTJdFJiGRGsfr5M3pbWo1HTEghrI+V2IKX/5+woNmqHLRps96PaMsiqJBsDTSw0nd9SQyjQVRpmXaUff25Xbu/cdAign3gcwsxeTkkHoRSVjfCHR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135193; c=relaxed/simple;
	bh=iJrlNVsjh6+70Ec05z6rXG0svXgiagQ0oIi5LjzykKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DunNhkBcxprETLUNah6QW8kwP3ba/PGiyJ/sLgqBnC+yDhWAOIuXHbTlbRvpklTIxZzti9vnECe7RXEJqz/pIINvPVT8j+W7R22NlHVPxOLYPnJ4/Cvnhf2KXYwilbSgzALRlgKlcefSaSoH7SobivyAMYpD/Ro5uAT0Fwxibbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KE80/p/K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA227C2BC87
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773135192;
	bh=iJrlNVsjh6+70Ec05z6rXG0svXgiagQ0oIi5LjzykKg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=KE80/p/KUIZZ0m7i/OIN43aBTaEeymRBmw0M6WAtsm4CddJyu6nn4tSPfT2/7FiBZ
	 VFPj8QNK4E02O7q/2/SlWu33xsm7/CFxdA6fI9rFAD095OwGBGSlkjkTfoMcEmd7Oh
	 Yl2fKpC5Z67Zc6JouVMQaZUCgUZapXYbhdS5Fan+jT3GEnIjNyt2buK2SVTsHoPEFn
	 P+DAd3fSZ+QFLK+kxmiFqv+fly1pMLuv2BUxWPX7HNWkvV43CkBu8OydVQ4BzbABKI
	 bg47oniWxm1db2FiSb2qkr7aEziiA2m5wvfkxwhK9M17HDyMiIa++d+pBaMU8VZWWp
	 B8GXp3pFeOn/Q==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a2f196cbaso53605971fa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 02:33:12 -0700 (PDT)
X-Gm-Message-State: AOJu0YyH8JnoIWu8cYvJIp0ADr1smyJKVf9njxcg/bhTb0iIJ0kbg4cj
	9PGHQhtdDlymU8YR2wz9wxHzKSqg63x9NmNXgLHx4/TMi0wwl7T61cl4TUELfAMkgD3pxhPa2Lu
	BPHKFhS+PizsI10iVcqb8uKqtuUgNZLY=
X-Received: by 2002:a2e:bd82:0:b0:387:20:bdbc with SMTP id 38308e7fff4ca-38a40d61d78mr46199441fa.12.1773135191017;
 Tue, 10 Mar 2026 02:33:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com> <20260310075539.11701-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260310075539.11701-4-wsa+renesas@sang-engineering.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Mar 2026 17:32:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v65gV+2xZDO7h9Dsx=iOHX6Jt_JyHTOeWRYaEMuC+jR1FA@mail.gmail.com>
X-Gm-Features: AaiRm51CffgMBtgWhMZCUpMdeeAdI463XBf8sQip2RO0V2c7exzECk92c7gy0OY
Message-ID: <CAGb2v65gV+2xZDO7h9Dsx=iOHX6Jt_JyHTOeWRYaEMuC+jR1FA@mail.gmail.com>
Subject: Re: [PATCH v4 03/15] hwspinlock: add helpers to retrieve core data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Wilken Gottwalt <wilken.gottwalt@posteo.net>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7834E2489CB
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
	TAGGED_FROM(0.00)[bounces-29121-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.alibaba.com,gmail.com,foss.st.com,posteo.net,sholland.org,st-md-mailman.stormreply.com,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-renesas-soc@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 3:56=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This is a first step to hide internal core structs from hwspinlock
> providers. It adds helper functions to retrieve the data needed by them.
> Because all users are only within the hwspinlock subsystem and the
> change there is trivial, conversion is included in this patch as well.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/hwspinlock/hwspinlock_core.c  | 12 ++++++++++++
>  drivers/hwspinlock/omap_hwspinlock.c  |  4 ++--
>  drivers/hwspinlock/qcom_hwspinlock.c  | 11 ++++++-----
>  drivers/hwspinlock/sprd_hwspinlock.c  |  6 +++---
>  drivers/hwspinlock/stm32_hwspinlock.c |  4 ++--

>  drivers/hwspinlock/sun6i_hwspinlock.c |  4 ++--

Acked-by: Chen-Yu Tsai <wens@kernel.org> # sun6i

