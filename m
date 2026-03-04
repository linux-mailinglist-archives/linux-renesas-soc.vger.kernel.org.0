Return-Path: <linux-renesas-soc+bounces-28774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AgjCapBqGn8rgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 15:28:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25070201765
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 15:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B2AC308534E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 14:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B75A3B8948;
	Wed,  4 Mar 2026 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HjwpUZhO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775C33BED58
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633478; cv=none; b=hm1IBfhhw4rYt5EqqIS7FK6BhXsulkk9a4ScdJoQxxRv12Q83e2OZuABFQkC5h7tJj8fNqyhqCoR5fQxNU9euNQsIdpwUmb2fMPK/Y2c69+2Cjf1s7Alwu0C3M3aQf+qNGKzLH0nPf7v0QPTEbIwMiGk5s9xa5/8wYTO3oZVTr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633478; c=relaxed/simple;
	bh=RRD82glsj6nOntxvtcB/gUHxdV3IX5WvC/uNfoVC8Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aog7rzj5cIGYMTDAwqcdZB+5ooFNeqg2gAxjhVfoHX9zJ7xivpGgC9cGKLR7nPJuaxsEsL+0Q3OTqdzBd4cOBMd7gBQNhw5Zle2tfEAlHMJxW7krgRBJUR4V9dxbow5Z4D4P7NzTjj6h7SE+Z/L5IYUBVkANPRoRLB7mxGRHzIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HjwpUZhO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47351C2BCB1
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 14:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772633478;
	bh=RRD82glsj6nOntxvtcB/gUHxdV3IX5WvC/uNfoVC8Bo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=HjwpUZhOiHy5YjL40RhBG3fdomNubKi5kiDja9gd8xIT84wzMdXAYDmZ/9KZGKaba
	 G8fKqNlelm/1sW5HoG31CZJTMqJ+jPijG1tHdW+zj8dPDlM02gJ0OOCkTxefmYpWqy
	 P0PjgXGWwHZ2iT+hNW2N2neMbH4ygfBvfwx4lgFkzmgSezQz7JVgehnzyKkmfnVfxo
	 vPIkK89KL8t9Y0awS03Gx+PR7QAkT8MJ+otrgWFgY6JkcDXagbCKZK60KGhSudYkXv
	 9Cd6bkaU4DGesvtwMo/VeF3UfvCd6m9U0Ri9dpSn9RUuW8Jtc9D7860tdKUAK95RLV
	 IoBpl2v1hE0ig==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6775a46c6dfso2666999eaf.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 06:11:18 -0800 (PST)
X-Gm-Message-State: AOJu0YxpOCWgd8AkJTZBqqjOScd2+WVBaWap09ObMsK8bL3K7YTfFb/7
	qtqnZyIhIwndLxy8rPQE7HYQm5CEF/Q3/G2EWMKv7lw5U3Fl005Q9ZTZN7AyPMCWkfPYwn2ezv1
	/KvlrhezejR55nuDbLaVz+0OTEhQpxFQ=
X-Received: by 2002:a05:6820:16ab:b0:679:a650:cc0b with SMTP id
 006d021491bc7-67b17762deemr1124355eaf.51.1772633477338; Wed, 04 Mar 2026
 06:11:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com> <20260303192600.7224-26-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260303192600.7224-26-wsa+renesas@sang-engineering.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 4 Mar 2026 23:11:02 +0900
X-Gmail-Original-Message-ID: <CAGb2v64Uvd9R-UBvsK7dH2FOAFy5LiVunj7eK3xXX_MYZBwPWw@mail.gmail.com>
X-Gm-Features: AaiRm51UKZgMQvlJkBBvuicIHC1NRc6PgGvmlvXLPvJenUPydhv9dgHS9yfMsTk
Message-ID: <CAGb2v64Uvd9R-UBvsK7dH2FOAFy5LiVunj7eK3xXX_MYZBwPWw@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] hwspinlock: sun6i: use new callback to
 initialize hwspinlock priv
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wilken Gottwalt <wilken.gottwalt@posteo.net>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 25070201765
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,posteo.net,kernel.org,linux.alibaba.com,gmail.com,sholland.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-28774-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sang-engineering.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 4:31=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Apply the new helper to avoid using internal structures from the core.
> Remove superfluous setting of drvdata while here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

