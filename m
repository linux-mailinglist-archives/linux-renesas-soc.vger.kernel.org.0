Return-Path: <linux-renesas-soc+bounces-32775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Mv+NlxiC2rwGwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 21:02:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 496045728AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 21:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22C493005D29
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 19:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6073D3101D0;
	Mon, 18 May 2026 19:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqpqYY9d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B7F1ABEDE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130940; cv=pass; b=ZouDIUqMgkcFURgai94JcLzjKfsJn4imHVcsO7c/zTcPcMp4VU+qr6mdFz7IEgVS+hJh0WtE0w/0LB/Ic4zMILqeLXSXNABWFvLZFvLlfU7qFz1rvnvjtB0d4zfgryqmP2y4VUXG54TLGYzLbhJ0zTTM9+KxFhHCI+B0i7KeV1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130940; c=relaxed/simple;
	bh=qW5inxGYPahUYZ3eZfW0srUOzzb8faQUPQkAsA2K4zU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQwtAQVADT0R2ATFHRd8K5hBo4NmlfnVH591o1v/BLr5qpNK+M+rB42EtFLla16Gi5HhlPGEhnZUU8RPjEum8CO0nB4nLaMGxRGX1kk8kCV2nea9d5LJ7XTsgnXHYYeHPiv8bdiuddwNtrt7BS0WGyXLxir2OqCbZZHlhm1ZCBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqpqYY9d; arc=pass smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-484ba8bc89eso1555424b6e.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 12:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779130937; cv=none;
        d=google.com; s=arc-20240605;
        b=Xm2ojSoQMfLOgrNeyGjn/d2ycr0wAPVrjwsqKEXKWC08eqA3huaUD6vaLrOpofE6E7
         ctdQT19pTkA5YORKWsSxgycpWihf4iGlLtrXBp8JbtwReWujdw4onKi/zqr3iOrhHme4
         31qAvIgka9MHqVjDmPAAZ3tGViQsbApSUo/9WOeC/FPNUJB56XGmYTJarKjmZCnD9SNX
         wInEFQbqGDCumOPLe7Xnn9vzntlhMXQqAMkvNzX+DdpLu/BIPNrbLN/4GA7GVxoj49ht
         GP04+fYdZDQ7PdpphVHTrYn5M2dWwFQLKjJlZqf9v9b3ARw0eDfCwVNteVWH67W+2SEh
         s+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=onumwHCqOqVxo7MINJ4Y6IYehLcTPppCv0to4+UZTKM=;
        fh=Nyqr9BkW2wLWUGh3lfzURzuhGuPLfU8+b7do+eKdhmc=;
        b=AkjTBo/vK9WlLuWlyiRDuxBg1rKVT6eJs1ihs1MH9isjvLkjjMPNarcCaxLwFDoNeF
         2lfxQ5dagzVe184YlcD0S+0qzQoFF2+AQQFplIkYS3LaYDSZ9hrjw3Omk8iIG2H8ERzf
         8gMe2kHR0IS8sM/vvenpRpS1bkMotGh3EApBYhL6lfeLEpVwF/KLypy8w8oT84EqgsVj
         oSmrIe2KuD+Rw0EkcJQRPNe99ajzNeHkOUfYCHSyiyfSwVSwLt4ylqo4fN2hTcuSuLHg
         7yh6H4nWm+4LzLCjz9PiqgVoCupUkaD0Ssg9WZ3ErIQw6EA2yifua3z/aWUChfBYj2g4
         naOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130937; x=1779735737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onumwHCqOqVxo7MINJ4Y6IYehLcTPppCv0to4+UZTKM=;
        b=eqpqYY9d+zVDKDGRaRuEjR1twFHk0qGlayIpa/eBYzV0myH3/NiOxvcBL3u06/oTkr
         SdeNIIZWaoUJ44rsRvLswCPuPkzMsmrCyq2L8U6xzGB5l/TTPCDfP1o2Nncw7sffr//V
         eOCWkaUZhnPoBCJh8VVhwm9363sW99k77iqY7PpRiAWSkGWpasFiRgapdbvP+C93VAlc
         K5z6JNwPAxCpynTi1dgQPdZKmgSF3jt3KWaAfftxSxhYwLRa2IPMDVtIVDU0NFFtNsQI
         c1qjadKik6PzrVL3eS9i0vrRoqWd57OMgOi+VOMNtrFQQSg9E2q9orGpur0LuY60y9xi
         YoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130937; x=1779735737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=onumwHCqOqVxo7MINJ4Y6IYehLcTPppCv0to4+UZTKM=;
        b=Kx64IEhLvGW5uEsclXHXoA4lpWTgCNa2R3r6puTboawQD/ePvbuI8Bskry2WCbm/vI
         KGpcyx0a5rVRJsuG7ogEtCrOF9x62NsOS7cfN3/19fImqTF996MBZfrdAx1pphsLaml7
         GT0ZbKYhLpNvkyvK3MJwAxy9Z5Yy6gjc4T2U/QVoitSI0ZHwTqBYVuLEogrL2kJO45xf
         4vNaU2DLowsKuBQp/yPlEJImVr0mkCUoJy/Vkcue2QB2zRdPRom76zFrQJ6chLs74VTA
         jfv9nR+Kl7iKjX6Wkz9AIpLYWvaweD0F8y82YDQILo35okaqXhRJYVrHIpgJvO3O1cDc
         TJSg==
X-Gm-Message-State: AOJu0YwrKx71PRrBLT/twOTPuahAl82uo9jjCLXiLMh3tzmL9JbyfQTd
	m4HpeY2SECBBaPRdmmmzzJmc27rudWbLiIddYWhKZHcp/vuw1Dt5yKEeDQ9YbWkSbglGZ339fTh
	KSWLFMF5t9SB2Xdky5rxp6siVEnOf+DE=
X-Gm-Gg: Acq92OFik5BX3HDc/MpxRJv+cN7OQydFHDOH+qacaNmoH4dqkzxaHeGjo5PLvYH0Zfs
	ZkHySCyiToYKnxDxYs/MjmBw4g4EQyrE4o0Dzg0qtZKpvrhXIn+yFSg8m+7VePKz7PmJIrIyR4K
	L0h6RM3inHiUVbu/bo05/aR3m8UyWwiFLwZby+cPWJg/MCjK5uODklYsmDSMUdQY8S5zXLZ/P1T
	tx+zqfVhEm3pqAx7Ej4CaSnGFd0vm0BVUq2PmSc3rn0uyq7yGsbEjCvNrY3FTM7zS/wkrD784Gl
	Ox6Kc54o
X-Received: by 2002:a05:6808:5282:b0:479:ca1e:ad80 with SMTP id
 5614622812f47-482e55b1030mr11044261b6e.5.1779130937136; Mon, 18 May 2026
 12:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506071128.4114-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260506071128.4114-1-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 14:02:05 -0500
X-Gm-Features: AVHnY4LpA_BT9Yxw2VmPZyWFNbsTFr2pJDODmBFKTLjXZucT98nEONbf8-kwePU
Message-ID: <CABb+yY3YcKK=gYGuDQHMMFKYH-fJunCv14gvn3zzU2gMSxADMQ@mail.gmail.com>
Subject: Re: [PATCH v3] mailbox: don't free the channel if the startup
 callback failed
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32775-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 496045728AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 6, 2026 at 2:11=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> If the optional startup() callbacks fails, we need to clear some states.
> Currently, this is done by freeing the channel. This does, however, more
> than needed which creates problems. Namely, it is calling the shutdown()
> callback. This is totally not intuitive. No user expects that shutdown()
> is called when startup() fails, similar to remove() not being called
> when probe() fails. Currently, quite some mailbox users register the IRQ
> in startup() and free them in shutdown(). These drivers will get a WARN
> about freeing an already free IRQ. Other subtle issues could arise from
> this unexpected behaviour.
>
> To solve this problem, introduce a helper which does the minimal cleanup
> and use it in both, in free_channel() and after startup() failed.
>
> Link: https://sashiko.dev/#/patchset/20260402112709.13002-1-wsa%2Brenesas=
%40sang-engineering.com # second issue
> Fixes: 2b6d83e2b8b7 ("mailbox: Introduce framework for mailbox")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v2:
> * moved helper function up and made it static (buildbot)
> * rebased to v7.1-rc2
>
>  drivers/mailbox/mailbox.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index bbc9fd75a95f..006ea5a5c320 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -327,6 +327,19 @@ int mbox_flush(struct mbox_chan *chan, unsigned long=
 timeout)
>  }
>  EXPORT_SYMBOL_GPL(mbox_flush);
>
> +static void mbox_clean_and_put_channel(struct mbox_chan *chan)
> +{
> +       /* The queued TX requests are simply aborted, no callbacks are ma=
de */
> +       scoped_guard(spinlock_irqsave, &chan->lock) {
> +               chan->cl =3D NULL;
> +               chan->active_req =3D MBOX_NO_MSG;
> +               if (chan->txdone_method =3D=3D MBOX_TXDONE_BY_ACK)
> +                       chan->txdone_method =3D MBOX_TXDONE_BY_POLL;
> +       }
> +
> +       module_put(chan->mbox->dev->driver->owner);
> +}
> +
>  static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client=
 *cl)
>  {
>         struct device *dev =3D cl->dev;
> @@ -350,10 +363,9 @@ static int __mbox_bind_client(struct mbox_chan *chan=
, struct mbox_client *cl)
>
>         if (chan->mbox->ops->startup) {
>                 ret =3D chan->mbox->ops->startup(chan);
> -
>                 if (ret) {
>                         dev_err(dev, "Unable to startup the chan (%d)\n",=
 ret);
> -                       mbox_free_channel(chan);
> +                       mbox_clean_and_put_channel(chan);
>                         return ret;
>                 }
>         }
> @@ -495,15 +507,7 @@ void mbox_free_channel(struct mbox_chan *chan)
>         if (chan->mbox->ops->shutdown)
>                 chan->mbox->ops->shutdown(chan);
>
> -       /* The queued TX requests are simply aborted, no callbacks are ma=
de */
> -       scoped_guard(spinlock_irqsave, &chan->lock) {
> -               chan->cl =3D NULL;
> -               chan->active_req =3D MBOX_NO_MSG;
> -               if (chan->txdone_method =3D=3D MBOX_TXDONE_BY_ACK)
> -                       chan->txdone_method =3D MBOX_TXDONE_BY_POLL;
> -       }
> -
> -       module_put(chan->mbox->dev->driver->owner);
> +       mbox_clean_and_put_channel(chan);
>  }
>  EXPORT_SYMBOL_GPL(mbox_free_channel);
>
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi

