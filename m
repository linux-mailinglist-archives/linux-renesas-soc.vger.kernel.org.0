Return-Path: <linux-renesas-soc+bounces-29903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKTRDc31u2nkqQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 14:10:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A988C2CBB34
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 14:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80841301CFCA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534BE3D3329;
	Thu, 19 Mar 2026 13:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bo01snnR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCE83C3453
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 13:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773925832; cv=none; b=VY1Vy4gHhnpO/KL6ffd2xRofWvo6q1vfvmfOUYiEsZT4WYRTuqvs/gh9k7lqmlP1RrL+/rEToIZGDLiLtR2b0TYM5Vd4fCzzrddhv+9n4VegCf7sVO9j1zEWk41aDd715GkXIr9/avE3IL6WldRQHRcC1Sm2s+lLkSwfNbkM/Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773925832; c=relaxed/simple;
	bh=/z6FEu0IUK6nCL3Uiqn1iq1VRQstHdDNDk6ymaE5UrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZD6zvjOL7P/WMC8lq2AsMq9XPabnbcr+Z6hsf0P3NexOoMCwm4uNPhPWLx+VyJx0noIBwEkNzl7eRS04VvU7MoT1X3shSnQ6sB07MdIEho7QxEV52l07sGbH1Rcg422rb9ifMvnHJmt0lZfNoaVP49hFcZc9fvUY+MzLG5TANXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bo01snnR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6E9C4AF0C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773925832;
	bh=/z6FEu0IUK6nCL3Uiqn1iq1VRQstHdDNDk6ymaE5UrI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Bo01snnRFCsVSU9jXLHYlBSQbxAuKL8IlZztOzE7GGenHwqVix5ssfwMi9T3optQG
	 d+gdZbHjid/FAQoMdnnvLy7M2K/MKgAstWlXld4NzDhgAaD4vtKGHzQIdX788cS21V
	 dFWydrgXzY/v9glSzQoEPDrKsVEti1U+5GfLE/NEDAwz+HH1o3l/SSY5ICwNs7lfQE
	 SgYxMuBjZ2CuTOrkXPv4s5eyPP1f6e/bZWIElN+S6x7LjeGeeI3xFgd0/YAfwDebPv
	 qUmCFKkrzQXaTuT5I2A/RKhCEe1nrU8iKbsxLH3L/Inc4Pn/eW0rhPQhZNZyKFwJJv
	 5fv/h7nyjmQUQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a12cd0bd79so912580e87.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 06:10:31 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxkp/lrsv8uIlZ2NIYZR2iYqyyD5TgJJFiFte/Qaf7ZMc5kEQNv
	VS+7v1yue5n5wxJuGobQ8Dt2KeZ875TUFO5htuSeUPHMLiO/AZO1pl0JzpHlzCdEDVYybTupPRK
	FMzilEyyzG3o/iv+NV/xor35dsyxaORs=
X-Received: by 2002:ac2:4303:0:b0:5a1:49a0:af35 with SMTP id
 2adb3069b0e04-5a27958560emr2184109e87.10.1773925830317; Thu, 19 Mar 2026
 06:10:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com> <20260319105947.6237-15-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260319105947.6237-15-wsa+renesas@sang-engineering.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Mar 2026 21:10:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v668mhN7XnjbA5Zg4ExRXLVqn8d9kDjap4wVNEEL780p7g@mail.gmail.com>
X-Gm-Features: AaiRm53ZA49QZnlP2rMulPZJ-bDSE_dydGwTankSFX-RnHDx5Riad08-AOxumlo
Message-ID: <CAGb2v668mhN7XnjbA5Zg4ExRXLVqn8d9kDjap4wVNEEL780p7g@mail.gmail.com>
Subject: Re: [PATCH v5 14/15] hwspinlock: refactor provider.h from public header
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29903-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.alibaba.com,gmail.com,foss.st.com,posteo.net,sholland.org,st-md-mailman.stormreply.com,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.947];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sang-engineering.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A988C2CBB34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 7:00=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Factor out the entries only needed for providers from the generic public
> header. This allows for a clean separation between providers and
> consumers. All providers are in the hwspinlock subsystem currently and
> are trivially converted here as well.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  MAINTAINERS                           |  1 +
>  drivers/hwspinlock/hwspinlock_core.c  |  1 +
>  drivers/hwspinlock/omap_hwspinlock.c  |  2 +-
>  drivers/hwspinlock/qcom_hwspinlock.c  |  2 +-
>  drivers/hwspinlock/sprd_hwspinlock.c  |  2 +-
>  drivers/hwspinlock/stm32_hwspinlock.c |  2 +-

>  drivers/hwspinlock/sun6i_hwspinlock.c |  2 +-

Acked-by: Chen-Yu Tsai <wens@kernel.org> # for sun6i

