Return-Path: <linux-renesas-soc+bounces-29902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA9XC7D1u2nkqQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 14:10:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 354CC2CBAF8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 14:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E41B3015EFA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF5D3AA4E5;
	Thu, 19 Mar 2026 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RacmPq1b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA38352927
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773925797; cv=none; b=GJnzD3J+rE7kl5PCixF/6CtDcXkKongJ4JX2Gy9zaSJn7zFqIH0uBtev+/igzLhGwcPFKOio7b4Exj/ApoXCqO0Wpl2vZkT2/fGMD9pQJyQfiFgAdE/kddLEnbftg+7SS3rXF1M3gHJHLWaZrvdc2Zjf16lHe/pKzs9TvfjMVx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773925797; c=relaxed/simple;
	bh=Ts/ZBzEhwzBq6L1alBpL4MrUmv33n0V3E/Ul5uCiuTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7nXuLvJb61Onbe5WQlopp1DmF4xp2TFyaNzfA/EAPHJyUryWC2Tzl3O8Z14qfWwmE0FJsOExBm+jm/Z4IWTUooa/30KjYEm2R00IMe1RLsWjdeNvIYQDpf7S9BqLRHwTZp3qNuj7ENt8lCZr+IvisekBV2AXXR+9Mdr43t4KtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RacmPq1b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA2BC4AF10
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 13:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773925797;
	bh=Ts/ZBzEhwzBq6L1alBpL4MrUmv33n0V3E/Ul5uCiuTo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=RacmPq1bIqMeMcyhxiEK10j6ygmP3LMQK2Z2fVE3HCOxsgvgXy03lL3FuvuLQQvgj
	 GiQcbk0Gc68ea8eJ4LngePUDz9C5XojYstENdaRQM1y0oSw68pXH0FB/x9xYOoXLj5
	 yzHUkBwYEvcieaKcpfVCPm7nVCORUUsT0yOyNlGzfZbyxsZTMYNRLeKm/6/LsH6iAi
	 g+KwM2FKgeEjnQE4mZhq0fF6zUla5vAiMm1h5fjWA7LIX/ZFlm4NfZRaEHQvb0eRdn
	 ro9atKpn/5SRW63zxRDjmZnik2psm1mFQ05jHWL2srdHA6o0dMoRIWg/vWUDnwIL81
	 7blFfhRQzZ9RQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a42a0d7f7so18276131fa.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 06:09:57 -0700 (PDT)
X-Gm-Message-State: AOJu0YzUEWdd8Wr3nGDCacTJc0ZvI7sHDc+dA+eN5/smk2bKUZt/0fwT
	3UIyEmYbmKvdh/uwElwuCXmYXbKh/DyRWR9B9r9ey6TcbrckUbNDx/anCP+Bg8q/BAnQT0kEoPD
	7loMh3kkbOkuqCa0zkIqYvJdqSuLVawM=
X-Received: by 2002:a05:651c:324f:b0:38a:d354:cb2a with SMTP id
 38308e7fff4ca-38be5f51b90mr10131901fa.18.1773925796044; Thu, 19 Mar 2026
 06:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com> <20260319105947.6237-12-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260319105947.6237-12-wsa+renesas@sang-engineering.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Mar 2026 21:09:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v67j91R7vsY2WOjgWQxyD-2Y8mRXe1go-F2jsL+9vbrBPQ@mail.gmail.com>
X-Gm-Features: AaiRm52DzwyqScnSD_1lE5a2W4uRQaDkIK3TFFUruN1gvKxXkVMyOzXMy0U3Fs4
Message-ID: <CAGb2v67j91R7vsY2WOjgWQxyD-2Y8mRXe1go-F2jsL+9vbrBPQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/15] hwspinlock: move entries from internal to public header
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29902-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.542];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,sang-engineering.com:email]
X-Rspamd-Queue-Id: 354CC2CBAF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 7:00=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Providers need the ops-structure and the hwlock_to_id-function. Move
> these entries to the public header. With this change, all providers are
> also updated to use the public header only. The internal header is now
> used by the core only.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/hwspinlock/hwspinlock_core.c     |  8 +++++++
>  drivers/hwspinlock/hwspinlock_internal.h | 29 ------------------------
>  drivers/hwspinlock/omap_hwspinlock.c     |  2 --
>  drivers/hwspinlock/qcom_hwspinlock.c     |  2 --
>  drivers/hwspinlock/sprd_hwspinlock.c     |  2 --
>  drivers/hwspinlock/stm32_hwspinlock.c    |  2 --

>  drivers/hwspinlock/sun6i_hwspinlock.c    |  2 --

Acked-by: Chen-Yu Tsai <wens@kernel.org> # for sun6i

