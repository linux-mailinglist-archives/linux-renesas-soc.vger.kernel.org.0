Return-Path: <linux-renesas-soc+bounces-30550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEFpIBtRyWnrxQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 18:19:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD763352D94
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 18:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FE343002776
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 16:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230EF1D9A66;
	Sun, 29 Mar 2026 16:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9V6OFpo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB9A18EB0
	for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Mar 2026 16:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774801098; cv=pass; b=f4a3se/TkoWDv8seqNVRAFIBVDKkNOnrS4RYT8K/DQ0DNvguZz1zNMes22YyKgAWw6SYC2G5cc0dU5X/mDXYy0DyPQDyvnjYGxi+BBIb6kU6oP2jMK/8fIr8PvezqU5HhIgYK0NHgafXDgKBOfilcTqgZFYVMODVe19LrDH18Yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774801098; c=relaxed/simple;
	bh=Q0e5aMLXLi724TnMUUc6wx+dZgqkYFlmPsiJaRjV/6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+g1gUx947oFf/XG7iSSstwgApLT7d9n0yBPorKZ8A1SwVV4s8f7ADPl1o69wSs5YQZScNPIJovAIimslig8DaA3lpNi8GTpuNV9Fkfxa1IVxmN3EQLvKaKb8qxbJ7fMSJwBKNYq6VtjGbjrdvbpeLo1TLAVhmrc7vfQ0P9lHTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9V6OFpo; arc=pass smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-662f30d3f1fso2684118eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Mar 2026 09:18:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774801096; cv=none;
        d=google.com; s=arc-20240605;
        b=U/UAfVAEVz1/61Eyv5Yd9dzaWCAZTAsYPbdh8oybU0qMrUP6kTt3m68CXhQ9kIqGY0
         6mTZLHaWrEoDQTqH/8+aTPng+iblgtq1z7pbiedaj7a/rH7gtybzHbuTAQKylgS54bqB
         54qUmbBtwlDhfWyFSLMFPp87NqmuXLVB3/VtlwuK3IyxAPpedVGVC8nin3r+Ck7U4yRA
         M/wJ3NrkYJY6YudW+BvNFTbTr6Wq1rSTXEV2SvUt0cVynPxr0Dt2EuRUKrHkxnliuH5K
         i4YsmjAMtV5lojqLFn/qbzdKE7mXf0Vlml27ttT85+eZOAtjtS77jEwWKlr3MDsfhNcP
         vpbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ln0AFKtiiOyd1awiSLR+/ZLVgvpXDVIqEDEAuJIpGl4=;
        fh=IKobhpx4zkV/zKqesqDG+2/1wVyug5Avr7E957e8+9Q=;
        b=emN6GamWUS320BK8D3FcOEVfVp5uBZsritrQsg988VtCI2AfzHLu2eu8uHJGokkjGP
         UuPGebGoSdhnHfGEQAMiBpR2RGnUpgnURghClfIHiHaoNg9eERvdiBi87rLXE/GE/usL
         LxWJUA8VR6Ql97a38dbcfKzeViXkllClYILRga/n6udFR145UVfDKQT40pS/Bo1YyCUI
         ECFbpnMblFmPUp0aNpLX/INZlEhBdUTD9SV3Q7o3ax5AjUw7V5IC6d0cstK61m5m82x+
         zZw2AHmzvQi8TeVY8I88TsLlwNng9VKBXKFexwqtjJslEFgNFNAbmdmchXzRsWpuxepN
         FkiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801096; x=1775405896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ln0AFKtiiOyd1awiSLR+/ZLVgvpXDVIqEDEAuJIpGl4=;
        b=W9V6OFpojV6eK03dA9D/Y1Joo0yzm6hY1w8kTQkcYtZImpwpl53ErZQeaRYzDL6uH2
         DQDX88t1Vcp9mcEk3p5RjrbpWBNEFrQvKeXhNubRJJznr3tYbf2HzBrh5YMx2ikMmEe4
         +CXRqjNtMsWksBSjBas1GCgwlwBHCfxd7VGV9fnKB9YUP+CZJ3VeQZ3HX1PM5HbiaYUM
         lPhCZGNz2NQOX3T8mpt+NVnf8dM1h9BbSwGGSyLjiexQ6zcFVA60tWQ1W9ggmBNawFzZ
         tfOQ7Vo2DYPZIpzSRcqtRPclPAFkfdHC5pt7UlXZoS/qs2uYjeKxHiRJrQqYUy1RgmpW
         xRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801096; x=1775405896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ln0AFKtiiOyd1awiSLR+/ZLVgvpXDVIqEDEAuJIpGl4=;
        b=WTafIQVhk846TYNTDY3NB59+EJoLf7NCQ5rOU5/SYvWjm4itaJY4O3jwCYjKBcVLNL
         ibR8Mjy67eCNzA61iLDc2FJaxdfiz32QIoVpI+G3OKOHtDaS8SjpioBknSNq6MombpL0
         Pc6AxIWbe53REzy18oPU9nFk0/lMvhiO0mJ9UHrRtEb7WPYSPiZRSTQTGPTHyl0M69qo
         mGvlrwHKhqUKlvu2GsPTsj8FheWwUDtsQPU/74OnrnaUX7HTH0A9nZ2x68Mok+ANUyr6
         e5R2NWIGILBEBm9IknmSdJBMpSqhZ4Iz3NYkb7XNPEODqvxXDykrn12EkWDcG1tkZu8U
         H3uQ==
X-Gm-Message-State: AOJu0YzcYBexxpP7HgJue0QanWKzSGFEQ4wt3kahyJpnfncbA1BXTib6
	H0fPi4G0Ioy4oVIkZuJL5ie4LgwddfbKKtKrzYhjBhfROzw2U1ATVAQZ1wK/irnyt+OSk+He6a1
	CuOHCZqbvhu8FnRZxv0GwvaQzb33FOTQ=
X-Gm-Gg: ATEYQzzTycHBPI1i02aOg6k5uDruXAUbV9eAKIbDdZoojOsV7kqITUTkYuJwHv2PDGp
	sSQB6x6Qt30rctU/Yrpzrp87uhMzMVSaLeGE9ZkGpG7S+z36SQYQMituWtHhJe/dkUzOs63VnFR
	/wy5cwk1NbCkp9PrglzgkDm7y0qVv7nd3m5LRQdZ156LWJp/Wa21EjJZ2NaeFqBE3fsxfcqSRPi
	f1HKHvDmRGueQubJ82w2mnHwDXMEPlJ+dp39Wvs1tl6bxgDOwT81NUBHkFPtCOnokP40CMTUZWM
	w+0amNxA
X-Received: by 2002:a05:6820:992:b0:67b:a85e:6ca5 with SMTP id
 006d021491bc7-67e195bd41fmr4231270eaf.18.1774801095746; Sun, 29 Mar 2026
 09:18:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327151332.5425-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260327151332.5425-2-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:18:04 -0500
X-Gm-Features: AQROBzCYhRSHffyuIz40Wf6kh2CMkJkh3NmTLvlG_EffDBSm87x8_smNNQuGVlo
Message-ID: <CABb+yY0KOk4ASTwomuiJC_XBGvpoAXEV3GhHYpWAbgQiOXZTLQ@mail.gmail.com>
Subject: Re: [PATCH v2] mailbox: exynos: drop superfluous mbox setting per channel
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30550-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sang-engineering.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CD763352D94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 10:13=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The core initializes the 'mbox' field exactly like this, so don't
> duplicate it in the driver.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> Changes since v1:
> * rebased to 7.0-rc5
> * add tags (Thanks, Tudor!) and dropped RFT
>
>  drivers/mailbox/exynos-mailbox.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-ma=
ilbox.c
> index 5f2d3b81c1db..d2355b128ba4 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -99,7 +99,6 @@ static int exynos_mbox_probe(struct platform_device *pd=
ev)
>         struct mbox_controller *mbox;
>         struct mbox_chan *chans;
>         struct clk *pclk;
> -       int i;
>
>         exynos_mbox =3D devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNE=
L);
>         if (!exynos_mbox)
> @@ -129,9 +128,6 @@ static int exynos_mbox_probe(struct platform_device *=
pdev)
>         mbox->ops =3D &exynos_mbox_chan_ops;
>         mbox->of_xlate =3D exynos_mbox_of_xlate;
>
> -       for (i =3D 0; i < EXYNOS_MBOX_CHAN_COUNT; i++)
> -               chans[i].mbox =3D mbox;
> -
>         exynos_mbox->mbox =3D mbox;
>
>         platform_set_drvdata(pdev, exynos_mbox);
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi

