Return-Path: <linux-renesas-soc+bounces-31220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6H7/GyhK3GnCOwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 03:43:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9A53E6B15
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 03:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AF883005793
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 01:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A701B21D00A;
	Mon, 13 Apr 2026 01:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAp2hMTp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A92212554
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 01:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776044580; cv=pass; b=iTbLfL8TqfaonXcvR5S8jcH7sdD1bLwG4uaaS54ZonNXCvfpP+z3sM30K/6BKhNpI1ouR6A8p9EVBKsdENmcwFeCubsdwDKrKlQyYWoX1dVlo4VepkmnOcqcBWeOqBi49aYPrC4xiNWnSxLJLSKO8QYzut/Ri2nyOeCEjpAv1Nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776044580; c=relaxed/simple;
	bh=qOI+HL01lOQlV/37/I6AGHvFI1YGoKNR8Wv08+v7GWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c05kKYyjT2Y3l3uhh39c/txFT8PLJO7mCpCuOlAWuBiQOaVFxq4Pxc/3PR3YSIhh+6le7F4mPdHM8Kbs5n8xu2+FaO2TrvG5/lGd1XnIpIJIYiR2jLSFbiz7wt08sehzNYmtovcK16S+mFq9rDRetA8ip+wrhk05Z3acLcppdTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAp2hMTp; arc=pass smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-404254ffe8aso2592711fac.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 18:42:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776044578; cv=none;
        d=google.com; s=arc-20240605;
        b=iwOgb5H/6hGXv7Uukzx5BSuoN7FodldJQVR8c74Ie9jkyNo06y3uZxZy+D2G3pcJu7
         WKHxPsf4OLtUI7PpwQ3zUKfBTg3fvp0vEhGqpwanwOODe9X5VsyJJLmuPIDWA/OVlnWq
         9ZkR2Gql5wM/rQWG3RtQ7Hxp/FCHy0UdRS7ONUozOt6vd5I1UyJ3OED+FxXYDvg2PEcb
         wb91p5Gs1cVPI09vm0gx6uculVpuigcdkQ5APoGyR/E+WMmG8VYHJ2ScvRpestbqp56Z
         ZhOpF4cUXm1z0emAtwk/gUo6XR0i1Z20rbJnLaEC5G6ZBhpkJyp1zs1q5LqpuAfeFA8a
         1K7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZpqWZ5OeBihZW+KiOWj3yc4NCjFh45eEbq7S9GQ1ONE=;
        fh=G6nk+JxSvL6P9e90s0LK8oTj0gKgaSDU4UoEyAEqHEQ=;
        b=HhpUmSo/2jANV+9tbyZGypyZNkxgoe+cmiJ5QN7xP/CA/ZzjcETF0f/K90o4puOL1u
         8H7eH1UZcx7ZwleTsWeSjt9ZOpw8Yn8d//5eBYGECyBt/9yML9QTDwqQ55w2lOtUREHh
         AmQ5kgmc+z8Kp0LTfTUhBEuj0zzHxrbKMkQGsuE3u1or6eWtWLrviC3J7QaRE697o44o
         SYKaqVKbXSVs57IoRDEVuyZxQiuP1zwcdX/tzZ1x8rzplQ8ngdinVuNs/S2VUEiJNKZL
         Twb9lh9o3AbYEFg6GK9zhYiTrefgGmDC8NfmmYMZbnOhFfr2OL85VDlDta+1HTBxt3bi
         69kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776044578; x=1776649378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpqWZ5OeBihZW+KiOWj3yc4NCjFh45eEbq7S9GQ1ONE=;
        b=MAp2hMTp8z+yF+iYZPUK9xkSbrOpnVX7H8amirdZHFUIyRJqhLM1pEdaOR/yj6xXXi
         Yb8iPC/unO8wtR/+Yv5oVo5vnOXBcGx0ohp09I1KUrqbDKOULacjMyiypeMWHsSH/uiM
         4YCXBT8YbUje1jl237xUiaeDjzspkrA/gK/3osqxfcuhGg7myWm8Hh7DV2R5Y0CvKvrQ
         u1LuWnqssp+mtBiZKBo9tv9ND+aMXi5E3jvnmfzJMIBuyASHPqX2NFMa+YHXuP7rqoWc
         PmMgWQ5dcQ4yZyVc6WOlSMwjZsqFTr1Ms3gZhMNffDH9JwhhtLB9PZp39tYi7v5Fl61+
         YSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776044578; x=1776649378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZpqWZ5OeBihZW+KiOWj3yc4NCjFh45eEbq7S9GQ1ONE=;
        b=Fl9EDMmOhgvMP4qmKQHRreAX7lUqcPBf1lZRigwlAuBKsEX35RksO7DDO+Waz0ofXg
         rf2bn9cwvCTNfzPycwDZlUYT85LhpNrv4cpa1/s0CWipUJJeOGruC1SXpok75HtFVznX
         8tyQE0WvLuiHX6b5C7pxDDKpXjKReK6/8h/sEV7QhdiPpMjUPdF3qHKNVMwv0WquCREW
         YmD06hLVCIa1sB4gsLKxRzwvYrRczhx4fDEuV8AKydtEleTlGohC2hJWEAeLtfCOoOTM
         1+wX6twTeRWPSsdQZcz9f20uohBTW/VVCf8y0rHdQdVx+f1b5hKWs9hgWUZMMuxXcjLn
         R+tQ==
X-Gm-Message-State: AOJu0YzB3Dcw6uPQfLlYKopjm0Jrjfo0GM/fZ/oByMVuiWZ6v/LZaPTW
	wOogqBN251vERRcGtpdYeakIfEnzsmK9GtmYqALnp97nKcJh1imE5zvR0FGqb4S1WOCg4Lz+IGq
	TH6hrBDtjPIZfJcHfOLHb/NugIMJtNRs=
X-Gm-Gg: AeBDieumsEEsEt6AD9/b6HW4TFGDXXR7rRqdh1fMaEs6Rm5fExqLfBJQvz6alwm1rc0
	P2H9o8VcwD4SQ6A3LDtzqeCZq4tUdkTa+jSCGtpY3Ku2sIqfN2h2gssZ8BV8ccIVzw0npvjP+CI
	QJ1qeb4IMb06pVaN8VvGNfPorp2GVq/Q+n8VfIuWpMwF+hLPG5nbgTvVoVX5iiTv8DsBmOJwQrG
	Rm22JQxJfbVIZSeDc9nJQQZJRkMFdNMIh1S5pK4ZDMDqof5UWGKUwybfkAkn4XLgoBthO2sPxV7
	+ysLcHgN
X-Received: by 2002:a05:687c:20c2:b0:41c:9797:d1e6 with SMTP id
 586e51a60fabf-423e1e1318dmr5077336fac.14.1776044577979; Sun, 12 Apr 2026
 18:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410125105.39340-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260410125105.39340-2-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 12 Apr 2026 20:42:46 -0500
X-Gm-Features: AQROBzD5VLydoqD-crkS8q5jKVQvu0Dgk3PHuV4kaQv0TPwaWMSf23DdaK7QoI0
Message-ID: <CABb+yY0QydFqBQ2sPzrbDjoj1ODTe0FW_p_4jyBR8cP_gxg9XQ@mail.gmail.com>
Subject: Re: [PATCH] mailbox: prefix new constants with MBOX_
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Peter Chen <peter.chen@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31220-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,cixtech.com,nxp.com,pengutronix.de,gmail.com,collabora.com,kernel.org,nvidia.com,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BE9A53E6B15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 7:51=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Commit 89e5d7d61600 ("mailbox: remove superfluous internal header")
> moved some constants to a public header but forgot to add a mailbox
> specific prefix. Add this now to prevent future collisions on a too
> generic naming.
>
> Link: https://sashiko.dev/#/patchset/20260327151112.5202-2-wsa%2Brenesas%=
40sang-engineering.com
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> This patch improves the above mentioned commit which already sits in
> -next. It is not really a fix but it probably is still a good idea to
> apply it before rc1 to avoid confusion.
>
>  drivers/mailbox/cix-mailbox.c      |  2 +-
>  drivers/mailbox/imx-mailbox.c      |  2 +-
>  drivers/mailbox/mailbox.c          | 22 +++++++++++-----------
>  drivers/mailbox/mtk-cmdq-mailbox.c |  2 +-
>  drivers/mailbox/omap-mailbox.c     |  2 +-
>  drivers/mailbox/tegra-hsp.c        |  2 +-
>  include/linux/mailbox_controller.h |  6 +++---
>  7 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.=
c
> index 8cfaa91b75bd..43c76cdab24a 100644
> --- a/drivers/mailbox/cix-mailbox.c
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -413,7 +413,7 @@ static int cix_mbox_startup(struct mbox_chan *chan)
>         switch (cp->type) {
>         case CIX_MBOX_TYPE_DB:
>                 /* Overwrite txdone_method for DB channel */
> -               chan->txdone_method =3D TXDONE_BY_ACK;
> +               chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>                 fallthrough;
>         case CIX_MBOX_TYPE_REG:
>                 if (priv->dir =3D=3D CIX_MBOX_TX) {
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.=
c
> index 22331b579489..246a9a9e3952 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -732,7 +732,7 @@ static struct mbox_chan * imx_mu_xlate(struct mbox_co=
ntroller *mbox,
>         p_chan =3D &mbox->chans[chan];
>
>         if (type =3D=3D IMX_MU_TYPE_TXDB_V2)
> -               p_chan->txdone_method =3D TXDONE_BY_ACK;
> +               p_chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>
>         return p_chan;
>  }
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 138ffbcd4fde..30eafdf3a91e 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -72,7 +72,7 @@ static void msg_submit(struct mbox_chan *chan)
>                 }
>         }
>
> -       if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
> +       if (!err && (chan->txdone_method & MBOX_TXDONE_BY_POLL)) {
>                 /* kick start the timer immediately to avoid delays */
>                 scoped_guard(spinlock_irqsave, &chan->mbox->poll_hrt_lock=
)
>                         hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_M=
ODE_REL);
> @@ -162,7 +162,7 @@ EXPORT_SYMBOL_GPL(mbox_chan_received_data);
>   */
>  void mbox_chan_txdone(struct mbox_chan *chan, int r)
>  {
> -       if (unlikely(!(chan->txdone_method & TXDONE_BY_IRQ))) {
> +       if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_IRQ))) {
>                 dev_err(chan->mbox->dev,
>                        "Controller can't run the TX ticker\n");
>                 return;
> @@ -183,7 +183,7 @@ EXPORT_SYMBOL_GPL(mbox_chan_txdone);
>   */
>  void mbox_client_txdone(struct mbox_chan *chan, int r)
>  {
> -       if (unlikely(!(chan->txdone_method & TXDONE_BY_ACK))) {
> +       if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_ACK))) {
>                 dev_err(chan->mbox->dev, "Client can't run the TX ticker\=
n");
>                 return;
>         }
> @@ -344,8 +344,8 @@ static int __mbox_bind_client(struct mbox_chan *chan,=
 struct mbox_client *cl)
>                 chan->cl =3D cl;
>                 init_completion(&chan->tx_complete);
>
> -               if (chan->txdone_method =3D=3D TXDONE_BY_POLL && cl->know=
s_txdone)
> -                       chan->txdone_method =3D TXDONE_BY_ACK;
> +               if (chan->txdone_method =3D=3D MBOX_TXDONE_BY_POLL && cl-=
>knows_txdone)
> +                       chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>         }
>
>         if (chan->mbox->ops->startup) {
> @@ -499,8 +499,8 @@ void mbox_free_channel(struct mbox_chan *chan)
>         scoped_guard(spinlock_irqsave, &chan->lock) {
>                 chan->cl =3D NULL;
>                 chan->active_req =3D MBOX_NO_MSG;
> -               if (chan->txdone_method =3D=3D TXDONE_BY_ACK)
> -                       chan->txdone_method =3D TXDONE_BY_POLL;
> +               if (chan->txdone_method =3D=3D MBOX_TXDONE_BY_ACK)
> +                       chan->txdone_method =3D MBOX_TXDONE_BY_POLL;
>         }
>
>         module_put(chan->mbox->dev->driver->owner);
> @@ -531,13 +531,13 @@ int mbox_controller_register(struct mbox_controller=
 *mbox)
>                 return -EINVAL;
>
>         if (mbox->txdone_irq)
> -               txdone =3D TXDONE_BY_IRQ;
> +               txdone =3D MBOX_TXDONE_BY_IRQ;
>         else if (mbox->txdone_poll)
> -               txdone =3D TXDONE_BY_POLL;
> +               txdone =3D MBOX_TXDONE_BY_POLL;
>         else /* It has to be ACK then */
> -               txdone =3D TXDONE_BY_ACK;
> +               txdone =3D MBOX_TXDONE_BY_ACK;
>
> -       if (txdone =3D=3D TXDONE_BY_POLL) {
> +       if (txdone =3D=3D MBOX_TXDONE_BY_POLL) {
>
>                 if (!mbox->ops->last_tx_done) {
>                         dev_err(mbox->dev, "last_tx_done method is absent=
\n");
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index 547a10a8fad3..e523c84b4808 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -728,7 +728,7 @@ static int cmdq_probe(struct platform_device *pdev)
>         cmdq->mbox.ops =3D &cmdq_mbox_chan_ops;
>         cmdq->mbox.of_xlate =3D cmdq_xlate;
>
> -       /* make use of TXDONE_BY_ACK */
> +       /* make use of MBOX_TXDONE_BY_ACK */
>         cmdq->mbox.txdone_irq =3D false;
>         cmdq->mbox.txdone_poll =3D false;
>
> diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbo=
x.c
> index 5772c6b9886a..535ca8020877 100644
> --- a/drivers/mailbox/omap-mailbox.c
> +++ b/drivers/mailbox/omap-mailbox.c
> @@ -238,7 +238,7 @@ static int omap_mbox_startup(struct omap_mbox *mbox)
>         }
>
>         if (mbox->send_no_irq)
> -               mbox->chan->txdone_method =3D TXDONE_BY_ACK;
> +               mbox->chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>
>         omap_mbox_enable_irq(mbox, IRQ_RX);
>
> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> index 7b1e1b83ea29..500fa77c7d53 100644
> --- a/drivers/mailbox/tegra-hsp.c
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -514,7 +514,7 @@ static int tegra_hsp_mailbox_startup(struct mbox_chan=
 *chan)
>         struct tegra_hsp *hsp =3D mb->channel.hsp;
>         unsigned long flags;
>
> -       chan->txdone_method =3D TXDONE_BY_IRQ;
> +       chan->txdone_method =3D MBOX_TXDONE_BY_IRQ;
>
>         /*
>          * Shared mailboxes start out as consumers by default. FULL and E=
MPTY
> diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_c=
ontroller.h
> index e3896b08f22e..a49ee687d4cf 100644
> --- a/include/linux/mailbox_controller.h
> +++ b/include/linux/mailbox_controller.h
> @@ -15,9 +15,9 @@ struct mbox_chan;
>  /* Sentinel value distinguishing "no active request" from "NULL message =
data" */
>  #define MBOX_NO_MSG    ((void *)-1)
>
> -#define TXDONE_BY_IRQ  BIT(0) /* controller has remote RTR irq */
> -#define TXDONE_BY_POLL BIT(1) /* controller can read status of last TX *=
/
> -#define TXDONE_BY_ACK  BIT(2) /* S/W ACK received by Client ticks the TX=
 */
> +#define MBOX_TXDONE_BY_IRQ     BIT(0) /* controller has remote RTR irq *=
/
> +#define MBOX_TXDONE_BY_POLL    BIT(1) /* controller can read status of l=
ast TX */
> +#define MBOX_TXDONE_BY_ACK     BIT(2) /* S/W ACK received by Client tick=
s the TX */
>
>  /**
>   * struct mbox_chan_ops - methods to control mailbox channels
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi

