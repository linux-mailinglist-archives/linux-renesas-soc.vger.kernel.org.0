Return-Path: <linux-renesas-soc+bounces-32774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KxfMlViC2rwGwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 21:02:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E9B5728A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 21:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F1B93008D33
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 19:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F6735E94F;
	Mon, 18 May 2026 19:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ky+0FTZt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C24B38AC9A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 19:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130923; cv=pass; b=K0WP8wrHkzEDfkfpiNEFaqFgCh3mLdVd0CD9ZijMGFQTUWkyqEWOnIEWohCZdc7VBurAOcsUqaIRGLhFQUntjU0ANHCV+KaQIgwdowCfckCflzKwNLqKKWVdlMp4XwzNTA6K/VnpY9DRI6/v0yd8QridvjSUIC7TfMPflGEB9d4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130923; c=relaxed/simple;
	bh=7aJYr8+BBO8AKpgkqPmT/bejH6qI0RU4sRJlyxTyOac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=loUJ+MgsiUV9mDL8loiguaBRGfzOwclPKaIagESkASrX7wjrId+dI1Iu9zECf5t7FxMTZ/74QHnufrQ309Ay/mW/jLsY7f6FdJxShVRDLqjMN60ZHTfT4pvNwEK0CvzV2AAhdAa0w2hWgmYQXuNkDlpm+HtBmtHcaaFQWy54ib4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ky+0FTZt; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7dcdd1b492eso2803452a34.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 12:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779130920; cv=none;
        d=google.com; s=arc-20240605;
        b=ep59fnXI5CzzSbj6htsELHwgXcFU0k0zqXOsMEaIhJ3VU6JP163kFuO00g0HkaC/QW
         bmNVE2jbaNdu21whn/kHdbxqtLTv9K3/hPdTIgxZiPD9VlRG6Pmxd404oeu4/IbWRniA
         K0iEYBjAPPZdWXeOENXb8AvcZBN/2XBESGzNQneGqp7v5QLu0dxIjYDLs4xnTNHx5USX
         KSKLRgrbY0fzx8xSRSsjVqsva23tSFvHQw+nYkBsMEoIPyXd1zq1MUpmZstUZVl4/KTf
         3/yjtzKaZClLVSm4tQ0nKtVPUaQc3GwSQyUT4+eaKjU4YEvvWAat+xI/dwgvm01BTN18
         sDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rtc0ZcomYJtMHAzVN/VEjL02sGiyFg1dkZ0Suxn7aAo=;
        fh=KM82T6IdRPoyLRvaCVDCFc/k5yoF+9lQqP7ZcQX8oe8=;
        b=BQYN5k/JbTjBhnXsKv77LLlYMoKV+TOHj45FDAG5OafDVaHbDmkiUjMYVJo5S/VfZA
         Oz+8JTGff1neHNTr14syDvRtnPBJxGX7/Y9ROcoi79ngLhIpIDekAWVQM/KK+ZGdvTQF
         Tq1klwo7j/4u1sWiAJ9HT9+BpyDQXMR9HBYlKSXDBhs3qCaqMe+/aTEcANu1jqiifpA3
         OFqZJpby8v25KMEygfzMd+WMpDH0GIDBVJhMo+6WD3sRjMdBVskIuuivPfNaPrkivea6
         EVDuCWi+eH+XTuRy66S8xSD2yjWhf9Vwl1aQUpJAdTDRUD/QCqA5eS4xMug9C3JNcr97
         oVvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130920; x=1779735720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rtc0ZcomYJtMHAzVN/VEjL02sGiyFg1dkZ0Suxn7aAo=;
        b=ky+0FTZt9catx0HRz/KCBzP3zC9oN2KO+Yvl3Pwj7frzUQFh4gX7XXvDXS0ZfutNbm
         BTK0NlWKkCYyeuvwkNURDDz/eAiHXYXWgalGVshGRE1CwjM2Rev5mBvZECCzMDN0bEpa
         I9kN4c+o8IlKaXYfHSvSUDOrfIKQ79fQIh5QQKcgvReSM7OSW9rfvAGMOpNYLXw+W5ic
         DGMT/ewpIT0HM27QMjWqubeVNZ2ibWI7VpxjX6q6ouEgQBbd1SLHiZ6775iqO1VZA/cb
         smo0eZsmemmFUWpVLGn8Ih4tQt0AXGmCa5HtHnbYAxR9uiZevQaCPyCM8TGl1raYogsF
         HjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130920; x=1779735720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rtc0ZcomYJtMHAzVN/VEjL02sGiyFg1dkZ0Suxn7aAo=;
        b=gvcOAoWJn2wde393juLUEYLqvgViI9dVKGYRvB2iQFfoQ1cuwRbEGNZ5QtLENtNJTG
         K/Jgpu1YCzlYWUs7Wh+v1rEYXC27pLZfsF7l8ossqA2vPkT+yYSPRikmAngoWUKpQBkb
         PuNXMSuZj7JtDc9z6esbzSwYlPORd7TYvHT7vZEnCaV4xCngsabau03pXuqdvADgttvl
         tSBFB4wvr13pKA4EtS5W7NTmupfyzyFhuOpXXIRlTqqZVI/gNp+LlevxpqRhYswiv1wg
         KzV1haPBByyrUvt7i1DNsOM7WQRk5UNd91kdDe+G8D/xlH1FGjIwFR6d/WW0lI1dIw8C
         0cRQ==
