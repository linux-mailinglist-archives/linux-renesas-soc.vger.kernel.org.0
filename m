Return-Path: <linux-renesas-soc+bounces-29122-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM2QFIPnr2nkdAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29122-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 10:42:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EABE248B15
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 10:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45094300AD67
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 09:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E9543DA46;
	Tue, 10 Mar 2026 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2KpT2PX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6317D43DA2B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135574; cv=none; b=rq0czLps1OpPT1vFrdMdjsy2bbaDUZYoBm3J8Q5SX4LJaU1lr7vzN7EIXfVI0XrT/aNHMpd4TvFNYUNmP+SREoxew8BgcXGEPLNNxzsnyNxmSy90h/oFHWXVu+a4LbdLiG3C/aEithDU3YS+4YxGrl9TP88YVZMqlCMZJgRdhqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135574; c=relaxed/simple;
	bh=0NvNqkbHvopZkhx6T/+IIZIFE+ZXvBvs4x160lciOgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAkMH5I8fPuBnHE++zoEkuOYUucLcPHNwRT+cwfQUy2fL/3SSgt0EO2RFxIIw3YQUDJI2V1Kpipd84ceGHkSPvyMTzEQWdKvpniGJnFWMsOFvM4Kt5Rt9pFH+VNOGF6V/oiHIl8R2h1udInY8aMjOQOcX9KfRHsW7i+82Q6hkRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2KpT2PX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C77AC2BCAF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 09:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773135574;
	bh=0NvNqkbHvopZkhx6T/+IIZIFE+ZXvBvs4x160lciOgk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=H2KpT2PXchY67iKw4BU6/Yl1d5CyFTJydVwdKiWhENgeBM56oCA722NqgJC/ZRPIG
	 mcX0jIQIx1kcMLR4OAZYfqOZhUuRE8gNRiDITuGd8390h+DBEOY3DKTZeZoT8Lj5ar
	 nVvSqlDVfImNkLRJWGOl6ukW7wHz2UZOTRMp7uhj+htw+N2CB3c65aiGg5qW6tW9sy
	 Ak9PlF6y3l0DaC1BlEqnIrD7tMN1F9ugJ8VYbpYFwJJtAT8OcQG0kIoU52TdKendeA
	 R5pbTOaQ167IykMHzzTJNVBSeraixqXTaF2fxtNnL3Y4GzbNRkW+CgoOijPvyqjJBh
	 GecNHMqtZ/Omw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38a42a0d7f7so27595981fa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 02:39:34 -0700 (PDT)
X-Gm-Message-State: AOJu0YySy1SJ8cA2oBlnvpql1W6pSwTImdWtZR8wneoC0d76PiBQrvFT
	w2369uUFbBwp9vnH/lefrtvY9E8oi88r+886LK0B79EPUSjJWlBil0qgCQcAiH8ix4Uqwmq0LDo
	pbF4wA2nSe3H6iMIoyd13T1w6iO8rm7w=
X-Received: by 2002:a05:651c:20ce:10b0:38a:3660:7feb with SMTP id
 38308e7fff4ca-38a5d010b86mr7646831fa.9.1773135572499; Tue, 10 Mar 2026
 02:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com> <20260310075539.11701-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260310075539.11701-10-wsa+renesas@sang-engineering.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Mar 2026 17:39:20 +0800
X-Gmail-Original-Message-ID: <CAGb2v64gTM41Q3aBkS+dqJ7w9fHtePte-6jeoFR3j-O1_aX9-Q@mail.gmail.com>
X-Gm-Features: AaiRm504Z-6QWp77ZJMLsW12D2p9SNHT7rtRZg5o6Wu6DQVg4_G6syeE7d95ZJ4
Message-ID: <CAGb2v64gTM41Q3aBkS+dqJ7w9fHtePte-6jeoFR3j-O1_aX9-Q@mail.gmail.com>
Subject: Re: [PATCH v4 09/15] hwspinlock: sun6i: use new callback to
 initialize hwspinlock priv
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wilken Gottwalt <wilken.gottwalt@posteo.net>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4EABE248B15
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,posteo.net,kernel.org,linux.alibaba.com,gmail.com,sholland.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-29122-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sang-engineering.com:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 3:56=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Apply the new helper to avoid using internal structures from the core.
> Remove superfluous setting of drvdata while here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  drivers/hwspinlock/sun6i_hwspinlock.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/s=
un6i_hwspinlock.c
> index a0c76bba3f05..c3db81cb1793 100644
> --- a/drivers/hwspinlock/sun6i_hwspinlock.c
> +++ b/drivers/hwspinlock/sun6i_hwspinlock.c
> @@ -74,9 +74,15 @@ static void sun6i_hwspinlock_unlock(struct hwspinlock =
*lock)
>         writel(SPINLOCK_NOTTAKEN, lock_addr);
>  }
>
> +static void *sun6i_hwspinlock_init_priv(int local_id, void *init_data)
> +{
> +       return init_data + sizeof(u32) * local_id;
> +}
> +
>  static const struct hwspinlock_ops sun6i_hwspinlock_ops =3D {
>         .trylock        =3D sun6i_hwspinlock_trylock,
>         .unlock         =3D sun6i_hwspinlock_unlock,
> +       .init_priv      =3D sun6i_hwspinlock_init_priv,
>  };
>
>  static void sun6i_hwspinlock_disable(void *data)
> @@ -91,10 +97,9 @@ static void sun6i_hwspinlock_disable(void *data)
>  static int sun6i_hwspinlock_probe(struct platform_device *pdev)
>  {
>         struct sun6i_hwspinlock_data *priv;
> -       struct hwspinlock *hwlock;
>         void __iomem *io_base;
>         u32 num_banks;
> -       int err, i;
> +       int err;
>
>         io_base =3D devm_platform_ioremap_resource(pdev, SPINLOCK_BASE_ID=
);
>         if (IS_ERR(io_base))
> @@ -161,11 +166,6 @@ static int sun6i_hwspinlock_probe(struct platform_de=
vice *pdev)
>                 goto bank_fail;
>         }
>
> -       for (i =3D 0; i < priv->nlocks; ++i) {
> -               hwlock =3D &priv->bank->lock[i];
> -               hwlock->priv =3D io_base + SPINLOCK_LOCK_REGN + sizeof(u3=
2) * i;
> -       }
> -
>         /* failure of debugfs is considered non-fatal */
>         sun6i_hwspinlock_debugfs_init(priv);
>         if (IS_ERR(priv->debugfs))
> @@ -177,10 +177,8 @@ static int sun6i_hwspinlock_probe(struct platform_de=
vice *pdev)
>                 goto bank_fail;
>         }
>
> -       platform_set_drvdata(pdev, priv);
> -
>         return devm_hwspin_lock_register(&pdev->dev, priv->bank, &sun6i_h=
wspinlock_ops,
> -                                        SPINLOCK_BASE_ID, priv->nlocks, =
NULL);
> +                                        SPINLOCK_BASE_ID, priv->nlocks, =
io_base + SPINLOCK_LOCK_REGN);
>
>  bank_fail:
>         clk_disable_unprepare(priv->ahb_clk);

Just a note, I see further code savings in using the clk and reset devm_
helpers. I'll do this after this series is merged, as the context overlaps.


ChenYu

