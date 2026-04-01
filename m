Return-Path: <linux-renesas-soc+bounces-30682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJpIKbzkzGmjXQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:26:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45910377921
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE98A30623E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 09:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245863B19BF;
	Wed,  1 Apr 2026 09:20:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A073BA222
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Apr 2026 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035232; cv=none; b=jH0jtDn/IWvESU9ojBjR1QzNQqG4XwlBCNDOXKWNtlmd6qPrFjK8P21mCQPU+JpuMmLBMC8IP//1GcKkGRkbOheGBgyEmABpy86zh+gvyGmGE56Os9AGrQVR0ZvlWGWki1mDRChxkmzutg1eVUQaRgs3omA/DmoFgno9pGwmj54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035232; c=relaxed/simple;
	bh=XYU8ExmSRZIQyMIdAquE+0ifwiwHOftNCrlOcWvWhTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baWyeJA2Nl4aw8AkqmmLokI4nIvyygWpkuPAAPEWFEmqK+lmALCwURvukTqUbUk8hD5KdpUB5rMnCkgF2NS/To0sNC9vcFbnjZ/Sy/CSSXCZ6fZbzoaU/wH9afLwvKA4VGcLV3aJhRQNMYTemFox2zF4i1+qEUXGVtTBMMn5MM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso2706998e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Apr 2026 02:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035230; x=1775640030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hf0uw/Ix0DKLhrS1Wvu1SOoT/BIoSGt8t98L/aQdTlU=;
        b=XIt3cqn/OjHIQb/FxWYqiaZfsnoRVhc1YplT8NvzYNtTjaIeiMGwUPv0N/+GIoGFS7
         xKUO7ixI2X+8kg4sHSsZEJuz7bIP8QaHN2RUpFpBz+xYyINWkEtmBXo3rl6WdPtM+hdB
         v7rP0yG+BI/rFdfbtBP0AQaunncsrL6lxVymBEdS3l8vPgcr9o+Sr2izbPoIYWZe8ieO
         ylT3ClQvcy0jIEEUsMV1azlyWChh/P5m94YK7j71B0bTwzyaU2vVv8gXV5tCg1tCce3w
         K30TNyki+kwbQZYNoQddlGQZ4krwC1CDA/cCL/0hI0bSR22TsSMz+PYFdFdufkWy+RG4
         iRIw==
X-Gm-Message-State: AOJu0YxWq37gVoR6kCLb8cUKaASsN0wCo1mGyMRnbZdFkpZpQF766dL0
	7dnuLAxSE49M1bDvEcnIr9nrxr7U2PbDfHXXPNQZDqDfEfLOe+aD+EeGz/s0sESE
X-Gm-Gg: ATEYQzyJ/3A4j1ognDPYyeAhAT1/9jC02mYDjOX8PGLqcWfF29qG1gmVfIKtNoKBQUY
	JBRBNxSXeXNqay6JRaPbZz0nRHggMsymgJ2vZrEXoIZMVv5USYNCl8irO/iw0QWyGzU6PFD6w+p
	NwDcCJzvXJvl0GNLQblQ/utd9X8wCCjUv45UDTqkqKMq156plUNKXTzoweQWm5iSevfLzqzBnRQ
	0Rrmva5NnSTPx4Vc074Ms3re4XgcNeQlB+p9UmXRQG6oxORzaYsoLKKQx0WP+HZSfw8Bc0IUt48
	u0c1HL17rBH/UxwrnCOwWfZGY0mRt/ix3VjxGvWSLYO+Ej8yVpVFvS87JzDHOZkP+GjEIVDlRLU
	Su+PHd7tYd2vRB4umtfSWrsz+uabk1tqwjs9CZVLzf6kd/1LGFCOrfmeDgBX8XwMtOYDS699iT7
	fGFgiiK2FpKQUW9ojWz7kDLGcXQ2cQRAs3GNZmHDHRw0Vfia753tjs9BAOyTcrg/1f
X-Received: by 2002:a05:6122:658f:b0:56b:5893:d051 with SMTP id 71dfb90a1353d-56d8aa7bceemr1132453e0c.13.1775035229695;
        Wed, 01 Apr 2026 02:20:29 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d885eac2fsm3555262e0c.1.2026.04.01.02.20.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:20:29 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56b8804f37cso2892881e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Apr 2026 02:20:28 -0700 (PDT)
X-Received: by 2002:a05:6122:4d87:b0:56b:8804:ef10 with SMTP id
 71dfb90a1353d-56d8a94ff53mr1142528e0c.9.1775035227975; Wed, 01 Apr 2026
 02:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331104527.29170-1-wsa+renesas@sang-engineering.com> <20260331104527.29170-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260331104527.29170-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Apr 2026 11:20:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdtc-Xhi_PGXvc8vOA_ubSssP5fAwmj+k6sOdy_ROPug@mail.gmail.com>
X-Gm-Features: AQROBzDZ5b8_s_XjIjEk5H481yg2SFYtRizGJxmsW8r4c7VBYWghSYUoSHbn_mg
Message-ID: <CAMuHMdWdtc-Xhi_PGXvc8vOA_ubSssP5fAwmj+k6sOdy_ROPug@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] soc: renesas: Add Renesas R-Car MFIS driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,mailbox.org,renesas.com,gmail.com,glider.be];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30682-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.965];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 45910377921
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wolfram,

On Tue, 31 Mar 2026 at 12:45, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas R-Car MFIS offers multiple features but most importantly
> mailboxes and hwspinlocks. Because they share a common register space
> and a common register unprotection mechanism, a single driver was chosen
> to handle all dependencies. (MFD and auxiliary bus have been tried as
> well, but they failed because of circular dependencies.)
>
> In this first step, the driver implements common register access and a
> mailbox controller. hwspinlock support will be added incrementally, once
> the subsystem allows out-of-directory drivers.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
> ---
> Changes since v2:
> * use BIT macro (Thanks, Marek!)
> * added tag (Thanks, Jassi!)

Thanks for the update!

> --- /dev/null
> +++ b/drivers/soc/renesas/rcar-mfis.c

> +static int mfis_mb_probe(struct mfis_priv *priv)
> +{
> +       struct device *dev = priv->dev;
> +       struct mbox_chan *chan;
> +       struct mbox_controller *mbox;
> +       unsigned int num_chan = priv->info->mb_num_channels;

I know it is almost Easter, but Reverse Christmas tree would be nice ;-)
(Oh, there are more, but this one stuck out)

[...]

> +       for (int i = 0; i < num_chan; i++)

unsigned int, cfr. num_chan.

> +               chan[i].con_priv = &priv->chan_privs[i];
> +
> +       mbox->chans = chan;
> +       mbox->num_chans = num_chan;
> +       mbox->txdone_poll = true;
> +       mbox->ops = &mfis_iicr_ops;
> +       mbox->dev = dev;
> +       mbox->of_xlate = mfis_mb_of_xlate;
> +
> +       return devm_mbox_controller_register(dev, mbox);
> +}

Regardless
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