X-Gm-Message-State: AOJu0YzkrX8n2ywDh5pyoL3lqpnRK6l6pM2KSdAoOLNUi++tWJaN+Nm8
	u5QXEqpyLwG2w++yjf1t1lFuwUiqQilZpl0xv7J5f9bpEBeGSR+dqx46D6JORjHZZ78hH5toF91
	XHx2s15OYhMqr1IJCc7suDwoHikkFDexNLT6FYLU=
X-Gm-Gg: Acq92OFaAKcmRWG0XLD+tTph/xnSpE0hzfPVNmnfQRQHnXoxAioDAoNX/MxDDRNDf7/
	19+WCGU45XBrW2Xm+71wYl+lx1D5L/k50eVTuBEWqkqlZz+6IGQ2saW+zYYt7nWQJws2X0dwaW3
	C8aSkfIjnc8G/Z19u9LAQBWZVT3MPerijiZqAppq2TC8+Yr4+Ip9jAHChU8jr5HUGD+D2BX2S1N
	x8uLt9mcZLxOerXAnmM9SJbTHYrUMLzSmXhHP9mByJ3ep3MNnY4j8QMISEX9LzuXcMMSzmFQ1Fr
	QJ6JWy3m
X-Received: by 2002:a05:6830:8290:b0:7d7:fd71:f2d4 with SMTP id
 46e09a7af769-7e49a889f33mr10062355a34.3.1779130919879; Mon, 18 May 2026
 12:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506072030.4288-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260506072030.4288-1-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 14:01:48 -0500
X-Gm-Features: AVHnY4I6l5iQ_c6LhQDxY2Mfgf9MkLxtQ8ga8E47CuQF1RmzSQAtbIGd37tqHys
Message-ID: <CABb+yY3PvnsFWyWM4mOKCZ-MpfrsRYY6zS5FtEvdpagEpnF80g@mail.gmail.com>
Subject: Re: [PATCH v5] mailbox: add list of used channels to debugfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32774-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D3E9B5728A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 6, 2026 at 2:20=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> During development, it is useful to see which mailboxes are currently
> obtained. Use a seq-file in debugfs to list the currently registered
> controllers and their used channels. Example output from a Renesas R-Car
> X5H based system:
>
>  # cat /sys/kernel/debug/mailbox/mailbox_summary
>
> 189e0000.system-controller:
>    0: c1000000.mailbox_test_send_to_recv
>    1: c1000100.mailbox_test_recv_to_send
>  128: c1000100.mailbox_test_recv_to_send
>  129: c1000000.mailbox_test_send_to_recv
> 189e1000.system-controller:
>    4: scmi_dev.1
>    5: scmi_dev.2
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> This patch was created on top of "[PATCH v3] mailbox: don't free the
> channel if the startup callback failed". It is no dependency, though.
> The patch applies without it with just some line offsets.
>
> Changes since v4:
> * improved comment to explain the initcall situation
> * rebased to v7.1-rc2
>
>  drivers/mailbox/mailbox.c | 65 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 006ea5a5c320..3716b8ccbe7f 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -7,6 +7,7 @@
>   */
>
>  #include <linux/cleanup.h>
> +#include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> @@ -16,6 +17,7 @@
>  #include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/property.h>
> +#include <linux/seq_file.h>
>  #include <linux/spinlock.h>
>
>  static LIST_HEAD(mbox_cons);
> @@ -636,3 +638,66 @@ int devm_mbox_controller_register(struct device *dev=
,
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(devm_mbox_controller_register);
> +
> +#ifdef CONFIG_DEBUG_FS
> +static void *mbox_seq_start(struct seq_file *s, loff_t *pos)
> +{
> +       mutex_lock(&con_mutex);
> +       return seq_list_start(&mbox_cons, *pos);
> +}
> +
> +static void *mbox_seq_next(struct seq_file *s, void *v, loff_t *pos)
> +{
> +       return seq_list_next(v, &mbox_cons, pos);
> +}
> +
> +static void mbox_seq_stop(struct seq_file *s, void *v)
> +{
> +       mutex_unlock(&con_mutex);
> +}
> +
> +static int mbox_seq_show(struct seq_file *seq, void *v)
> +{
> +       const struct mbox_controller *mbox =3D list_entry(v, struct mbox_=
controller, node);
> +
> +       seq_printf(seq, "%s:\n", dev_name(mbox->dev));
> +
> +       for (unsigned int i =3D 0; i < mbox->num_chans; i++) {
> +               struct mbox_chan *chan =3D &mbox->chans[i];
> +
> +               scoped_guard(spinlock_irqsave, &chan->lock) {
> +                       if (chan->cl) {
> +                               struct device *cl_dev =3D chan->cl->dev;
> +
> +                               seq_printf(seq, " %3u: %s\n", i,
> +                                          cl_dev ? dev_name(cl_dev) : "N=
ULL device");
> +                       }
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct seq_operations mbox_sops =3D {
> +       .start =3D mbox_seq_start,
> +       .next =3D mbox_seq_next,
> +       .stop =3D mbox_seq_stop,
> +       .show =3D mbox_seq_show,
> +};
> +DEFINE_SEQ_ATTRIBUTE(mbox);
> +
> +/*
> + * subsys_initcall() is used here but controllers may already have been
> + * registered earlier or will be later. The rationale is that debugfs is
> + * accessed only late, i.e. from userspace. So, files created here must =
make no
> + * assumptions about initcall ordering.
> + */
> +static int __init mbox_init(void)
> +{
> +       struct dentry *mbox_debugfs =3D debugfs_create_dir("mailbox", NUL=
L);
> +
> +       debugfs_create_file("mailbox_summary", 0444, mbox_debugfs, NULL, =
&mbox_fops);
> +       return 0;
> +}
> +subsys_initcall(mbox_init);
> +#endif /* DEBUG_FS */
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi

